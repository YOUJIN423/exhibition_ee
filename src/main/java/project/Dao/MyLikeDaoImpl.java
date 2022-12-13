package project.Dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.Model.Exhibition;
import project.Model.MyLike;

@Repository
public class MyLikeDaoImpl implements MyLikeDao{
	@Autowired
	private SqlSessionTemplate st;

	@Override
	public int getMyLike(Map like) {
		try {
			return st.selectOne("mylikens.getMyLike", like);
		} catch (NullPointerException e) {
			return 3;
		}
	}

	@Override
	public int updateMyLike(MyLike like) {
		return st.update("mylikens.updateMyLike", like);
	}

	@Override
	public int insertMyLike(Map map) {
		return st.update("mylikens.insertMyLike", map);
	}

	@Override
	public List<Exhibition> mylikeList(Map map) {
		return st.selectList("mylikens.mylikeList", map);
	}

	@Override
	public List<Exhibition> mylikeList_recent(String mem_id) {
		return st.selectList("mylikens.mylikeList_recent", mem_id);
	}

	@Override
	public int getCount(String mem_id) {
		return st.selectOne("mylikens.getCount",mem_id);
	}
}
