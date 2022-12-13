package project.Controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import project.Model.Board;
import project.Model.Master;
import project.Model.Qna;
import project.Service.BoardServiceImple;

@Controller
public class BoardController {
@Autowired
public BoardServiceImple bs;

//글 작성 폼
	@RequestMapping("master/boardwriter.do")
	public String Board_writer() {
		return "/masterboard/boardwriter"; 
	}
	
// 글 작성 등록
		@RequestMapping("master/insert.do")
		public String insert(@ModelAttribute Board  board ,Model  model, HttpServletRequest request , HttpSession session) throws Exception {
		String date = request.getParameter("board_date_b");
 	    System.out.println(date);			
		int result = bs.insert(board);		
       	if(result==1) System.out.println("글작성 성공");
       	model.addAttribute("result", result);
       	
       	return "masterboard/insertresult";
}

		// 관리자용 공지사항 목록으로 이동
		@RequestMapping("master/master_notice.do")
		public String master_notice(HttpServletRequest request, Model model) {
			
			System.out.println("master_notice.do in");
		
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
			
			return "master/master_notice";
		}
		
		// 관리자용 공지 사항 상세 페이지로 이동
		@RequestMapping("master/master_boardcontent.do")
		public String boardcontent(int board_num, int page, Model model) {
			
			System.out.println("master_boardcontent.do in");
			Board board = bs.getBoard(board_num); // 상세정보 구하기 
			
			String content = board.getBoard_content().replace("\n", "<br>");
			
			model.addAttribute("board", board);
			model.addAttribute("content", content);
			model.addAttribute("page", page);
			
			return "master/master_boardContent";
		}	

//글수정 폼
@RequestMapping("master/boardupdateform.do")
public String boardupdateform(HttpSession session, int board_num, int page, Model model) { 

	System.out.println("boardupdateform.do in");
	
	Board board = bs.getBoard(board_num); 
	
	model.addAttribute("board", board);
	model.addAttribute("page", page);
	
	return "masterboard/boardupdate";
}
				
	// 글 수정 등록
	@RequestMapping("master/boardupdate.do")
	public String boardupdate(Board board, int page, Model model) {
		
		System.out.println("boardupdate.do in");
	    
	    int result = bs.update(board);  // 글 수정; 
	    if(result == 1) System.out.println("글 수정 완료");
	    	
	    model.addAttribute("result", result);
	    model.addAttribute("board", board);
	    model.addAttribute("page", page);
	    
	    return "masterboard/updateresult";
	}

	// 글 삭제 폼
	@RequestMapping("master/boarddeleteform.do")
	public String boarddelete(int board_num, int page, Model model) {
		
		System.out.println("boarddeleteform.do in");
		
		Board board = bs.getBoard(board_num); 
		
		model.addAttribute("board", board);
		model.addAttribute("page", page);
		
		return "masterboard/boarddeleteform";	
	}
	
	//글 삭제 
	@RequestMapping("master/boarddelete.do")
	public String BoardDelete(Board board, int page, Model model) {
		
	    System.out.println("boarddelete.do in");
	    
	    int result = bs.delete(board.getBoard_num());
	    if(result == 1) System.out.println("글 삭제 완료");
		
		model.addAttribute("page", page);
		
	   	return "redirect: master_notice.do";
		
	}
}

