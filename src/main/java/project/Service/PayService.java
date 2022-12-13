package project.Service;

import project.Model.Book;
import project.Model.Pay;

public interface PayService {

	public int pay_insert(Pay pay) throws Exception;
	
	public Pay pay_select_maxnum() throws Exception;
	
	public int ex_total_count(Book book) throws Exception;
	
	public int book_delete(Pay pay) throws Exception;

	public int timecount_update1(Book book) throws Exception;
	
	public int timecount_update2(Book book) throws Exception;

	public int timecount_update3(Book book) throws Exception;

	public int timecount_update4(Book book) throws Exception;

	public int pay_0insert(Book book) throws Exception;

	public int book_0delete(Book book) throws Exception;

	
//	public void time_count_edit(Book book) throws Exception;
}
