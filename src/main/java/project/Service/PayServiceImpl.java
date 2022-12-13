package project.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.Dao.PayDao;
import project.Model.Book;
import project.Model.Pay;

@Service
public class PayServiceImpl implements PayService{

	@Autowired
	private PayDao payDao;
	
	// 결제 완료 시 결제 정보 insert
	public int pay_insert(Pay pay) throws Exception {
		return payDao.pay_insert(pay);
	}

	// 결제 정보 select (등록 후 바로 꺼내기 위해 max 함수 사용)
	public Pay pay_select_maxnum() throws Exception {
		return payDao.pay_select_maxnum();
	}
	
	// 결제 완료 시 예약 가능 인원 update : 1일 경우 (10:00 ~ 12:00)
	public int timecount_update1(Book book) throws Exception {
		return payDao.timecount_update1(book);
	}
	
	// 결제 완료 시 예약 가능 인원 update : 2일 경우 (12:00 ~ 14:00)
	public int timecount_update2(Book book) throws Exception {
		return payDao.timecount_update2(book);
	}

	// 결제 완료 시 예약 가능 인원 update : 3일 경우 (14:00 ~ 16:00)
	public int timecount_update3(Book book) throws Exception {
		return payDao.timecount_update3(book);
	}
	
	// 결제 완료 시 예약 가능 인원 update : 4일 경우 (16:00 ~ 18:00)
	public int timecount_update4(Book book) throws Exception {
		return payDao.timecount_update4(book);
	}
	
	// 결제 완료 시 전시 테이블 예약 총 인원 update
	public int ex_total_count(Book book) throws Exception {
		return payDao.ex_total_count(book);
	}
	
	// 결제 실패 시 예약 정보 delete
	public int book_delete(Pay pay) throws Exception {
		return payDao.book_delete(pay);
	}

	// 0원 결제 시 결제 정보 insert
	public int pay_0insert(Book book) throws Exception {
		return payDao.pay_0insert(book);
	}

	// 0원 결제 insert 실패 시 예약 정보 delete
	public int book_0delete(Book book) throws Exception {
		return payDao.book_0delete(book);
	}

}
