<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="layout/header.jsp"%>

<div id="wrap">
	<%@ include file="head.jsp"%>
	<%@ include file="../ycgh/popup.jsp"%>
	<div id="container" class="main">
		<div class="main1 type2">
			<div class="section">
				<div class="txt center">
					<div class="t1">
						정보 &middot; 지식 &middot; 행복
					</div>
					<div class="t2">
						상주도서관이 함께 합니다
					</div>
					<!-- <div class="t1">
						<p>LIBRARY TOGETHER</p>
						<strong>시민과 미래를 <span>함께하는 도서관</span></strong>
					</div>
					<div class="t2">
						시민들의 지식&middot;정보습득화 평생교육의 장으로서  그 역할을 충실히 수행하고 있습니다.
					</div> -->
				</div>
				<div class="search-box">
					<form>
						<fieldset>
							<legend class="blind">통합검색</legend>
							<div class="box1">
								<div class="box2">
									<input type="text" class="text" placeholder="검색어를 입력해 주세요"/>
								</div>
							</div>
							<button>통합검색</button>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
		<div class="qmenu">
			<div class="section">
				<ul data-call="bxslider" data-breaks="[{screen:0, slides:2},{screen:380, slides:3},{screen:450, slides:4},{screen:580, slides:5},{screen:767, slides:7},{screen:1000, slides:9}]">
					<li class="qm1"><a href="" style="background-image:url('/resources/homepage/sj/img/qm1.gif')"><span>자료검색</span></a></li>
					<li class="qm2"><a href="" style="background-image:url('/resources/homepage/sj/img/qm2.gif')"><span>대출조회/예약</span></a></li>
					<li class="qm3"><a href="" style="background-image:url('/resources/homepage/sj/img/qm3.gif')"><span>희망도서신청</span></a></li>
					<li class="qm4"><a href="" style="background-image:url('/resources/homepage/sj/img/qm4.gif')"><span>전자도서관</span></a></li>
					<li class="qm5"><a href="" style="background-image:url('/resources/homepage/sj/img/qm5.gif')"><span>자료실좌석예약</span></a></li>
					<li class="qm6"><a href="" style="background-image:url('/resources/homepage/sj/img/qm6.gif')"><span>자원봉사신청</span></a></li>
					<li class="qm7"><a href="" style="background-image:url('/resources/homepage/sj/img/qm7.gif')"><span>영화상영</span></a></li>
					<li class="qm8"><a href="" style="background-image:url('/resources/homepage/sj/img/qm8.gif')"><span>Q&amp;A</span></a></li>
					<li class="qm9"><a href="" style="background-image:url('/resources/homepage/sj/img/qm9.gif')"><span>통합도서관</span></a></li>
				</ul>
			</div>
		</div>
		<div class="lt-wrap">
			<div class="section">
				<div class="main2">
					<div class="lt1">
						<div class="box">
							<h3>독서문화행사</h3>
							<p>서로 공감하고 소통이 이루어 지는 곳</p>
							<a href=""><span>자세히보기</span></a>
						</div>
					</div>
					<div class="lt2">
						<div class="like_book">
							<div class="box">
								<h3>사서추천도서</h3>
								<ul>
									<li>
										<a href="">
											<img src="/resources/homepage/sj/img/book.jpg" alt="세계 도서관 기행"/>
											<span>세계 도서관 기행</span>
										</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="lt3">
						<div class="box">
							<h3>상호대차서비스</h3>
							<p>소장 자료를 서로 공유하는 전국 도서관 자료 공동 활용 서비스</p>
							<a href=""><span>자세히보기</span></a>
						</div>
					</div>
					<div class="lt4">
						<div class="box">
							<h3>독서칼럼</h3>
							<p>사회 저명인사와 독거전문가의 독서칼럼</p>
							<a href=""><span>자세히보기</span></a>
						</div>
					</div>
				</div>
				<div class="main3">
					<div class="lt5">
						<div class="news">
							<div class="box">
								<h3>공지사항</h3>
								<ul>
									<li class="notice">
										<a href=""><em>찾아라, 담아라. 나만의 보물책! 꿈다락 토요문화학교 2기 모집 안내</em></a>
										<span>2016.11.16</span>
									</li>
									<% for(int i=1; i<=2; i++) { %>
									<li>
										<a href=""><em>[8월 문화가 있는 날] 다함께 즐기는 문화예술공연 안내</em></a>
										<span>2016.11.16</span>
									</li>
									<% } %>
								</ul>
								<a href="" class="more">더보기</a>
							</div>
						</div>
					</div>
					<div class="lt6">
						<div class="popupzone">
							<h3>알림판</h3>
							<div class="box">
								<ul>
									<li><a href=""><img src="/resources/homepage/sj/img/popupzone.jpg" alt=""/></a></li>
									<li><a href=""><img src="/resources/common/img/type4/popupnone.jpg" alt=""/></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="main4">
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

</div>

<script type="text/javascript">
var ltHeight = $('.lt2 .box').height();
$('.main2 .box').height(ltHeight);
$(window).resize(function(){
	var ltHeight = $('.lt2 .box').height();
	$('.main2 .box').height(ltHeight);
});
</script>
	
<%@ include file="layout/footer.jsp"%>