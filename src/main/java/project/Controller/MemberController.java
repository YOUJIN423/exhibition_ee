package project.Controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import project.Model.Member;
import project.Service.MemberService;
import project.Service.MemberServiceImpl;

@Controller
public class MemberController {

	@Autowired
	private MemberServiceImpl memberService;
	
	/*[메인(로그인 폼)]*/
	@RequestMapping("member_loginform.do")
	public String member_loginform(HttpServletRequest request, HttpSession session) {
		System.out.println("멤버 컨트롤러 들어옴(member_loginform");
		String referer = "";
		
		try {
			referer = request.getHeader("Referer");
			request.getSession().setAttribute("redirectURI", referer);
			System.out.println(referer);
			session.setAttribute("bf_url", referer.substring(30));
			
		} catch(NullPointerException e) {
			referer = "main_index.do";
			System.out.println(referer);
			session.setAttribute("bf_url", referer);
		}

		return "Member/member_loginform";
	}
	
	/*[ID중복 검사]*/
	@RequestMapping("member_idcheck.do")
	public String member_idcheck(@RequestParam("memid") String id, Model model )
								throws Exception{
		System.out.println("id:"+id);
		System.out.println("멤버 컨트롤러 들어옴(member_idcheck");
		
		int result = memberService.checkMembereId(id);  //[checkMemberId()메소드 : ID중복 검사 메소드]
		model.addAttribute("result", result);
		
		return "Member/member_idcheck_result";
	}

	
	/*
	 [로그인 인증]
	 a)DB에 저장된 비번을 불러오는 변수
	 passwd)로그인 폼에서 입력받은 비번  
	*/
	@RequestMapping("member_login_ok.do")
	public String member_login_ok(@RequestParam("id") String id,
			                      @RequestParam("passwd") String passwd,
			                      HttpSession session,  //세션 공유 설정
			                      Model model) throws Exception  {
		
		System.out.println("멤버 컨트롤러 들어옴(member_login_ok");
		int result=0;
		Member a = memberService.userCheck(id); //[userCheck()메소드 : 회원 1명의 상세 정보 구하는 메소드 ]
		
		//등록되지 않은 회원일 때
		if (a == null ) {
			
			result = 1;
			model.addAttribute("result", result);
			
			return "Member/member_loginResult";
		
	    //회원일 때
		}else {
			if(a.getMem_passwd().equals(passwd)) {
				session.setAttribute("mem_id", id);
				System.out.println(session.getAttribute("bf_url"));
				
				if(!session.getAttribute("bf_url").equals("null")) {
					return "redirect:"+session.getAttribute("bf_url");
				}
				
				return "redirect: main_index.do";
			//등록된 회원인데 비번이 다를 때	
			}else {
				result = 2;
				model.addAttribute("result", result);
			
		return "Member/member_loginResult";
	}
	}
}
	
	/*[비번 찾기 폼]*/
	@RequestMapping("member_pwd_find.do")
	public String member_pwd_find() {
		System.out.println("멤버 컨트롤러 들어옴(member_pwd_find");
		
		return "Member/member_pwd_find";
	}	
	
	
	/*[비번 찾기 메일 보내기]*/
	@RequestMapping("member_pwd_find_ok.do")
	public String member_pwd_find_ok(@ModelAttribute Member mem,
									 HttpServletResponse response,
			                         Model model)throws Exception {
		System.out.println("메인 컨트롤러 들어옴(member_pwd_find_ok");
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		Member member  = memberService.findpwd(mem);// [findpwd()메소드 : 비번 찾기 메소드 ]
		
		//값이 없는 경우
		if(member == null) {
			
			return "Member/member_pwd_result";
		
		//메일 전송	
		}else {
			// Mail Server 설정
			String charSet = "utf-8";
			String hostSMTP = "smtp.naver.com";
			String hostSMTPid = "alsgkqhfdl@naver.com";
			String hostSMTPpwd = "hhince159!!"; // 비밀번호 입력해야함

			// 보내는 사람 EMail, 제목, 내용
			String fromEmail = "alsgkqhfdl@naver.com";
			String fromName = "관리자";
			String subject = "비밀번호 찾기";

			// 받는 사람 E-Mail 주소 → member를 통해 불러와 mail변수에 저장 → addTo()메소드로 메일 전송
			String mail = member.getMem_email()+"@"+member.getMem_domain();

			try {
				HtmlEmail email = new HtmlEmail();
				email.setDebug(true);
				email.setCharset(charSet);
				email.setSSL(true);
				email.setHostName(hostSMTP);
				email.setSmtpPort(587);

				email.setAuthentication(hostSMTPid, hostSMTPpwd);
				email.setTLS(true);
				email.addTo(mail, charSet);
				email.setFrom(fromEmail, fromName, charSet);
				email.setSubject(subject);
				email.setHtmlMsg("<p align = 'center'>비밀번호 찾기</p><br>" + "<div align='center'> 비밀번호 : "
						+ member.getMem_passwd() + "</div>");
				email.send();
			} catch (Exception e) {
				System.out.println(e);	
		}
		model.addAttribute("pwdok", "등록된 email을 확인 하세요.");
		return "Member/member_pwd_find";
	}	
		
	}
	
	/*[멤버(이용 약관 동의 폼)]*/
	@RequestMapping("member_join_agreeform.do")
	public String member_join_agreeform() {
		System.out.println("메인 컨트롤러 들어옴(member_join_agreeform");
		
		return "Member/member_join_agreeform";
	}
	
	/*[멤버(회원가입 폼)]*/
	@RequestMapping("member_joinform.do")
	public String member_joinform() {
		System.out.println("멤버 컨트롤러 들어옴(member_joinform");
		
		return"Member/member_joinform";
	}
	
	/*[멤버(회원 가입 저장)]*/
	@RequestMapping("member_join_ok.do")
	public String member_join_ok(@ModelAttribute Member member, 
			                      Model model)throws Exception {
		int result = memberService.insert(member);  //[insert()메소드 : 회원 가입 메소드]
		if(result == 1)	 {System.out.println("메인 컨트롤러 들어옴(member_join_ok");
		model.addAttribute("result", result);
		}
		return"Member/member_join_welcome";
	}	
	
	/*[로그아웃]*/
	@RequestMapping("member_logout.do")
	public String member_logout(HttpSession session) {
		System.out.println("멤버 컨트롤러 들어옴(member_logout");
		
		session.invalidate();
		return"Member/member_logout";
	}
	
	/*[회원 탈퇴 ]*/
	
	/*[회원 탈퇴 완료]*/
	

	
	
}