package project.Model;

import java.util.Date;

public class Member {
	private String mem_id; // 아이디
	private String mem_passwd; // 비밀번호
	private String mem_name; // 이름
	private String mem_gender; // 성별
	private String mem_jumin1; // 주민번호 1
	private String mem_jumin2; // 주민번호 2
	private String mem_email; // 이메일
	private String mem_domain; // 도메인
	private String mem_post; // 우편번호
	private String mem_addr1; // 주소1
	private String mem_addr2; // 주소2
	private String mem_tel1; // 연락처1
	private String mem_tel2; // 연락처2
	private String mem_tel3; // 연락처3
	private Date mem_reg; // 가입일
	private int mem_exit_state; // 탈퇴유무
	private String mem_exit_reason; // 탈퇴사유

	// 화면 출력
	private int startRow;
	private int endRow;

	// 검색 기능
	private String search; // select name 값
	private String keyword; // 검색하는 양식의 name 값
	

	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_passwd() {
		return mem_passwd;
	}
	public void setMem_passwd(String mem_passwd) {
		this.mem_passwd = mem_passwd;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_gender() {
		return mem_gender;
	}
	public void setMem_gender(String mem_gender) {
		this.mem_gender = mem_gender;
	}
	public String getMem_jumin1() {
		return mem_jumin1;
	}
	public void setMem_jumin1(String mem_jumin1) {
		this.mem_jumin1 = mem_jumin1;
	}
	public String getMem_jumin2() {
		return mem_jumin2;
	}
	public void setMem_jumin2(String mem_jumin2) {
		this.mem_jumin2 = mem_jumin2;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_domain() {
		return mem_domain;
	}
	public void setMem_domain(String mem_domain) {
		this.mem_domain = mem_domain;
	}
	public String getMem_post() {
		return mem_post;
	}
	public void setMem_post(String mem_post) {
		this.mem_post = mem_post;
	}
	public String getMem_addr1() {
		return mem_addr1;
	}
	public void setMem_addr1(String mem_addr1) {
		this.mem_addr1 = mem_addr1;
	}
	public String getMem_addr2() {
		return mem_addr2;
	}
	public void setMem_addr2(String mem_addr2) {
		this.mem_addr2 = mem_addr2;
	}
	public String getMem_tel1() {
		return mem_tel1;
	}
	public void setMem_tel1(String mem_tel1) {
		this.mem_tel1 = mem_tel1;
	}
	public String getMem_tel2() {
		return mem_tel2;
	}
	public void setMem_tel2(String mem_tel2) {
		this.mem_tel2 = mem_tel2;
	}
	public String getMem_tel3() {
		return mem_tel3;
	}
	public void setMem_tel3(String mem_tel3) {
		this.mem_tel3 = mem_tel3;
	}
	public Date getMem_reg() {
		return mem_reg;
	}
	public void setMem_reg(Date mem_reg) {
		this.mem_reg = mem_reg;
	}
	public int getMem_exit_state() {
		return mem_exit_state;
	}
	public void setMem_exit_state(int mem_exit_state) {
		this.mem_exit_state = mem_exit_state;
	}
	public String getMem_exit_reason() {
		return mem_exit_reason;
	}
	public void setMem_exit_reason(String mem_exit_reason) {
		this.mem_exit_reason = mem_exit_reason;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
}