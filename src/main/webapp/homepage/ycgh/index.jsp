<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="layout/header.jsp"%>

<div id="wrap">
	<%@ include file="head.jsp"%>
	<%//@ include file="../ycgh/popup.jsp"%>
	<div id="container" class="main">
		<div class="qmenu">
			<div class="section">
				<ul data-call="bxslider" data-breaks="[{screen:0, slides:2},{screen:380, slides:3},{screen:500, slides:5},{screen:600, slides:6},{screen:767, slides:7},{screen:1000, slides:10}]">
					<li class="qm1"><a href="" style="background-image:url('/resources/homepage/ycgh/img/qm1.gif')"><span>자료검색</span></a></li>
					<li class="qm2"><a href="" style="background-image:url('/resources/homepage/ycgh/img/qm2.gif')"><span>대출조회/예약</span></a></li>
					<li class="qm3"><a href="" style="background-image:url('/resources/homepage/ycgh/img/qm3.gif')"><span>희망도서신청</span></a></li>
					<li class="qm4"><a href="" style="background-image:url('/resources/homepage/ycgh/img/qm4.gif')"><span>전자도서관</span></a></li>
					<li class="qm5"><a href="" style="background-image:url('/resources/homepage/ycgh/img/qm5.gif')"><span>디지털자료실예약</span></a></li>
					<li class="qm6"><a href="" style="background-image:url('/resources/homepage/ycgh/img/qm6.gif')"><span>자원봉사신청</span></a></li>
					<li class="qm7"><a href="" style="background-image:url('/resources/homepage/ycgh/img/qm7.gif')"><span>온라인수강신청</span></a></li>
					<li class="qm8"><a href="" style="background-image:url('/resources/homepage/ycgh/img/qm8.gif')"><span>도서관탐방신청</span></a></li>
					<li class="qm9"><a href="" style="background-image:url('/resources/homepage/ycgh/img/qm9.gif')"><span>Q&amp;A</span></a></li>
					<li class="qm10"><a href="" style="background-image:url('/resources/homepage/ycgh/img/qm10.gif')"><span>통합도서관</span></a></li>
				</ul>
			</div>
		</div>
		<div class="section">
			<div class="main1">
				<div class="main_txt">
					<img src="/resources/homepage/ycgh/img/main_txt.png" alt="함께하는 도서관 지식up!! 소통up!!"/>
				</div>
				<ul class="main_img">
					<li>
						<img src="/resources/homepage/ycgh/img/main01.jpg" alt="메인 이미지 제목"/>
					</li>
					<li>
						<img src="/resources/homepage/ycgh/img/main02.jpg" alt="메인 이미지 제목"/>
					</li>
					<li>
						<img src="/resources/homepage/ycgh/img/main03.jpg" alt="메인 이미지 제목"/>
					</li>
				</ul>
			</div>
			<div class="main2">
				<ul>
					<li class="mb1">
						<a href="" class="box">
							<!-- <span>보고싶은 자료 신청</span> -->
							<b style="padding-top:80px">내서재</b>
						</a>
					</li>
					<li class="mb2">
						<a href="" class="box">
							<!-- <span>독서활동 지원 체험</span> -->
							<b style="padding-top:60px">희망도서<br/>신청</b>
						</a>
					</li>
					<li class="mb3">
						<a href="" class="box">
							<!-- <span>도서관 월별일정안내</span> -->
							<b style="padding-top:60px">온라인<br/>수강신청</b>
						</a>
					</li>
					<li class="mb4">
						<a href="" class="box">
							<!-- <span>재능기부/자원봉사 활동가</span> -->
							<b style="padding-top:60px">정보<br/>서비스</b>
						</a>
					</li>
				</ul>
			</div>
			<div class="main3">
				<div class="lt1 libClosed">
					<div class="box">
						<h3>이용시간</h3>
						<div class="lib_box">
							<ul>
								<li>
									<strong>자료실</strong>
									<p>평일(화~금) 09:00 ~ 18:00</p>
									<p>주말(토~일) 09:00 ~ 17:00</p>
								</li>
								<li>
									<strong>자유열람실</strong>
									<p>하절기(3월~10월) 09:00 ~ 22:00</p>
									<p>동절기(11월~2월) 09:00 ~ 21:00</p>
								</li>
							</ul>
							<dl>
								<dt><strong>01월</strong> <span>휴관일</span></dt>
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
						<a href="" class="more">더보기</a>
					</div>
				</div>
				<div class="lt2 news">
					<div class="box">
						<h3>공지사항</h3>
						<ul>
							<li class="notice">
								<a href=""><em>2016년 도서관 이용자만족도조사</em></a>
								<span>11.16</span>
							</li>
							<% for(int i=1; i<=4; i++) { %>
							<li>
								<a href=""><em>2016년 도서관 이용자만족도조사</em></a>
								<span>11.16</span>
							</li>
							<% } %>
						</ul>
						<a href="" class="more">더보기</a>
					</div>
				</div>
				<div class="lt3 like_book2">
					<div class="box">
						<h3>
							<a href="#like_book2_1" class="active">신착도서</a>
							<span class="bar"></span>
							<a href="#like_book2_2">추천도서</a>
						</h3>
						<ul>
							<li class="active" id="like_book2_1">
								<div class="thumb"><a href=""><img src="/resources/homepage/ycgh/img/book.jpg" alt=""/></a></div>
								<div class="snipet">
									<dl>
										<dt><a href="">나는 단순하게 살기로 했다</a></dt>
										<dd>
											<label>저자</label>
											<span>사사키 후미오</span>
										</dd>
										<dd>
											<label>출판사</label>
											<span>비즈니스북스</span>
										</dd>
										<dd class="item">
											버릴수록 행복하다! 집에 있는 옷장이나 책상 서랍에서 자주 꺼내 입는 옷, 효과..
										</dd>
									</dl>
								</div>
							</li>
							<li id="like_book2_2">
								<div class="thumb"><a href=""><img src="/resources/homepage/ycgh/img/book.jpg" alt=""/></a></div>
								<div class="snipet">
									<dl>
										<dt><a href="">책이름</a></dt>
										<dd>
											<label>저자</label>
											<span>홍길동</span>
										</dd>
										<dd>
											<label>출판사</label>
											<span>디즈니 랜드</span>
										</dd>
										<dd class="item">
											내용이 표시되는 부분에 내용이 나옵니다..
										</dd>
									</dl>
								</div>
							</li>
						</ul>
						<a href="" class="more">더보기</a>
					</div>
				</div>
			</div>
			<div class="main4">
				<div class="box">
					<h3>팝업알리미</h3>
					<div class="popupzone">
						<ul>
							<% for(int i=1; i<=5; i++) { %>
							<li>
								<a href="">
									<img src="/resources/homepage/cd/img/popup1.jpg" alt=""/>
								</a>
							</li>
							<% } %>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>
	
<%@ include file="layout/footer.jsp"%>