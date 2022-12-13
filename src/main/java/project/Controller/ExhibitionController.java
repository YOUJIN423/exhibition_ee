package project.Controller;

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
import project.Model.MyLike;
import project.Model.Qna;
import project.Model.Review;
import project.Service.BookService;
import project.Service.ExhibitionService;
import project.Service.MyLikeService;
import project.Service.ReviewService;

@Controller
public class ExhibitionController {

	@Autowired
	private ExhibitionService es;

	@Autowired
	private MyLikeService ls;
	
	@Autowired
	private ReviewService rs;

	@Autowired
	private BookService bs;
	
	// 전시 목록
	// 전시 목록 + 페이징 넣기
	@RequestMapping("exhibition.do")
	public String exhibition_List( @RequestParam("ex_end_state") String ex_end_state,
									Model model, HttpServletRequest request) {	
		// 페이징처리
		int page = 1; // 페이지 번호 (초기값 :1)
		int limit = 4; // 한 페이지에 출력할 데이터 수
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		// 총 리스트 수를 받아옴
		int listcount = es.getListCount(ex_end_state);
		System.out.println("listcount : "+listcount);
		
		// 한 페이지의 데이터 갖고 오기
		Map map = new HashMap();
		map.put("page", page);
		map.put("ex_end_state", ex_end_state);
		
		List<Exhibition> boardlist = es.getBoardList(map);
		System.out.println("boardlist : "+boardlist);
		
		// 총 페이지
		int pageCount = listcount / limit + ((listcount%limit == 0) ? 0 : 1);
		int startPage = ((page - 1) / 10) * limit + 1; 	// 1, 11, 21,...
		int endPage = startPage + 10 - 1; 				// 10, 20, 30,...
		
		if (endPage > pageCount) endPage = pageCount;
		
		String ex_title = "";
		if(ex_end_state.equals("y")) {
			ex_title = "진행 중인 전시";
		} else {
			ex_title = "종료 전시";
		}
		
		model.addAttribute("page", page); 					// 현재 페이지
		model.addAttribute("listcount", listcount); 		// 리스트 수
		model.addAttribute("boardlist", boardlist); 		// 한 페이지 전시 목록
		model.addAttribute("pageCount", pageCount); 		// 총 페이지 수
		model.addAttribute("startPage", startPage); 		// 1, 11, 21,...
		model.addAttribute("endPage", endPage);     		// 10, 20, 30,...
		
		model.addAttribute("ex_end_state", ex_end_state); 	// 전시 상태 (진행중/종료)
		model.addAttribute("ex_title",ex_title);
		
		return "exhibition/exhibition2";
	}
	
	// 전시 상세정보
	// 세션 아이디 값으로 좋아요 정보 받아오기
	// mylike (좋아요 정보)
	//		0 : 좋아요 안누른 상태
	//		1 : 좋아요 누른 상태
	//		2 : 기본 상태 (비로그인)
	//		3 : 좋아요 정보가 없는 상태 -> mem_id, ex_num 넣어서 좋아요 데이터 생성
	
