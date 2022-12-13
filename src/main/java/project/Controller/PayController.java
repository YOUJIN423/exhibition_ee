package project.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import project.Model.Book;
import project.Model.Book_now;
import project.Model.Exhibition;
import project.Model.Pay;
import project.Service.BookService;
import project.Service.PayService;

@Controller
public class PayController {
	
	@Autowired
	private PayService payService;
	
	@Autowired
	private BookService bookService;
	
	
	// 결제 API 호출
	@RequestMapping("pay_main.do")
	public String pay_main() {
		return "pay/pay_main";
	}
	
	// 결제 금액 0원 시 결제 정보 insert
	@RequestMapping("pay/pay0Result.do")
	public String pay0Result(@RequestParam("bo_num") int bo_num,
							 HttpSession session,
							 Model model) throws Exception {	
		
		System.out.println("pay/pay0Result.do in");
		
		// 예매 정보 불러옴
		Book book = bookService.book_select(bo_num);
		System.out.println("book: "+book);
		
		String mem_id = (String)session.getAttribute("mem_id");
		book.setMem_id(mem_id);
		
		// 결제 정보 insert
		int result = payService.pay_0insert(book);
		if(result == 1) System.out.println("결제 정보 저장");
		
		if(result == 1) {
			// insert 완료 시 예매 가능 인원 update
			// 결제 완료 후 book 갖고 와 변경
			// book에 저장된 시간 별로 book_now 예매 가능 인원 수정
			if(book.getBo_time() == 1) {
				int update_result1 = payService.timecount_update1(book);
				if(update_result1 == 1) System.out.println("예매 가능 인원 update - 1");
			}else if(book.getBo_time() == 2) {
				int update_result2 = payService.timecount_update2(book);
				if(update_result2 == 1) System.out.println("예매 가능 인원 update - 2");
			}else if(book.getBo_time() == 3) {
				int update_result3 = payService.timecount_update3(book);
				if(update_result3 == 1) System.out.println("예매 가능 인원 update - 3");
			}else if(book.getBo_time() == 4) {
				int update_result4 = payService.timecount_update4(book);
				if(update_result4 == 1) System.out.println("예매 가능 인원 update - 4");
			}
			
			// 전시 테이블에 예약 인원 수 update
			int totalcount_result = payService.ex_total_count(book);
			if(totalcount_result == 1) System.out.println("예약 인원 수 update");
			
		}else {
			// insert 실패 시 예매 정보 삭제
			int delete_result = payService.book_0delete(book); 
			if(delete_result == 1) System.out.println("예매 정보 삭제");
		}
		
		return "redirect: paySuccess.do";
	}
	
	// 결제 실패 시 예약 테이블 delete
	@RequestMapping("pay/payCancel.do")
	public String payCancel(@RequestParam("bo_num") int bo_num,
							Model model) throws Exception {
		
		System.out.println("pay/payCancel.do in");
		
		// 예매 번호로 예매 테이블 불러오기
		Book book = bookService.book_select(bo_num);
		
		// insert 실패 시 예매 정보 삭제
		int delete_result = payService.book_0delete(book); 
		if(delete_result == 1) System.out.println("예매 정보 삭제");
		
		int ex_num = book.getEx_num();
		
		model.addAttribute("ex_num", ex_num);
		
		return "redirect: /semi_project/exhibition_detail.do";	// 전시 상세 페이지로 이동
	}
	
	// 결제 정보 insert
	@ResponseBody // dto나 list를 바로 돌려줄 때 사용함
	@RequestMapping("pay/payResult.do")
	public int payResult(@RequestBody Pay pay,
						 Model model) throws Exception {	
		
		System.out.println("pay/payResult.do in");
		
		// 결제 정보 insert
		int result = payService.pay_insert(pay);
		if(result == 1) System.out.println("결제 정보 저장");
		
		// 저장한 결제 정보 꺼내기
		Pay spay = payService.pay_select_maxnum();			
		int bo_num = spay.getBo_num();
		
		// 예매 번호로 예매 테이블 불러오기
		Book book = bookService.book_select(bo_num);
		
		if(result == 1) {
			// insert 완료 시 예매 가능 인원 update
			// 결제 완료 후 book 갖고 와 변경
			// book에 저장된 시간 별로 book_now 예매 가능 인원 수정
			if(book.getBo_time() == 1) {
				int update_result1 = payService.timecount_update1(book);
				if(update_result1 == 1) System.out.println("예매 가능 인원 update - 1");
			}else if(book.getBo_time() == 2) {
				int update_result2 = payService.timecount_update2(book);
				if(update_result2 == 1) System.out.println("예매 가능 인원 update - 2");
			}else if(book.getBo_time() == 3) {
				int update_result3 = payService.timecount_update3(book);
				if(update_result3 == 1) System.out.println("예매 가능 인원 update - 3");
			}else if(book.getBo_time() == 4) {
				int update_result4 = payService.timecount_update4(book);
				if(update_result4 == 1) System.out.println("예매 가능 인원 update - 4");
			}
			
			// 전시 테이블에 예약 인원 수 update
			int totalcount_result = payService.ex_total_count(book);
			if(totalcount_result == 1) System.out.println("예약 인원 수 update");
			
		}
			// insert 실패 시 예매 정보 삭제
			// int delete_result = payService.book_delete(pay); 
			// if(delete_result == 1) System.out.println("예매 정보 삭제");
		
		model.addAttribute("result", result);
		
		return result;	// 호출한 payForm.jsp로 값 넘김
	}
	
	
	// 결제 완료 시 결제 완료 창으로 이동
	@RequestMapping("pay/paySuccess.do")
	public String paySuccess() throws Exception {
		return "pay/paySuccess";
	}
	
	// 결제 완료 창에서 마이페이지로 이동
	
}
