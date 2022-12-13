package project.Controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.Model.Book;
import project.Model.Exhibition;
import project.Model.Member;
import project.Service.BookMasterService;

@Controller
public class BookMasterController {
	@Autowired
	public BookMasterService ms;

// 예약 관리 페이지 
	@RequestMapping("master/masterbook.do")
	public String masterbook() {
		
		return "bookmaster/masterbook";
	}

// 예약 페이지 
	@RequestMapping("master/bookpage.do")
	public String bookpage(Book book, Model model, HttpServletRequest request) throws Exception {

		int page = 1; // 현재 페이지 번호
		int limit = 5; // 한 화면에 출력 데이터 갯수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}	
			
			int startRow = (page - 1) * limit + 1;
			int endRow = page * limit;

			int bookcount = ms.getbookCount();
			System.out.println("bookcount:" +bookcount ); // 총 데이터 갯수

			List<Book> booklist = ms.booklist(page); // 예약 목록
			System.out.println("booklist:" + booklist);

			// 총 페이지 수

			int pagecount = bookcount / limit + ((bookcount % limit == 0) ? 0 : 1);

			int startPage = ((page - 1) / 5) * limit + 1;
			int endPage = startPage + 5 - 1;

			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			
			if (endPage > pagecount) endPage = pagecount;
			
			 model.addAttribute("page", page);
			 model.addAttribute("startPage",startPage );
			 model.addAttribute("endPages", endPage);
			 model.addAttribute("bookcount", bookcount);
			 model.addAttribute("booklist", booklist);
			 
		return "/bookmaster/masterbook";

	}

// 예약 상세페이지
@RequestMapping("master/bookdetail.do")
public String bookdetail(int bo_num , int page , Model model) {
	System.out.println("관리자 예약 상세 페이지 확인");
	
	Book  book = ms.bookdetai(bo_num);  // 상세 정보 구하기 
	System.out.println("book:"+book);
	
	model.addAttribute("book", book);  // 번호
	model.addAttribute("page", page); 
	
	return"bookmaster/bookdetail";
}
	
	

}