package project.Service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

@Service
public class OAuthServiceImpl implements OAuthService{
	
	// 카카오
    public String getKakaoAccessToken (String code) {
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            //POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            //POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=0bd8574fe41ad9e2b977ee43df4f41f5"); // TODO REST_API_KEY 입력
            sb.append("&redirect_uri=http://localhost/semi_project/kakao/oauth.do"); // TODO 인가코드 받은 redirect_uri 입력
            sb.append("&code=" + code);
            bw.write(sb.toString());
            bw.flush();

            //결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            //요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            
            System.out.println("response body : " + result);

            //Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);

            br.close();
            bw.close();
            
        } catch (IOException e) {
            e.printStackTrace();
        }

        return access_Token;
    }
    
    public Map createKakaoUser(String token) {

    	String reqURL = "https://kapi.kakao.com/v2/user/me";
    	Map map = new HashMap();
    	
        //access_token을 이용하여 사용자 정보 조회
        try {
           URL url = new URL(reqURL);
           HttpURLConnection conn = (HttpURLConnection) url.openConnection();

           conn.setRequestMethod("POST");
           conn.setDoOutput(true);
           conn.setRequestProperty("Authorization", "Bearer " + token); //전송할 header 작성, access_token전송

           //결과 코드가 200이라면 성공
           int responseCode = conn.getResponseCode();
           System.out.println("responseCode : " + responseCode);

           //요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
           BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
           String line = "";
           String result = "";

           while ((line = br.readLine()) != null) {
               result += line;
           }
           System.out.println("response body : " + result);

           //Gson 라이브러리로 JSON파싱
           JsonParser parser = new JsonParser();
           JsonElement element = parser.parse(result);

           String id = element.getAsJsonObject().get("id").getAsString();
           boolean hasEmail = element.getAsJsonObject().get("kakao_account").getAsJsonObject().get("has_email").getAsBoolean();
           String email = "";
           
           if(hasEmail){
               email = element.getAsJsonObject().get("kakao_account").getAsJsonObject().get("email").getAsString();
           }

           System.out.println("id : " + id);
           System.out.println("email : " + email);
           
           
           map.put("id", id);
           map.put("email", email);
           
           br.close();
           
           } catch (Exception e) {
                e.printStackTrace();
           }
        
		return map;
     }
    
    // 네이버
	public Map getNaverAccessToken(Map map) throws Exception {
		
		Map token = new HashMap();
		
		String clientId = "U36AmKq1EApAPBeDJePi";
	    String clientSecret = "R4LCz3QzhJ";
	    
	    String code = (String) map.get("code");
	    String state = (String) map.get("state");
	    
	    String redirectURI = URLEncoder.encode("http://localhost/semi_project/naver/oauth.do", "UTF-8");
	    String apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code"
	        + "&client_id=" + clientId
	        + "&client_secret=" + clientSecret
	        + "&redirect_uri=" + redirectURI
	        + "&code=" + code
	        + "&state=" + state;
	    
	    String accessToken = "";
	    String refreshToken = "";
	    
	    try {
	      URL url = new URL(apiURL);
	      HttpURLConnection con = (HttpURLConnection)url.openConnection();
	      con.setRequestMethod("GET");
	      
	      int responseCode = con.getResponseCode();
	      BufferedReader br;
	      
	      if (responseCode == 200) { // 정상 호출 
	        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	      
	      } else {  // 에러 발생
	        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	      }
	      
	      String inputLine;
	      String result = "";
	      StringBuilder res = new StringBuilder();
	      
	      while ((inputLine = br.readLine()) != null) {
	        res.append(inputLine);
	        result += inputLine;
	      }
	      
	      System.out.println("response body : "+result);
	      
	      JsonParser parser = new JsonParser();
	      JsonElement element = parser.parse(result);
	      
	      accessToken = element.getAsJsonObject().get("access_token").getAsString();
	      refreshToken = element.getAsJsonObject().get("refresh_token").getAsString();
	      
	      System.out.println(accessToken);
	      System.out.println(refreshToken);
	      
	      token.put("accessToken", accessToken);
	      token.put("refreshToken", refreshToken);
	      
	      br.close();
	      
	    } catch (Exception e) {
	      e.printStackTrace();
	    }
	    
	    return token;
		
	}

	public Map createNaverUser(Map t) {
		String reqURL = "https://openapi.naver.com/v1/nid/me";
		
    	Map map = new HashMap();
    	String token = (String) t.get("accessToken");
    	
        //access_token을 이용하여 사용자 정보 조회
        try {
           URL url = new URL(reqURL);
           HttpURLConnection conn = (HttpURLConnection) url.openConnection();

           conn.setRequestMethod("POST");
           conn.setDoOutput(true);
           conn.setRequestProperty("Authorization", "Bearer " + token); // 전송할 header 작성, access_token전송

           //결과 코드가 200이라면 성공
           int responseCode = conn.getResponseCode();
           System.out.println("responseCode : " + responseCode);

           //요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
           BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
           String line = "";
           String result = "";

           while ((line = br.readLine()) != null) {
               result += line;
           }
           System.out.println("response body : " + result);

           //Gson 라이브러리로 JSON파싱
           JsonParser parser = new JsonParser();
           JsonElement element = parser.parse(result);
           
           String response = element.getAsJsonObject().get("response").toString();
           element = parser.parse(response);
           
           String id = element.getAsJsonObject().get("id").getAsString();
           String email = element.getAsJsonObject().get("email").getAsString();
           
           // System.out.println("response :" + response);
           System.out.println("id : " + id);
           System.out.println("email : " + email);
           
           map.put("id", id);
           map.put("email", email);
           
           br.close();
           
           } catch (Exception e) {
                e.printStackTrace();
           }
        
		return map;
	}
}
