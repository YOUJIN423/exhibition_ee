package project.Dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.Model.Qna;

@Repository
public class QnaDaoImpl implements QnaDao{
	@Autowired
	private SqlSessionTemplate st;
		
	@Override
	public List<Qna> getQnaList(Map map) {
		return st.selectList("qnans.getQnaList",map);
	}
	
	@Override
	public String getQnaRe(int qna_num) {
		return st.selectOne("qnans.getQnaRe", qna_num);
	}

	@Override
	public int insertQna(Qna qna) {
		return st.insert("qnans.insertQna",qna);
	}
}
