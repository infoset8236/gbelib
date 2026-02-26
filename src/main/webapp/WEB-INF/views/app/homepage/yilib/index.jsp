<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<tiles:insertAttribute name="header" />
<div id="wrap">
	<tiles:insertAttribute name="top" />
	
	<div id="container">
		<div class="qmenu">
			<div class="section">
				<ul data-call="bxslider">
					<li class="qm1"><a href=""><span>신착자료</span></a></li>
					<li class="qm2"><a href=""><span>대출조회/연기</span></a></li>
					<li class="qm3"><a href=""><span>희망도서신청</span></a></li>
					<li class="qm4"><a href=""><span>전자도서관</span></a></li>
					<li class="qm5"><a href=""><span>자료실좌석예약</span></a></li>
					<li class="qm6"><a href=""><span>자원봉사신청</span></a></li>
					<li class="qm7"><a href=""><span>이용방법</span></a></li>
					<li class="qm8"><a href=""><span>Q&amp;A</span></a></li>
				</ul>
			</div>
		</div>
		<div class="section">
			<div class="main">
				<div class="main1">
					<ul>
						<li style="background:url('/resources/homepage/lib-11/img/main01.jpg') no-repeat 0 0">이미지1</li>
						<li>이미지2</li>
						<li>이미지3</li>
						<li>이미지4</li>
						<li>이미지5</li>
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
			</div>
			<div class="main3">
				<div class="like_book">
					<div class="box">
						<h3>추천도서</h3>
						<ul>
							<li>
								<a href="">
									<img src="/resources/homepage/lib-11/img/book.jpg" alt="나는 단순하게 살기로 했다"/>
									<span>나는 단순하게 살기로 했습니다</span>
								</a>
							</li>
						</ul>
						<a href="" class="more">더보기</a>
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
				<div class="news">
					<div class="box">
						<h3>도서관행사</h3>
						<ul>
							<li class="new">
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
					<h3>행사갤러리</h3>
					<ul>
						<% for(int i=1; i<=3; i++) { %>
						<li>
							<a href="">
								<img src="/resources/homepage/lib-11/img/mb2bg.jpg" alt=""/>
								<span>컬러링 포스터</span>
							</a>
						</li>
						<% } %>
					</ul>
					<a href="" class="more">더보기</a>
				</div>
			</div>
		</div>
	</div>
</div>

<tiles:insertAttribute name="footer" />