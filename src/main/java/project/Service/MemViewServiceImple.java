package project.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.Dao.MemViewDao;
import project.Model.Book;
import project.Model.Member;

@Service
public class MemViewServiceImple implements MemViewService {
@Autowired
public MemViewDao  md;
//회원  총 데이터
@Override
public int getCount(Member member) {
	
	return md.getCount(member);
}

// 회원 목록
@Override
public List<Member> memberlist(Member member) {
	
	return md.memberlist(member);
}

//회원 상세 페이지

@Override
public Member detail(String mem_id) {
	
	return md.detail(mem_id);
}

// 회원 수정 
@Override
public int update(Member member) {
	
	return md.update(member);
}











	
	









	
	

}

