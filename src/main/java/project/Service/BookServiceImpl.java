package project.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.Dao.BookDao;
import project.Dao.BookDaoImpl;
import project.Model.Book;
import project.Model.Book_now;
import project.Model.Book;
import project.Model.Exhibition;
import project.Model.Pay;

@Service
public class BookServiceImpl implements BookService {

	@Autowired
	private BookDao bookDao;

		// 전시 상세 정보 구하기
		public Exhibition exhi_detail(int ex_num) throws Exception {
			return bookDao.exhi_detail(ex_num);
		}

		// 예약 현황 구하기
		public List<Book_now> book_now(int ex_num) throws Exception {
			return bookDao.book_now(ex_num);
		}

		// 예약 정보 insert
		public int book_insert(Book book) throws Exception {
			return bookDao.book_insert(book);
		}

		// 예약 정보 select
		public Book book_select(int bo_num) throws Exception {
			return bookDao.book_select(bo_num);
		}
		
		// 예약 정보 select (등록 후 바로 꺼내기 위해 max 함수 사용)
		public int book_select_maxnum() throws Exception {
			return bookDao.book_select_maxnum();
		}

	/**********************************************************************/
	
	@Override
	public List<Book> getBookList_book(Map map) {
		return bookDao.getBookList_book(map);
	}

	@Override
	public List<Exhibition> getBookList_ex(Map map) {
		return bookDao.getBookList_ex(map);
	}

	@Override
	public List<Pay> getPayList(Map map) {
		return bookDao.getPayList(map);
	}

	@Override
	public int updateBook_state(int bo_num) {
		return bookDao.updateBook_state(bo_num);
	}

	@Override
	public int updatePay_cancledate(int bo_num) {
		return bookDao.updatePay_cancledate(bo_num);
	}

	@Override
	public Book getBook(int bo_num) {
		return bookDao.getBook(bo_num);
	}

	@Override
	public Pay getPay(int bo_num) {
		return bookDao.getPay(bo_num);
	}

	@Override
	public Date getCancleDate(int bo_num) {
		return bookDao.getCancleDate(bo_num);
	}

	@Override
	public List<Book> getBookList_book_recent(String mem_id) {
		return bookDao.getBookList_book_recent(mem_id);
	}

	@Override
	public List<Exhibition> getBookList_ex_recent(String mem_id) {
		return bookDao.getBookList_ex_recent(mem_id);
	}

	@Override
	public List<Pay> getPayList_recent(String mem_id) {
		return bookDao.getPayList_recent(mem_id);
	}

	@Override
	public int getBookCount(String mem_id) {
		return bookDao.getBookCount(mem_id);
	}

	@Override
	public int deleteReview_state(int bo_num) {
		return bookDao.deleteReview_state(bo_num);
	}

}