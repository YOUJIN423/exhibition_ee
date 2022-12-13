package project.Dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.Model.Member;

@Repository
public class MemberDaoImpl implements MemberDao{

	@Autowired
	private SqlSession sqlSession;
	
	/*[로그인 인증]*/
	public Member userCheck(String id) throws Exception{
		return sqlSession.selectOne("memberns.login_check", id);
	}
	/*[멤버(회원 가입 저장)]*/
	@Override
	public int insert(Member member) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert("memberns.insert", member);
	}
	/*[비번 찾기 메일 보내기]*/
	public Member findpwd(Member pm) throws Exception {
		return sqlSession.selectOne("memberns.pwd_find", pm);
	}
	/*[ID중복 검사(ajax함수로 처리부분)]*/
	public int checkMembereId(String id) throws Exception {
		int re = -1;  // 사용 가능한 ID
		Member mb = sqlSession.selectOne("memberns.login_check", id);
		if(mb != null)
			re=1;    //중복id
		return re;
	}
	
	// 회원 탈퇴
	public int deleteMember(Map map) {
		return sqlSession.update("memberns.deleteMember",map);
	}
	public int updateMember(Member member) {
		return sqlSession.update("memberns.updateMember",member);
	}
	
	public int insertSocial(Member member) {
		return sqlSession.insert("memberns.insertSocial",member);
	}
}