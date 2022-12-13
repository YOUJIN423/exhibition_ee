package project.Service;

import java.util.Map;

public interface OAuthService {

	String getKakaoAccessToken(String code);

	Map createKakaoUser(String access_Token);

	Map getNaverAccessToken(Map res) throws Exception;

	Map createNaverUser(Map token);
	

}