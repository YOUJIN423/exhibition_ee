package project.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.Dao.BoardDaoImple;
import project.Model.Board;
import project.Model.Qna;

@Service
public class BoardServiceImple implements BoardService {

	@Autowired
	public BoardDaoImple bd;

//글작성 등록
	@Override
	public int insert(Board board) throws Exception {
		return bd.insert(board);
	}

// 글 데이터 총수 
	public int getCount() {
		return bd.getCount();
	}

// 글 목록
	public List<Board> getBoardList(int page) {
		return bd.getBoardList(page);
	}

//  글 상세 페이지 
	public Board getBoard(int board_num) {
		return bd.getBoard(board_num);
	}
//   글 수정
	public  int update(Board board) {
	 return bd.update(board);
	}
// 글 삭제 
	public int delete(int board_num) {
		
		return bd.delete(board_num);
	}

}