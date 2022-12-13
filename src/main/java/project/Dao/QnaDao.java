package project.Dao;

import java.util.List;
import java.util.Map;

import project.Model.Qna;

public interface QnaDao {

	List<Qna> getQnaList(Map map);

	String getQnaRe(int qna_num);

	int insertQna(Qna qna);

}