	@RequestMapping("exhibition_detail.do")
	public String exhibition_detail(@RequestParam int ex_num, HttpSession session, 
								Model model,HttpServletRequest request){
		int mylike = 2;
		int page = 1;
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int rev_page = 1;
		
		if (request.getParameter("rev_page") != null) {
			rev_page = Integer.parseInt(request.getParameter("rev_page"));
		}
		
		String mem_id = (String) session.getAttribute("mem_id");
		System.out.println("session : " + mem_id);
		System.out.println("ex_num : "+ex_num);
		
		// 좋아요 정보를 구해오기 위한 map
		Map map = new HashMap();
		map.put("ex_num", ex_num);
		map.put("mem_id", mem_id);

		if (mem_id != null) {			// 세션이 존재 (=로그인 상태)
			mylike = ls.getMyLike(map);	// 0,1,3 리턴
		}
		
		System.out.println(mylike);
		
		// 처음 보는 전시의 상세정보에는 좋아요 데이터가 존재하지 않기 때문에 좋아요 데이터를 생성 해준다.
		// MyLikeDaoImpl에서 getMyLike()메소드 실행 후 NullPointException이 발생하면 mylike값을 3으로 리턴하게 해둠
		if (mylike == 3) {
			int result = ls.insertMyLike(map);
			mylike = 0;
		}
		
		// 전시 상세 정보
		Exhibition exhibition = es.detail(ex_num);
		model.addAttribute("exhibition", exhibition);
		model.addAttribute("page",page);
		
		// 좋아요 정보
		System.out.println("mylike: " + mylike);
		model.addAttribute("mylike", mylike);
		
		// 리뷰페이지 정보
		model.addAttribute("rev_page",rev_page);
		model.addAttribute("ex_num",ex_num);
		
		return "exhibition/exhibition_detail2";
	}
	
	
	// 좋아요 클릭
	@RequestMapping("mylikeUpdate.do") 
	public String myLike_update(@RequestParam("mem_id") String mem_id, 
								@RequestParam("ex_num") int ex_num,
								@RequestParam("mylike_num") int mylike_num,
								Model model) {
		System.out.println("mylikeUpdate.do : "+mylike_num);
		if(mylike_num==0) {
			mylike_num=1;
		} else {
			mylike_num=0;
		}
		
		MyLike mylike = new MyLike();
		mylike.setEx_num(ex_num);
		mylike.setMem_id(mem_id);
		mylike.setMylike_num(mylike_num);
		
		ls.updateMyLike(mylike);
		
		return "redirect: exhibition_detail.do?ex_num="+ex_num;
	}
	
	// 리뷰 작성 가능한지 확인
	@RequestMapping("reviewCheck.do")
	public String reviewCheck(HttpServletRequest request, HttpSession session, Model model) {
		
		// book테이블에서 mem_id와 ex_num에 일치하는 bo_num이 존재하는지 + bo_state가 2번인지 확인
		// 조건에 일치하는 예약 정보가 존재하면 bo_num을 리턴하고 (1이상의 값), 일치하지 않으면 0이 리턴됨
		// 0이 리턴되는 조건 : mem_id가 null, 예약정보가 존재하지 않음, bo_state가 2가 아님
		
		String mem_id = (String) request.getParameter("mem_id");
		int bo_num = 0;
		
		if(!mem_id.equals("")) {
			int ex_num = Integer.parseInt(request.getParameter("ex_num"));
			
			System.out.println("mem_id : "+mem_id);
			System.out.println("ex_num : "+ex_num);
			
			Map map = new HashMap();
			map.put("mem_id", mem_id);
			map.put("ex_num", ex_num);
			
			bo_num = rs.reviewCheck(map);
			
		} else {
			bo_num = -1;
		}
		
		System.out.println("bo_num : "+bo_num);
		model.addAttribute("bo_num", bo_num);
		return "exhibition/reviewCheck";
	}
	
	// 리뷰폼으로 이동
	@RequestMapping("reviewForm.do")
	public String reviewForm(HttpServletRequest request, Model model) {
		int bo_num = Integer.parseInt(request.getParameter("bo_num"));
		
		// 전시명 갖고 오기
		Book book = rs.getBook(bo_num);
		String ex_name = es.getExName(book.getEx_num());
		
		model.addAttribute("book", book);
		model.addAttribute("ex_name", ex_name);
		return "Review/reviewForm";
	}
	
	// 리뷰 작성
	@RequestMapping("review.do")
	public String review(@ModelAttribute Review review, 
						HttpSession session, Model model) {
		
		Map map = new HashMap();
		map.put("mem_id", session.getAttribute("mem_id"));
		map.put("ex_num", review.getEx_num());
		
		int bo_num = rs.reviewCheck(map);
		
		review.setBo_num(bo_num);
		
		int insertResult = rs.writeReview(review);
		System.out.println(insertResult);
		
		int updateResult = rs.updateBookState(review.getBo_num());
		System.out.println(updateResult);
		
		int ex_num = review.getEx_num();
		
		return "redirect: exhibition_detail.do?ex_num="+ex_num+"#detail_review";
	}
	
