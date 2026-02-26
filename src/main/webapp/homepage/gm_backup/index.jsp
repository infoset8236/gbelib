<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="layout/header.jsp"%>

<div id="wrap">
	<%@ include file="head.jsp"%>

	<div id="container" class="main">
		<div class="main_bg">
			<div class="section">
				<div class="main1">
					<ul class="main_img">
						<li style="background:url('/resources/homepage/gm_backup/img/main_img01.png') no-repeat right 50%">
							<div class="box">
								<div class="t1">
									<p>시민과 함께</p>
									<p><strong>미래를 가꾸는 도서관을</strong></p>
									<strong>희망</strong>합니다.
								</div>
								<div class="t2">
									세상을 바꾸는 힘!도서관에 있습니다. 새로운 생각, 함께하는 도서관
								</div>
							</div>
						</li>
						<li>이미지2</li>
						<li>이미지3</li>
						<li>이미지4</li>
						<li>이미지5</li>
					</ul>
				</div>
				<!--search S-->
				<div class="main2">
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
				<!--search E-->
			</div>
		<div class="qmenu">
			<div class="section">
				<ul data-call="bxslider" data-breaks="[{screen:0, slides:1},{screen:340, slides:2},{screen:450, slides:3},{screen:600, slides:4},{screen:767, slides:5},{screen:1000, slides:8}]">
					<li class="qm1"><a href="" style="background-image:url('/resources/homepage/gm_backup/img/qm1.png')"><span>자료검색</span></a></li>
					<li class="qm2"><a href="" style="background-image:url('/resources/homepage/gm_backup/img/qm2.png')"><span>대출조회/연기</span></a></li>
					<li class="qm3"><a href="" style="background-image:url('/resources/homepage/gm_backup/img/qm3.png')"><span>희망도서신청</span></a></li>
					<li class="qm4"><a href="" style="background-image:url('/resources/homepage/gm_backup/img/qm4.png')"><span>전자도서관</span></a></li>
					<li class="qm5"><a href="" style="background-image:url('/resources/homepage/gm_backup/img/qm5.png')"><span>자료실좌석예약</span></a></li>
					<li class="qm6"><a href="" style="background-image:url('/resources/homepage/gm_backup/img/qm6.png')"><span>자원봉사신청</span></a></li>
					<li class="qm7"><a href="" style="background-image:url('/resources/homepage/gm_backup/img/qm7.png')"><span>이달의행사</span></a></li>
					<li class="qm8"><a href="" style="background-image:url('/resources/homepage/gm_backup/img/qm8.png')"><span>통합도서관</span></a></li>
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
						<h3>신착&추천도서</h3>
						<ul class="lt_photo">
							<% for(int i=1; i<=5; i++) { %>
							<li>
								<a href="">
									<img src="/resources/homepage/gm_backup/img/book.jpg" alt=""/>
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
							<li><a href=""><img src="/resources/homepage/gm_backup/img/pop_img01.jpg" alt="인문열차 삶을 달리다!"/></a></li>
							<li><a href="">2</a></li>
							<li><a href="">3</a></li>
							<li><a href="">4</a></li>
							<li><a href="">5</a></li>
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