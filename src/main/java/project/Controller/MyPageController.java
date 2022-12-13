package project.Controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import project.Model.Book;
import project.Model.Exhibition;
import project.Model.Member;
import project.Model.Pay;
import project.Model.Qna;
import project.Model.Review;
import project.Service.BookService;
import project.Service.ExhibitionService;
import project.Service.MemberService;
import project.Service.MyLikeService;
import project.Service.QnaService;
import project.Service.ReviewService;

@Controller
public class MyPageController {
	
	@Autowired
	private MyLikeService ls;
	
	@Autowired
	private BookService bs;
	
	@Autowired
	private ExhibitionService es;
	
	@Autowired
	private QnaService qs;
	
	@Autowired
	private MemberService ms;
	
	@Autowired
	private ReviewService rs;
	
	@RequestMapping("mypage/mypage.do")
	public String mypage_main(HttpSession session, Model model) {
		String mem_id = (String) session.getAttribute("mem_id");
		
		List<Book> book = bs.getBookList_book_recent(mem_id);
		List<Exhibition> ex = bs.getBookList_ex_recent(mem_id);
		List<Pay> pay = bs.getPayList_recent(mem_id);

		model.addAttribute("book",book);
		model.addAttribute("ex",ex);
		model.addAttribute("pay", pay);
		
		List<Exhibition> mylike = ls.mylikeList_recent(mem_id);
		model.addAttribute("mylike", mylike);
		
		return "mypage/mypage_main2";
	}
	
	// 예약 관리
	// 예약 리스트
	@RequestMapping("mypage/bookList.do")
	public String bookList(HttpSession session, Model model,
							HttpServletRequest request) {
		
		String mem_id = (String) session.getAttribute("mem_id");

		// 페이징 처리
		int page = 1;
		int limit = 10;
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int listcount = bs.getBookCount(mem_id);
		Map map = new HashMap();
		map.put("page",page);
		map.put("mem_id",mem_id);
		
		List<Book> book = bs.getBookList_book(map);
		List<Exhibition> ex = bs.getBookList_ex(map);
		List<Pay> pay = bs.getPayList(map);

		model.addAttribute("book",book);
		model.addAttribute("ex",ex);
		model.addAttribute("pay", pay);
		
		int pageCount = listcount / limit + ((listcount%limit==0)? 0:1);
		int startPage = ((page - 1) / 10) * limit + 1; 	// 1, 11, 21,...
		int endPage = startPage + 10 - 1; 				// 10, 20, 30,...
		
		if (endPage > pageCount) endPage = pageCount;
		
		model.addAttribute("page", page); 					// 현재 페이지
		model.addAttribute("listcount", listcount); 		// 리스트 수
		model.addAttribute("pageCount", pageCount); 		// 총 페이지 수
		model.addAttribute("startPage", startPage); 		// 1, 11, 21,...
		model.addAttribute("endPage", endPage);     		// 10, 20, 30,...
		

		return "mypage/bookList2";
	}
	
	// 예약 취소폼
	@RequestMapping("mypage/bookCancleForm.do")
	public String bookCancleForm (@RequestParam int bo_num, Model model) {
		Book book = bs.getBook(bo_num);
		Pay pay = bs.getPay(bo_num);
		int ex_num = book.getEx_num();
		Exhibition exhibition = es.detail(ex_num);
				
		model.addAttribute("book", book);
		model.addAttribute("pay", pay);
		model.addAttribute("exhibition", exhibition);
		
		return "mypage/bookCancleForm";
	}
	
	// 예약 취소
	@RequestMapping("mypage/bookCancle.do")
	public String bookCancle(@RequestParam int bo_num) {
		
		// 예약상태(bo_state) = 3으로 바꾸기
		int r1 = bs.updateBook_state(bo_num);
		
		// 결제 테이블에 pay_cancledate 추가하기
		int r2 = bs.updatePay_cancledate(bo_num); 
		
		return "redirect: bookList.do#";
	}
	
