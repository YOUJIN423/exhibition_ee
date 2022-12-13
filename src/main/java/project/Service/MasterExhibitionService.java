package project.Service;

import java.util.List;

import project.Model.Exhibition;

public interface MasterExhibitionService {
   
	int insertExhibition(Exhibition exhibition);

	int getCount();

	List<Exhibition> getexlist(int page);


	Exhibition getex(int ex_num);

	int update(Exhibition ex);

	
	int delete(int ex_num);

	


}
