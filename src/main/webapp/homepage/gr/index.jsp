<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="layout/header.jsp"%>

<div id="wrap">
	<%@ include file="head.jsp"%>
	<%//@ include file="../ycgh/popup.jsp"%>
	<div id="container" class="main">
		<div class="main1">
			<div class="section">
				<div class="main_txt">
					<!-- <p class="t1"><strong>함께해요</strong> 도서관, 곁에 있어 행복합니다.</p>
					<p class="t2">당신의 미래, 고령공공도서관이 함께 합니다.</p> -->
					<p class="t1">당신의 꿈과 행복이<br/>
함께하는 곳,<br/>
여기는 고령공공도서관입니다.</p>
					<!-- <p class="t2">고령공공도서관</p>
					<p class="t3"><strong>GORYEONG PUBLIC LIBRARY</strong></p> -->
				</div>
				<div class="mb">
					<ul>
						<li class="mb1">
							<a href="" class="box">
								<span>Service guide</span>
								<img src="/resources/common/img/type10/mb1.png" alt="이용안내"/>
								<b>이용안내</b>
							</a>
						</li>
						<li class="mb2">
							<a href="" class="box">
								<span>도서관 이용현황</span>
								<img src="/resources/common/img/type10/mb2.png" alt="나만의 도서관"/>
								<b>나만의 도서관</b>
							</a>
						</li>
						<li class="mb3">
							<a href="" class="box">
								<span>새로 출간된 도서</span>
								<img src="/resources/common/img/type10/mb3.png" alt="신착도서"/>
								<b>신착도서</b>
							</a>
						</li>
						<li class="mb4">
							<a href="" class="box">
								<span>e-Book Library</span>
								<img src="/resources/common/img/type10/mb4.png" alt="전자도서관"/>
								<b>전자도서관</b>
							</a>
						</li>
					</ul>
				</div>

				<!-- search S -->
				<div class="search_m">
					<div class="search-box">
						<form>
							<fieldset>
								<legend>통합검색</legend>
								<input type="text" class="text" placeholder="검색어를 입력하세요"/>
								<button></button>
							</fieldset>
						</form>
					</div>
				</div>
				<!-- search E -->

				<div class="mbt">
					<ul>
						<li class="mbt1">
							<a href="" class="box">
								<span>대출조회</span>
							</a>
						</li>
						<li class="mbt2">
							<a href="" class="box">
								<span>희망도서 신청</span>
							</a>
						</li>
						<li class="mbt3">
							<a href="" class="box">
								<span>프로그램 신청</span>
							</a>
						</li>
						<li class="mbt4">
							<a href="" class="box">
								<span>좌석예약 신청</span>
							</a>
						</li>
						<li class="mbt5">
							<a href="" class="box">
								<span>자원봉사 신청</span>
							</a>
						</li>
						<li class="mbt6">
							<a href="" class="box">
								<span>사물함 신청</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="main2">
			<div class="section">
				<div class="news1">
					<div class="box">
						<div class="lt11 news">
							<h3>도서관소식</h3>
							<div class="snipet thumbno">
								<!-- <div class="thumb"><a href=""><img src="/resources/homepage/gr/img/news_img.jpg" alt=""></a></div> -->
								<div class="item">
									<div class="box">
										<a href="" class="t1"><strong>2016년 6월 자원봉사 신청 안내</strong></a>
										<span class="t2">2016-11-16</span>
										<span class="t3">도시의 상생과 화합을 위한 해오름 동맹 결성에 따른 독서문화프로그램 교류의 일환으로..</span>
									</div>
								</div>
							</div>
							<%-- <ul>
								<% for(int i=1; i<=4; i++) { %>
								<li>
									<a href=""><em>2016년 도서관 이용자만족도조사</em></a>
									<span>2016.11.16</span>
								</li>
								<% } %>
							</ul> --%>
							<a href="" class="more">더보기</a>
						</div>
						<div class="lt12 like_book2 on">
							<h3>추천도서</h3>
							<ul>
								<li>
									<div class="thumb"><a href=""><img style="width:80px;height:105px" src="/resources/homepage/ycgh/img/book.jpg" alt=""></a></div>
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
									<div class="thumb"><a href=""><img style="width:80px;height:105px" src="/resources/homepage/ycgh/img/book.jpg" alt=""></a></div>
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
				
				<div class="popupzone">
					<ul>
						<li><a href=""><img src="/resources/homepage/gr/img/popuop_img.jpg" alt="인문열차 삶을 달리다!"/></a></li>
						<li><a href=""><img src="/resources/homepage/gr/img/popupnone.jpg" alt="등록된 팝업존 이미지가 없습니다"/></a></li>
					</ul>
				</div>

				<div class="banner_s">
					<ul>
						<li class="bm1"><a href=""><img src="/resources/common/img/type10/banner01.jpg" alt="책바다"/> <span>국가상호대차서비스</span></a></li>
						<li class="bm2"><a href=""><img src="/resources/common/img/type10/banner02.jpg" alt="책나래"/> <span>장애인을 위한 무료 우편 서비스</span></a></li>
						<li class="bm3"><a href=""><img src="/resources/common/img/type10/banner03.jpg" alt="사서에게물어보세요"/> <span>사서에게물어보세요</span></a></li>
					</ul>
				</div>

				<div class="calendar">
					<div class="box">
						<div id="planBox">
							<div class="info">
								<h3>이달의행사</h3>
								<p class="t1">today</p>
								<p class="t2">6</p>
								<ul>
									<!-- <li>
										<i class="type-r">&nbsp;</i>
										<span>오늘</span>
									</li> -->
									<li>
										<i class="type-e">&nbsp;</i>
										<span>행사일</span>
									</li>
									<li>
										<i class="type-m">&nbsp;</i>
										<span>휴관일</span>
									</li>
								</ul>
							</div>
							<div class="cal_area">
								<div id="calendar">
									<div class="cal-func">
										<a id="before-btn" href="#prev" class="btn prev"><i class="fa fa-angle-left"></i><span class="blind">이전달</span></a>
										<b class="date"><span>2016/</span><em>12</em></b>
										<a id="next-btn" href="#next" class="btn next"><i class="fa fa-angle-right"></i><span class="blind">다음달</span></a>
									</div>
									<table class="cal-tbl">
										<thead>
											<tr>
												<th class="sun">SUN</th><th>MON</th><th>YUE</th><th>WED</th><th>THU</th><th>FIR</th><th class="sat">SAT</th>
											</tr>
										</thead>
										<tbody>
											<tr><td class="sun"><div></div></td><td><div></div></td><td><div></div></td><td><div></div></td><td><div>1</div></td><td><div>2</div></td><td class="sat"><div>3</div></td></tr>
											<tr><td class="sun"><div><a href="" class="type-r">4</a></div></td><td><div>5</div></td><td><div>6</div></td><td><div>7</div></td><td><div>8</div></td><td><div>9</div></td><td class="sat"><div>10</div></td></tr>
											<tr><td class="sun"><div><a href="" class="type-e">11</a></div></td><td><div>12</div></td><td><div>13</div></td><td><div>14</div></td><td><div>15</div></td><td><div>16</div></td><td class="sat"><div>17</div></td></tr>
											<tr><td class="sun"><div><a href="" class="type-m">18</a></div></td><td><div>19</div></td><td><div>20</div></td><td><div>21</div></td><td><div>22</div></td><td><div>23</div></td><td class="sat"><div>24</div></td></tr>
											<tr><td class="sun"><div>25</div></td><td><div>26</div></td><td><div>27</div></td><td><div>28</div></td><td><div>29</div></td><td><div>30</div></td><td class="sat"><div>31</div></td></tr>
										</tbody>
									</table>
									<div id="planList">오늘의 일정이 없습니다.</div>
									<!-- <div class="planView">
										<div class="inbox">
											<dl>
												<dt>2016-12-17</dt>
												<dd>내용...</dd>
											</dl>
											<a href="" class="close"><i class="fa fa-close"></i></a>
										</div>
									</div> -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
<%@ include file="layout/footer.jsp"%>