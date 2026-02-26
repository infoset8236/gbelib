<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="layout/header.jsp"%>

<div id="wrap" class="main">

	<%@ include file="head.jsp"%>
	<%@ include file="../ycgh/popup.jsp"%>
	<div id="container" class="main">
		<div id="main-spot">
			<div class="main-img">
				<ul class="main_img">
					<li style="background-image:url('/resources/homepage/bh/img/main1.jpg'">
						<div class="main_txt">
							<p>당신이 바로 <b>도서관의 친구입니다</b></p>
							<span>bonghwa Public Library</span>
						</div>
					</li>
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
		<!-- <div class="lt like_book">
			<div class="section">
				<h3>RECOMMENDED READING</h3>
				<ul>
					<li>
						<a href="" class="thumb"><img src="/resources/homepage/bh/img/book.jpg" alt="나는 단순하게 살기로 했다"/></a>
						<div class="item">
							<div class="box">
								<strong class="sbj">어린이를 위한 하버드 새벽 4시반</strong>
								<p><label>저자</label> <span>웨이슈잉</span> <span class="bar">ㅣ</span> <label>출판사</label> <span>세종주니어</span></p>
								<p class="snipet">
									《어린이를 위한 하버드 새벽 4시 반》은 자라나는 어린이들에게 꿈, 용기, 자립심, 의지력을 길러주기 위한 어린이 자기계발서예요. 하버드 대학교는 노벨상 
									수상자, 미국 대통령, 성공한 기업가, 위대한 문학가 등 세계를 움직이는 수많은 인재를 배출했어요. 왜 이렇게 하버드에만 들어가면 숨어 있던 잠재력이 
									찬란하게 꽃피는 걸까요? 답은 바로 ‘진정한 엘리트는 남다른 능력을 타고난 사람이 아니라, 품성이 뛰어난 사람이다.’라는 하버드의 정신에 있어요. 
									웨이슈잉 저자는 하버드 교육에 대해 깊이 있게 연구하여 어린이들에게 적합한 10가지 습관을 정리했어요. 그리고 각 습관들이 단순한 이해로 그치지 않고 
									가슴으로 동기가 일어 실천할 수 있도록 책을 구성했어요.
								</p>
								<a href="" class="more">자세히보러가기</a>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div> -->
		<div class="main2">
			<div class="section">
				<!-- <div class="popupzone">
					<div class="box">
						<h3>POPUP Zone</h3>
						<ul>
							<li><a href=""><img src="/resources/homepage/bh/img/popupzone.jpg" alt=""/></a></li>
							<li><a href=""><img src="/resources/homepage/bh/img/popupnone.png" alt=""/></a></li>
						</ul>
					</div>
				</div> -->
				<div class="calendar">
					<div class="box">
						<h3>이달의 행사</h3>
						<div id="planBox">
							<div class="info">
								<p class="t1">today</p>
								<p class="t2">6</p>
								<ul>
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
											<tr class="first">
												<th class="sun first th1">SUN</th><th class="th2">MON</th><th class="th3">YUE</th><th class="th4">WED</th><th class="th5">THU</th><th class="th6">FIR</th><th class="sat last th7">SAT</th>
											</tr>
										</thead>
										<tbody>
											<tr class="first"><td class="sun first td1"><div></div></td><td class="td2"><div></div></td><td class="td3"><div></div></td><td class="td4"><div></div></td><td class="td5"><div>1</div></td><td class="td6"><div>2</div></td><td class="sat last td7"><div>3</div></td></tr>
											<tr><td class="sun first td1"><div><a href="" class="type-r">4</a></div></td><td class="td2"><div>5</div></td><td class="td3"><div>6</div></td><td class="td4"><div>7</div></td><td class="td5"><div>8</div></td><td class="td6"><div>9</div></td><td class="sat last td7"><div>10</div></td></tr>
											<tr><td class="sun first td1"><div><a href="" class="type-e">11</a></div></td><td class="td2"><div>12</div></td><td class="td3"><div>13</div></td><td class="td4"><div>14</div></td><td class="td5"><div>15</div></td><td class="td6"><div>16</div></td><td class="sat last td7"><div>17</div></td></tr>
											<tr><td class="sun first td1"><div><a href="" class="type-m">18</a></div></td><td class="td2"><div>19</div></td><td class="td3"><div>20</div></td><td class="td4"><div>21</div></td><td class="td5"><div>22</div></td><td class="td6"><div>23</div></td><td class="sat last td7"><div>24</div></td></tr>
											<tr><td class="sun first td1"><div>25</div></td><td class="td2"><div>26</div></td><td class="td3"><div>27</div></td><td class="td4"><div>28</div></td><td class="td5"><div>29</div></td><td class="td6"><div>30</div></td><td class="sat last td7"><div>31</div></td></tr>
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
				<div class="photo_news">
					<div class="box">
						<h3>Library Album</h3>
						<ul class="lt_photo">
							<% for(int i=1; i<=12; i++) { %>
							    <li><a href="" title="글제목"><img src="/resources/homepage/bh/img/photo<%=i%>.jpg" alt="" alt="글제목"/></a></li>
							<% } %>
						</ul>
						<a href="" class="more">더보기</a>
					</div>
				</div>
				<div class="libClosed">
					<h3>LIBRARY Hours</h3>
					<div class="box">
						<div class="inBox">
						<p>종합자료실,디지털자료실</p>
						<span>09:00 ~ 18:00</span>
						<p>열람실</p>
						<span><b>월~토</b> 08:00~22:00 / <b>일</b> 08:00~18:00</span>
						<p>휴관일</p>
						<span>매월 마지막 월요일, 일요일을 제외한 관공서의 공휴일<br/>
								특별한 사유로 도서관장이 지정하는 날</span>
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