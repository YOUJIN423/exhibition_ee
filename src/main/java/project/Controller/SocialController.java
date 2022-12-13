package project.Controller;

import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import project.Model.Member;
import project.Service.MemberService;
import project.Service.OAuthService;

@Controller
public class SocialController {
	@Autowired
	OAuthService oas;
	
	@Autowired
	private MemberService ms;
	
	// 소셜 로그인폼으로 이동
	@RequestMapping("socialLoginForm.do")
	public String socialLoginForm() {
		return "socialLogin/SocialLoginForm";
	}
	
	// 카카오 소셜 로그인 callback
	@RequestMapping("kakao/oauth.do")
	public String kakao_login(@RequestParam String code, Model model, 
								HttpSession session) throws Exception {
		
		System.out.println("kakao code : "+code);
		String access_Token = oas.getKakaoAccessToken(code);
		
		System.out.println(access_Token);
		Map map = oas.createKakaoUser(access_Token);
		
		// 회원가입
		String id = (String) map.get("id");
		String email = (String) map.get("email");
		
		StringTokenizer e = new StringTokenizer(email,"@");
		
		// 기존 회원인지 검사
		Member a = ms.userCheck(id);
		if (a == null) {
			model.addAttribute("id", id);
			model.addAttribute("email",e.nextToken());
			model.addAttribute("domain",e.nextToken());
			
			return "Member/socialJoinForm";
		} else {
			session.setAttribute("mem_id",id);
		}
		return "redirect: /semi_project/main_index.do";
	}
	
	// 네이버 소셜 로그인 callback
	@RequestMapping("naver/oauth.do")
	public String naver_login(HttpServletRequest request, HttpSession session, 
									Model model) throws Exception {
		String code = request.getParameter("code");
		String state = request.getParameter("state");
		
		System.out.println("code : "+code);
		System.out.println("state : "+state);
		
		Map res = new HashMap();
		res.put("code", code);
		res.put("state",state);
		
		Map token = oas.getNaverAccessToken(res);
		Map result = oas.createNaverUser(token);
		
		String id = (String) result.get("id");
		String email = (String) result.get("email");
		StringTokenizer e = new StringTokenizer(email,"@");
		
		// 기존 회원인지 검사
		Member a = ms.userCheck(id);
		if (a == null) {
			model.addAttribute("id", id);
			model.addAttribute("email",e.nextToken());
			model.addAttribute("domain",e.nextToken());
			return "Member/socialJoinForm";
		} else {
			session.setAttribute("mem_id",id);
		}
		return "redirect: /semi_project/main_index.do";
	}
	
	@RequestMapping("google/oauth.do")
	public String google_login(HttpServletRequest request, 
				HttpSession session, Model model) throws Exception {
		
		// 회원가입
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		StringTokenizer e = new StringTokenizer(email,"@");
		
		// 기존 회원인지 검사
		Member a = ms.userCheck(id);
		
		if (a == null) {
			model.addAttribute("id", id);
			model.addAttribute("email",e.nextToken());
			model.addAttribute("domain",e.nextToken());
			return "Member/socialJoinForm";
		} else {
			session.setAttribute("mem_id",id);
		}
		return "redirect: /semi_project/main_index.do";
	}
	
	@RequestMapping("kakao/oauth/logout.do")
	public String kakao_logout(HttpSession session) {
		session.invalidate();
		return "redirect: main_index.do";
	}
	
	@RequestMapping("socialJoin.do")
	public String socialJoin(@ModelAttribute Member member, Model model) {
		int result = ms.insertSocial(member);
		model.addAttribute("result",result);
		return "Member/member_join_welcome";
	}
}