	// 예약 상세
	@RequestMapping("mypage/bookDetail.do")
	public String bookDetail(@RequestParam int bo_num, Model model) {
		Book book = bs.getBook(bo_num);
		System.out.println("book: "+book);
		
		Pay pay = bs.getPay(bo_num);
		System.out.println("pay: "+pay);
		int ex_num = book.getEx_num();
		Exhibition exhibition = es.detail(ex_num);
		System.out.println("exhibition: "+exhibition);
		
		// 취소 가능일 (관람일 -1)
		Date cancleDate = bs.getCancleDate(bo_num);
		
		model.addAttribute("book", book);
		model.addAttribute("pay", pay);
		model.addAttribute("exhibition", exhibition);
		model.addAttribute("cancleDate", cancleDate);
		
		return "mypage/bookDetail2";
	}
	
	// 좋아요 리스트
	@RequestMapping("mypage/mylikeList.do")
	public String mylikeList(HttpSession session, Model model
							,HttpServletRequest request) {
		String mem_id = (String)session.getAttribute("mem_id");

		int page = 1; // 페이지 번호 (초기값 :1)
		int limit = 9; // 한 페이지에 출력할 데이터 수
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		// 총 리스트 수를 받아옴
		int listcount = ls.getCount(mem_id);
		Map map = new HashMap();
		map.put("page",page);
		map.put("mem_id",mem_id);
		
		List<Exhibition> mylike = ls.mylikeList(map);
		
		
		int pageCount = listcount / limit + ((listcount%limit == 0) ? 0 : 1);
		int startPage = ((page - 1) / 10) * limit + 1; 	// 1, 11, 21,...
		int endPage = startPage + 10 - 1; 				// 10, 20, 30,...
		
		if (endPage > pageCount) endPage = pageCount;
		
		model.addAttribute("mylike", mylike);
		model.addAttribute("page", page); 					// 현재 페이지
		model.addAttribute("listcount", listcount); 		// 리스트 수
		model.addAttribute("pageCount", pageCount); 		// 총 페이지 수
		model.addAttribute("startPage", startPage); 		// 1, 11, 21,...
		model.addAttribute("endPage", endPage);
		
		return "mypage/mylikeList2";
	}
	
	// 내 리뷰 관리
	@RequestMapping("mypage/myreviewList.do")
	public String myreviewList(Model model, HttpSession session, HttpServletRequest request) {
		String mem_id = (String)session.getAttribute("mem_id");
		
		int page = 1; // 페이지 번호 (초기값 :1)
		int limit = 10; // 한 페이지에 출력할 데이터 수
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		// 총 리스트 수를 받아옴
		int listcount = rs.getCount(mem_id);
		
		Map map = new HashMap();
		map.put("page",page);
		map.put("mem_id",mem_id);
		
		List<Review> review = rs.myReviewList(map);
		List<Exhibition> exhibition = rs.myReviewList_ex(map);
		
		int pageCount = listcount / limit + ((listcount%limit == 0) ? 0 : 1);
		int startPage = ((page - 1) / 10) * limit + 1; 	// 1, 11, 21,...
		int endPage = startPage + 10 - 1; 				// 10, 20, 30,...
		
		if (endPage > pageCount) endPage = pageCount;
		
		model.addAttribute("review", review);
		model.addAttribute("exhibition", exhibition);
		model.addAttribute("page", page); 					// 현재 페이지
		model.addAttribute("listcount", listcount); 		// 리스트 수
		model.addAttribute("pageCount", pageCount); 		// 총 페이지 수
		model.addAttribute("startPage", startPage); 		// 1, 11, 21,...
		model.addAttribute("endPage", endPage);
		
		return "mypage/myReviewList";

	}
	
