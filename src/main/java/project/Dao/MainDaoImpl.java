package project.Dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.Model.Exhibition;

@Repository
public class MainDaoImpl implements MainDao{

	@Autowired
	private SqlSession sqlSession;
	
	/*[전시 상세 정보]*/
	/*
	 * @Override public Exhibition exhibition_info(int ex_num) { return
	 * sqlSession.selectOne("exhibition_info", ex_num); }
	 */
	
}
