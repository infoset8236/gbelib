<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="layout/header.jsp"%>

<div id="wrap">

	<%@ include file="head.jsp"%>
	<%@ include file="../ycgh/popup.jsp"%>
	<div id="container" class="main">
		<div id="main-spot">
			<div class="section">
				<div class="main-img">
					<ul class="main_img">
						<!-- <li style="background-image:url('/resources/homepage/geic/img/mainImg1.jpg'">&nbsp;</li>
						<li style="background-image:url('/resources/homepage/geic/img/mainImg2.jpg'">&nbsp;</li>
						<li style="background-image:url('/resources/homepage/geic/img/mainImg3.jpg'">&nbsp;</li> -->
						<li><img src="/resources/homepage/geic/img/main_new1.jpg" alt="제목"/></li>
						<li><img src="/resources/homepage/geic/img/main_new2.jpg" alt="제목"/></li>
						<li><img src="/resources/homepage/geic/img/main_new3.jpg" alt="제목"/></li>
						<li><img src="/resources/homepage/geic/img/main_new4.jpg" alt="제목"/></li>
						<li><img src="/resources/homepage/geic/img/main_new5.jpg" alt="제목"/></li>
					</ul>
				</div>

				<div class="notice">
					<ul>
						<li class="t1">
							<dl>
								<dt>
									<a href="">2016년 12월 독도퀴즈 당첨자 명단</a>
									<!-- <span>2016.11.01</span> -->
								</dt>
								<dd>
									축하드립니다. *.*12월 독도퀴즈에 당첨되셨습니다.회원증 지참 후 1층...
								</dd>
							</dl>
						</li>
						<li class="t2">
							<dl>
								<dt>
									<a href="">지방공무원(사서) 병가 대체인력 채용</a>
								</dt>
								<dd>
									우리 교육정보센터에서는 지역주민과 학생들의 여가선용 및 문화욕구 충족을 위한...
								</dd>
							</dl>
						</li>
						<li class="t3">
							<dl>
								<dt>
									<a href="">지방공무원(사서) 병가 대체인력 채용</a>
								</dt>
								<dd>
									★ 2017년 1월 독서퀴즈 응모 요강 ★ ☆ 응모대상 : 우리 지역의 초등학교...
								</dd>
							</dl>
						</li>
						<li class="t4">
							<dl>
								<dt>
									<a href="">지방공무원(사서) 병가 대체인력 채용</a>
								</dt>
								<dd>
									★ 2017년 1월 독서퀴즈 응모 요강 ★ ☆ 응모대상 : 우리 지역의 초등학교...
								</dd>
							</dl>
						</li>
					</ul>
					<!-- <a href="" class="more">더보기</a> -->
				</div>
			</div>
		</div>

		<div class="qmenu">
			<div class="section">
				<ul data-call="bxslider" data-breaks="[{screen:0, slides:2},{screen:350, slides:3},{screen:450, slides:4},{screen:767, slides:5},{screen:1000, slides:6}]">
					<li class="qm1"><a href="" style="background-image:url('/resources/homepage/geic/img/qmenu1.gif')"><span>교육행정포털</span></a></li>
					<li class="qm2"><a href="" style="background-image:url('/resources/homepage/geic/img/qmenu2.gif')"><span>현장지원</span></a></li>
					<li class="qm3"><a href="" style="background-image:url('/resources/homepage/geic/img/qmenu3.gif')"><span>전자정보실</span></a></li>
					<li class="qm4"><a href="" style="background-image:url('/resources/homepage/geic/img/qmenu4.gif')"><span>독서문화&middot;평생교육</span></a></li>
					<li class="qm5"><a href="" style="background-image:url('/resources/homepage/geic/img/qmenu5.gif')"><span>전자도서관</span></a></li>
					<li class="qm6"><a href="" style="background-image:url('/resources/homepage/geic/img/qmenu6.gif')"><span>자료검색</span></a></li>
				</ul>
			</div>
			<!--
			<div class="control">
				<a href="">퀵메뉴 보이기</a>
				<a href="" class="active">퀵메뉴 가리기</a>
			</div>
			-->
		</div>

		<div class="main1">
			<div class="tit_bar red">
				<div class="section">
					<ul>
						<li>주요소식</li>
					</ul>
				</div>
			</div>
			<div class="section">
				<div class="news news1">
					<div class="box">
						<h3>
							<a href="" class="active">교육행정정보화소식</a>
							<span class="txt-bar">&nbsp;</span>
							<a href="">자료실</a>
						</h3>
						<p><img src="/resources/homepage/geic/img/news1.jpg" alt=""/></p>
						<ul>
							<li class="notice">
								<a href=""><em>2016년 도서관 이용자만족도조사</em></a>
								<span>2016.11.16</span>
							</li>
							<% for(int i=1; i<=2; i++){ %>
							<li>
								<a href=""><em>2016년 도서관 이용자만족도조사</em></a>
								<span>2016.11.16</span>
							</li>
							<% } %>
						</ul>
						<a href="" class="more">더보기</a>
					</div>
				</div>
				<div class="news news2">
					<div class="box">
						<h3>
							<a href="" class="active">독서문화소식</a>
							<span class="txt-bar">&nbsp;</span>
							<a href="">평생교육소식</a>
						</h3>
						<p><img src="/resources/homepage/geic/img/news2.jpg" alt=""/></p>
						<ul>
							<% for(int i=1; i<=3; i++){ %>
							<li>
								<a href=""><em>2016년 도서관 이용자만족도조사</em></a>
								<span>2016.11.16</span>
							</li>
							<% } %>
						</ul>
						<a href="" class="more">더보기</a>
					</div>
				</div>
				<div class="news news3">
					<div class="box">
						<h3>공지사항</h3>
						<p><img src="/resources/homepage/geic/img/news3.jpg" alt=""/></p>
						<ul>
							<% for(int i=1; i<=3; i++){ %>
							<li>
								<a href=""><em>2016년 도서관 이용자만족도조사</em></a>
								<span>2016.11.16</span>
							</li>
							<% } %>
						</ul>
						<a href="" class="more">더보기</a>
					</div>
				</div>

				<div class="news-photo">
					<div class="tit">
						<h3>
							<b><span class="t1">사진으로</span><span class="t2">보는센터</span></b>
						</h3>
						<!-- <p>지금, 정보센터의 이모저모 이야기를 여러분께 알려드립니다.</p> -->
					</div>
					<div class="photo-list">
						<ul>
							<% for(int i=1; i<=3; i++){ %>
							<li<%=" class='pl"+i+"'"%>>
								<a href="">
									<span class="thumb">
										<img src="/resources/homepage/geic/img/01.jpg" alt=""/>
									</span>
									<span class="date">2016.11.01</span>
									<span class="sbj">울릉도 현장지원</span>
									<span class="snipet">지금 정보센터의 이모저모 이야기를 여러분께 알려드립니다.경상북도교육정보센터 사진으로보는센터</span>
								</a>
							</li>
							<% } %>
						</ul>
					</div>
					<a href="" class="more">더보기</a>
				</div>
			</div>
		</div>

		<div class="main2">
			<div class="tit_bar">
				<div class="section">
					<ul>
						<li>퀵링크</li>
						<li>이달의행사</li>
						<li>알림판</li>
					</ul>
				</div>
			</div>
			<div class="section">
				<div class="qlink">
					<h3>퀵링크</h3>
					<div class="box">
						<ul>
							<li class="ql1"><a href="">금주의영화</a></li>
							<li class="ql2"><a href="">자원봉사신청</a></li>
							<li class="ql3"><a href="">국가상호대차 책바다</a></li>
							<li class="ql4"><a href="">장애인무료우편서비스 책나래</a></li>
						</ul>
					</div>
				</div>
				<div class="calendar">
					<div class="box">
						<div id="planBox">
							<div class="info">
								<h3>이달의행사</h3>
								<p class="t1">today</p>
								<p class="t2">6</p>
								<ul>
									<!-- <li>
										<i class="type-r">&nbsp;</i>
										<span>오늘</span>
									</li> -->
									<li>
										<i class="type-e">&nbsp;</i>
										<span>행사일</span>
									</li>
									<li>
										<i class="type-m">&nbsp;</i>
										<span>휴관일</span>
									</li>
								</ul>
							</div>
							<div class="cal_area">
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
											<tr><td class="sun"><div><a href="" class="type-r">4</a></div></td><td><div>5</div></td><td><div>6</div></td><td><div>7</div></td><td><div>8</div></td><td><div>9</div></td><td class="sat"><div>10</div></td></tr>
											<tr><td class="sun"><div><a href="" class="type-e">11</a></div></td><td><div>12</div></td><td><div>13</div></td><td><div>14</div></td><td><div>15</div></td><td><div>16</div></td><td class="sat"><div>17</div></td></tr>
											<tr><td class="sun"><div><a href="" class="type-m">18</a></div></td><td><div>19</div></td><td><div>20</div></td><td><div>21</div></td><td><div>22</div></td><td><div>23</div></td><td class="sat"><div>24</div></td></tr>
											<tr><td class="sun"><div>25</div></td><td><div>26</div></td><td><div>27</div></td><td><div>28</div></td><td><div>29</div></td><td><div>30</div></td><td class="sat"><div>31</div></td></tr>
										</tbody>
									</table>
									<div id="planList">오늘의 일정이 없습니다.</div>
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
				</div>
				<div class="popupzone">
					<h3>알림판</h3>
					<div class="box">
						<ul>
							<li><a href=""><img src="/resources/homepage/geic/img/popup1.jpg" alt=""/></a></li>
							<li><a href="">123</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	
<%@ include file="../geic/layout/footer.jsp"%>