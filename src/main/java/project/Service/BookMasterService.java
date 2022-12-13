package project.Service;

import java.util.List;

import project.Model.Book;
import project.Model.Exhibition;
import project.Model.Member;

public interface BookMasterService {

	// 총예약 데이터 수
	public int getbookCount()throws Exception;

	// 예약 리스트 
	public List<Book> booklist(int page);

	//  상세 예약
	public Book bookdetai(int bo_num);

	


	




}
