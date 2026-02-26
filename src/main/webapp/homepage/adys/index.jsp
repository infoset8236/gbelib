<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="layout/header.jsp"%>

<div id="wrap">
	<%@ include file="head.jsp"%>
	<%@ include file="../ycgh/popup.jsp"%>
	<div id="container" class="main">
		<div class="section">
			<div class="ltr main1">
				<div class="main_txt">
					<p><strong>책</strong>으로 여는</p>
					<p>따뜻한 <strong>미래</strong></p>
					<p><strong>도서관</strong>이 함께 합니다</p>
				</div>
				<!-- <ul>
					<li><img src="/resources/homepage/adys/img/main_txt.png"/></li>
				</ul> -->
			</div>
			<div class="ltm">
				<div class="lta mb1">
					<a href=""  class="box">
						<span class="t2">책&amp;공감&amp;문화</span>
						<span class="t1">독서회</span>
					</a>
				</div>
				<div class="lta mb2">	
					<a href=""  class="box">
						<span class="t2">배움&amp;나눔</span>
						<span class="t1">평생교육<br/>프로그램</span>
					</a>
				</div>
				<div class="lta mb3">
					<a href=""  class="box">
						<span class="t2">다양한 디지털 컨텐츠</span>
						<span class="t1">전자도서관</span>
					</a>
				</div>
				<div class="lta mb4 converse">
					<div class="box">
						<span class="t1">이달의행사</span>
						<dl class="closed_day">
							<dt>01월 휴관일</dt>
							<dd>
								<span>02</span>
								<span>02</span>
								<span>02</span>
								<span>02</span>
								<span>02</span>
								<span>02</span>
								<span>02</span>
							</dd>
						</dl>
					</div>
				</div>
			</div>
			<div class="lts popupzone">
				<ul>
					<li><a href=""><img src="/resources/homepage/adys/img/popupzone.jpg" alt="팝업존 제목"/></a></li>
					<li><a href=""><img src="/resources/common/img/type21/popupnone.png" alt="등록된 팝업이 없습니다."/></a></li>
				</ul>
			</div>

			<div class="maini">
				<div class="search">
					<div class="box">
						<h3>통합자료검색</h3>
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
	
				<div class="lt q-Menu">
					<div class="box">
						<ul>
							<li class="qm1"><a href="sub.jsp?menu_seq=noContent" style="background-image:url('/resources/common/img/type21/qm1.png')"><span>대출조회/예약</span></a></li>
							<li class="qm2"><a href="sub.jsp?menu_seq=noContent" style="background-image:url('/resources/common/img/type21/qm2.png')"><span>자원봉사신청</span></a></li>
							<li class="qm3"><a href="sub.jsp?menu_seq=noContent" style="background-image:url('/resources/common/img/type21/qm3.png')"><span>Q&amp;A</span></a></li>
							<li class="qm4"><a href="sub.jsp?menu_seq=noContent" style="background-image:url('/resources/common/img/type21/qm4.png')"><span>희망도서신청</span></a></li>
							<li class="qm5"><a href="sub.jsp?menu_seq=noContent" style="background-image:url('/resources/common/img/type21/qm5.png')"><span>자료실좌석예약</span></a></li>
							<li class="qm6"><a href="sub.jsp?menu_seq=noContent" style="background-image:url('/resources/common/img/type21/qm6.png')"><span>영화상영</span></a></li>
							<li class="qm7"><a href="sub.jsp?menu_seq=noContent" style="background-image:url('/resources/common/img/type21/qm7.png')"><span>책바다서비스</span></a></li>
							<li class="qm8"><a href="sub.jsp?menu_seq=noContent" style="background-image:url('/resources/common/img/type21/qm8.png')"><span>통합도서관</span></a></li>
						</ul>
					</div>
				</div>

				<div class="ltb like_book">
					<div class="box">
						<h3>신착&추천도서</h3>
						<ul data-call="bxslider" data-breaks="[{screen:0, slides:2},{screen:325, slides:3},{screen:580, slides:4},{screen:750, slides:3}]">
						<% for(int i=1; i<=6; i++){ %>
							<li>
								<a href="" title="노유진의 할말은 합시다">
									<img src="/resources/homepage/adys/img/book.jpg" style="width:61px;height:78px" alt="노유진의 할말은 합시다"/>
									<span>노유진의 할말은 합시다</span>
								</a>
							</li>
							<% } %>
						</ul>
						<a href="" class="more_">더보기</a>
					</div>
				</div>
				<div class="ltb news">
					<div class="box">
						<h3>도서관새소식</h3>
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
						<a href="" class="more_">더보기</a>
					</div>
				</div>
				<div class="ltb last lib-info"><!-- banner -->
					<div class="box">
						<h3>도서관 이용시간</h3>
						<ul>
							<li>
								<div>
									<strong>일반자료실</strong>
									<p>화~금 09:00~19:00<br/>
									토~일 09:00~17:00</p>
								</div>
							</li>
							<li>
								<div>
									<strong>어린이&middot;디지털자료실, 정기간행물실</strong>
									<p>화~금 09:00~18:00<br/>
									토~일 09:00~17:00</p>
								</div>
							</li>
							<li>
								<div>
									<strong>열람실</strong>
									<p>화~일 08:00~22:00</p>
								</div>
							</li>
						</ul>
						<%-- <div class="banner-wrap type2">
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
									<% for(int i=1; i<=5; i++) { %>
									<li><span><a href="" target="_blank"><img alt="" src="/resources/common/img/banner/banner<%=i%>.gif"/></a></span></li>
									<% } %>
								</ul>
							</div>
						</div> --%>
						<a href="" class="more_">더보기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="layout/footer.jsp"%>