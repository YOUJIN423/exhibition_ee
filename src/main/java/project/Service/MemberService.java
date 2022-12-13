package project.Service;

import java.util.Map;

import project.Model.Member;

	/*[멤버(회원 가입 저장)]*/
	public interface MemberService {
		public Member userCheck(String mem_id) throws Exception;
		public int insert(Member member) throws Exception;
		
		// 회원 탈퇴
		public int deleteMember(Map map);
		
		// 회원 수정
		public int updateMember(Member member);
		
		// 소셜회원가입
		public int insertSocial(Member member);
		
	/*[비번 찾기 메일 보내기]*/	
		
	}
