package project.Dao;

import java.util.Map;

import project.Model.Member;

public interface MemberDao {
	public Member userCheck(String id) throws Exception;
	public int insert(Member member) throws Exception;
	
	public int deleteMember(Map map);
	public int updateMember(Member member);
	public int insertSocial(Member member);
}
