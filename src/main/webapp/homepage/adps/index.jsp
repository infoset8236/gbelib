<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="layout/header.jsp"%>

<div id="wrap">
	<%@ include file="head.jsp"%>
	<%@ include file="../ycgh/popup.jsp"%>
	<div id="container" class="main">
		<div class="section">
			<div class="ltr main1">
				<img src="/resources/common/img/type1/main_txt.png" alt="도서관! 세상과의 평생소통, 미래와의 설레는 동행"/>
			</div>
			<div class="con1">
				<div class="ltm search_m">
					<div class="box">
						<span>도서관 내에 유용한 자료검색</span>
						<h3>통합검색</h3>
						<div class="search-box">
							<form>
								<fieldset>
									<legend class="blind">통합검색</legend>
									<div class="box">
										<input type="text" class="text" placeholder="검색어를 입력하세요"/>
									</div>
									<button><span>통합검색</span></button>
								</fieldset>
							</form>
						</div>
						<!-- <div class="search_link">
							<h4>[추천 검색어]</h4>
							<div class="qu_txt">
								<a href="" title="음의방정식">음의방정식</a>
								<a href="" title="블랙아웃">블랙아웃</a>
							</div>
						</div> -->
					</div>
				</div>
				<div class="lts mt1">
					<a><img src="/resources/common/img/type1/mt1.png" alt="독서 문화행사 바로가기"/></a>
					<div class="blind">
						<span>든든한미래,<br />경상북도공공도서관이 열어갑니다.</span>
						<p>독서 문화행사</p>
						<em>Reading Cultural Events</em>
					</div>
				</div>
				<div class="lts mt2">
					<a class="mt2a">
						<span>유익한 책 읽기<br />창의적인 독서능력 향상</span>
						<p>독서회</p>
						<i><img src="/resources/common/img/type1/more_bt03.png" alt="더보기"/></i>
					</a>
					<div class="closed_day">
						<strong>2016.11.24</strong>
						<span>등록된 일정이 없습니다.</span>
						<!-- <a href="">일정이 있을 때</a> -->
					</div>
				</div>
			</div>
		</div>

		<div class="lta bg2">
			<div class="section">
				<div class="ltm news">
					<div class="box">
						<h3>공지사항</h3>
						<ul>
							<li class="notice">
								<a href=""><em>2016년 도서관 이용자만족도조사</em></a>
								<span>2016.11.16</span>
							</li>
							<% for(int i=1; i<=4; i++){ %>
							<li>
								<a href=""><em>2016년 도서관 이용자만족도조사</em></a>
								<span>2016.11.16</span>
							</li>
							<% } %>
						</ul>
						<a href="" class="more_">더보기</a>
					</div>
				</div>
				<div class="lts popupzone">
					<ul>
						<li><a href=""><img src="/resources/common/img/type1/popupzone.jpg" alt="팝업존 제목"/></a></li>
						<li><a href=""><img src="/resources/homepage/adps/img/popupzone.jpg" alt="팝업존 제목"/></a></li>
						<li><a href=""><img src="/resources/common/img/type1/popupnone.png" alt="등록된 팝업이 없습니다"/></a></li>
					</ul>
				</div>
				<div class="lts mt3">
					<div class="box">
						<a class="">
							<span>다양한 행사일정안내</span>
							<strong>이달의행사</strong>
							<i><img src="/resources/common/img/type1/more_bt02.png" alt="자세히 보기"/></i>
						</a>
						<div class="dayoff">
							<div class="desc">
								휴관일 : 매주 월요일 / 일요일을 제외한 관공서의 공휴일
							</div>
							<dl class="info">
								<dt>
									<span class="t1">12월</span>
									<span class="t2">휴관일</span>
								</dt>
								<dd>
									<span>07</span>
									<span>14</span>
									<span>21</span>
									<span>28</span>
									<span>29</span>
									<span>30</span>
								</dd>
							</dl>
						</div>
					</div>
				</div>
				<div class="ltm like_book">
					<div class="box">
						<h3>추천도서</h3>
						<ul data-call="bxslider" data-breaks="[{screen:200, slides:1},{screen:1000, slides:2}]">
						<% for(int i=1; i<=3; i++) { %>
							<li>
								<a href="">
									<img src="/resources/common/img/type1/book.jpg" alt="책이름"/>
									<span>나는 단순하게 살기로 했습니다</span>
								</a>
							</li>
							<% } %>
						</ul>
						<a href="" class="more_">더보기</a>
					</div>
				</div>
			</div>
		</div>

		<div class="lta qmenu">
			<div class="section">
				<ul data-call="bxslider" data-breaks="[{screen:0, slides:2},{screen:380, slides:3},{screen:450, slides:4},{screen:767, slides:6},{screen:1000, slides:9}]">
					<li class="qm1"><a href="" style="background-image:url('/resources/common/img/type1/qm1.png')"><span>신착자료</span></a></li>
					<li class="qm2"><a href="" style="background-image:url('/resources/common/img/type1/qm2.png')"><span>대출조회</span></a></li>
					<li class="qm3"><a href="" style="background-image:url('/resources/common/img/type1/qm3.png')"><span>이용안내</span></a></li>
					<li class="qm4"><a href="" style="background-image:url('/resources/common/img/type1/qm4.png')"><span>희망프로그램신청</span></a></li>
					<li class="qm5"><a href="" style="background-image:url('/resources/common/img/type1/qm5.png')"><span>도서관견학신청</span></a></li>
					<li class="qm6"><a href="" style="background-image:url('/resources/common/img/type1/qm6.png')"><span>희망도서신청</span></a></li>
					<li class="qm7"><a href="" style="background-image:url('/resources/common/img/type1/qm7.png')"><span>디지털자료실좌석예약</span></a></li>
					<li class="qm8"><a href="" style="background-image:url('/resources/common/img/type1/qm8.png')"><span>재능기부신청</span></a></li>
					<li class="qm9"><a href="" style="background-image:url('/resources/common/img/type1/qm9.png')"><span>새책드림서비스</span></a></li>
				</ul>
			</div>
		</div>

		<div class="lta banner">
			<div class="section">
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
</div>
<%@ include file="layout/footer.jsp"%>