<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="layout/header.jsp"%>

<div id="wrap">
	<%@ include file="head.jsp"%>
	<%@ include file="../ycgh/popup.jsp"%>
	<div id="container" class="main">
		<div class="qmenu">
			<div class="section">
				<ul data-call="bxslider" data-breaks="[{screen:0, slides:1},{screen:420, slides:2},{screen:500, slides:3},{screen:767, slides:4},{screen:900, slides:5},{screen:1000, slides:5}]">
					<li class="qm1"><a href="" style="background-image:url('/resources/common/img/type27/qm1.gif')"><span>자료검색</span></a></li>
					<li class="qm2"><a href="" style="background-image:url('/resources/common/img/type27/qm2.gif')"><span>대출조회</span></a></li>
					<li class="qm3"><a href="" style="background-image:url('/resources/common/img/type27/qm3.gif')"><span>희망도서신청</span></a></li>
					<li class="qm4"><a href="" style="background-image:url('/resources/common/img/type27/qm4.gif')"><span>자원봉사신청</span></a></li>
					<li class="qm5"><a href="" style="background-image:url('/resources/common/img/type27/qm5.gif')"><span>전자도서관</span></a></li>
				</ul>
			</div>
		</div>
		<div class="section">
			<div class="main_img bxn">
				<ul>
					<li>
						<div class="box">
							<p class="t02">사랑해요 도서관,<br/>곁에 있어 행복합니다.</p>
							<p class="t01">경상북도립칠곡공공도서관</p>
						</div>
					</li>
				</ul>
			</div>
			<div class="main2">
				<ul>
					<li class="mb1">
						<a href="" class="box">
							<span>온라인<br/>수강신청</span>
							<b>평생교육 및 독서프로그램</b>
						</a>
					</li>
					<li class="mb2">
						<a href="" class="box">
							<span>이달의행사</span>
							<b>도서관 월별일정</b>
						</a>
					</li>
					<li class="mb3">
						<a href="" class="box">
							<span>도서관<br/>이용안내</span>
							<b>이용시간 및 자료이용</b>
						</a>
					</li>
					<li class="mb4">
						<a href="" class="box">
							<span>이달의<br/>추천도서</span>
							<b>추천도서검색</b>
						</a>
					</li>
					<li class="mb5">
						<a href="" class="box">
							<span>책바다</span>
							<b>국가상호대차서비스</b>
						</a>
					</li>
				</ul>
			</div>
			<div class="main3 like_book2">
					<div class="box">
						<h3>
							<a href="#like_book2_1" class="active">공지사항</a>
							<a href="#like_book2_2">신착도서</a>
						</h3>
						<div class="active" id="like_book2_1">
							<div class="news">
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
								</div>
							</div>
						</div>
						<ul class="like_book" id="like_book2_2">
							<li>
								<div>
									<a href="">
										<img src="/resources/homepage/qm/img/book.jpg" alt="나는 단순하게 살기로 했다"/>
										<span>
											<b>나는 단순하게 살기로 했다</b>
											<i>믿을 만한 뉴스가 없다'는 사회적 요구에 따라 수많은 대안언론이 등장한 오늘,</i>
											<em>&lt;노유진의 정치카페&gt;최고의 핫이슈를 되돌아보다! '믿을 만한 뉴스가 없다'는 사회적 요구에 따라 수많은 대안언론이 등장한 오늘,</em>
										</span>
									</a>
								</div>
							</li>
						</ul>
						<a href="" class="more">더보기</a>
					</div>
				</div>

				<div class="main4">
					<h3>도서관알리미</h3>
					<div class="popupzone">
						<ul>
							<li><a href=""><img src="/resources/homepage/cg/img/pop_img01.jpg" alt="인문열차 삶을 달리다!"/></a></li>
							<li><a href=""><img src="/resources/common/img/type27/popupnone.jpg" alt="등록된 이미지 없음"/></a></li>
						</ul>
					</div>
				</div>
			<div class="main5">
				<div class="banner-wrap type2">
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