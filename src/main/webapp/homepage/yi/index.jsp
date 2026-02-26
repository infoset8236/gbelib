<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="layout/header.jsp"%>

<div id="wrap">
	<%@ include file="head.jsp"%>
	<%@ include file="../ycgh/popup.jsp"%>
	<div id="container" class="main">
		<div class="qmenu">
			<div class="section">
				<ul data-call="bxslider" data-breaks="[{screen:0, slides:2},{screen:380, slides:3},{screen:450, slides:4},{screen:767, slides:6},{screen:1000, slides:8}]">
					<li class="qm1"><a href="" style="background-image:url('/resources/homepage/yi/img/qm1.gif')"><span>이용안내</span></a></li>
					<li class="qm2"><a href="" style="background-image:url('/resources/homepage/yi/img/qm2.gif')"><span>대출조회</span></a></li>
					<li class="qm3"><a href="" style="background-image:url('/resources/homepage/yi/img/qm3.gif')"><span>신착자료</span></a></li>
					<li class="qm4"><a href="" style="background-image:url('/resources/homepage/yi/img/qm4.gif')"><span>자료예약</span></a></li>
					<li class="qm5"><a href="" style="background-image:url('/resources/homepage/yi/img/qm5.gif')"><span>전자도서관</span></a></li>
					<li class="qm6"><a href="" style="background-image:url('/resources/homepage/yi/img/qm6.gif')"><span>도서관일정</span></a></li>
					<li class="qm7"><a href="" style="background-image:url('/resources/homepage/yi/img/qm7.gif')"><span>자원봉사신청</span></a></li>
					<li class="qm8"><a href="" style="background-image:url('/resources/homepage/yi/img/qm8.gif')"><span>도서관견학신청</span></a></li>
				</ul>
			</div>
		</div>
		<div class="section">
			<div class="main1">
				<ul class="main_img">
					<li class="main_img1" style="background:url('/resources/homepage/yi/img/main01.jpg') no-repeat 0 0">
						책으로 꿈을 키워가는 도서관 / 오늘도 변화를 꿈꾸는 영일도서관입니다
					</li>
					<li class="main_img2" style="background:url('/resources/homepage/yi/img/main02.jpg') no-repeat 0 0">
						책으로 꿈을 키워가는 도서관 / 오늘도 변화를 꿈꾸는 영일도서관입니다
					</li>
					<li class="main_img3" style="background:url('/resources/homepage/yi/img/main03.jpg') no-repeat 0 0">
						책으로 꿈을 키워가는 도서관 / 오늘도 변화를 꿈꾸는 영일도서관입니다
					</li>
				</ul>
			</div>
			<div class="main2">
				<ul>
					<li class="mb1">
						<a href="" class="box">
							<span>보고싶은 자료 신청</span>
							<b>희망<br/>도서신청</b>
						</a>
					</li>
					<li class="mb2">
						<a href="" class="box">
							<span>독서활동 지원 체험</span>
							<b>문화<br/>강좌신청</b>
						</a>
					</li>
					<li class="mb3">
						<a href="" class="box">
							<span>도서관 월별일정안내</span>
							<b>도서관<br/>일정</b>
						</a>
					</li>
					<li class="mb4">
						<a href="" class="box">
							<span>재능기부/자원봉사 활동가</span>
							<b>자원<br/>봉사신청</b>
						</a>
					</li>
				</ul>
			</div>
			<div class="main3">
				<div class="lt1 like_book">
					<div class="box">
						<h3>추천도서</h3>
						<ul data-call="bxslider" data-breaks="[{screen:0, slides:1},{screen:550, slides:3},{screen:767, slides:1}]">
							<li>
								<a href="">
									<img src="/resources/homepage/yi/img/book.jpg" alt="나는 단순하게 살기로 했다"/>
									<span>나는 단순하게 살기로 했습니다</span>
								</a>
							</li>
							<li>
								<a href="">
									<img src="/resources/homepage/yi/img/book.jpg" alt="나는 단순하게 살기로 했다"/>
									<span>단순하게 살기로 했다</span>
								</a>
							</li>
							<li>
								<a href="">
									<img src="/resources/homepage/yi/img/book.jpg" alt="나는 단순하게 살기로 했다"/>
									<span>나는 단순하게 살기로 했습니다</span>
								</a>
							</li>
							<li>
								<a href="">
									<img src="/resources/homepage/yi/img/book.jpg" alt="나는 단순하게 살기로 했다"/>
									<span>나는 단순하게 살기로 했습니다</span>
								</a>
							</li>
						</ul>
						<a href="" class="more">더보기</a>
					</div>
				</div>
				<div class="lt2 news">
					<div class="box">
						<h3>공지사항</h3>
						<ul>
							<li class="notice">
								<a href=""><em>2016년 도서관</em></a>
								<span>2016.11.16</span>
							</li>
							<% for(int i=1; i<=4; i++){ %>
							<li>
								<a href=""><em>2016년 도서관 이용자만족도조사</em></a>
								<span>2016.11.16</span>
							</li>
							<% } %>
						</ul>
						<a href="" class="more">더보기</a>
					</div>
				</div>
				<div class="lt3 news">
					<div class="box">
						<h3>도서관행사</h3>
						<ul>
							<li class="new">
								<a href=""><em>2016년 도서관</em></a>
								<span>2016.11.16</span>
							</li>
							<li class="new">
								<a href=""><em>2016년 도서관 이용자만족도조사</em></a>
								<span>2016.11.16</span>
							</li>
							<% for(int i=1; i<=3; i++) { %>
							<li>
								<a href=""><em>2016년 도서관 이용자만족도조사</em></a>
								<span>2016.11.16</span>
							</li>
							<% } %>
						</ul>
						<a href="" class="more">더보기</a>
					</div>
				</div>
			</div>
			<div class="main4">
				<div class="box">
					<h3>행사갤러리</h3>
					<ul class="lt_photo">
						<% for(int i=1; i<=5; i++) { %>
						<li>
							<a href="">
								<img src="/resources/homepage/yi/img/mb2bg.jpg" alt=""/>
								<span>컬러링 포스터</span>
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
	
<%@ include file="layout/footer.jsp"%>