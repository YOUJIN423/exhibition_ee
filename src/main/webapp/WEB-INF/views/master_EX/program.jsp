<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/commonConfig.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%--[외부 파일] --%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/Main/main_deco_notice_notice.css">

</head>

<body>
	<header>
		<div class="logo">
			<a href="<%=request.getContextPath()%>/main_index.do"> <img
				src="<%=request.getContextPath()%>/images/EELOGO_TEXTONLY_BK.png"
				width=800 height=160>
			</a>
		</div>

		<div class="zero"></div>
		<nav role="navigation">
			<ul id="main-menu">
				<li><a href="<%=request.getContextPath()%>/qnalist.do"><strong>문의
							글</strong></a></li>
				<li><a
					href="<%=request.getContextPath()%>/exhibitionRegiForm.do"><strong>전시등록</strong></a>
					<ul id="sub-menu">
						<li><a href="<%=request.getContextPath()%>/exhibitionlist.do"
							aria-label="subemnu">전시 목록</a></li>
						<li><a
							href="<%=request.getContextPath()%>/exhibitionEditForm.do"
							aria-label="subemnu">전시 수정</a></li>
						<li><a
							href="<%=request.getContextPath()%>/exhibitiondelete.do"
							aria-label="subemnu">전시 삭제</a></li>
					</ul></li>
				<li><a href="#"><strong>공지 사항</strong></a>
					<ul id="sub-menu">
						<li><a href="<%=request.getContextPath()%>/boardwriter.do"
							aria-label="subemnu">공지 등록</a></li>
						<li><a href="<%=request.getContextPath()%>/main_notice.do"
							aria-label="subemnu">공지 목록</a></li>
						<li><a
							href="<%=request.getContextPath()%>/main_notice_faq.do"
							aria-label="subemnu">FAQ</a></li>
					</ul></li>
				<li><a href="#"><strong>회원</strong></a>
					<ul id="sub-menu">
						<li><a href="<%=request.getContextPath()%>/memberlist.do"
							aria-label="subemnu">회원 정보</a></li>
						<li><a href="<%=request.getContextPath()%>/bookpage.do"
							aria-label="subemnu">회원 예약</a></li>
					</ul></li>
			</ul>
		</nav>
	</header>

	<main>
		<h3>현재 프로그램</h3>
		<div align="left">
			<h4>[리움 들어서기] 2022 리움 들어서기: 고미술 손끝에서 시작된 마감</h4>

			<img src="images/po.png"  width="650" height="300" style="margin-bottom: 50px"><br>
			
			
			<p> 리움미술관에서는 한국을 대표하는 미술 작품과 학술 가치가 높은 연구 자료를 여러
			분야에 걸쳐 소장하고 연구해 오고 있습니다. <br> 리움 들어서기는 이와 연계하여 리움미술관의 대표 소장품을
			소개하는 강좌로, 이번에는 '한국 고미술'을 집중적으로 다뤄봅니다.<p> <br>

		</div>
		<h3>안내</h3>
		<div>
			<p><strong>옛 장인과 화원의&nbsp;손끝에서 탄생한 '한국 고미술'에는 어떤 미감이 담겨 있을까요?&nbsp;소장품 강좌
				&lt;2022 리움 들어서기: 고미술, 손끝에서 시작된 미감&gt;에서는 리움미술관을 대표하는 '한국 고미술'에 관해
				살펴봅니다. 이번 강좌에는 리움미술관의 고미술 소장품을 연구하고 전시를 기획하는 연구원이 강연자로 참여하여, 도자,
				고서화, 불교미술, 공예를 아우르는 다채로운 이야기를&nbsp;들려줍니다. 오랜 시간에
				걸쳐&nbsp;장인과&nbsp;화원들이 그려낸 한국 고미술의 궤적과 그 이면의 정취를 느낄 수 있는 이번 강좌에 많은 관심
				바랍니다.</strong></p>
		</div>
		<p>&nbsp;</p>
		<div >
			<p>■ 대상: 한국 고미술에 관심있는&nbsp;관람객 180명</p>
			<p>■ 구성: 총 4회차 강좌</p>
			
		    <table class="table table-bordered">
				<tr>
					<th>순서</th>
					<th>일시</th>
					<th >주제 및 강연</th>
					<th>접수일</th>
				</tr>
				<tr>
					<td>&nbsp;1</td>
					<td>"11월3일"<br> "15:00~16:30"
					</td>
					<td> 갈색이지만 청자, 고려청자의 변주<br>
						    이준광 (리움 소장품연구실 책임연구원)
					</td>
					<td>
					10월20일 14:00
					</td>
				</tr>
				<tr>
					<td >&nbsp;2</td>
					<td>11월 10일 <br>
						   15:00~16:30</td>
					<td>&nbsp;&lt;조선의 화가들, 화단을 이끌다&nbsp;&lt;<br>
						&nbsp;&lt;조지윤 (리움 소장품연구실 수석연구원&nbsp;&lt;</td>
					<td><p>10월 27일 14:00&nbsp;</p></td>
				</tr>
				<tr>
					<td>&nbsp;3</td>
					<td>11월 17일<br>
					        15:00~16:30</td>
					<td>
							&nbsp;&lt;지극한 즐거움이 가득한 나라로: <br>
							&nbsp;고려시대 아미타불 신앙과 미술&gt;<br>
						  &nbsp;이승혜(리움 소장품연구실 책임연구원)&nbsp;</td>
					<td>11월 3일 14:00</td>
				</tr>
				<tr>
					<td>&nbsp;4</td>
					<td>11월 24일<br>
						11:00~12:30</td>
					<td>
						&nbsp;&lt;이로운 실천, 한국 공예의 지금&gt;<br>
						&nbsp;이광배 (리움 소장품연구실 수석연구원)
					</td>
					<td>11월 10일 14:00</td>
				</tr>
			</table>
			<p>■&nbsp;접수: 10월 20일부터 4주 동안 매주 목요일 14:00, 리움 홈페이지에서 선착순
				신청&nbsp;시작</p>
			<p>■&nbsp;참가비: 무료</p>
			<p>■&nbsp;문의: 02-2014-6900</p>
			<p>* 이번 강좌는 신청자 본인만 참여할 수&nbsp;있으며, 현장 접수는 불가합니다.</p>
			<p>* 전시 관람을 위해서는 별도 예약이 필요합니다.</p>
			<p>
				* 첨석이 어려울&nbsp;경우, 대기자를 위해 강좌일 하루 전까지 취소 부탁드립니다.&nbsp;취소 없이 불참하실 경우,
				이후 프로그램 신청과 참여가 제한됩니다.&nbsp; <br> * 참석 전, 발열 확인 및 손 소독제 사용을
				요청드리며, 강연 중에는 반드시 마스크를 착용해 주시기 바랍니다.
			</p>
			<p>* 주차장이 협소하오니 대중교통을 이용하여 주시기 바랍니다.</p>

			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p> <strong>
					
						<strong>▣ 회차별 상세 내용</strong>
					
				</strong>
			</p>
			<p>
				<strong> [1회차] 이준광, &lt;갈색이지만 청자, 고려청자의 변주&nbsp;&gt;
				</strong>
			</p>
			<p><strong>청자의 빛깔은 비색(翡色)으로 대표되는 담녹, 담청색으로 널리 알려져 있습니다. 그러나, 고미술 상설전 4층
				청자 전시실 한 켠에는 갈색빛이 감도는 자기가 전시되어 있고, 여기에 '청자'라는 이름이 붙어 있습니다. 작품 이름이
				잘못된 것일까요? 청자를 이해하는데 다른 무엇이 더 필요한 것일까요? 갈색에서 시작하는 고려청자 속 과학, 고려청자의
				국제성, 그리고 확장에 대한 이야기를 &nbsp;&lt;청자철화 보상화당초문 매병&nbsp;&gt; 을 비록한 주요 도자 소장품을 중심으로 살펴봅니다.</strong></p>
			<p>&nbsp;</p>
			<strong> [2회차] 조지윤, &lt;조선의 화가들, 화단을 이끌다&gt;
			</strong> <br>
			<p>조선 회화에는 화풍, 주제 등 각 시기를 대표하는 유행이 존재합니다. 이를 통해 우리는 당시 문화와 역사를
				유추할 수 있습니다. 그러나, 그보다 우리에게 더 널리 알려진 것은 화가들입니다&nbsp;&lt;군선도&nbsp;&gt; 등 신선 그림에
				뛰어났던 김홍도, 진경산수화의 창시자 정선 등 조선 시대를 대표하는 화가들을 통해 우리 회화의 역사가 더욱 다채로워질 수
				있었습니다. 이번 강좌에서는 리움미술관 한국 회화 소장품과 현재 전시 작품을 통해 이들의 회화적 성취와 화단에 끼친 영향에
				관해 살펴보고자 합니다.</p>
			<p>&nbsp;</p>
			<p>
				<strong>[3회차] 이승혜, &lt;지극한 즐거움이 가득한 나라로: 고려시대 아미타불
						신앙과 미술&gt;</strong>
			</p>
			<p>
				고려시대 사람들은 지상에서의 삶이 종말을 고하면 아미타불(阿彌陀佛)을 대면하기를 간절히 바랐습니다. 그리고 아미타불의
				인도로 그가 다스리는 지극한 즐거움이 가득한 청정한 나라, 즉 '극락정토(極樂淨土)'에 다시 태어나기를 염원하였습니다.
				아미타불은 대체 어떤 부처이길래 죽음을 맞이하는 순간 그 분을 만나고 싶어했던 것일까요? 고려시대 사람들이 꿈꾸었던 삶의
				마지막 순간은 과연 어떠했을까요? 이 강좌에서는 리움미술관 고미술 상설전 1층에 전시된
				&nbsp;&lt;아미타여래삼촌도&nbsp;&gt; &nbsp;&lt;은제 이마타여래삼촌 좌상&nbsp;&gt;등 불교미술 소장품을 중심으로 고려시대
				사람들이 상상하고 그려낸 죽음 이후의 세계를 만나보고자 합니다. 
			</p>
			<p>&nbsp;</p>
			<p>
				<strong> [4회차] 이광배, &lt;이로운 실천, 한국 공예의 지금&gt;
				</strong> &nbsp;
			</p>
			<p>리움미술관 대표 금속 및 공예 소장품&nbsp;&lt;나전 국화당초문 팔각합&nbsp;&gt; &nbsp;&lt;대모 감장 화문 빗&nbsp;&gt; &nbsp;&lt;"금제 귀걸이&nbsp;&gt;
				등 더불어 상설 기획전 "공예지금" 과 연계한 강의로, 한국 역사와 예술성을 통해 공예의&nbsp; 독창성에 관해 제고하는
				시간을 가져봅니다. 기능과 예술성을 동시에 겸비해야 하는 공예라는 분야는 동서고금을 막론하고 시대별, 지역별 미감을
				반영하며 전개됩니다. 특히, 한국 공예는 특유의 섬세한 장식 기법과 다양한 재료를 통해 발현되며, 이는 오늘날까지 이어져
				오고 있습니다. 이번 강좌를 통해 한국 공예의 오랜 생명력을 다시 한번 살펴보며, 전통과 교감하는 <"공예지금">의 다양한
				면모를 즐길 수 있는 &nbsp; 시간이 되기를 바랍니다.</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
		</div>
	</main>
	<footer>
		<div class="footer_sns">
			<div class="inner_wrap">
				<a href="https://www.facebook.com/leeumofficial"> <img
					src="<%=request.getContextPath() %>/images/picto_twitter.png"
					width=40 height=40>
				</a> <a href="https://www.instagram.com/leeummuseumofart/"> <img
					src="<%=request.getContextPath() %>/images/picto_insta.png"
					width=40 height=40>
				</a> <a href="https://www.youtube.com/channel/UCyXVnJijxHsBrzN9AAZ-Yxw">
					<img src="<%=request.getContextPath() %>/images/picto_youtube.png"
					width=40 height=40>
				</a><br> <a href="<%=request.getContextPath()%>/program.do" class="private">개인정보 처리 방침</a><br>
				<br>
			</div>
		</div>
		<div class="footer_addr">
			<div class="inner_wrap">
				ee Museum of Art<br> 서울특별시 마포구 신촌로176, 04104<br> 176,
				Sinchon-ro, Mapo-gu, Seoul, Republic of Korea, 04104<br> Tel)
				02 - 1234 - 5678<br> &copy; An Extraordinary Exhibition Museum
				of Art. All Rights reserved.<br>
				<br>
			</div>
		</div>
	</footer>
</body>
</html>