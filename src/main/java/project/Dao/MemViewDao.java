package project.Dao;

import java.util.List;

import project.Model.Book;
import project.Model.Member;

public interface MemViewDao {

// 회원 총 데이터 수
	int getCount(Member member);
// 회원 리스트
	List<Member> memberlist(Member member);
	
  // 회원 상세 페이지
	Member detail(String mem_id);
	
	// 회원 수정 
	int update(Member member);

	

}