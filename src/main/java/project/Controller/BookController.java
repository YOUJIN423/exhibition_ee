package project.Controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import project.Model.Book;
import project.Model.Book_now;
import project.Model.Exhibition;
import project.Model.Member;
import project.Service.BookService;
import project.Service.BookServiceImpl;
import project.Service.ExhibitionService;
import project.Service.MemViewService;
import scala.util.parsing.json.JSONArray;
import scala.util.parsing.json.JSONObject;

@Controller

public class BookController {
	
	@Autowired
	private MemViewService memViewService;

	@Autowired
	private ExhibitionService es;
	
	@Autowired
	private BookService bookService;
	
	// 전시 상세 정보 출력
		@RequestMapping("exhibition_detail2.do")
		public String exhibition(Model model) throws Exception {

			int ex_num = 82;
			
			// 전시 정보 불러오는 함수 호출
			Exhibition exhi = bookService.exhi_detail(ex_num);	
			model.addAttribute("exhi", exhi);

			return "book/exhibition";
		}

	// 상세 페이지에서 예약 페이지로 이동
	@RequestMapping("book/bookForm.do")
	public String bookForm(@RequestParam("ex_num") int ex_num, 	// dto 생성과 동시에 폼에서 넘어온 값 저장됨
						   Model model) throws Exception {
		
		System.out.println("bookForm.do in");

		// 1. 전시 상세 내용 불러옴
		Exhibition exhibition = es.detail(ex_num);
		model.addAttribute("exhibition", exhibition);
		
		// 2. 예매 현황 불러옴 (list)
		List<Book_now> Book_nowList = bookService.book_now(ex_num);	

		Book_now bo_now_1 = Book_nowList.get(0);		// 첫째 날
		Book_now bo_now_2 = Book_nowList.get(1);		// 둘째 날
		Book_now bo_now_3 = Book_nowList.get(2);		// 셋째 날
		Book_now bo_now_4 = Book_nowList.get(3);		// 넷째 날
		Book_now bo_now_5 = Book_nowList.get(4);		// 디섯째 날
		
		model.addAttribute("Book_nowList",Book_nowList);
		
		model.addAttribute("bo_now_1",bo_now_1);
		model.addAttribute("bo_now_2",bo_now_2);
		model.addAttribute("bo_now_3",bo_now_3);
		model.addAttribute("bo_now_4",bo_now_4);
		model.addAttribute("bo_now_5",bo_now_5);
		
		return "book/bookForm";
	}
	
	
	// 예매 정보 저장
	@RequestMapping("book/bookInsert.do")
	public String bookInsert(@ModelAttribute Book book, 
							 @RequestParam("ex_num") int ex_num,
							 @RequestParam("bo_re_num") String bo_re_num,
							 Model model) throws Exception {
		
		System.out.println("bookInsert.do in");
		
		System.out.println("getPay_num: "+book.getPay_num());
		System.out.println("getMem_id: "+book.getMem_id());
		System.out.println("getEx_num: "+book.getEx_num());
		System.out.println("getBo_time: "+book.getBo_time());
		System.out.println("getBo_count: "+book.getBo_count());
		System.out.println("getBo_date: "+book.getBo_date());
		System.out.println("ex_num: "+ex_num);
		System.out.println("bo_re_num: "+bo_re_num);
						
		// 예매 정보 저장
		int result = bookService.book_insert(book);
		if(result == 1) System.out.println("bookInsert.do : 예매 정보 저장");
		
		// 저장한 예매 정보 꺼내기
		int bo_num = bookService.book_select_maxnum();	
		System.out.println("bo_num:"+ bo_num);
		
		model.addAttribute("result", result);
		model.addAttribute("ex_num", ex_num);
		model.addAttribute("bo_num", bo_num);

		return "book/bookInsert";
	}
	
	
	// 예매 페이지에서 결제 페이지로 이동
	@RequestMapping("book/payForm.do")
	public String payForm(@RequestParam int ex_num,
						  @RequestParam int bo_num,
						  HttpSession session,
			 			  Model model) throws Exception {
		
		System.out.println("payForm.do in");
		
		String mem_id = (String)session.getAttribute("mem_id");
		
		// 회원 테이블 불러옴
		Member member = memViewService.detail(mem_id);
		
		// 전시 상세 내용 불러옴
		Exhibition exhi = bookService.exhi_detail(ex_num);	
		
		// 예매 정보 불러옴
		Book book = bookService.book_select(bo_num);
		
		model.addAttribute("member", member);
		model.addAttribute("exhi", exhi);
		model.addAttribute("book", book);
		
		return "pay/payForm";
	}
	
}