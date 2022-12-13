package project.Dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.Model.Book;
import project.Model.Pay;

@Repository
public class PayDaoImpl implements PayDao{
	
	@Autowired
	private SqlSession sqlSession;

	// 결제 완료 시 결제 정보 insert
	public int pay_insert(Pay pay) throws Exception {
		return sqlSession.insert("payns.pay_insert", pay);
	}

	// 결제 정보 select (등록 후 바로 꺼내기 위해 max 함수 사용)
	public Pay pay_select_maxnum() throws Exception {
		return sqlSession.selectOne("payns.pay_select_maxnum");
	}
	
	// 결제 완료 시 예약 가능 인원 update : 1일 경우 (10:00 ~ 12:00)
	public int timecount_update1(Book book) throws Exception {
		return sqlSession.update("payns.timecount_select1", book);
	}
	
	// 결제 완료 시 예약 가능 인원 update : 2일 경우 (10:00 ~ 12:00)
	public int timecount_update2(Book book) throws Exception {
		return sqlSession.update("payns.timecount_select2", book);
	}
	
	// 결제 완료 시 예약 가능 인원 update : 3일 경우 (10:00 ~ 12:00)
	public int timecount_update3(Book book) throws Exception {
		return sqlSession.update("payns.timecount_select3", book);
	}
	
	// 결제 완료 시 예약 가능 인원 update : 4일 경우 (10:00 ~ 12:00)
	public int timecount_update4(Book book) throws Exception {
		return sqlSession.update("payns.timecount_select4", book);
	}
	
	// 결제 완료 시 전시 테이블 예약 총 인원 update
	public int ex_total_count(Book book) throws Exception {
		return sqlSession.update("payns.ex_total_count", book);
	}
	
	// 결제 실패 시 예약 정보 delete
	public int book_delete(Pay pay) throws Exception {
		return sqlSession.delete("payns.book_delete", pay);
	}

	// 0원 결제 시 결제 정보 insert
	public int pay_0insert(Book book) throws Exception {
		return sqlSession.insert("payns.pay_0insert", book);
	}

	// 0원 결제 실패 시 예약 정보 delete
	public int book_0delete(Book book) throws Exception {
		return sqlSession.delete("payns.book_0delete", book);
	}
	

}
