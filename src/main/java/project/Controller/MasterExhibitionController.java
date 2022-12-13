package project.Controller;

import org.apache.catalina.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import project.Model.Exhibition;
import project.Model.Master;
import project.Service.ExhibitionService;
import project.Service.MasterExhibitionService;

@Controller
public class MasterExhibitionController {

	@Autowired
	private MasterExhibitionService mes;

	@Autowired
	private ExhibitionService ms;

	// 전시 등록폼
	@RequestMapping("master/exhibitionRegiForm.do")
	public String exhibitionRegiForm() {
		return "master_EX/exhibitionRegiForm";
	}

	// 전시 등록
	@RequestMapping("master/exhibitionRegi.do")
	public String exhibitionRegi(@RequestParam("mf[]") MultipartFile[] mf, HttpServletRequest request, Model model)
			throws Exception {

		System.out.println(mf[0]);
		System.out.println(mf[1]);

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		String ex_name = request.getParameter("ex_name");
		String ex_loc = request.getParameter("ex_loc");

		String ex_start_b = request.getParameter("ex_start");

		ex_start_b += " 00:00:00";

		System.out.println(ex_start_b);
		Date ex_start = format.parse(ex_start_b);

		// String ex_end_state = request.getParameter("ex_end_state");
		// int ex_ing = Integer.parseInt(request.getParameter("ex_ing"));

		Exhibition exhibition = new Exhibition();
		exhibition.setEx_name(ex_name);
		exhibition.setEx_loc(ex_loc);
		exhibition.setEx_start(ex_start);

		for (int i = 0; i < 2; i++) {
			String filename = mf[i].getOriginalFilename(); // 첨부파일명
			int size = (int) mf[i].getSize();

			String path = request.getRealPath("upload");
			System.out.println("mf = " + mf[i]);

			System.out.println("filename = " + filename);
			System.out.println("size = " + size);
			System.out.println("Path = " + path);

			int result = 0;
			String file[] = new String[2];

			String newfilename = "";

			// 첨부파일이 전송된 경우
			if (filename != "") {
				String extension = filename.substring(filename.lastIndexOf("."), filename.length()); // 확장자 분리

				System.out.println("extension: " + extension);

				UUID uuid = UUID.randomUUID(); // 문자열 난수 발생
				newfilename = uuid.toString() + extension;

				// 확장자 확인을 위한 분리
				StringTokenizer st = new StringTokenizer(filename, ".");
				file[0] = st.nextToken(); // 파일명
				file[1] = st.nextToken(); // 확장자

				// 파일크기 제한 확인
				if (size > 10000000) {
					result = 1;
					model.addAttribute("result", result);
					return "master_EX/uploadResult";

					// 확장자 확인
				} else if (!file[1].equals("jpg") && !file[1].equals("gif") && !file[1].equals("png")) {
					result = 2;
					model.addAttribute("result", result);
					return "master_EX/uploadResult";
				}
			}

			// 업로드
			if (size > 0) {
				mf[i].transferTo(new File(path + "/" + newfilename));
			}

			if (i == 0) {
				exhibition.setEx_poster(newfilename);
			} else if (i == 1) {
				exhibition.setEx_con_img(newfilename);
			}
		}

		int result = mes.insertExhibition(exhibition);

		return "redirect: exhibitionlist.do";
	}

	// 전시 목록
	@RequestMapping("master/exhibitionlist.do")
	public String exhibitionList(HttpServletRequest request, Model model) {

		int page = 1; // 현재 페이지 번호
		int limit = 4; // 한 화면에 출력 데이터 갯수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));

		}

		int startRow = (page - 1) * limit + 1;
		int endRow = page * limit;

		int excount = mes.getCount(); // 전시 총 갯수
		System.out.println("excount" + excount);

		List<Exhibition> exlist = mes.getexlist(page); // 게시판 목록
		System.out.println("exlist" + exlist);
		// 총 페이지

		int pageCount = excount / limit + ((excount % limit == 0) ? 0 : 1);

