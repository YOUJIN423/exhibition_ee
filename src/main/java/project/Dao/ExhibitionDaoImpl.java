package project.Dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.Model.Exhibition;

@Repository
public class ExhibitionDaoImpl implements ExhibitionDao{
	@Autowired
	private SqlSessionTemplate st;

	@Override
	public Exhibition detail(int ex_num) {
		return st.selectOne("exhibitionns.detail", ex_num);
	}

	@Override
	public int getListCount(String ex_end_state) {
		return st.selectOne("exhibitionns.count", ex_end_state);
	}

	// 전시 목록
	@Override
	public List<Exhibition> getBoardList(Map map) {
		return st.selectList("exhibitionns.pagelist",map);
	}

	@Override
	public String getExName(int ex_num) {
		return st.selectOne("exhibitionns.getName",ex_num);
	}

	@Override
	public List<Exhibition> searchExhibition(String search) {
		System.out.println(search);
		return st.selectList("exhibitionns.searchExhibition", search);
	}

	/*[추천 전시]*/
	@Override
	public List<Exhibition> exhibition_bestList() {
		return st.selectList("exhibitionns.exhibition_bestList");
	}
}
