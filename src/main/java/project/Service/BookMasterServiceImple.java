package project.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.Dao.BookMasterDaoImple;
import project.Model.Book;
import project.Model.Exhibition;
import project.Model.Member;


@Service
public class BookMasterServiceImple implements BookMasterService {
@Autowired
public BookMasterDaoImple  mb;

// 총예약 데이터 갯수
public int getbookCount() {
	return mb.getbookCount();
}
//예약 내역

public List<Book> booklist(int page){
	return mb.booklist(page);
}
//예약 상세내역

public Book bookdetai(int bo_num) {
	return mb.bookdetail(bo_num);
}

}
