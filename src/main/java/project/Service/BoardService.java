package project.Service;

import java.util.List;

import project.Model.Board;

public interface BoardService {

// 글작성 등록
public int insert(Board board) throws Exception;
// 글 총 갯수
public int getCount()throws Exception;
// 글 목록
public List<Board>getBoardList(int page)throws Exception;
// 글 상세 페이지
public Board getBoard(int board_num) throws Exception;
// 글수정
public int update(Board board)throws Exception;
// 글 삭제
public int delete(int board_num)throws Exception;

	
	
}
