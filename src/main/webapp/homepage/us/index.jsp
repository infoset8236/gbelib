<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="layout/header.jsp"%>

<div id="wrap">
	<%@ include file="head.jsp"%>
	<%//@ include file="../ycgh/popup.jsp"%>
	<div id="container" class="main">
		<div class="qmenu">
			<div class="section">
				<ul data-call="bxslider" data-breaks="[{screen:0, slides:2},{screen:380, slides:3},{screen:450, slides:4},{screen:767, slides:6},{screen:1000, slides:8}]">
					<li class="qm1"><a href="" style="background-image:url('/resources/homepage/us/img/qm1.gif')"><span>자료검색</span></a></li>
					<li class="qm2"><a href="" style="background-image:url('/resources/homepage/us/img/qm7.gif')"><span>신착자료</span></a></li>
					<li class="qm3"><a href="" style="background-image:url('/resources/homepage/us/img/qm2.gif')"><span>대출조회/예약</span></a></li>
					<li class="qm4"><a href="" style="background-image:url('/resources/homepage/us/img/qm3.gif')"><span>희망도서신청</span></a></li>
					<li class="qm5"><a href="" style="background-image:url('/resources/homepage/us/img/qm5.gif')"><span>자원봉사신청</span></a></li>
					<li class="qm6"><a href="" style="background-image:url('/resources/homepage/us/img/qm4.gif')"><span>전자도서관</span></a></li>
					<li class="qm7"><a href="" style="background-image:url('/resources/homepage/us/img/qm8.gif')"><span>통합도서관</span></a></li>
					<li class="qm8"><a href="" style="background-image:url('/resources/homepage/us/img/qm6.gif')"><span>이용안내</span></a></li>
				</ul>
			</div>
		</div>
		<div class="section">
			<div class="main1">
				<ul class="main_img">
					<li>
						<img src="/resources/homepage/us/img/main01.jpg" alt="메인 이미지 제목"/>
					</li>
					<li>
						<img src="/resources/homepage/us/img/main02.jpg" alt="메인 이미지 제목"/>
					</li>
					<li>
						<img src="/resources/homepage/us/img/main03.jpg" alt="메인 이미지 제목"/>
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
				<div class="lt1 banner-wrap type2">
					<div class="box">
						<div class="banner-t">
							<h3><span>배너</span><strong>모음</strong></h3>
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
						<div class="banner_more"><a class="next" href="#next"><i class="fa fa-chevron-down"></i><span class="blind">다음</span></a></div>
					</div>
				</div>
				<div class="lt2 on like_book2">
					<div class="box">
						<h3>추천도서</h3>
						<ul>
							<li>
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
							<li>
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
						<!-- <h3>
							<a href="#like_book2_1" class="active">신착도서</a>
							<span class="bar"></span>
							<a href="#like_book2_2" class="">추천도서</a>
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
						</ul> -->
						<a href="" class="more">더보기</a>
					</div>
				</div>
				<div class="lt3 news">
					<div class="box">
						<h3>공지사항</h3>
						<ul>
							<li class="notice">
								<a href=""><em>2016년 도서관 이용자만족도조사</em></a>
								<span>01.10</span>
							</li>
							<% for(int i=1; i<=4; i++) { %>
							<li>
								<a href=""><em>2016년 도서관 이용자만족도조사</em></a>
								<span>01.10</span>
							</li>
							<% } %>
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
							<% for(int i=1; i<=2; i++) { %>
							<li>
								<a href="">
									<img src="/resources/homepage/us/img/popup1.jpg" alt="팝업이미지"/>
								</a>
							</li>
							<% } %>
							<li>
								<a href="">
									<img src="/resources/homepage/us/img/popup11.jpg" alt="팝업이미지"/>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>
	
<%@ include file="layout/footer.jsp"%>