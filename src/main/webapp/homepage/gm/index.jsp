<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="layout/header.jsp"%>

<div id="wrap">
	<%@ include file="head.jsp"%>
	<%@ include file="../ycgh/popup.jsp"%>
	<div id="container" class="main">
		<div class="main_bg ">
			<div class="section">
				<div class="main1">
					<ul>
						<li><img src="/resources/homepage/gm/img/visual1.jpg" /></li>
					</ul>
					<!--search S-->
					<div class="search-box">
						<form>
							<fieldset>
								<legend class="blind">검색</legend>
								<div class="box1">
									<div class="box2">
										<input type="text" class="text" placeholder="검색어를 입력해주세요"/>
									</div>
								</div>
								<button>검색하기</button>
							</fieldset>
						</form>
					</div>
					<!--search E-->
				</div>
				
				<div class="qmenu">
					<div class="section">
						<ul data-call="bxslider" data-breaks="[{screen:0, slides:2},{screen:340, slides:3},{screen:450, slides:4},{screen:600, slides:5},{screen:767, slides:6},{screen:1000, slides:9}]">
							<li class="qm1"><a href="" style="background-image:url('/resources/homepage/gm/img/qm1.png')"><span>도서관일정</span></a></li>
							<li class="qm2"><a href="" style="background-image:url('/resources/homepage/gm/img/qm2.png')"><span>신착자료</span></a></li>
							<li class="qm3"><a href="" style="background-image:url('/resources/homepage/gm/img/qm3.png')"><span>대출조회</span></a></li>
							<li class="qm4"><a href="" style="background-image:url('/resources/homepage/gm/img/qm4.png')"><span>이용안내</span></a></li>
							<li class="qm5"><a href="" style="background-image:url('/resources/homepage/gm/img/qm5.png')"><span>지디털자료실좌석예약</span></a></li>
							<li class="qm6"><a href="" style="background-image:url('/resources/homepage/gm/img/qm6.png')"><span>자원봉사신청</span></a></li>
							<li class="qm7"><a href="" style="background-image:url('/resources/homepage/gm/img/qm7.png')"><span>희망도서신청</span></a></li>
							<!-- <li class="qm8"><a href="" style="background-image:url('/resources/homepage/gm/img/qm8.png')"><span>오디오북</span></a></li> -->
							<li class="qm8"><a href="" style="background-image:url('/resources/homepage/gm/img/qm8_20170126.png')"><span>추천도서</span></a></li>
							<li class="qm9"><a href="" style="background-image:url('/resources/homepage/gm/img/qm9.png')"><span>책바다</span></a></li>
						</ul>
					</div>
				</div>
			</div>
		<div class="main_line">
			<div class="section">	
				<div class="calendar">
					<div class="section">
						<div class="box">
						<h3>이달의행사</h3>
							<div id="calendar">
								<div class="cal-func">
									<a id="before-btn" href="#prev" class="btn prev"><i class="fa fa-angle-left"></i><span class="blind">이전달</span></a>
									<b class="date"><span>2016/</span><em>12</em></b>
									<a id="next-btn" href="#next" class="btn next"><i class="fa fa-angle-right"></i><span class="blind">다음달</span></a>
								</div>
								<table class="cal-tbl">
									<thead>
										<tr>
											<th class="sun">SUN</th><th>MON</th><th>YUE</th><th>WED</th><th>THU</th><th>FIR</th><th class="sat">SAT</th>
										</tr>
									</thead>
									<tbody>
										<tr><td class="sun"><div></div></td><td><div></div></td><td><div></div></td><td><div></div></td><td><div>1</div></td><td><div>2</div></td><td class="sat"><div>3</div></td></tr>
										<tr><td class="sun"><div><a href="" class="type-r">4</a></div></td><td><div>5</div></td><td><div>6</div></td><td><div>7</div></td><td><div>8</div></td><td><div><a href="" class="type-r">9</a></div></td><td class="sat"><div>10</div></td></tr>
										<tr><td class="sun"><div><a href="" class="type-e">11</a></div></td><td><div>12</div></td><td><div>13</div></td><td><div>14</div></td><td><div>15</div></td><td><div>16</div></td><td class="sat"><div><a href="" class="type-e">17</a></div></td></tr>
										<tr><td class="sun"><div><a href="" class="type-e">18</a></div></td><td><div>19</div></td><td><div><a href="" class="type-r">20</a></div></td><td><div>21</div></td><td><div>22</div></td><td><div>23</div></td><td class="sat"><div>24</div></td></tr>
										<tr><td class="sun"><div>25</div></td><td><div><a href="" class="type-r">26</a></div></td><td><div>27</div></td><td><div>28</div></td><td><div><a href="" class="type-r">29</a></div></td><td><div>30</div></td><td class="sat"><div>31</div></td></tr>
									</tbody>
								</table>
								<div id="planList">
									<h3>01월 휴관일</h3>
									<span>11</span><span>14</span><span>17</span><span>18</span><span>21</span><span>21</span><span>21</span><span>21</span>
								</div>
								<div class="planView">
									<div class="inbox">
										<dl>
											<dt>2016-12-17</dt>
											<dd>내용...</dd>
										</dl>
										<a href="" class="close"><i class="fa fa-close"></i></a>
									</div>
								</div>
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
									<span>2016-11-16</span>
								</li>
								<% for(int i=1; i<=4; i++) { %>
								<li>
									<a href=""><em>2016년 도서관 이용자만족도조사</em></a>
									<span>2016-11-16</span>
								</li>
								<% } %>
							</ul>
							<a href="" class="more">+ 더보기</a>
						</div>
					</div>
				</div>
				<div class="main4">
						<h3>팝업존</h3>
					<div class="popupzone">
						<ul>
							<li><a href=""><img src="/resources/homepage/gm/img/pop_img01.jpg" alt="인문열차 삶을 달리다!"/></a></li>
							<li><a href=""><img src="/resources/homepage/gm/img/nopopup.png" alt="등록된 내용이 없습니다."/></a></li>
							<li><a href="">3</a></li>
							<li><a href="">4</a></li>
							<li><a href="">5</a></li>
						</ul>
					</div>
				</div>
				<div class="main5 like_book2">
					<div class="box">
						<h3>
							<a href="#like_book2_1" class="active">신착도서</a>
							<a href="#like_book2_2">추천도서</a>
						</h3>
							<ul>
								<li  class="active" id="like_book2_1">
									<div>
										<a href="">
											<img src="/resources/homepage/gm/img/book.jpg" alt="나는 단순하게 살기로 했다"/>
											<span>
												<b>나는 단순하게 살기로 했다</b>
												<i>믿을 만한 뉴스가 없다'는 사회적 요구에 따라 수많은 대안언론이 등장한 오늘,</i>
												<em>&lt;노유진의 정치카페&gt;최고의 핫이슈를 되돌아보다! '믿을 만한 뉴스가 없다'는 사회적 요구에 따라 수많은 대안언론이 등장한 오늘,</em>
											</span>
										</a>
									</div>
								</li>
								<li id="like_book2_2">
									<div>
										<a href="">
											<img src="/resources/homepage/gm/img/book01.jpg" alt="나는 단순하게 살기로 했다"/>
											<span>
												<b>노유진의 정치카페두번째화면보기</b>
												<i>최고의 핫이슈를 되돌아보다!  믿을 만한 뉴스가 없다'는 사회적 요구에 따라 수많은 대안언론이 등장한 오늘,</i>
												<em>&lt;노유진의 정치카페&gt;최고의 핫이슈를 되돌아보다! '믿을 만한 뉴스가 없다'는 사회적 요구에 따라 수많은 대안언론이 등장한 오늘,</em>
											</span>
										</a>
									</div>
								</li>
							</ul>
						<a href="" class="more">+ 전체보기</a>
					</div>

				</div>
			</div>
		</div>
		<div class="section">
			<div class="main6">
				<div class="banner-wrap type1">
					<div class="banner-t">
						<h3>배너모음</h3>
						<div class="control">
							<a class="prev" href="#prev"><i class="fa fa-chevron-left"></i><span class="blind">이전</span></a>
							<a class="stop active" href="#stop"><i class="fa fa-pause"></i><span class="blind">정지</span></a>
							<a class="play" href="#play"><i class="fa fa-play"></i><span class="blind">시작</span></a>
							<a class="next" href="#next"><i class="fa fa-chevron-right"></i><span class="blind">다음</span></a>
							<a class="more" href=""><i class="fa fa-navicon"></i><span class="blind">더보기</span></a>
						</div>
					</div>
					<div class="banner-box">
						<ul class="banner-roll">
							<% for(int i=1; i<=17; i++) { %>
							<li><span><a href="" target="_blank"><img alt="" src="/resources/homepage/od/img/banner/b<%=i%>.gif"/></a></span></li>
							<% } %>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	
<%@ include file="layout/footer.jsp"%>