package project.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.taglibs.standard.extra.spath.Step;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.Model.Board;
import project.Model.Master;
import project.Model.Member;
import project.Model.Qna;
import project.Service.BoardServiceImple;
import project.Service.MasterService;

@Controller
public class MasterController {
	@Autowired
	public MasterService MS;
	
	@Autowired
	public BoardServiceImple bs;
	
	
// 관리자 인덱스 
	@RequestMapping("master/master_index.do")
	public String master_index(HttpSession session) {
		System.out.println("master_index에 들어옴");
		return "master/master_index";
	}
	
	

// 관리자 로그인 폼 
	@RequestMapping("master/master_loginform.do")
	public String master_loginform(HttpSession session) {
		System.out.println("master_loginform에 들어옴");
		return "master/master_loginform";
	}

// 관리자  로그인 
	@RequestMapping(value = "master/master_login.do", method = RequestMethod.POST)
	public String master_login(Model model, Master ms, HttpSession session) throws Exception {
		System.out.println("login 메서드 진입");
		System.out.println("전달된 데이터 :" + ms);
		System.out.println(ms.getMaster_id());
		System.out.println(ms.getMaster_passwd());
		Master master = MS.login(ms);

		if (master != null) {
			System.out.println("로그인 성공");
			model.addAttribute("check", 1);
			session.setAttribute("master_id", ms.getMaster_id());

			return "master/master_index";
		} else {
			model.addAttribute("master", master);
			return "master/master_loginform";
		}

	}

	// 문의글 목록
	@RequestMapping("master/qnalist.do")
	public String qnadetail(HttpServletRequest request, Model model) {

		int page = 1;
		int limit = 5;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		int startRow = (page - 1) * limit + 1;
		int endRow = page * limit;

		int qnacount = MS.getCount();
		System.out.println("qnacount:" + qnacount); // 총 문의 총 데이터

		List<Qna> qnalist = MS.getQnaList(page);
		System.out.println("qnalist:" + qnalist);

		// 총 페이지 설정

		int pageCount = qnacount / limit + ((qnacount % limit == 0) ? 0 : 1);

		int startPage = ((page - 1) / 5) * limit + 1;
		int endPage = startPage + 5 - 1;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		if (endPage > startPage)
			endPage = pageCount;

		model.addAttribute("page", page);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("qnacount", qnacount);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("qnalist", qnalist);

		return "master/qnalist";

	}
	
	@RequestMapping("master/qnacontent.do")
	public String qnacontent(Model model, HttpServletRequest request) {
		String page = request.getParameter("page");
		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		Qna qna = MS.getselect(qna_num);
		
		if(qna.getQna_state().equals("y")) {
			Qna reply = MS.getselect(qna_num);
			System.out.println(reply.getQna_content());
			model.addAttribute("reply",reply);
		}
		
		model.addAttribute("qna", qna);
		model.addAttribute("page", page);
		return "master/qnadetail";
	}

	// 답글 작성 폼
	@RequestMapping("master/qnareply.do")
	public String qnareply(Model model, HttpServletRequest request) {
		String page = request.getParameter("page");
		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		model.addAttribute("qna_num", qna_num);
		model.addAttribute("page",page);
		return "master/qnareply";
	}
	
	// 답글 작성
	@RequestMapping("master/reply.do")
	public String reply(HttpServletRequest request, Qna qna, String page, Model model) {
		
		int replyresult = MS.reply_ok(qna); // 답글
		System.out.println("qna_num : "+qna.getQna_num());
		int result = MS.qna_state_update(qna.getQna_num()); // 답변 달린 문의글 상태변경
		model.addAttribute("page",page);
		
		return "redirect: qnacontent.do?qna_num="+qna.getQna_num();
	}



	
	
	// 관리자 로그아웃
	@RequestMapping("master/master_logout.do")
	public String master_logout(HttpSession session) {
		session.invalidate();
		System.out.println("master_logout에 들어옴");
		
		return "master/master_logout";
	}
}