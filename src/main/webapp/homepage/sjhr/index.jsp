<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="layout/header.jsp"%>

<div class="main">
	<%@ include file="head.jsp"%>
	<div class="main01">
		<div class="main1">
			<div class="box">
				<ul class="main_img">
					<li style="background:url('/resources/homepage/sjhr/img/main1.jpg') no-repeat 0 0">
						시민과 미래를 함께하는 도서관 / 책으로 여는 행복한 내일, 꿈이 자라는 경상북도공공도서관
					</li>
					<li style="background:url('/resources/homepage/sjhr/img/main2.jpg') no-repeat 0 0">
						책 읽는 작은 여유가 마음 속의 큰 행복입니다
					</li>
				</ul>
			</div>
		</div>

		<div class="main2 popupzone">
			<h3 class="blind">팝업존</h3>
			<ul>
				<li><a href=""><img src="/resources/homepage/sjhr/img/popupzone1.jpg" alt=""/></a></li>
				<li><a href=""><img src="/resources/common/img/type18/popupnone.jpg" alt="등록된 팝업이 없습니다."/></a></li>
			</ul>
		</div>
	</div>
	<div class="main02">
		<div class="main3">
			<div class="box">
				<div class="search-box">
					<h3>통합자료검색</h3>
					<form>
						<fieldset>
							<legend class="blind">통합자료검색</legend>
							<div class="box1">
								<div class="box2">
									<input type="text" placeholder="검색어를 입력하세요"/>
								</div>
							</div>
							<button>검색하기</button>
						</fieldset>
					</form>
				</div>
				<div class="news news1">
					<div class="box">
						<h3><span>도서관</span><strong>새소식</strong></h3>
						<div class="snipet">
							<div class="thumb"><a href=""><img src="/resources/homepage/sjhr/img/thumb1.jpg" alt=""></a></div>
							<div class="item">
								<div class="box">
									<a href="" class="t1"><strong>낭독극장 [연극으로 읽는 책] 공연 안내</strong></a>
									<span class="t2">2016.11.16</span>
									<span class="t3">도시의 상생과 화합을 위한 해오름 동맹 결성에 따른 독서문화프로그램 교류의 일환으로 낭독극장 연극으로 읽는 책,시인동주〉공연을..</span>
								</div>
							</div>
						</div>
						<ul>
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
				<div class="news news2">
					<div class="box">
						<h3><span>신착</span><strong>권장도서</strong></h3>
						<div class="snipet">
							<div class="thumb"><a href=""><img src="/resources/homepage/sjhr/img/thumb2.jpg" alt=""></a></div>
							<div class="item">
								<div class="box">
									<a href="" class="t1"><strong>오베라는 남자</strong></a>
									<span class="t3">전 세계 30개국 판권 수출 독일 슈피겔지 20주 연속 베스트셀러 유럽 전 역 100만 부 판매..</span>
								</div>
							</div>
						</div>
						<ul>
							<% for(int i=1; i<=3; i++) { %>
							<li>
								<a href=""><em>2016년 도서관 이용자만족도조사</em></a>
							</li>
							<% } %>
						</ul>
						<a href="" class="more">더보기</a>
					</div>
				</div>
			</div>
		</div>
		<div class="main4">
			<div class="day1">
				<div class="box">
					<h3><span>도서관</span><strong>이용안내</strong></h3>
					<ul>
						<li class="s1">
							<label>자료실</label>
							<div>
								<p>
								(평일) 09:00 ~ 18:00<br/>
								(주말) 09:00 ~ 17:00
								</p>
							</div>
						</li>
						<li class="s2">
							<label>열람실</label>
							<div>
								<p>
								(3월~10월) 09:00 ~ 22:00<br/>
								(11월~2월) 09:00 ~ 21:00
								</p>
							</div>
						</li>
						<li class="s3">
							<label>휴관일</label>
							<div>
								<p>
								매주 월요일, 법정 공휴일, 특별한 사유로 관장이 지정하는 날
								</p>
							</div>
						</li>
					</ul>
					<a href="" class="more">더보기</a>
				</div>
			</div>
			<div class="day2">
				<div class="box dayoff">
					<dl class="info">
						<dt>
							<span class="t1">12원</span>
							<span class="t2">휴관일</span>
						</dt>
						<dd>
							<span>07</span>
							<span>14</span>
							<span>21</span>
							<span>28</span>
							<span>29</span>
							<span>30</span>
						</dd>
					</dl>
				</div>
			</div>
		</div>
	</div>
	<div class="qmenu">
		<ul data-call="bxslider" data-breaks="[{screen:0, slides:2},{screen:380, slides:3},{screen:450, slides:4},{screen:767, slides:6},{screen:1000, slides:7},{screen:1100, slides:8}]">
			<li class="qm1"><a href="" style="background-image:url('/resources/homepage/sjhr/img/qm1.gif')"><span>이용안내</span></a></li>
			<li class="qm2"><a href="" style="background-image:url('/resources/homepage/sjhr/img/qm2.gif')"><span>자료검색</span></a></li>
			<li class="qm3"><a href="" style="background-image:url('/resources/homepage/sjhr/img/qm3.gif')"><span>대출조회/연장/예약</span></a></li>
			<li class="qm4"><a href="" style="background-image:url('/resources/homepage/sjhr/img/qm4.gif')"><span>희망도서신청</span></a></li>
			<li class="qm5"><a href="" style="background-image:url('/resources/homepage/sjhr/img/qm5.gif')"><span>전자자료</span></a></li>
			<li class="qm6"><a href="" style="background-image:url('/resources/homepage/sjhr/img/qm6.gif')"><span>자원봉사신청</span></a></li>
			<li class="qm7"><a href="" style="background-image:url('/resources/homepage/sjhr/img/qm7.gif')"><span>평생교육강좌</span></a></li>
			<li class="qm8"><a href="" style="background-image:url('/resources/homepage/sjhr/img/qm8.gif')"><span>통합도서관</span></a></li>
		</ul>
	</div>
	<div class="main5">
		<div class="box">
			<ul>
				<li class="mb1">
					<a href="" class="box">
						<em>
							<span class="t1">사진으로 보는</span>
							<span class="t2">&nbsp;</span>
						</em>
						<strong>
							<span class="t1">우리</span>
							<span class="t2">도서관</span>
						</strong>
					</a>
				</li>
				<li class="mb2">
					<a href="" class="box">
						<em>
							<span class="t1">전국도서관 이용대출</span>
							<span class="t2">국가상호대차서비스</span>
						</em>
						<strong>
							<span class="t1">책바다</span>
							<span class="t2">서비스</span>
						</strong>
					</a>
				</li>
				<li class="mb3">
					<a href="" class="box">
						<em>
							<span class="t1">장애인의 도서관 이용편리</span>
							<span class="t2">무료우편서비스</span>
						</em>
						<strong>
							<span class="t1">책나래</span>
							<span class="t2">서비스</span>
						</strong>
					</a>
				</li>
				<li class="mb4">
					<a href="" class="box">
						<em>
							<span class="t1">원문자료서비스</span>
							<span class="t2">&nbsp;</span>
						</em>
						<strong>
							<span class="t1">국가전자</span>
							<span class="t2">도서관</span>
						</strong>
					</a>
				</li>
			</ul>
		</div>
	</div>
	<div class="banner-wrap type2">
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
	</div>
</div>
	
<%@ include file="layout/footer.jsp"%>