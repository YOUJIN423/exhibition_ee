package project.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import project.Model.Board;
import project.Model.Exhibition;
import project.Model.Member;
import project.Service.BoardServiceImple;
import project.Service.ExhibitionService;
import project.Service.MainServiceImpl;

@Controller
public class MainController {

	@Autowired
	private MainServiceImpl MainService;

	@Autowired
	private ExhibitionService es;

	@Autowired
	public BoardServiceImple bs;
	
	/* [메인 추천 전시 → 인덱스] */
	@RequestMapping("main_index.do")
	public String main_index(Model model) {
		System.out.println("전시 컨트롤러 들어옴(main_best_exhibition)");
		List<Exhibition> exhibition_bestList = es.exhibition_bestList();
		System.out.println("exhibition_bestList:" + exhibition_bestList);

		model.addAttribute("exhibition_bestList", exhibition_bestList);

		return "Main/main_index";

	}

//-----------------------------------Info	
	/* [메인(info1(미술관 소개))] */
	@RequestMapping("main_about_introduce.do")
	public String main_about_introduce() {
		System.out.println("메인 컨트롤러 들어옴(main_about_introduce)");

		return "Main/main_about_introduce";
	}

	/* [메인(info2(관람 안내))] */
	@RequestMapping("main_info_booking.do")
	public String main_info_booking() {
		System.out.println("메인 컨트롤러 들어옴(main_info_booking");

		return "Main/main_info_booking";
	}

	/* [메인(info3(예매 안내))] */
	@RequestMapping("main_info_watching.do")
	public String main_info_watching() {
		System.out.println("메인 컨트롤러 들어옴(main_info_watching");

		return "Main/main_info_watching";
	}

//-----------------------------------공지
	/* [메인(notice1(공지))] */
	@RequestMapping("main_notice.do")
	public String BoardList(HttpServletRequest request ,Model model) {
		int page =1; // 현재 페이지 번호
		int limit=5; // 한 화면에 출력 데이터 갯수
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int startRow = (page-1)* limit+1;
		int endRow  =  page*limit;
		
		int listcount = bs.getCount();
		System.out.println("listcount:"+listcount); // 총 데이터 갯수

	List<Board>boardlist = bs.getBoardList(page); // 게시판 목록
	     System.out.println("boardlist:"+boardlist);
	     
	   // 총 페이지 
	     
	     int pageCount = listcount/limit + ((listcount % limit==0)?0:1);
	     
	     int startPage =  ((page-1)/5)*limit +1;
	     int endPage = startPage +5 -1;  
	     
	     if(request.getParameter("page")!=null) {
	    	 page = Integer.parseInt(request.getParameter("page"));
	     	 
	       }
	     if(endPage>pageCount)endPage = pageCount; 
	    
	     model.addAttribute("page", page);
	     model.addAttribute("listcount", listcount);
	     model.addAttribute("boardlist", boardlist);
	     model.addAttribute("pageCount", pageCount);
	     model.addAttribute("startPage", startPage);
	     model.addAttribute("endPage", endPage);
	     
	     return"Main/main_notice";     
	}

	// 상세 페이지 
	@RequestMapping("boardcontent.do")
	public String boardcontent(int board_num , int page , Model model) {
		Board board = bs.getBoard(board_num); // 상세정보 구하기 
		
		String content = board.getBoard_content().replace("\n", "<br>");
		model.addAttribute("board", board);
		model.addAttribute("content", content);
		model.addAttribute("page", page);
		
		return "masterboard/boardcontent";
	}
	
//	  [메인(notice2(FAQ))]
	  @RequestMapping("main_notice_faq.do") 
	  public String main_notice_faq() {
	  System.out.println("메인 컨트롤러 들어옴(main_notice_faq");
	  
	  return "Main/main_notice_faq"; }
	 

//-----------------------------------전시
	/* [메인(exhibition1(진행 중인 전시))] */
	/*
	 * @RequestMapping("main_exhibition_ing.do") public String main_exhibition_ing()
	 * { System.out.println("메인 컨트롤러 들어옴(main_exhibition_ing");
	 * 
	 * return "Main/main_exhibition_ing"; }
	 */

	/* [메인(exhibition2(종료전시))] */
	/*
	 * @RequestMapping("main_exhibition_end.do") public String main_exhibition_end()
	 * { System.out.println("메인 컨트롤러 들어옴(main_exhibition_end");
	 * 
	 * return "Main/main_exhibition_end"; }
	 */

//-------------------------------------추천 전시
	/* [메인(추천 전시)] */
	/*
	 * @RequestMapping("main_best_exhibition.do") public String
	 * main_best_exhibition(@RequestParam int ex_num, Model model)throws Exception {
	 * 
	 * System.out.println("메인 컨트롤러 들어옴(main_best_exhibition");
	 * 
	 * Exhibition exhibition = MainService.exhibition_info(ex_num);
	 * //[exhibition_info() : 전시 상세 정보 구하는 메소드]
	 * 
	 * 
	 * model.addAttribute("exhibition", exhibition);
	 * 
	 * return "Main/main_best_exhibition"; }
	 */

//-------------------------------------etc
	/* [개인 정보 처리 방침] */
	@RequestMapping("main_ee_privacy.do")
	public String main_ee_privacy() {
		System.out.println("메인 컨트롤러 들어옴(main_ee_privacy)");

		return "Main/main_ee_privacy";
	}

	/* [메인(슬라이더(프로그램1))] */
	@RequestMapping("main_slider_program1.do")
	public String main_slider_program1() {
		System.out.println("메인 컨트롤러 들어옴(main_slider_program1)");

		return "Main/main_slider_program1";
	}

	/* [메인(슬라이더(프로그램2))] */
	@RequestMapping("main_slider_program2.do")
	public String main_slider_program2() {
		System.out.println("메인 컨트롤러 들어옴(main_slider_program2)");

		return "Main/main_slider_program2";
	}
}