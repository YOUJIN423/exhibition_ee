package project.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.Model.Master;
import project.Model.Member;
import project.Model.Qna;
@Repository
public class MasterDaoImple implements MasterDao{
@Autowired
public SqlSessionTemplate session;
// 관리자 로그인 
@Override
public Master login(Master ms) {
	return session.selectOne("masterns.login",ms);
}
// 문의 글 갯수
@Override
public int getCount() {

	return session.selectOne("masterns.count1");
}

// 문의 목록
@Override
public List<Qna> getQnaList(int page) {
	
	return session.selectList("masterns.qnalist",page);
}
// 문의 글 정보
@Override
public Qna getselect(int qna_num) {
	
	return session.selectOne("masterns.qna",qna_num);
}
// 문의 답글
@Override
public int qnareply(Qna qna) {

	return session.insert("masterns.insert", qna);
}
// 문의 답글 레벨
@Override
public void replyUp(Qna qna) {
	
   session.update("masterns.update",qna);
	
}
// 문의 답변 상대 변경
@Override
public int qna_state_update(int qna_num) {
	return session.update("masterns.state_update", qna_num);
}

// 답변출력
@Override
public Qna getReSelect(int qna_num) {
	return session.selectOne("masterns.replyPrint",qna_num);
}








// 문의 답글 수정

}