	// 리뷰 리스트 (비동기)
	@RequestMapping("reviewList.do")
	public String reviewList(HttpServletRequest request, Model model) {
		int ex_num = Integer.parseInt(request.getParameter("ex_num"));
		System.out.println("ex_num : "+ex_num);
		
		int page = 1; // 페이지 번호 (초기값 :1)
		int limit = 10; // 한 페이지에 출력할 데이터 수
		
		if (request.getParameter("rev_page") != null) {
			page = Integer.parseInt(request.getParameter("rev_page"));
		}

		// 총 리스트 수를 받아옴
		int listcount = rs.getCount(ex_num);
		
		Map map = new HashMap();
		map.put("page",page);
		map.put("ex_num",ex_num);
		
		List<Review> list = rs.getReviewList(map);
		System.out.println("reviewList : "+list);
		model.addAttribute("list", list);
		
		int pageCount = listcount / limit + ((listcount%limit == 0) ? 0 : 1);
		int startPage = ((page - 1) / 10) * limit + 1; 	// 1, 11, 21,...
		int endPage = startPage + 10 - 1; 				// 10, 20, 30,...
		
		if (endPage > pageCount) endPage = pageCount;
		
		model.addAttribute("page", page); 					// 현재 페이지
		model.addAttribute("listcount", listcount); 		// 리스트 수
		model.addAttribute("pageCount", pageCount); 		// 총 페이지 수
		model.addAttribute("startPage", startPage); 		// 1, 11, 21,...
		model.addAttribute("endPage", endPage);
		model.addAttribute("ex_num", ex_num);
		
		return "Review/reviewlist";
	}
	
	@RequestMapping("rev_title_load.do")
	public String rev_title_load(@RequestParam("rev_num") String rev_num,
								Model model) {
		int r_num = Integer.parseInt(rev_num);
		
		String title = rs.getReviewTitle(r_num);
		System.out.println(title);
		
		model.addAttribute("title",title);
		
		return "Review/load_title_result";
	}
	
	@RequestMapping("rev_content_load.do")
	public String rev_content_load(@RequestParam("rev_num") String rev_num,
								Model model) {
		
		int r_num = Integer.parseInt(rev_num);
		
		String content = rs.getReviewContent(r_num);
		System.out.println(content);
		
		model.addAttribute("content",content);
		
		return "Review/load_content_result";
	}
	
	@RequestMapping("reviewUpdate.do")
	public String reviewUpdate(@ModelAttribute Review review, Model model) {
		int rev_num = review.getRev_num();
		System.out.println(rev_num);
		int result = rs.updateReview(review);
		int ex_num = review.getEx_num();
		
		return "redirect: exhibition_detail.do?ex_num="+ex_num+"#detail_review";
	}
	
	@RequestMapping("reviewUpdate2.do")
	public String reviewUpdate2(@ModelAttribute Review review, Model model) {
		int rev_num = review.getRev_num();
		System.out.println(rev_num);
		int result = rs.updateReview(review);
		int ex_num = review.getEx_num();
		
		return "redirect: mypage/myreviewList.do";
	}
	
	@RequestMapping("reviewDelete.do")
	public String reviewDelete(HttpServletRequest request, Model model) {
		int rev_num = Integer.parseInt(request.getParameter("rev_num"));
		int ex_num = Integer.parseInt(request.getParameter("ex_num"));
		int bo_num = rs.getBook_rev(rev_num);
		int delete = rs.deleteReview(rev_num);
		int update = bs.deleteReview_state(bo_num);
		return "redirect: exhibition_detail.do?ex_num="+ex_num+"#detail_review";
	}
	
	@RequestMapping("reviewDelete2.do")
	public String reviewDelete2(HttpServletRequest request, Model model) {
		int rev_num = Integer.parseInt(request.getParameter("rev_num"));
		int bo_num = rs.getBook_rev(rev_num);
		int delete = rs.deleteReview(rev_num);
		int update = bs.deleteReview_state(bo_num);
		return "redirect: mypage/myreviewList.do";
	}
	
	@RequestMapping("searchExhibition.do")
	public String searchExhibition(@RequestParam String search, Model model) {
		List<Exhibition> searchList = es.searchExhibition(search); 
		System.out.println(searchList);
		model.addAttribute("searchList", searchList);
		return "exhibition/search";
	}
}