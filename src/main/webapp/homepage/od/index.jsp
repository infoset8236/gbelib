<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="layout/header.jsp"%>

<div id="wrap">
	<%@ include file="head.jsp"%>
	<%@ include file="../ycgh/popup.jsp"%>
	<div id="container" class="main">
		<div class="main1">
			<div class="section">
				<div class="txt">
					<div class="t1">
						<p>도서관은 <b>당신</b>께</p>
						<strong><span>귀한 선물</span>이고 싶습니다</strong>
					</div>
				</div>
				<div class="sport">
					<div class="popupzone">
						<ul>
							<li><a href=""><img src="/resources/homepage/od/img/popupzone.jpg" alt="제9회 한울타리협회 다문화가정 콘서트"/></a></li>
							<li><a href=""><img src="/resources/homepage/od/img/popupzone2.jpg" alt="3월 열두달 도서관 이야기 Book 이벤트"/></a></li>
							<li class="none"><a href=""><img src="/resources/common/img/type14/popupnone.jpg" alt="등록된 팝업이 없습니다."/></a></li>
							<li class="none"><a href=""><img src="/resources/common/img/type14/popupnone.jpg" alt="등록된 팝업이 없습니다."/></a></li>
						</ul>
					</div>
					<div class="qmenu">
						<div class="box">
							<ul data-call="bxslider" data-breaks="[{screen:0, slides:2},{screen:500, slides:3},{screen:800, slides:4},{screen:900, slides:5},{screen:1000, slides:6}]">
								<li class="qm1"><a href="" style="background-image:url('/resources/homepage/od/img/icon1.png"><span>대출조회/예약</span></a></li>
								<li class="qm2"><a href="" style="background-image:url('/resources/homepage/od/img/icon2.png"><span>희망도서신청</span></a></li>
								<li class="qm3"><a href="" style="background-image:url('/resources/homepage/od/img/icon3.png"><span>전자도서관</span></a></li>
								<li class="qm4"><a href="" style="background-image:url('/resources/homepage/od/img/icon4.png"><span>도서관일정</span></a></li>
								<li class="qm5"><a href="" style="background-image:url('/resources/homepage/od/img/icon5.png"><span>자원봉사신청</span></a></li>
								<li class="qm6"><a href="" style="background-image:url('/resources/homepage/od/img/icon6.png"><span>통합도서관</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="lt-wrap">
			<div class="section">
				<div class="main2">
					<div class="like_book lt1">
						<div class="box">
							<h3>신착&amp;추천도서</h3>
							<ul>
								<li>
									<a href="">
										<img src="/resources/homepage/yi/img/book.jpg" alt="나는 단순하게 살기로 했다"/>
										<span>
											<b>나는 단순하게 살기로 했다</b>
											<em>&lt;노유진의 정치카페&gt;최고의 핫이슈를 되돌아보다! '믿을 만한 뉴스가 없다'는 사회적 요구에 따라 수많은 대안언론이 등장한 오늘,</em>
										</span>
									</a>
								</li>
							</ul>
							<a href="" class="more">더보기</a>
						</div>
					</div>
					<div class="news lt2">
						<div class="box">
							<h3>공지사항</h3>
							<div class="snipet">
								<a href="" class="t1">홈페이지 및 전자도서관 이용안내</a>
								<span class="t2">2016.01.01</span>
								<span class="t3">수요일! 도서관이 좋다(5월 특강) "오리놀이" 수요일! 도서관이 좋다</span>
							</div>
							<ul>
								<% for(int i=1; i<=3; i++) { %>
								<li>
									<a href=""><em>홈페이지 및 전자도서관 이용안내</em></a>
									<span>2016.11.16</span>
								</li>
								<% } %>
							</ul>
							<a href="" class="more">더보기</a>
						</div>
					</div>
					<div class="lt3">
						<div class="box lib-info">
							<h3>도서관이용안내</h3>
							<ul>
								<li><b>각 자료실</b> <span>09:00~18:00</span></li>
								<li><b>디지털자료실</b> <span>화~토 09:00~17:30</span></li>
								<li>
									<b>자율열람실</b> <span>동절기 09:00~21:00</span>
									<b style="height:1px;display:inline-block;overflow:hidden">자율열람실</b> <span>하절기 09:00~22:00</span>
								</li>
							</ul>
							<dl>
								<dt>※ 휴관일</dt>
								<dd>매주월요일, 법정공휴일, 임시공휴일 등</dd>
								<dd class="holiday">
									<strong>1월 휴관일</strong>
									<span>
										<em>01</em>
										<em>02</em>
										<em>03</em>
										<em>04</em>
									</span>
								</dd>
							</dl>
							<a href="" class="more">더보기</a>
						</div>
					</div>
					<div class="lt4">
						<div class="box">
							<a href="">
								<b>독서문화행사</b>
								<span>공감과 소통이 이루어 지는 곳</span>
							</a>
						</div>
					</div>
					<div class="lt5">
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
					<div class="lt6">
						<div class="box">
							<a href="">
								<b>작은<em>도서관</em></b>
								<span>경주교육지원청 작은도서관</span>
							</a>
						</div>
					</div>
				</div>
	
				<div class="main3">
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