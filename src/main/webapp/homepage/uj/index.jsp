<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="layout/header.jsp"%>

<div id="wrap">

	<%@ include file="head.jsp"%>
	<%@ include file="../ycgh/popup.jsp"%>
	<div id="container" class="main">
		<div id="main-spot">
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
			
				<div class="txt">
					두손에는 책이 가득! <br />가슴에는 꿈이 가득!
				</div>
			</div>

			<div class="main1">
				<div class="section">
					<div class="lt mm1">
						<div class="box">
							<a href="uj/html.do?menu_idx=34">
								<!-- <span class="t1">독서문화행사</span>
								<span class="t3">서로 공감하고,<br />소통할 수 있는 프로그램</span> -->
								<span class="t1" style="line-height:130%;padding-top:13px">사진으로 보는 도서관</span>
							</a>
						</div>
					</div>
					<div class="lt mm2">
						<div class="box">
							<a href="">
								<span class="t1">신착&amp;추천도서</span>
								<span class="t3">새로 출간된 도서 및 사서들이 추천하는 도서 검색</span>
							</a>
						</div>
					</div>
					<div class="lt mm3">
						<div class="box">
							<a href="">
								<span class="t1">희망도서신청</span>
								<span class="t3">원하시는 책을 신청하세요!</span>
							</a>
						</div>
					</div>
					<div class="lts quickMenu">
						<div class="box">
							<ul>
								<li class="qm1"><a href="sub.jsp?menu_seq=noContent" style="background-image:url('/resources/homepage/uj/img/qm1.gif')"><span>자료검색</span></a></li>
								<li class="qm2"><a href="sub.jsp?menu_seq=noContent" style="background-image:url('/resources/homepage/uj/img/qm2.gif')"><span>대출조회/예약</span></a></li>
								<li class="qm3"><a href="sub.jsp?menu_seq=noContent" style="background-image:url('/resources/homepage/uj/img/qm4.gif')"><span>전자도서관</span></a></li>
								<li class="qm4"><a href="sub.jsp?menu_seq=noContent" style="background-image:url('/resources/homepage/uj/img/qm5.gif')"><span>자료실좌석예약</span></a></li>
								<li class="qm5"><a href="sub.jsp?menu_seq=noContent" style="background-image:url('/resources/homepage/uj/img/qm6.gif')"><span>이용안내</span></a></li>
								<li class="qm6"><a href="sub.jsp?menu_seq=noContent" style="background-image:url('/resources/homepage/uj/img/qm8.gif')"><span>통합도서관</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>

			<div class="main2">
				<div class="section">
					
					
				<div class="lts news">
					<div class="box">
						<h3>도서관새소식</h3>
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
					
					<div class="lts popupzone">
						<ul>
							<li><a href=""><img src="/resources/homepage/uj/img/popup_img.jpg" alt="팝업존 제목"/></a></li>
							<li><a href=""><img src="/resources/common/img/type3/popupnone.png" alt="등록된 팝업이 없습니다."/></a></li>
						</ul>
					</div>

					<div class="lt bannerzone">
						<div class="box">
							<div class="banner-wrap type2">
								<div class="banner-t">
									<h3>배너모음</h3>
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
					</div>
					<div class="lt calendar">
							<div id="calendar">
								<div class="cal-func">
									<a id="before-btn" href="#prev" class="btn prev"><i class="fa fa-caret-left"></i><span class="blind">이전달</span></a>
									<b class="date"><span>2016/</span><em>12</em></b>
									<a id="next-btn" href="#next" class="btn next"><i class="fa fa-caret-right"></i><span class="blind">다음달</span></a>
								</div>
								<table class="cal-tbl">
									<thead>
										<tr>
											<th class="sun">SUN</th><th>MON</th><th>TUE</th><th>WED</th><th>THU</th><th>FRI</th><th class="sat">SAT</th>
										</tr>
									</thead>
									<tbody>
										<tr><td class="sun"><div></div></td><td><div></div></td><td><div></div></td><td><div></div></td><td><div>1</div></td><td><div>2</div></td><td class="sat"><div>3</div></td></tr>
										<tr><td class="sun"><div>4</div></td><td class="active"><div>5</div></td><td><div>6</div></td><td><div>7</div></td><td><div>8</div></td><td><div>9</div></td><td class="sat"><div>10</div></td></tr>
										<tr><td class="sun"><div>11</div></td><td><div>12</div></td><td><div>13</div></td><td><div>14</div></td><td><div>15</div></td><td><div>16</div></td><td class="sat"><div>17</div></td></tr>
										<tr><td class="sun"><div>18</div></td><td><div>19</div></td><td><div>20</div></td><td><div>21</div></td><td><div>22</div></td><td><div>23</div></td><td class="sat"><div>24</div></td></tr>
										<tr><td class="sun"><div>25</div></td><td><div>26</div></td><td><div>27</div></td><td><div>28</div></td><td><div>29</div></td><td><div>30</div></td><td class="sat"><div>31</div></td></tr>
									</tbody>
								</table>
								<div id="planList">
									<p class="date1"><span>DATE</span>2016.05.24 (화)</p>
									<p class="date2">오늘의 일정이 없습니다.</p>
								</div>
							</div>
						</div>
					<div class="lt mm4">
						<div class="box">
							<a href="">
								<span class="t1">어린이독서퀴즈</span>
								<span class="t3">올바른 독서생활과 <br />책 읽는 즐거움을 주는 <br />독서퀴즈교실</span>
							</a>
						</div>
					</div>
					<div class="lt mm5">
						<div class="box">
							<a href="">
								<span class="t1">도서대출조회</span>
								<span class="t3">도서대출조회 및 연장/예약</span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	
<%@ include file="layout/footer.jsp"%>