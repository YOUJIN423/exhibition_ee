package project.Service;

import java.util.List;

import project.Model.Book;
import project.Model.Member;

public interface MemViewService {
// 회원 총 수
	int getCount(Member member);
	
//회원 리스트
	List<Member> memberlist(Member member);

// 회원 상세 페이지 
	Member detail(String mem_id);	

// 회원 수정 
	int update(Member member);




   


	
	


	






	
}
