<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="layout/header.jsp"%>

<div class="main">
	<%@ include file="head.jsp"%>
	<div class="main01">
		<div class="main1">
			<div class="box">
				<div class="box2">
					<div class="main_txt"><img src="/resources/homepage/lib/img/main_txt.png" alt="도민과 함께 성상하는 책 읽는 경북"/></div>
					<ul class="main_img">
						<li style="background-image:url('/resources/homepage/lib/img/main01.png')">&nbsp;</li>
						<li style="background-image:url('/resources/homepage/lib/img/main02.png')">&nbsp;</li>
						<li style="background-image:url('/resources/homepage/lib/img/main03.png')">&nbsp;</li>
					</ul>
				</div>
			</div>
		</div>

		<div class="main2">

			<div class="popupzone">
				<h3 class="blind">팝업존</h3>
				<ul>
					<li><a href=""><img src="/resources/homepage/lib/img/popupzone.jpg" alt=""/></a></li>
					<li><a href=""><img src="/resources/homepage/lib/img/popupnone.png" alt=""/></a></li>
				</ul>
			</div>

			<div class="mb">
				<div class="box">
					<ul>
						<li class="mb1">
							<a href="" class="box">
								<strong>
									<span class="t1">전자도서관</span>
								</strong>
								<em>
									<span class="t1">생활 속의 스마트도서관</span>
									<span class="t2">Digital Library</span>
								</em>
								<i>이동하기</i>
							</a>
						</li>
						<li class="mb2">
							<a href="" class="box">
								<strong>
									<span class="t1">모바일앱</span>
								</strong>
								<em>
									<span class="t1">내 손안의 도서관</span>
									<span class="t2">모바일앱 이용안내</span>
								</em>
								<i>이동하기</i>
							</a>
						</li>
					</ul>
				</div>
			</div>

			<div class="like_book">
				<div class="box">
					<h3>신착도서</h3>
					<ul data-call="bxslider" data-breaks="[{screen:0, slides:1},{screen:360, slides:2},{screen:460, slides:3},{screen:1000, slides:3}]">
						<% for(int i=1; i<=4; i++){ %>
						<li>
							<a href="" title="제목">
								<img src="/resources/homepage/lib/img/book.jpg" alt="나는 단순하게 살기로 했다"/>
							</a>
						</li>
						<% } %>
					</ul>
					<span></span>
					<a href="" class="more">더보기</a>
				</div>
			</div>

			<div class="qmenu">
				<ul data-call="bxslider" data-breaks="[{screen:0, slides:2},{screen:380, slides:3},{screen:450, slides:4},{screen:767, slides:5},{screen:1000, slides:6}]">
					<li class="qm1"><a href="" style="background-image:url('/resources/homepage/lib/img/qm1.png')"><span>자료검색</span></a></li>
					<li class="qm2"><a href="" style="background-image:url('/resources/homepage/lib/img/qm2.png')"><span>책바다</span></a></li>
					<li class="qm3"><a href="" style="background-image:url('/resources/homepage/lib/img/qm3.png')"><span>책나래</span></a></li>
					<li class="qm4"><a href="" style="background-image:url('/resources/homepage/lib/img/qm4.png')"><span>책이음</span></a></li>
					<li class="qm5"><a href="" style="background-image:url('/resources/homepage/lib/img/qm5.png')"><span>사서에게 물어보세요</span></a></li>
					<li class="qm6"><a href="" style="background-image:url('/resources/homepage/lib/img/qm6.png')"><span>국가전자 도서관</span></a></li>
				</ul>
			</div>
		</div>
	</div>

	<div class="news">
		<div class="box">
			<h3>공지사항</h3>
			<ul>
				<li><!-- <li class="notice"> -->
					<a href=""><small class="zone">전체</small> <em>2016년 도서관 이용자만족도조사</em></a>
					<span>2016.11.16</span>
				</li>
				<% for(int i=1; i<=4; i++){ %>
				<li>
					<a href=""><small class="zone yd">영덕</small><em>2016년 도서관 이용자만족도조사</em></a>
					<span>2016.11.16</span>
				</li>
				<% } %>
			</ul>
			<a href="" class="more">더보기</a>
		</div>
	</div>

	<!-- <div class="event"> -->
	<div class="news">
		<div class="box">
			<h3>평생강좌안내</h3>
			<ul>
				<li>
					<a href=""><small class="zone">전체</small> <em>2016년 도서관 이용자만족도조사</em></a>
					<span>2016.11.16</span>
				</li>
				<li>
					<a href=""><small class="zone sj">상주</small><em>2016년 도서관 이용자만족도조사</em></a>
					<span>2016.11.16</span>
				</li>
				<li>
					<a href=""><small class="zone sjhr">상주화령</small><em>2016년 도서관 이용자만족도조사</em></a>
					<span>2016.11.16</span>
				</li>
				<li>
					<a href=""><small class="zone gm">구미</small><em>2016년 도서관 이용자만족도조사</em></a>
					<span>2016.11.16</span>
				</li>
				<li>
					<a href=""><small class="zone cs">청송</small><em>2016년 도서관 이용자만족도조사</em></a>
					<span>2016.11.16</span>
				</li>
				<!-- <li>
					<a href=""><small class="zone cd">청도</small><em>2016년 도서관 이용자만족도조사</em></a>
					<span>2016.11.16</span>
				</li>
				<li>
					<a href=""><small class="zone od">외동</small><em>2016년 도서관 이용자만족도조사</em></a>
					<span>2016.11.16</span>
				</li>
				<li>
					<a href=""><small class="zone yd">영덕</small><em>2016년 도서관 이용자만족도조사</em></a>
					<span>2016.11.16</span>
				</li>
				<li>
					<a href=""><small class="zone sj">상주</small><em>2016년 도서관 이용자만족도조사</em></a>
					<span>2016.11.16</span>
				</li>
				<li>
					<a href=""><small class="zone sjhr">상주화령</small><em>2016년 도서관 이용자만족도조사</em></a>
					<span>2016.11.16</span>
				</li>
				<li>
					<a href=""><small class="zone geiclib">센터도서관</small><em>2016년 도서관 이용자만족도조사</em></a>
					<span>2016.11.16</span>
				</li>
				<li>
					<a href=""><small class="zone geic">센터</small><em>2016년 도서관 이용자만족도조사</em></a>
					<span>2016.11.16</span>
				</li>
				<li>
					<a href=""><small class="zone gm">구미</small><em>2016년 도서관 이용자만족도조사</em></a>
					<span>2016.11.16</span>
				</li>
				<li>
					<a href=""><small class="zone gw">군위</small><em>2016년 도서관 이용자만족도조사</em></a>
					<span>2016.11.16</span>
				</li>
				<li>
					<a href=""><small class="zone cs">청송</small><em>2016년 도서관 이용자만족도조사</em></a>
					<span>2016.11.16</span>
				</li>
				<li>
					<a href=""><small class="zone yi">영일</small><em>2016년 도서관 이용자만족도조사</em></a>
					<span>2016.11.16</span>
				</li>
				<li>
					<a href=""><small class="zone yc">예천</small><em>2016년 도서관 이용자만족도조사</em></a>
					<span>2016.11.16</span>
				</li>
				<li>
					<a href=""><small class="zone jc">점촌</small><em>2016년 도서관 이용자만족도조사</em></a>
					<span>2016.11.16</span>
				</li>
				<li>
					<a href=""><small class="zone yj">영주</small><em>2016년 도서관 이용자만족도조사</em></a>
					<span>2016.11.16</span>
				</li>
				<li>
					<a href=""><small class="zone yjpg">영주풍기</small><em>2016년 도서관 이용자만족도조사</em></a>
					<span>2016.11.16</span>
				</li>
				<li>
					<a href=""><small class="zone cg">칠곡</small><em>2016년 도서관 이용자만족도조사</em></a>
					<span>2016.11.16</span>
				</li>
				<li>
					<a href=""><small class="zone uj">울진</small><em>2016년 도서관 이용자만족도조사</em></a>
					<span>2016.11.16</span>
				</li>
				<li>
					<a href=""><small class="zone ad">안동</small><em>2016년 도서관 이용자만족도조사</em></a>
					<span>2016.11.16</span>
				</li>
				<li>
					<a href=""><small class="zone adys">안동용상</small><em>2016년 도서관 이용자만족도조사</em></a>
					<span>2016.11.16</span>
				</li>
				<li>
					<a href=""><small class="zone adps">안동풍산</small><em>2016년 도서관 이용자만족도조사</em></a>
					<span>2016.11.16</span>
				</li>
				<li>
					<a href=""><small class="zone sjl">성주</small><em>2016년 도서관 이용자만족도조사</em></a>
					<span>2016.11.16</span>
				</li>
				<li>
					<a href=""><small class="zone yy">영양</small><em>2016년 도서관 이용자만족도조사</em></a>
					<span>2016.11.16</span>
				</li>
				<li>
					<a href=""><small class="zone bh">봉화</small><em>2016년 도서관 이용자만족도조사</em></a>
					<span>2016.11.16</span>
				</li>
				<li>
					<a href=""><small class="zone us">의성</small><em>2016년 도서관 이용자만족도조사</em></a>
					<span>2016.11.16</span>
				</li>
				<li>
					<a href=""><small class="zone gr">고령</small><em>2016년 도서관 이용자만족도조사</em></a>
					<span>2016.11.16</span>
				</li>
				<li>
					<a href=""><small class="zone gbccs">학생문화회관</small><em>2016년 도서관 이용자만족도조사</em></a>
					<span>2016.11.16</span>
				</li>
				<li>
					<a href=""><small class="zone ul">울릉</small><em>2016년 도서관 이용자만족도조사</em></a>
					<span>2016.11.16</span>
				</li>
				<li>
					<a href=""><small class="zone ycgh">영천금호</small><em>2016년 도서관 이용자만족도조사</em></a>
					<span>2016.11.16</span>
				</li>
			</ul> -->
			<!-- <!-- <ul>
				<li>
					<div class="thumb"><a href=""><img src="/resources/homepage/lib/img/thumb1.jpg" alt="제목"/></a></div>
					<div class="snipet">
						<div class="box">
							<small class="zone zone2">영덕</small>
							<a href="">하반기 평생교육강좌</a>
							<dl>
								<dd>
									<label>대상 : </label>
									<span> 일반100명</span>
								</dd>
								<dd>
									<label>시간 : </label>
									<span> 16.09.09~16.10.14</span>
								</dd>
								<dd>
									<label>장소 : </label>
									<span> 1층 자료실</span>
								</dd>
							</dl>
						</div>
					</div>
				</li>
			</ul>
			<ul>
				<li>
					<div class="thumb"><a href=""><img src="/resources/homepage/lib/img/thumb2.jpg" alt="제목"/></a></div>
					<div class="snipet">
						<div class="box">
							<small class="zone zone3">영천</small>
							<a href="">하반기 평생교육강좌</a>
							<dl>
								<dd>
									<label>대상 : </label>
									<span> 일반100명</span>
								</dd>
								<dd>
									<label>시간 : </label>
									<span> 16.09.09~16.10.14</span>
								</dd>
								<dd>
									<label>장소 : </label>
									<span> 1층 자료실</span>
								</dd>
							</dl>
						</div>
					</div>
				</li>
			</ul> -->
		</div>
		<a href="" class="more">더보기</a>
	</div>

	<%@ include file="layout/footer.jsp"%>

</div>