		int startPage = ((page - 1) / 4) * limit + 1;
		int endPage = startPage + 4 - 1;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));

		}
		if (endPage > pageCount)
			endPage = pageCount;

		model.addAttribute("page", page);
		model.addAttribute("exlist", exlist);
		model.addAttribute("excount", excount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("pageCount",pageCount);
		model.addAttribute("endPage", endPage);

		return "master_EX/exhibitionList";
	}

	// 전시 상세
	@RequestMapping("master/exhibitionview.do")
	public String exhibitonview(int ex_num, int page, Model model, HttpServletRequest request) {

		Exhibition exh = mes.getex(ex_num); // 상세 정보구하기

		Exhibition exhibition = new Exhibition();

		model.addAttribute("page", page);
		model.addAttribute("ex_num", ex_num);
		model.addAttribute("exhibition", exh);

		return "master_EX/exhibitionview";

	}

	// 전시 수정 폼
	@RequestMapping("master/exhibitionEditForm.do")
	public String exhibitionEditForm(int page, int ex_num, Model model) {

		Exhibition exh = mes.getex(ex_num); // 상세 정보구하기
		model.addAttribute("exhibition", exh);
		model.addAttribute("page", page);

		return "master_EX/exhibitionEditForm";
	}

	// 전시 수정
	@RequestMapping("master/member_edit_ok.do")
	public String exhibitionEdit(@RequestParam("mf[]") MultipartFile[] mf, String page, Exhibition ex,
			HttpServletRequest request, Model model) throws Exception {

		Exhibition ex_old = ms.detail(ex.getEx_num());
		System.out.println(ex_old.getEx_poster());
		System.out.println(ex_old.getEx_con_img());

		System.out.println(mf[0]);
		System.out.println(mf[1]);

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String ex_start_b = request.getParameter("ex_start1");
		ex_start_b += " 00:00:00";
		System.out.println(ex_start_b);
		Date ex_start = format.parse(ex_start_b);

		ex.setEx_start(ex_start);

		for (int i = 0; i < 2; i++) {
			String filename = mf[i].getOriginalFilename(); // 첨부파일명
			int size = (int) mf[i].getSize();

			String path = request.getRealPath("upload");
			System.out.println("mf = " + mf[i]);

			System.out.println("filename = " + filename);
			System.out.println("size = " + size);
			System.out.println("Path = " + path);

			int result = 0;
			String file[] = new String[2];

			String newfilename = "";

			// 첨부파일이 전송된 경우
			if (filename != "") {
				String extension = filename.substring(filename.lastIndexOf("."), filename.length()); // 확장자 분리

				System.out.println("extension: " + extension);

				UUID uuid = UUID.randomUUID(); // 문자열 난수 발생
				newfilename = uuid.toString() + extension;

				// 확장자 확인을 위한 분리
				StringTokenizer st = new StringTokenizer(filename, ".");
				file[0] = st.nextToken(); // 파일명
				file[1] = st.nextToken(); // 확장자

				// 파일크기 제한 확인
				if (size > 100000000) {
					result = 1;
					model.addAttribute("result", result);
					return "master_EX/uploadResult";

					// 확장자 확인
				} else if (!file[1].equals("jpg") && !file[1].equals("gif") && !file[1].equals("png")) {
					result = 2;
					model.addAttribute("result", result);
					return "master_EX/uploadResult";
				}
			}

			// 업로드
			if (size > 0) {
				mf[i].transferTo(new File(path + "/" + newfilename));
			}

			if (i == 0) {
				System.out.println("newfilename : " + newfilename);
				if(newfilename=="") {
					newfilename = ex_old.getEx_poster();
				}
				
				ex.setEx_poster(newfilename);
				
			} else if (i == 1) {
				System.out.println("newfilename : " + newfilename);
				if(newfilename=="") {
					newfilename = ex_old.getEx_con_img();
				}
				
				ex.setEx_con_img(newfilename);
			}
		}

		int result1 = mes.update(ex);
		if (result1 == 1)
			System.out.println("수정 완료");

		model.addAttribute("result", result1);
		model.addAttribute("page", page);

		return "master_EX/exhibitionEdit";
	}

// 전시 삭제 폼 
	@RequestMapping("master/exhibitiondelete.do")
	public String exhibitiondelete(Model model, HttpServletRequest request) {
		model.addAttribute("ex_num", request.getParameter("ex_num"));
		model.addAttribute("page", request.getParameter("page"));
		return "master_EX/exhibitionDeleteForm";
	}

// 전시 삭제 완료
	@RequestMapping("master/exhibitiondelete_ok.do")
	public String exhibitiondelete_ok(HttpServletRequest request, Model model, int page) {
		String up = request.getRealPath("upload");
		
	//	String img = request.getParameter("ex_con_img");
	//	String poster = request.getParameter("ex_poster");
	//	System.out.println("up"+up);
		
		System.out.println("up: "+up);
		
		int ex_num = Integer.parseInt(request.getParameter("num"));
		System.out.println(ex_num);
		Exhibition exh = ms.detail(ex_num); // 상세 정보구하기

		String img = exh.getEx_con_img();
		String poster = exh.getEx_poster();
		System.out.println("img: "+img);
		System.out.println("poster: "+poster);
		
		if(img != null) {
			File delFile = new File(up+"/"+img);
			delFile.delete();
		}
		
		if(poster != null) {
			File delFile = new File(up+"/"+poster);
			delFile.delete();
		}
		
//		if (img != null || poster != null) { // 기존 이전 파일 존재
//			File delFile = new File(up + "/" + img);
//			File delteFile = new File(up + "/" + poster);
//
//			File[] f1 = delFile.listFiles();
//			for (int i = 0; i < f1.length; i++) {
//				if (f1[i].getName().equals(img)) {
//					f1[i].delete();
//				}
//			}
//
//			File[] f2 = delteFile.listFiles();
//			for (int i = 0; i < f2.length; i++) {
//				if (f2[i].getName().equals(poster)) {
//					f2[i].delete();
//				}
//			}
//		}

		int result = mes.delete(ex_num);
		
		if (result == 1)
			System.out.println("전시글 삭제");
		
		model.addAttribute("result", result);
		model.addAttribute("ex_num", ex_num);
		model.addAttribute("page", page);
		System.out.println(page);
		return "master_EX/deleteResult";

	}

// 전시 프로그램  

	@RequestMapping("program.do")
	public String program() {
		return "master_EX/program";
	}

}