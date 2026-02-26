<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="layout/header.jsp"%>

<div id="wrap">
	<%@ include file="head.jsp"%>
	<%@ include file="../ycgh/popup.jsp"%>
	<div id="container" class="main">

		<div class="section">
			<div class="main1">
				<ul class="main_img">
					<li><span class="t01"><b>생활 속의</b><br />스마트 도서관</span><br /><span class="t02">경상북도 교육청 전자도서관</span></li>
					<li><span class="t01"><b>경상북도교육청</b><br />전자도서관</span><br /><span class="t02">경상북도 교육청 전자도서관</span></li>
					<li><span class="t01"><b>나만의 도서관</b><br />경상북도교육청</span><br /><span class="t02">경상북도 교육청 전자도서관</span></li>
				</ul>
			</div>

			<div class="mbanner">
					<div class="banner-list">
						<h3 class="ebook">E-Book</h3>
						<p>전자책</p>
						<h4>전자책으로 이동합니다.</h4>
						<a href=""><span class="blind">바로가기</span></a>
					</div>
					<div class="banner-list">
						<h3 class="audio">Audio Book</h3>
						<p>오디오북</p>
						<h4>오디오북으로 이동합니다.</h4>
						<a href=""><span class="blind">바로가기</span></a>
					</div>
					<div class="banner-list bt3">
						<h3 class="elearning">E-Learning</h3>
						<p>이러닝</p>
						<h4>이러닝으로 이동합니다.</h4>
						<a href=""><span class="blind">바로가기</span></a>
					</div>
				</div>
			<div class="mimg">
			
			</div>

			<div class="bestbook">
				<h3>베스트 도서</h3>
				<div class="bestbook_m">
					<ul>
						<li>
							<em><img src="/resources/homepage/elib/img/book_best.png" alt="베스트도서"/></em>
							<a href="" class="thumb"><img src="/resources/homepage/elib/img/book.jpg" alt="나는 단순하게 살기로 했다"/></a>
							<div class="item">
								<a class="box">
									<strong class="sbj">어린이를 위한 하버드</strong>
									<p><span>웨이슈잉</span> <span class="bar">/</span><span>세종주니어</span></p>
									<p class="snipet">
										《어린이를 위한 하버드 새벽 4시 반》은 자라나는 어린이들에게 꿈, 용기, 자립심, 의지력을 길러주기 위한 어린이 자기계발서예요. 하버드 대학교는 노벨상 
										수상자, 미국 대통령, 성공한 기업가, 위대한 문학가 등 세계를 움직이는 수많은 인재를 배출했어요. 왜 이렇게 하버드에만 들어가면 숨어 있던 잠재력이 
										찬란하게 꽃피는 걸까요? 답은 바로 ‘진정한 엘리트는 남다른 능력을 타고난 사람이 아니라, 품성이 뛰어난 사람이다.’
									</p>
								</a>
							</div>
						</li>
					</ul>
				</div>
				<div class="bestbook_l">
					<ul>
						<li><span class="num">2</span><span class="book"><a href=""><img src="/resources/homepage/elib/img/book01.jpg" alt="나는 단순하게 살기로 했다"/></a></span></li>
						<li><span class="num">3</span><span class="book"><a href=""><img src="/resources/homepage/elib/img/book02.jpg" alt="나는 단순하게 살기로 했다"/></a></span></li>
						<li><span class="num">4</span><span class="book"><a href=""><img src="/resources/homepage/elib/img/book.jpg" alt="나는 단순하게 살기로 했다"/></a></span></li>
						<li><span class="num">5</span><span class="book"><a href=""><img src="/resources/homepage/elib/img/book03.jpg" alt="나는 단순하게 살기로 했다"/></a></span></li>
						<li><span class="num">6</span><span class="book"><a href=""><img src="/resources/homepage/elib/img/book04.jpg" alt="나는 단순하게 살기로 했다"/></a></span></li>
						<li><span class="num">7</span><span class="book"><a href=""><img src="/resources/homepage/elib/img/book06.jpg" alt="나는 단순하게 살기로 했다"/></a></span></li>
					</ul>
				</div>
			</div>
				<div class="like_book">
					<h3>신간도서</h3>
					<div class="box">
						<ul data-call="bxslider" data-breaks="[{screen:0, slides:1},{screen:360, slides:2},{screen:460, slides:3},{screen:650, slides:4},{screen:767, slides:5},{screen:1000, slides:6}]">
						<% for(int i=1; i<=30; i++) { %>
							<li>
								<a href="">
									<img src="/resources/homepage/elib/img/book05.jpg" alt="나는 단순하게 살기로 했다"/>
									<span>나는 단순하게 살기로 했습니다</span>
									<em>웨이슈잉</em>
								</a>
							</li>
							<% } %>
						</ul>
					</div>
				</div>
			<div class="bbanner">
				<div class="mb1">
					<a href="">전자잡지</a>
				</div>
				<div class="mb2">
					<a href="">전자저널</a>
				</div>
				<div class="mb3">
					<a href="">FAQ</a>
				</div>
			</div>

			<div class="news">
				<div class="box">
					<h3>공지사항</h3>
					<ul>
						<li class="notice">
							<a href=""><em>2016년 도서관 이용자만족도조사</em></a>
							<span>2017.01.10</span>
						</li>
						<% for(int i=1; i<=3; i++) { %>
						<li>
							<a href=""><em>2016년 도서관 이용자만족도조사</em></a>
							<span>2017.01.10</span>
						</li>
						<% } %>
					</ul>
					<a href="" class="more">더보기</a>
				</div>
			</div>

			<div class="news">
				<div class="box">
					<h3>FAQ</h3>
					<ul>
						<li class="notice">
							<a href=""><em>예약 중인 전자책은 언제 볼 수 있나요?</em></a>
							<span>2017.01.10</span>
						</li>
						<% for(int i=1; i<=3; i++) { %>
						<li>
							<a href=""><em>이용하던 전자책이 안 보입니다? </em></a>
							<span>2017.01.10</span>
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