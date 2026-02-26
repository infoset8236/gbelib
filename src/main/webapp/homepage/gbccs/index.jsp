<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="layout/header.jsp"%>

<div id="wrap">
	<%@ include file="head.jsp"%>
	<div id="container" class="main">
		<div class="ltr main1">
			<ul class="main_img">
				<li style="background-image:url(/resources/homepage/gbccs/img/main1.jpg)">메인 이미지 제목1</li>
				<li style="background-image:url(/resources/homepage/gbccs/img/main2.jpg)">메인 이미지 제목2</li>
				<li style="background-image:url(/resources/homepage/gbccs/img/main3.jpg)">메인 이미지 제목3</li>
				<li style="background-image:url(/resources/homepage/gbccs/img/main4.jpg)">메인 이미지 제목4</li>
				<li style="background-image:url(/resources/homepage/gbccs/img/main5.jpg)">메인 이미지 제목5</li>
			</ul>
			<div class="section">
				<div class="main_txt">
					<img src="/resources/homepage/gbccs/img/main_txt.png" alt="꿈과 미래를 위한 만남 : 경상북도학생문화회관이 여러분의 꿈과 희망을 펼쳐갑니다"/>
				</div>
			</div>
		</div>		
		<div class="section lt_center">

			<div class="main2">
				<div class="quickMenu">
					<div>
						<ul>
							<li class="qm1"><a href="sub.jsp?menu_seq=noContent" style="background-image:url('/resources/homepage/gbccs/img/qm1.png')"><span>문화체험수강신청</span></a></li>
							<li class="qm2"><a href="sub.jsp?menu_seq=noContent" style="background-image:url('/resources/homepage/gbccs/img/qm2.png')"><span>수강신청 확인/취소</span></a></li>
							<li class="qm3"><a href="sub.jsp?menu_seq=noContent" style="background-image:url('/resources/homepage/gbccs/img/qm3.png')"><span>독도교육체험관</span></a></li>
							<li class="qm4"><a href="sub.jsp?menu_seq=noContent" style="background-image:url('/resources/homepage/gbccs/img/qm4.png')"><span>체험활동소감문</span></a></li>
							<li class="qm5"><a href="sub.jsp?menu_seq=noContent" style="background-image:url('/resources/homepage/gbccs/img/qm5.png')"><span>시설현황</span></a></li>
							<li class="qm6"><a href="sub.jsp?menu_seq=noContent" style="background-image:url('/resources/homepage/gbccs/img/qm6.png')"><span>대관절차안내</span></a></li>
							<li class="qm7"><a href="sub.jsp?menu_seq=noContent" style="background-image:url('/resources/homepage/gbccs/img/qm7.png')"><span>자료실자료검색</span></a></li>
							<li class="qm8"><a href="sub.jsp?menu_seq=noContent" style="background-image:url('/resources/homepage/gbccs/img/qm8.png')"><span>정보공개</span></a></li>
						</ul>
					</div>
				</div>
					
				<div class="popupzone">
					<ul>
						<li><a href=""><img src="/resources/homepage/gbccs/img/popupzone.jpg" alt=""/></a></li>
						<li><a href=""><img src="/resources/homepage/gbccs/img/popupnone.png" alt="등록된 팝업이 없습니다"/></a></li>
					</ul>
				</div>
			</div>

			<div class="main3">
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
						<a href="" class="more_">더보기</a>
					</div>
				</div>
				<div class="news news1">
					<div class="box">
						<h3>보도자료</h3>
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
						<a href="" class="more_">더보기</a>
					</div>
				</div>
				<div class="photo">
					<div class="box">
						<h3>포토갤러리</h3>
						<ul class="lt_photo">
							<% for(int i=1; i<=5; i++) { %>
							<li>
								<a href="">
									<img src="/resources/homepage/gbccs/img/photo.jpg" alt=""/>
								</a>
							</li>
							<% } %>
						</ul>
						<a href="" class="more">더보기</a>
					</div>
				</div>
			</div>

		<div class="main4">
			<div class="mb">
				<div class="mb1">
					<a href=""  class="box">
						<span class="t2">학생문화회관</span>
						<span class="t1"><b>홍보</b><br />동영상</span>
						<i>자세히 보기</i>
					</a>
				</div>
				<div class="mb2">	
					<a href=""  class="box">
						<span class="t2">학생문화회관</span>
						<span class="t1"><b>행사</b><br />동영상</span>
						<i>자세히 보기</i>
					</a>
				</div>
			</div>
			<div class="hot">
				<div class="box">
				<h3>HOT LINK</h3>
					<ul>
						<li class="hm1"><a href="sub.jsp?menu_seq=noContent"><span>자주하는질문</span></a></li>
						<li class="hm2"><a href="sub.jsp?menu_seq=noContent"><span>강사인력풀제</span></a></li>
						<li class="hm3"><a href="sub.jsp?menu_seq=noContent" ><span>공연/전시일정</span></a></li>
					</ul>
				</div>
			</div>

			<div class="guide">
				<div class="box">
					<h3>이용시간안내</h3>
					<span><b>회관이용. 09:00~21:00</b></span>
					<span><i>&nbsp;</i><b>자료실. 09:00~18:00(<em>토</em>09:00~17:00)</b></span>
					<span><i>&nbsp;</i><b>휴관일. 회관이용 : </b>토요일,일요일,법정공휴일<br /><i class="s">&nbsp;</i><b>자료실 : </b>일요일,월요일,법정공휴일</span>
				</div>
			</div>
		</div>
	</div>

	<div class="main5">
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
<%@ include file="layout/footer.jsp"%>