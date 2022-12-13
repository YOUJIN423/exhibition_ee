package project.Dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import java.util.Date;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.Model.Book;
import project.Model.Book_now;
import project.Model.Exhibition;
import project.Model.Pay;

@Repository
public class BookDaoImpl implements BookDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	// 전시 상세 정보 구하기
		public Exhibition exhi_detail(int ex_num) throws Exception {
			return sqlSession.selectOne("exhi_detail", ex_num);
		}

		// 예약 현황 구하기
		public List<Book_now> book_now(int ex_num) throws Exception {
			return sqlSession.selectList("book_now", ex_num);
		}

		// 예약 정보 insert
		public int book_insert(Book book) throws Exception {
			return sqlSession.insert("bookns.book_insert", book);
		}

		// 예약 정보 select
		public Book book_select(int bo_num) throws Exception {
			return sqlSession.selectOne("bookns.book_select", bo_num);
		}
		
		// 예약 정보 select (등록 후 바로 꺼내기 위해 max 함수 사용)
		public int book_select_maxnum() throws Exception {
			return sqlSession.selectOne("bookns.book_select_maxnum");
		}
	
	/******************************************************************/
	
	@Override
	public List<Book> getBookList_book(Map map) {
		return sqlSession.selectList("bookns.booklist_book",map);
	}

	@Override
	public List<Exhibition> getBookList_ex(Map map) {
		return sqlSession.selectList("bookns.booklist_ex",map);
	}

	@Override
	public List<Pay> getPayList(Map map) {
		return sqlSession.selectList("bookns.booklist_pay",map);
	}
	
	@Override
	public int updateBook_state(int bo_num) {
		return sqlSession.update("bookns.updateBook_state",bo_num);
	}

	@Override
	public int updatePay_cancledate(int bo_num) {
		return sqlSession.update("bookns.updatePay_cancledate",bo_num);
	}

	@Override
	public Book getBook(int bo_num) {
		return sqlSession.selectOne("bookns.getBook",bo_num);
	}

	@Override
	public Pay getPay(int bo_num) {
		return sqlSession.selectOne("bookns.getPay",bo_num);
	}

	@Override
	public Date getCancleDate(int bo_num) {
		return sqlSession.selectOne("bookns.getCancleDate",bo_num);
	}

	@Override
	public List<Book> getBookList_book_recent(String mem_id) {
		return sqlSession.selectList("bookns.booklist_book_recent", mem_id);
	}

	@Override
	public List<Exhibition> getBookList_ex_recent(String mem_id) {
		return sqlSession.selectList("bookns.booklist_ex_recent",mem_id);
	}

	@Override
	public List<Pay> getPayList_recent(String mem_id) {
		return sqlSession.selectList("bookns.booklist_pay_recent",mem_id);
	}

	@Override
	public int getBookCount(String mem_id) {
		return sqlSession.selectOne("bookns.bookCount",mem_id);
	}

	@Override
	public int deleteReview_state(int bo_num) {
		return sqlSession.update("bookns.delReview_state",bo_num);
	}

	// 예약 취소 시 전시 테이블 예약 총 인원 수 update 
	public int updateEx_total_count(Book book) {
		return sqlSession.update("bookns.updateEx_total_count", book);
	}

}