	// 1:1문의
	@RequestMapping("mypage/qnaList.do")
	public String qnaList(HttpSession session, Model model
							,HttpServletRequest request) {
		String mem_id = (String)session.getAttribute("mem_id");
		
		int page = 1; // 페이지 번호 (초기값 :1)
		int limit = 9; // 한 페이지에 출력할 데이터 수
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		// 총 리스트 수를 받아옴
		int listcount = ls.getCount(mem_id);
		Map map = new HashMap();
		map.put("page",page);
		map.put("mem_id",mem_id);
		
		List<Qna> qna = qs.getQnaList(map);
		model.addAttribute("qna", qna);
		

		int pageCount = listcount / limit + ((listcount%limit == 0) ? 0 : 1);
		int startPage = ((page - 1) / 10) * limit + 1; 	// 1, 11, 21,...
		int endPage = startPage + 10 - 1; 				// 10, 20, 30,...
		
		if (endPage > pageCount) endPage = pageCount;
		
		model.addAttribute("page", page); 					// 현재 페이지
		model.addAttribute("listcount", listcount); 		// 리스트 수
		model.addAttribute("pageCount", pageCount); 		// 총 페이지 수
		model.addAttribute("startPage", startPage); 		// 1, 11, 21,...
		model.addAttribute("endPage", endPage);
		
		return "mypage/qnaList2";
	}
	
	// qna 리스트 출력
	@RequestMapping("mypage/qna_re_load.do")
	public String qna_re_load(HttpServletRequest request, Model model) {
		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		String qna_re = qs.getQnaRe(qna_num);
		model.addAttribute("qna_re", qna_re);
		return "mypage/qna_re_result";
	}
	
	// qna 작성
	@RequestMapping("mypage/qnaWrite.do")
	public String qnaWrite(@ModelAttribute Qna qna,HttpSession session) {
		String mem_id = (String) session.getAttribute("mem_id");
		qna.setMem_id(mem_id);
		int result = qs.insertQna(qna);
		return "redirect: qnaList.do";
	}
	
	// 회원 관리
	@RequestMapping("mypage/memberInfo.do")
	public String memberInfo() {
		return "mypage/passwordConfirm";
	}
	
	@RequestMapping("mypage/pwdConfirm.do")
	public String pwdConfirm(@RequestParam("mem_passwd") String mem_passwd, Model model, HttpSession session) throws Exception {
		String result = "NO";
		String mem_id = (String) session.getAttribute("mem_id");
		
		Member member = ms.userCheck(mem_id);
		String pwd = member.getMem_passwd();
		System.out.println(pwd);
		System.out.println(mem_passwd);
		if(mem_passwd.equals(pwd)) {
			result = "YES";
		}
		System.out.println(result);
		model.addAttribute("result",result);
		return "mypage/pwdConfirm_result";
	}
	
	@RequestMapping("mypage/updateForm.do")
	public String updateForm(HttpSession session, Model model, HttpServletRequest request) throws Exception {
		String mem_id = (String) session.getAttribute("mem_id");
		Member member = ms.userCheck(mem_id);
		model.addAttribute("member", member);
		
		String result = request.getParameter("result");
		model.addAttribute("result", result);
		return "mypage/updateForm";
	}
	
	@RequestMapping("mypage/updateMember.do")
	public String updateMember(@ModelAttribute Member member) {
		int result = ms.updateMember(member);
		return "redirect: updateForm.do?result=1";
	}
	
	@RequestMapping("mypage/exitForm.do")
	public String exitMemberForm() {
		return "mypage/exitForm";
	}
	
	@RequestMapping("mypage/exitMember.do")
	public String exitMember(@RequestParam("mem_exit_reason") String mem_exit_reason, 
								HttpSession session, HttpServletRequest request) {
		String mem_id = (String) session.getAttribute("mem_id");
		
		Map map = new HashMap();
		map.put("mem_id", mem_id);
		map.put("mem_exit_reason",mem_exit_reason);
		
		int result = ms.deleteMember(map);
		session.invalidate();
		
		return "redirect: /main_index.do";
	}
	
}



