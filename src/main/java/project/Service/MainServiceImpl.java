package project.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.Dao.MainDaoImpl;
import project.Model.Exhibition;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	private MainDaoImpl MainDao;
	/*
	 * [전시 상세 정보]
	 * 
	 * @Override public Exhibition exhibition_info(int ex_num) { return
	 * MainDao.exhibition_info(ex_num); }
	 */

}
