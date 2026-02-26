<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="layout/header.jsp"%>

<div id="wrap">
	<%@ include file="head.jsp"%>
	<%@ include file="../ycgh/popup.jsp"%>
	<div id="container" class="main">
		<div class="section">
			<div class="main1">
				<div class="box">
					<!-- <p>꿈과 희망이 자라는<br /><span>성장</span>비타민</p>
					<em>시민들의 지식ㆍ정보습득과 평생교육의 장으로서<br />그 역할을 충실히 수행하고 있습니다.</em> -->
					<img src="/resources/homepage/ad/img/main_txt.png" alt="미래를 함께 여는 안동도서관"/>
				</div>
				<!-- search S -->
				<div class="search">
					<div class="search-box">
						<form>
							<fieldset>
								<legend>통합검색</legend>
								<input type="text" class="text" placeholder="검색어를 입력하세요"/>
								<button>통합검색</button>
							</fieldset>
						</form>
					</div>
				</div>
				<!-- search E -->
			</div>
			
			<div class="main2">
				<ul>
					<li class="mb1">
						<div class="box">
							<div class="inBox">
								<h3>일정안내</h3>
								<p>2017년 01월 25일</p>
								<ul>
									<li><a href="">문화가 있는 날</a></li>
									<li><a href="">두배로 Day</a></li>
								</ul>
								<dl>
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
						<a href="" class="more">더보기</a>
					</li>
					<li class="mb2">
						<a href="">
							<span>
								<strong>독서칼럼&middot;웹툰</strong>
								<em>청소년을 위한<br />독서칼럼&middot;웹툰</em>
							</span>
						</a>
					</li>
				</ul>
			</div>
			<div class="main3 like_book2">
				<div class="box">
					<h3>추천도서</h3>
					<ul>
						<% for(int i=1; i<=2; i++) { %>
						<li>
							<a href=""><strong>[내가 혼자 여행하는 이유]</strong></a>
							<div class="thumb"><a href=""><img src="/resources/homepage/ad/img/book.jpg" alt=""/></a></div>
							<div class="snipet">
								<div>
									<p>카트린 지타</p>
									<p>걷는나무/2015년</p>
									내가 혼자 여행하는 이유 내가 혼자 여행하는 이유내가 혼자...
								</div>
							</div>
						</li>
						<% } %>
					</ul>
				</div>
				<a href="" class="more">더보기</a>
			</div>
			<div class="main5">
				<div class="box">
					<div class="main4">
						<div class="popupzone">
							<ul>
								<li><a href=""><img src="/resources/homepage/ad/img/popupzone.jpg" alt="팝업존 제목"/></a></li>
								<li><a href=""><img src="/resources/common/img/type8/popupnone.jpg" alt="등록된 팝업이 없습니다."/></a></li>
							</ul>
						</div>
						<div class="q-menu">
							<div class="section">
								<ul>
									<li class="qm1"><a href="" style="background-image:url('/resources/common/img/type8/qm1.png')"><span>자료검색</span></a></li>
									<li class="qm2"><a href="" style="background-image:url('/resources/common/img/type8/qm2.png')"><span>대출조회/예약</span></a></li>
									<li class="qm3"><a href="" style="background-image:url('/resources/common/img/type8/qm3.png')"><span>희망도서신청</span></a></li>
									<li class="qm4"><a href="" style="background-image:url('/resources/common/img/type8/qm4.png')"><span>전자도서관</span></a></li>
									<li class="qm5"><a href="" style="background-image:url('/resources/common/img/type8/qm5.png')"><span>좌석예약</span></a></li>
									<li class="qm6"><a href="" style="background-image:url('/resources/common/img/type8/qm6.png')"><span>자원봉사신청</span></a></li>
									<li class="qm7"><a href="" style="background-image:url('/resources/common/img/type8/qm7.png')"><span>영화상영</span></a></li>
									<li class="qm8"><a href="" style="background-image:url('/resources/common/img/type8/qm8.png')"><span>통합도서관</span></a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="news">
						<div class="box">
							<h3>공지사항</h3>
							<ul>
								<li class="notice">
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
					<div class="mb_2">
						<h3>분관 바로가기</h3>
						<ul>
							<li class="a1">
								<a href="">용상분관</a>
							</li>
							<li class="a2">
								<a href="">풍산분관</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
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