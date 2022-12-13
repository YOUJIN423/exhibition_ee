package project.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.Model.Book;
import project.Model.Exhibition;
import project.Model.Member;

@Repository
public class BookMasterDaoImple {
@Autowired
public SqlSession session;

// 예약 총 데이터 갯수
public int getbookCount() {
	
	return session.selectOne("membook.count");
}

// 예약 페이지
public List<Book> booklist(int page) {
	
	return session.selectList("membook.booklist",page);	
}

// 상세 예약 페이지
public Book bookdetail(int bo_num) {
	
	return session.selectOne("membook.detail", bo_num);
}

// 현재 예약 현항
}