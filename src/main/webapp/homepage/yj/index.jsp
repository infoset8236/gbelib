<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="layout/header.jsp"%>

<div id="wrap">
	<%@ include file="head.jsp"%>
	<%@ include file="../ycgh/popup.jsp"%>
	<div id="container" class="main">
		<div class="search_con">
			<div class="section">
				<div class="search">
					<h3>통합자료검색</h3>
					<div class="search-box">
						<form>
							<fieldset>
								<legend>통합검색</legend>
								<input type="text" class="text" placeholder="검색어를 입력하세요"/>
								<button>검색</button>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>

		<div class="main1">
			<ul class="main_img">
				<li style="background-image:url('/resources/homepage/yj/img/main_img01.jpg')"><div class="box"><span>시민과 함께하는 <br /><b>독서문화 조성</b></span><br /><span class="t02">Gyeongbuk Provincial YeongJu Public Library</span></div></li>
				<li style="background-image:url('/resources/homepage/yj/img/main_img02.jpg')"><div class="box"><span>꿈을 꾸는 <br /><b>영주공공도서관</b></span><br /><span class="t02">Gyeongbuk Provincial YeongJu Public Library</span></div></li>
				<li style="background-image:url('/resources/homepage/yj/img/main_img03.jpg')"><div class="box"><span>시민과 함께하는 <br /><b>독서문화 조성</b></span><br /><span class="t02">Gyeongbuk Provincial YeongJu Public Library</span></div></li>
				<li style="background-image:url('/resources/homepage/yj/img/main_img02.jpg')"><div class="box"><span>독서문화조성 <br /><b>영주공공도서관</b></span><br /><span class="t02">Gyeongbuk Provincial YeongJu Public Library</span></div></li>
			</ul>
		</div>
		
		<div class="section">
			<div class="popupzone">
				<ul>
					<li><a href=""><img src="/resources/homepage/yj/img/pop_img01.jpg" alt="인문열차 삶을 달리다!"/></a></li>
					<li><a href=""><img src="/resources/homepage/yj/img/pop_img01.jpg" alt="인문열차 삶을 달리다!"/></a></li>
				</ul>
			</div>
		</div>

		<div class="qmenu">
			<div class="section">
				<ul data-call="bxslider" data-breaks="[{screen:0, slides:1},{screen:380, slides:2},{screen:450, slides:3},{screen:650, slides:4},{screen:767, slides:5},{screen:1000, slides:7}]">
					<li class="qm1"><a href="" style="background-image:url('/resources/common/img/type19/qm1.gif')"><span>사서에게물어보세요</span></a></li>
					<li class="qm2"><a href="" style="background-image:url('/resources/common/img/type19/qm2.gif')"><span>대출조회/예약</span></a></li>
					<li class="qm3"><a href="" style="background-image:url('/resources/common/img/type19/qm3.gif')"><span>희망도서신청</span></a></li>
					<li class="qm4"><a href="" style="background-image:url('/resources/common/img/type19/qm4.gif')"><span>디지털자료실좌석예약</span></a></li>
					<li class="qm5"><a href="" style="background-image:url('/resources/common/img/type19/qm5.gif')"><span>자원봉사신청</span></a></li>
					<li class="qm6"><a href="" style="background-image:url('/resources/common/img/type19/qm6.gif')"><span>사물함</span></a></li>
					<li class="qm7"><a href="" style="background-image:url('/resources/common/img/type19/qm7.gif')"><span>전자도서관</span></a></li>
				</ul>
			</div>
		</div>
		<div class="section">
			<div class="main2">
				<div class="mbr">
					<div class="calendar">
					<h3>이달의행사</h3>
					<div class="today">
						<span>TODAY</span>
						<p>25</p>
						<i class="t01"></i><em>오늘</em>
						<i class="t02"></i><em>휴관일</em>
						<i class="t03"></i><em>행사일</em>
					</div>
						<div id="calendar">
							<div class="cal-func">
								<a id="before-btn" href="#prev" class="btn prev"><i class="fa fa-angle-left"></i><span class="blind">이전달</span></a>
								<b class="date"><span>2017.</span><em>01</em></b>
								<a id="next-btn" href="#next" class="btn next"><i class="fa fa-angle-right"></i><span class="blind">다음달</span></a>
							</div>
							<table class="cal-tbl">
								<thead>
									<tr>
										<th class="sun">SUN</th><th>MON</th><th>TUE</th><th>WED</th><th>THU</th><th>FRI</th><th class="sat">SAT</th>
									</tr>
								</thead>
								<tbody>
									<tr><td class="point2"><div></div></td><td><div></div></td><td><div></div></td><td><div></div></td><td><div>1</div></td><td><div>2</div></td><td><div>3</div></td></tr>
									<tr><td class="point2"><div>4</div></td><td class="active"><div>5</div></td><td><div>6</div></td><td><div>7</div></td><td class="point1"><div>8</div></td><td><div>9</div></td><td><div>10</div></td></tr>
									<tr><td class="point2"><div>11</div></td><td><div>12</div></td><td class="point2"><div>13</div></td><td class="point1"><div>14</div></td><td><div>15</div></td><td><div>16</div></td><td><div>17</div></td></tr>
									<tr><td><div>18</div></td><td><div>19</div></td><td><div>20</div></td><td><div>21</div></td><td><div>22</div></td><td><div>23</div></td><td><div>24</div></td></tr>
									<tr><td class="point2"><div>25</div></td><td class="point2"><div>26</div></td><td><div>27</div></td><td><div>28</div></td><td class="point1"><div>29</div></td><td><div>30</div></td><td><div>31</div></td></tr>
								</tbody>
							</table>
							<div id="planList">
								<p class="date1"><span>DATE</span>2016.05.24 (화)</p>
								<p class="date2">오늘의 일정이 없습니다.</p>
							</div>
						</div>
					</div>
				</div>
				<ul class="mb">	
					<li class="mb1">
						<a href="" class="box">
							<p>평생학습<br /> <b>강좌신청</b></p>
							<span>평생학습 강좌 프로그램  <br />온라인 수강신청</span>
							<i>자세히 보기</i>
						</a>
					</li>
					<li class="mb2">
						<a href="" class="box">
							<em>국가상호대차서비스</em>
							<p><b>책바다</b></p>
							<span>소장 자료를 서로 공유하는<br />전국 도서관 자료 공통 활용 서비스</span>
							<i>자세히 보기</i>
						</a>
					</li>
				</ul>
				<div class="mbr1">	
					<div class="lt3">
						<div class="box">
							<h3><b>도서관 이용시간 안내</b></h3>
							<ul>
								<li><b>일반자료실</b><br /> <span>화~금 09:00 ~ 19:00</span><br /> <span>토~일 09:00 ~ 17:00</span></li>
								<li><b>어린이자료실, 디지털,연속간행물실</b><br /> <span>화~금 09:00 ~ 18:00</span><br /> <span>토~일 09:00 ~ 17:00</span></li>
								<li><b>성인열람실, 학생열람실</b><br /> <span>화~금 08:00 ~ 22:00</span></li>
							</ul>
							<a href="" class="more">더보기</a>
						</div>
					</div>
				</div>
			</div>

			<div class="main3">
				<div class="news">
					<div class="box">
						<h3>공지사항</h3>
						<ul>
							<li class="notice">
								<a href=""><em>2016년 도서관 이용자만족도조사</em></a>
								<span>2016.11.16</span>
							</li>
							<% for(int i=1; i<=5; i++) { %>
							<li>
								<a href=""><em>2016년 도서관 이용자만족도조사</em></a>
								<span>2016.11.16</span>
							</li>
							<% } %>
						</ul>
						<a href="" class="more_">더보기</a>
					</div>
				</div>
				<div class="like_book">
					<div class="box">
						<h3>추천도서</h3>
						<ul>
							<li>
								<a href="">
									<img src="/resources/homepage/yj/img/book.jpg" alt="나는 단순하게 살기로 했다"/>
									<span>나는 단순하게 살기로 했습니다</span>
								</a>
							</li>
						</ul>
						<a href="" class="more_">더보기</a>
					</div>
				</div>
				<div class="banner">
					<div class="banner-wrap type2 display3">
						<div class="banner-t">
							<h3>배너모음</h3>
							<div class="control">
								<a class="prev" href="#prev"><i class="fa fa-chevron-up"></i><span class="blind">이전</span></a>
								<a class="stop active" href="#stop"><i class="fa fa-pause"></i><span class="blind">정지</span></a>
								<a class="play" href="#play"><i class="fa fa-play"></i><span class="blind">시작</span></a>
								<a class="next" href="#next"><i class="fa fa-chevron-down"></i><span class="blind">다음</span></a>
								<a class="more" href=""><i class="fa fa-navicon"></i><span class="blind">더보기</span></a>
							</div>
						</div>
						<div class="banner-box">
							<ul class="banner-roll">
								<% for(int i=1; i<=10; i++) { %>
								<li><span><a href="" target="_blank"><img alt="" src="/resources/common/img/banner/banner<%=i%>.gif"/></a></span></li>
								<% } %>
							</ul>
						</div>
					</div>
				</div>
				<div class="mb3">
					<div class="box">
						<p>영주공공도서관</p><br />
						<span><b>이동도서관</b></span><br />
						<em>지역주민과 함께하는<br />이동식 도서관</em>
					</div>
					<a href="" class="more">더보기</a>
				</div>
			</div>
		</div>
	</div>

</div>
	
<%@ include file="layout/footer.jsp"%>