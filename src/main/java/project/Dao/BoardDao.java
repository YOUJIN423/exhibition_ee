package project.Dao;

import java.util.List;

import project.Model.Board;

public interface BoardDao {
// 공지 사항 등록
	public int insert(Board board) throws Exception;
// 데이터 총 수
	public int getCount() throws Exception;
// 글 목록
	public List<Board> getBoardList(int page);
	// 글 상세페이지 
	public Board getBoard(int board_num) ;
    // 글 수정
	public int update(Board board) throws Exception;
	// 글 삭제 
	public int delete(int board_num)throws Exception;
}