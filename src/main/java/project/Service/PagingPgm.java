package project.Service;

public class PagingPgm {

	private int total;
	private int rowPage;
	private int pageBlk = 10;

	private int currentPage;
	private int startPage;
	private int endPage;
	private int totalPage;

	// 전달된 기본 변수를 초기화 한다.
	public PagingPgm(int total, int rowPage, int currentPage) { // 전달된 기본변수를 초기화
		this.total = total;
		this.rowPage = rowPage;
		this.currentPage = currentPage;

		// 파생된 변수 생성
		totalPage = (int) Math.ceil((double) total / rowPage);
		startPage = currentPage - (currentPage - 1) % pageBlk; // 1, 11, 21...
		endPage = startPage + pageBlk - 1; // 10, 20, 30...
		if (endPage > totalPage)
			endPage = totalPage;

	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getRowPage() {
		return rowPage;
	}

	public void setRowPage(int rowPage) {
		this.rowPage = rowPage;
	}

	public int getPageBlk() {
		return pageBlk;
	}

	public void setPageBlk(int pageBlk) {
		this.pageBlk = pageBlk;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
}

	


