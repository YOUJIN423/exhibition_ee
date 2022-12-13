package project.Dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.Model.Exhibition;

@Repository
public class MasterExhibitionDaoImpl implements MasterExhibitionDao{
	
	@Autowired
	SqlSessionTemplate st;
	
	
	@Override
	public int insertExhibition(Exhibition exhibition) {
		return st.insert("masterex.insertExhibition", exhibition);
	}

     
	@Override
	public int getCount() {

		return st.selectOne("masterex.count");
	}


	@Override
	public List<Exhibition> getexlist(int page) {
		// TODO Auto-generated method stub
		return st.selectList("masterex.exlist",page);
	}

     // 전시 상세 정보
	@Override
	public Exhibition getex(int ex_num) {
		
		return st.selectOne("masterex.select",ex_num);
	}


	@Override
	public int update(Exhibition ex) {
		// TODO Auto-generated method stub
		return st.update("masterex.update",ex);
	}


	@Override
	public int delete(int ex_num) {
		// TODO Auto-generated method stub
		return st.delete("masterex.delete", ex_num);
	}

	
}