package project.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.Model.Board;
import project.Model.Qna;

@Repository
public class BoardDaoImple implements BoardDao {
	@Autowired
	public SqlSession session;

	// 공지사항 등록
	public int insert(Board board) {
		return session.insert("boardns.insert", board);

	}

// 데이터 총 수 
	public int getCount() {
		return session.selectOne("boardns.count");
	}

// 공지사항 목록 
	public List<Board> getBoardList(int page) {
		return session.selectList("boardns.list", page);
	}

// 글 상세페이지
	
	public Board getBoard(int board_num) {
		return session.selectOne("boardns.content", board_num);
	}

// 글 수정 
	public int update(Board board) {
		return session.update("boardns.update", board);
	}
// 글 삭제 
	public int delete(int board_num) {
	    return session.delete("boardns.delete", board_num);
	}

}