package project.Dao;

import java.util.List;

import project.Model.Book;
import project.Model.Exhibition;
import project.Model.Member;
import project.Service.BookMasterService;

public interface BookMasterDao{

// 예약 총 데이터 갯수
public int getbookCount() ;

// 예약 페이지
public List<Book> booklist(int page);

//상세 예약 페이지 
public Book bookdetail(int bo_num);


}