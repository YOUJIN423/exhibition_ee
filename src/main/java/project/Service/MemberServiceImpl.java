package project.Service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.Dao.MemberDaoImpl;
import project.Model.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDaoImpl MemberDao;
	
	/*[로그인 인증]*/
	public Member userCheck(String id) throws Exception{
		return MemberDao.userCheck(id);
	}

	/*[멤버(회원 가입 저장)]*/
	@Override
	public int insert(Member member) throws Exception {
		// TODO Auto-generated method stub
		return MemberDao.insert(member);
	}

	/*[비번 찾기 메일 보내기]*/
	public Member findpwd(Member m) throws Exception {
		return MemberDao.findpwd(m);
	}

	/*[ID중복 검사(ajax함수로 처리부분)]*/
	public int checkMembereId(String id) throws Exception {
		return MemberDao.checkMembereId(id);
	}

	@Override
	public int deleteMember(Map map) {
		return MemberDao.deleteMember(map);
	}

	@Override
	public int updateMember(Member member) {
		return MemberDao.updateMember(member);
	}

	@Override
	public int insertSocial(Member member) {
		return MemberDao.insertSocial(member);
	}
	
	

	
}
