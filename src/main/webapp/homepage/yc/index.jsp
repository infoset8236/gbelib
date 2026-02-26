<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="layout/header.jsp"%>

<div id="wrap" class="main">

	<%@ include file="head.jsp"%>
	<%@ include file="../ycgh/popup.jsp"%>
	<div id="container" class="main">
		<div id="main-spot">
			<div class="main-img">	
				<ul class="main_img">
					<li style="background-image:url('/resources/homepage/yc/img/main1.jpg')">
						<div class="main_txt">
							<p><b>책으로 행복해지는</b> 도서관</p>
							<span>예천도서관은 모두를 위한 도서관입니다.</span>
						</div>
					</li>
					<!-- <li style="background-image:url('/resources/homepage/yc/img/main2.jpg')">
						<div class="main_txt">
							<p>경상북도립 <b>예천공공도서관</b></p>
							<span>책으로 행복해지는 도서관입니다.</span>
						</div>
					</li>
					<li style="background-image:url('/resources/homepage/yc/img/main3.jpg')">
						<div class="main_txt">
							<p><b>책으로 행복해지는</b> 도서관</p>
							<span>예천도서관은 모두를 위한 도서관입니다.</span>
						</div>
					</li>
					<li style="background-image:url('/resources/homepage/yc/img/main4.jpg')">
						<div class="main_txt">
							<p><b>경상북도립 예천공공</b>도서관</p>
							<span>책으로 행복해지는 도서관입니다.</span>
						</div>
					</li>
					<li style="background-image:url('/resources/homepage/yc/img/main5.jpg')">
						<div class="main_txt">
							<p><b>예천도서관은</b> 모두를 위한</p>
							<span>예천도서관은 모두를 위한 도서관입니다.</span>
						</div>
					</li> -->
				</ul>
			</div>
			<div class="section">
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
		<div class="main1">
			<div class="section">
				<div class="lt lt1">
					<h3>READING CULTURE EVENT</h3>
					<a href="" class="more">더보기</a>
					<ul>
						<% for (int i=1; i<=2; i++) { %>
						<li>
							<a href="">
								<img src="/resources/homepage/yc/img/ltimg1.jpg" alt="제목"/>
								<span class="t1">2016책나래 페스티벌 독서의 달 행사</span>
								<strong class="tit">쓸모있음의 철학이야기</strong>
								<span class="t2">
									<strong>일시</strong>
									<em>2016.11.24(토) 오후2시~4시</em>
								</span>
								<span class="t3">
									<strong>대상</strong>
									<em>지역주민 누구나</em>
								</span>
								<span class="bt">WATCH NOW</span>
							</a>
						</li>
						<% } %>
					</ul>					
				</div>
				<div class="lt news">
					<div class="box">
						<h3>NOTICE &amp; NEWS</h3>
						<a href="" class="more">더보기</a>
						<ul>
							<% for(int i=1; i<=4; i++) { %>
							<li <%if(i == 1){%>class="first"<%}%>>
								<a href="">
									<em class="t1">2016년 지방공무원 성과상여금 S등급 공개</em>
									<em class="t2">2016년 지방공무원  기간제 근로자(주말자료실 업무 보조) 채용을 다음과 같이 공고합니다.</em>
								</a>
								<span>2016 <br />10.18</span>
							</li>
							<% } %>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="qmenu">
			<div class="section">
				<h3>QUICK LINK</h3>
				<ul data-call="bxslider" data-breaks="[{screen:0, slides:1},{screen:450, slides:2},{screen:600, slides:3},{screen:750, slides:4},{screen:1000, slides:5},{screen:1140, slides:6}]">
					<li class="qm1">
						<a href="" style="background-image:url('/resources/common/img/type29/qm1.jpg')">&nbsp;</a>
						<strong>대출조회/예약</strong>
						<span>도서대출조회 및 예약을<br/> 하실 수 있습니다</span>
					</li>
					<li class="qm2">
						<a href="" style="background-image:url('/resources/common/img/type29/qm2.jpg')">&nbsp;</a>
						<strong>희망도서신청</strong>
						<span>희망하는 도서를 쉽고 간편하게<br/>신청할 수 있습니다.</span>
					</li>
					<li class="qm3">
						<a href="" style="background-image:url('/resources/common/img/type29/qm3.jpg')">&nbsp;</a>
						<strong>평생교육강좌신청</strong>
						<span>평생교육 프로그램<br/>온라인 수강신청</span>
					</li>
					<li class="qm4">
						<a href="" style="background-image:url('/resources/common/img/type29/qm4.jpg')">&nbsp;</a>
						<strong>자원봉사신청</strong>
						<span>나눌수록 행복은 두배가 됩니다.<br/>따뜻함을 나눠주세요.</span>
					</li>
					<li class="qm5">
						<a href="" style="background-image:url('/resources/common/img/type29/qm5.jpg')">&nbsp;</a>
						<strong>문화행사신청</strong>
						<span>서로 공감하고<br/>소통할 수 있는 프로그램</span>
					</li>
					<li class="qm6">
						<a href="" style="background-image:url('/resources/common/img/type29/qm6.jpg')">&nbsp;</a>
						<strong>전자도서관</strong>
						<span>생활속의<br/>스마트 도서관</span>
					</li>
				</ul>
			</div>
		</div>
		<div class="main2">
			<div class="section">
				<div class="popupzone">
					<div class="box">
						<h3>POPUP Zone</h3>
						<ul>
							<li><a href=""><img src="/resources/homepage/yc/img/popupzone.jpg" alt=""/></a></li>
							<li class="none"><a href=""><img src="/resources/common/img/type29/popupnone.jpg" alt="등록된 팝업이 없습니다."/></a></li>
						</ul>
					</div>
				</div>
				<div class="like_book">
					<h3>RECOMMENDED READING</h3>
					<ul>
						<li>
							<a href="" class="thumb"><img src="/resources/homepage/yc/img/book.jpg" alt="나는 단순하게 살기로 했다"/></a>
							<div class="item">
								<div class="box">
									<strong class="sbj">어린이를 위한 하버드 새벽 4시반어린</strong>
								</div>
							</div>
						</li>
					</ul>
					<a href="" class="more">더보기</a>
				</div>
				<div class="libClosed">
					<h3>LIBRARY Hours</h3>
					<div class="box">
						<div class="inBox">
						<p>종합자료실,디지털자료실</p>
						<span>09:00 ~ 18:00</span>
						<p>열람실</p>
						<span><b>3월~10월</b> 09:00~22:00 / <b>11월~2월</b> 09:00~21:00</span>
						<p>휴관일</p>
						<span>매주 월요일,법정공휴일 등</span>
						</div>
						<div class="inBox1">
							<strong><b>1월</b> 휴관일</strong>
							<dl class="info">
								<dd>02, 09, 16, 23, 24, 25, 26, 27, 28, 29, 30</dd>
							</dl>
							<div class="bt-controls">
								<a class="bt-prev" href="">Prev</a><a class="bt-next" href="">Next</a>
							</div>
						</div>
					</div>
					<a href="" class="more">더보기</a>
				</div>
			</div>
		</div>
	</div>
</div>
	
<%@ include file="layout/footer.jsp"%>