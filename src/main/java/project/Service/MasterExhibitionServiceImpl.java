package project.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.Dao.MasterExhibitionDao;
import project.Model.Exhibition;

@Service
public class MasterExhibitionServiceImpl implements MasterExhibitionService {

	@Autowired
	private MasterExhibitionDao med;
	
	@Override 
	public int insertExhibition(Exhibition exhibition) {
		return med.insertExhibition(exhibition);
	}

	@Override
	public int getCount() {
		
		return med.getCount();
	}

	@Override
	public List<Exhibition> getexlist(int page) {
		
		return med.getexlist(page);
	}
   // 전시 상세 정보
	@Override
	public Exhibition getex(int ex_num) {
		// TODO Auto-generated method stub
		return med.getex(ex_num);
	}


	@Override
	public int update(Exhibition ex) {
		// TODO Auto-generated method stub
		return med.update(ex);
	}

	@Override
	public int delete(int ex_num) {
		// TODO Auto-generated method stub
		return med.delete(ex_num);
	}
    


	


}
