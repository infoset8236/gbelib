<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="layout/header.jsp"%>

<div id="wrap">
	<%@ include file="head.jsp"%>
	<%@ include file="../ycgh/popup.jsp"%>
	<div id="container" class="main">
		<div class="main_bg">
			<div class="main1">
				<div class="section">
					<div class="txt">
						<!-- <img src="/resources/homepage/cs/img/txt.png" alt=""/> -->
						<p class="t1"><img src="/resources/homepage/cs/img/txt1.png" alt=""/>
						<img src="/resources/homepage/cs/img/txt2.png" alt=""/></p>
						<p class="t2"><img src="/resources/homepage/cs/img/txt3.png" alt=""/></p>
						<p class="t3"><img src="/resources/homepage/cs/img/txt4.png" alt=""/>
						<img src="/resources/homepage/cs/img/txt5.png" alt=""/></p>
					</div>
					<ul class="main_img">
						<li style="background:url('/resources/homepage/cs/img/main1.png') no-repeat right 40px">
							<!-- <div class="box">
								<div class="t1">
									<p>도서관, 생활속의</p>
									<p><strong>열린 교육 &middot; 문화 공간</strong></p>
								</div>
							</div> -->
						</li>
						<li style="background:url('/resources/homepage/cs/img/main2.png') no-repeat right 40px">
							&nbsp;
						</li>
					</ul>
				</div>
			</div>
			<div class="main2">
				<div class="section">
					<div class="main2_box">
						<div class="search-box">
							<form>
								<fieldset>
									<legend class="blind">통합검색</legend>
									<div class="box1">
										<div class="box2">
											<input type="text" class="text" placeholder="검색어를 입력하세요"/>
										</div>
									</div>
									<button>통합검색</button>
								</fieldset>
							</form>
						</div>
					</div>
				</div>
			</div>
		<div class="qmenu">
			<div class="section">
				<ul data-call="bxslider" data-breaks="[{screen:0, slides:1},{screen:340, slides:2},{screen:450, slides:3},{screen:600, slides:4},{screen:767, slides:5},{screen:1000, slides:8}]">
					<li class="qm1"><a href="" style="background-image:url('/resources/homepage/cs/img/qm1.png')"><span>도서관일정</span></a></li>
					<li class="qm2"><a href="" style="background-image:url('/resources/homepage/cs/img/qm2.png')"><span>자료검색</span></a></li>
					<li class="qm3"><a href="" style="background-image:url('/resources/homepage/cs/img/qm3.png')"><span>대출조회/예약</span></a></li>
					<li class="qm4"><a href="" style="background-image:url('/resources/homepage/cs/img/qm4.png')"><span>희망도서신청</span></a></li>
					<li class="qm5"><a href="" style="background-image:url('/resources/homepage/cs/img/qm5.png')"><span>이용안내</span></a></li>
					<li class="qm6"><a href="" style="background-image:url('/resources/homepage/cs/img/qm6.png')"><span>자원봉사신청</span></a></li>
					<li class="qm7"><a href="" style="background-image:url('/resources/homepage/cs/img/qm7.png')"><span>전자도서관</span></a></li>
					<li class="qm8"><a href="" style="background-image:url('/resources/homepage/cs/img/qm8.png')"><span>통합도서관</span></a></li>
				</ul>
			</div>
		</div>
		<div class="main_line">
			<div class="section">
				<div class="main3">
					<div class="news">
						<div class="box">
							<h3>공지사항</h3>
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
				</div>
				<div class="main4">
					<div class="box">
						<h3>신착도서</h3>
						<ul class="lt_photo">
							<% for(int i=1; i<=5; i++) { %>
							<li>
								<a href="">
									<img src="/resources/homepage/cs/img/book.jpg" alt=""/>
									<span>컬러링 포스터</span>
								</a>
							</li>
							<% } %>
						</ul>
						<a href="" class="more">더보기</a>
					</div>
				</div>
				<div class="main5">
					<div class="popupzone">
						<ul>
							<li><a href=""><img src="/resources/homepage/cs/img/popupzone.jpg" alt="인문열차 삶을 달리다!"/></a></li>
							<li><a href=""><img src="/resources/common/img/type17/popupnone.jpg" alt="등록된 팝업존이 없습니다."/></a></li>
						</ul>
					</div>
				</div>				
			</div>
		</div>
		<div class="main6_bg">
			<div class="main6 section">
				<div class="lt1"><a href="">도서관행사일정</a></div>
				<div class="lt2"><a href="">독서문화행사</a></div>
				<div class="lt3"><a href="">청소년을위한독서칼럼</a></div>
			</div>
		</div>
		<div class="section">
			<div class="main7">
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
							<% for(int i=1; i<=5; i++) { %>
							<li><span><a href="" target="_blank"><img alt="" src="/resources/common/img/banner/banner<%=i%>.gif"/></a></span></li>
							<% } %>
							<% for(int i=1; i<=5; i++) { %>
							<li><span><a href="" target="_blank"><img alt="" src="/resources/common/img/banner/banner<%=i%>.gif"/></a></span></li>
							<% } %>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	
<%@ include file="layout/footer.jsp"%>