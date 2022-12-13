package project.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.Model.Book;
import project.Model.Member;

@Repository
public class MemViewDaoImple implements MemViewDao {
	@Autowired
	public SqlSession session;

// 회원 총 데이터
	@Override
	public int getCount(Member member) {

		return session.selectOne("memns.membercount", member);
	}

// 회원 목록
	@Override
	public List<Member> memberlist(Member member) {

		return session.selectList("memns.memberlist", member);
	}

	// 회원 상세페이지
	@Override
	public Member detail(String mem_id) {
		return session.selectOne("memns.detail" , mem_id);
	}

	// 회원 수정
	@Override
	public int update(Member member) {
	
		return session.update("memns.update", member);
	}
}