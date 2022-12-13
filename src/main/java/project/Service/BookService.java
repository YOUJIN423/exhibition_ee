package project.Service;

import java.util.List;
import java.util.Map;

import project.Model.Book;
import project.Model.Book_now;

import java.util.Date;
import java.util.List;

import project.Model.Book;

import project.Model.Exhibition;
import project.Model.Pay;

public interface BookService {
	
	public Exhibition exhi_detail(int ex_num) throws Exception;

	public List<Book_now> book_now(int ex_num) throws Exception;
		
	public int book_insert(Book book) throws Exception;
		
	public Book book_select(int bo_num) throws Exception;

	public int book_select_maxnum() throws Exception;

	
	/***************************************************************/

	List<Book> getBookList_book(Map map);

	List<Exhibition> getBookList_ex(Map map);

	List<Pay> getPayList(Map map);

	int updateBook_state(int bo_num);

	int updatePay_cancledate(int bo_num);

	Book getBook(int bo_num);

	Pay getPay(int bo_num);


	Date getCancleDate(int bo_num);

	List<Book> getBookList_book_recent(String mem_id);

	List<Exhibition> getBookList_ex_recent(String mem_id);

	List<Pay> getPayList_recent(String mem_id);

	public int getBookCount(String mem_id);

	public int deleteReview_state(int bo_num);

}