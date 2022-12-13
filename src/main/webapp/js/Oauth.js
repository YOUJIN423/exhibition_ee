const CLIENT_ID = "8d979e360e4ba63c4a51080d0e424517";
const REDIRECT_URI =  "http://localhost:8088/member/login.do";

export const KAKAO_AUTH_URL = `https://kauth.kakao.com/oauth/authorize?client_id=${CLIENT_ID}&redirect_uri=${REDIRECT_URI}&response_type=code`;