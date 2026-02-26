<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="layout/header.jsp"%>

<div id="wrap" class="main_bg">
	<%@ include file="head.jsp"%>
	<%//@ include file="../ycgh/popup.jsp"%>
	<div id="container" class="main">
		<div class="section">			
			<div class="main1">
				<div class="b_l">
					<!-- <ul>
						<li class="mb1">
							<a href="" class="box">
								<b>도서관일정</b>
								<span>국가상호대차서비스</span>
								<i>소장자료를 서로<br /> 공유라는 전국 도서관<br /> 자료 공동 활용</i>
							</a>
						</li>
					</ul> -->
					<div class="calendar" id="planBox">
						<h3>이달의 행사</h3>
						<div class="today">
							<span>TODAY</span>
							<p id="currDay">29</p>
							<p id="hiddenDay" style="display: none">2017-03</p>
							<i class="t01"></i><em>오늘</em> <i class="t02"></i><em>휴관일</em> <i class="t03"></i><em>행사일</em>
						</div>
						<div id="calendar">
							<div class="cal-func">
								<a id="before-btn" href="#prev" class="btn prev"><i class="fa fa-angle-left"></i><span class="blind">이전달</span></a>
								<b class="date"><span>2016/</span><em>12</em></b>
								<a id="next-btn" href="#next" class="btn next"><i class="fa fa-angle-right"></i><span class="blind">다음달</span></a>
							</div>
							<table class="cal-tbl">
								<thead>
									<tr class="first">
										<th class="sun first th1">SUN</th><th class="th2">MON</th><th class="th3">YUE</th><th class="th4">WED</th><th class="th5">THU</th><th class="th6">FIR</th><th class="sat last th7">SAT</th>
									</tr>
								</thead>
								<tbody>
									<tr class="first"><td class="sun first td1"><div></div></td><td class="td2"><div></div></td><td class="td3"><div></div></td><td class="td4"><div></div></td><td class="td5"><div>1</div></td><td class="td6"><div>2</div></td><td class="sat last td7"><div>3</div></td></tr>
									<tr><td class="sun first td1"><div><a href="" class="type-r">4</a></div></td><td class="td2"><div>5</div></td><td class="td3"><div>6</div></td><td class="td4"><div>7</div></td><td class="td5"><div>8</div></td><td class="td6"><div>9</div></td><td class="sat last td7"><div>10</div></td></tr>
									<tr><td class="sun first td1"><div><a href="" class="type-e">11</a></div></td><td class="td2"><div>12</div></td><td class="td3"><div>13</div></td><td class="td4"><div>14</div></td><td class="td5"><div>15</div></td><td class="td6"><div>16</div></td><td class="sat last td7"><div>17</div></td></tr>
									<tr><td class="sun first td1"><div><a href="" class="type-m">18</a></div></td><td class="td2"><div>19</div></td><td class="td3"><div>20</div></td><td class="td4"><div>21</div></td><td class="td5"><div>22</div></td><td class="td6"><div>23</div></td><td class="sat last td7"><div>24</div></td></tr>
									<tr><td class="sun first td1"><div>25</div></td><td class="td2"><div>26</div></td><td class="td3"><div>27</div></td><td class="td4"><div>28</div></td><td class="td5"><div>29</div></td><td class="td6"><div>30</div></td><td class="sat last td7"><div>31</div></td></tr>
								</tbody>
							</table>
							<div id="planList">
								<p class="date1">
									<span>DATE</span>2017.03.29
								</p>
								<div id="show_29" class="calAll" style=""><p class="date2">[강좌]마음을 담은 글씨, 캘리그라...</p></div>
							</div>
						</div>
					</div>
				</div>
				<div class="q-menu">
					<div class="box">
						<h3>QUICK MENU</h3>
						<ul>
							<li class="qm1"><a href="" style="background-image:url('/resources/common/img/type20/qm1.gif')"><span>자료검색</span></a></li>
							<li class="qm2"><a href="" style="background-image:url('/resources/common/img/type20/qm2.gif')"><span>대출조회예약</span></a></li>
							<li class="qm3"><a href="" style="background-image:url('/resources/common/img/type20/qm3.gif')"><span>희망도서신청</span></a></li>
							<li class="qm4"><a href="" style="background-image:url('/resources/common/img/type20/qm4.gif')"><span>이용안내</span></a></li>
							<li class="qm5"><a href="" style="background-image:url('/resources/common/img/type20/qm5.gif')"><span>사서에게물어보세요</span></a></li>
							<li class="qm6"><a href="" style="background-image:url('/resources/common/img/type20/qm6.gif')"><span>자원봉사신청</span></a></li>
							<li class="qm7"><a href="" style="background-image:url('/resources/common/img/type20/qm7.gif')"><span>평생교육</span></a></li>
							<li class="qm8"><a href="" style="background-image:url('/resources/common/img/type20/qm8.gif')"><span>독서문화행사</span></a></li>
							<li class="qm9"><a href="" style="background-image:url('/resources/common/img/type20/qm9.gif')"><span>설문조사</span></a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="main_visual">
				<ul class="main_img bxn">
					<li>
						<div class="box">
							<div class="t1">
								<span><b>배움이 즐겁고,</b><br />나눔이 행복한 인재육성</span>
							</div>
						</div>
					</li>
				</ul>
			</div>
			<div class="main2">
				<div class="popupzone">
					<ul>
						<li><a href=""><img src="/resources/homepage/yjpg/img/popup_img.jpg" alt="인문열차 삶을 달리다!"/></a></li>
						<li><a href="">2</a></li>
						<li><a href="">3</a></li>
						<li><a href="">4</a></li>
						<li><a href="">5</a></li>
					</ul>
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
			</div>
		</div>
		<div class="main3">
			<div class="section">
				<div class="news">
					<h3>공지사항</h3>
					<div class="box">
						<ul>
							<li class="notice">
								<a href=""><em>2016년 도서관 이용자만족도조사</em></a>
								<span>2016.11.16</span>
							</li>
							<% for(int i=1; i<=4; i++) { %>
							<li>
								<a href=""><em>2016년 도서관 이용자만족도조사</em></a>
								<span>2016.11.16</span>
							</li>
							<% } %>
						</ul>
						<a href="" class="more">더보기</a>
					</div>
				</div>
				
				<div class="like_book">
					<h3>새로 들어온 책</h3>
					<div class="box">
						<ul data-call="bxslider" data-breaks="[{screen:0, slides:2},{screen:380, slides:3},{screen:450, slides:3},{screen:767, slides:3},{screen:1000, slides:4}]">
						<% for(int i=1; i<=4; i++) { %>
							<li>
								<a href="">
									<img src="/resources/homepage/ycgh/img/book.jpg" alt="나는 단순하게 살기로 했다"/>
									<span>나는 단순하게 살기로 했습니다</span>
								</a>
							</li>
							<% } %>
						</ul>
						<a href="" class="more">더보기</a>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>
	
<%@ include file="layout/footer.jsp"%>