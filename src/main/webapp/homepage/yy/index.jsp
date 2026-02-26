<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="layout/header.jsp"%>

<div id="wrap">
	<%@ include file="head.jsp"%>
	<%@ include file="../ycgh/popup.jsp"%>
	<div id="container" class="main">
		<div class="section">
			<div class="main_box">	
				<div class="ltm">
					<div class="popupzone">
						<ul>
							<li><a href=""><img src="/resources/common/img/type6/popupzone.jpg" alt="제목"/></a></li>
							<li><a href=""><img src="/resources/homepage/yy/img/popupzone2.jpg" alt="제목"/></a></li>
							<li><a href=""><img src="/resources/common/img/type6/popupnone.png" alt="등록된 팝업이 없습니다"/></a></li>
						</ul>
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
					<div class="like_book">
						<div class="box">
							<h3>추천도서</h3>
							<ul>
								<li>
									<a href="">
										<img src="/resources/common/img/type6/book.jpg" style="width:120px;height:175px" alt="제목"/>
										<span>임금 인상을 요청하기 위해 과장에게 접근하는 기술과 방법</span>
									</a>
								</li>
							</ul>
							<a href="" class="more">더보기</a>
						</div>
					</div>
				</div>
	
				<div class="ltr">
					<div class="quickMenu">
						<ul>
							<li class="qm1"><div><a href="" style="background-image:url('/resources/common/img/type6/qm1.png')"><span>자료실좌석예약</span></a></div></li>
							<li class="qm2"><div><a href="" style="background-image:url('/resources/common/img/type6/qm2.png')"><span>자료검색</span></a></div></li>
							<li class="qm3"><div><a href="" style="background-image:url('/resources/common/img/type6/qm3.png')"><span>자원봉사신청</span></a></div></li>
							<li class="qm4"><div><a href="" style="background-image:url('/resources/common/img/type6/qm4.png')"><span>이용안내</span></a></div></li>
							<li class="qm5"><div><a href="" style="background-image:url('/resources/common/img/type6/qm5.png')"><span>대출도회/예약</span></a></div></li>
							<li class="qm6"><div><a href="" style="background-image:url('/resources/common/img/type6/qm6.png')"><span>희망도서신청</span></a></div></li>
							<li class="qm7"><div><a href="" style="background-image:url('/resources/common/img/type6/qm7.png')"><span>통합도서관</span></a></div></li>
							<!-- <li class="qm8"><div><a href="" style="background-image:url('/resources/common/img/type6/qm8.png')"><span>통합도서관</span></a></div></li> -->
						</ul>
					</div>
					<div class="main1">
						<ul class="main_img">
							<li style="background-image:url('/resources/common/img/type6/main_img01.png')">&nbsp;</li>
							<li style="background-image:url('/resources/common/img/type6/main_img02.png')">&nbsp;</li>
						</ul>
					</div>
				</div>
	
				<div class="lts">
					<div class="mb1">
						<a href=""  class="box">
							<span class="t1">휴관일안내</span>
							<span class="t2">휴관일 및 행사일정</span>
							<span class="t3">영양공공도서관 휴관일 및 <br /> 다양한 도서관 일정 안내</span>
						</a>
					</div>
					<div class="mb2">	
						<a href=""  class="box">
							<span class="t1">청소년을 위한<br /> 독서칼럼</span>
							<span class="t3">책을 통해 만나는 인생 <br />선배들의 꿈과 희망의 메시지</span>
						</a>
					</div>
					<div class="mb3">
						<a href=""  class="box">
							<span class="t1">책바다</span>
							<span class="t2">국가상호대차서비스</span>
							<span class="t3">소장 자료를 서로 공유하는<br /> 전국 도서관 자료 공동 활용</span>
						</a>
					</div>
					<div class="mb4">
						<a href=""  class="box">
							<span class="t1">사서에게<br /> 물어보세요</span>
							<span class="t3">일반인들이 궁금해하는 지식을<br />사서가  도서관 소장자료 등을 <br />활용하여 제공</span>
						</a>
					</div>
				</div>
			</div>
		</div>

		<div class="banner">
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
							<% for(int i=1; i<=4; i++) { %>
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