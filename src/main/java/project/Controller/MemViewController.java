package project.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import project.Model.Book;
import project.Model.Member;

import project.Service.MemViewService;

@Controller
public class MemViewController<paginPgm> {
	@Autowired
	public MemViewService mv;

	// 회원 목록
	@RequestMapping("master/memberlist.do") // 전체 회원 , 검색 회원 구분
	public String memberlist(Model model, Member member, String pageNum) {
		final int rowPage = 10;
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		
		// 현재 페이지 번호
		int currentPage = Integer.parseInt(pageNum);

		// 총 회원 수
		int total = mv.getCount(member);
		System.out.println("total:" + total);

		int startRow = (currentPage - 1) * rowPage + 1;
		int endRow = currentPage* rowPage ;

		project.Service.PagingPgm pp = new project.Service.PagingPgm(total, rowPage, currentPage);
		member.setStartRow(startRow);
		member.setEndRow(endRow);

	
		// 검색된 회원, 전체 회원
		List<Member> memberlist = mv.memberlist(member);
	
		System.out.println("memberlist:" + memberlist);

		model.addAttribute("memberlist", memberlist);
		model.addAttribute("pp", pp);

		// 검색 기능
		model.addAttribute("search", member.getSearch());
		model.addAttribute("keyword", member.getKeyword());

		return "memberview/memberlist";

	}
	
	// 회원 상세 조회 페이지

	@RequestMapping("master/memberview.do")
	public String memberview(String id, Model model) {

		 Member  member = mv.detail(id);

		System.out.println("member : " + member);

		model.addAttribute("member", member);

		return "memberview/memberdetail";

	}

// 회원 수정  폼 페이지 
	@RequestMapping("master/memberupdateform.do")
	public String memberedit(String mem_id, Model model) {
		 System.out.println("글수정 폼");
		Member member = mv.detail(mem_id);  // 상세 정보
		
		model.addAttribute("member", member);
		
		
		return "memberview/memberupdateform";
	}

// 회원 수정 	
	@RequestMapping("master/memupdate.do")
	public String memupdate(Member member, Model model) {
      System.out.println("글수정");
      
		int result = mv.update(member); // 회원 정보수정

		model.addAttribute("member", member.getMem_id());
		model.addAttribute("result", result);

		return "memberview/memupdate";

	}

}