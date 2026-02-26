<%@ page language="java" pageEncoding="utf-8" %>

<nav id="menu"></nav>

<div id="wrap">
	<div class="section wrap">
		<div id="header">
			<h1><a href=""><img src="/resources/homepage/lib/img/logo.png" alt="대표도서관"/></a></h1>
			<div class="mmode m-menu">
				<a href="#menu"><i class="fa fa-navicon"></i><span class="blind">메뉴</span></a>
			</div>
			<div class="Gnb">
				<h2 class="blind">주메뉴</h2>
				<div class="g-menu">
					<!-- menu S -->
					<ul class="gnb-menu">
						<li class="List"><a href="sub.jsp?menu_seq="><span>자료검색</span><b>DATA RETRIEVAL</b></a>
							<ul class="SubMenu">
								<li><a href="sub.jsp?menu_seq=01">강사은행</a></li>
								<li><a href="sub.jsp?menu_seq=02">대출회원가입</a></li>
								<li><a href="sub.jsp?menu_seq=03">도서관현황</a></li>
								<li><a href="sub.jsp?menu_seq=04">모바일이용</a></li>
								<li><a href="sub.jsp?menu_seq=05">사서에게물어보세요</a></li>
								<li><a href="sub.jsp?menu_seq=06">순회문고</a></li>
								<li><a href="sub.jsp?menu_seq=07">이동도서관</a></li>
								<li><a href="sub.jsp?menu_seq=08">자원봉사신청</a></li>
								<li><a href="sub.jsp?menu_seq=09">책이음서비스</a></li>
								<li><a href="sub.jsp?menu_seq=10">특색사업</a></li>
								<li><a href="sub.jsp?menu_seq=11">평생학습관</a></li>
								<li><a href="sub.jsp?menu_seq=12">평생학습동아리</a></li>
								<li><a href="sub.jsp?menu_seq=13">학교도서관지원</a></li>
								<li><a href="sub.jsp?menu_seq=14">행사안내</a></li>
								<li><a href="sub.jsp?menu_seq=15">통합도서관 소개</a></li>
							</ul>
						</li>
						<li class="List"><a href="sub.jsp?menu_seq="><span>독서문화강좌</span><b>READING CULTURE</b></a></li>
						<li class="List"><a href="sub.jsp?menu_seq=16"><span>평생교육</span><b>LIFELONG EDUCATION</b></a></li>
						<li class="List"><a href="sub.jsp?menu_seq="><span>전자도서관</span><b>DIGITAL LIBRARY</b></a>
							<ul class="SubMenu">
								<li><a href=""><span>메뉴1-1</span></a></li>
								<li><a href=""><span>메뉴1-2</span></a></li>
								<li><a href=""><span>메뉴1-3</span></a></li>
							</ul>
						</li>
						<li class="List"><a href="sub.jsp?menu_seq="><span>도서관서비스</span><b>LIBRARY SERVICE</b></a></li>
						<li class="List"><a href="sub.jsp?menu_seq="><span>도서관안내</span><b>LIBRARY GUIDE</b></a></li>
					</ul>
					<!-- menu E -->
				</div>
			</div>

			<div class="calendar">
				<div id="calendar">
					<div class="cal-func">
						<a id="before-btn" href="#prev" class="btn prev"><i class="fa fa-angle-left"></i><span class="blind">이전달</span></a>
						<b class="date"><span>2016.</span><em>12</em></b>
						<a id="next-btn" href="#next" class="btn next"><i class="fa fa-angle-right"></i><span class="blind">다음달</span></a>
					</div>
					<table class="cal-tbl">
						<thead>
							<tr>
								<th class="sun">SUN</th><th>MON</th><th>TUE</th><th>WED</th><th>THU</th><th>FRI</th><th class="sat">SAT</th>
							</tr>
						</thead>
						<tbody>
							<tr><td class="sun"><div></div></td><td><div></div></td><td><div></div></td><td><div></div></td><td><div>1</div></td><td><div>2</div></td><td class="sat"><div>3</div></td></tr>
							<tr><td class="sun"><div>4</div></td><td><div><a title="행사일정" class="type-e">5</a></div></td><td><div>6</div></td><td><div>7</div></td><td><div>8</div></td><td><div>9</div></td><td class="sat"><div>10</div></td></tr>
							<tr><td class="sun"><div>11</div></td><td><div><a title="휴관일" class="type-r">12</a></div></td><td><div>13</div></td><td><div>14</div></td><td><div>15</div></td><td><div>16</div></td><td class="sat"><div>17</div></td></tr>
							<tr><td class="sun"><div>18</div></td><td><div>19</div></td><td><div>20</div></td><td><div>21</div></td><td><div>22</div></td><td><div>23</div></td><td class="sat"><div>24</div></td></tr>
							<tr><td class="sun"><div>25</div></td><td><div>26</div></td><td><div>27</div></td><td><div>28</div></td><td><div>29</div></td><td><div><a title="영화상영" class="type-m">30</a></div></td><td class="sat"><div>31</div></td></tr>
						</tbody>
					</table>
					<div id="planList">
						<p class="date1"><span>DATE</span>2016.05.24 (화)</p>
						<p class="date2">오늘의 일정이 없습니다.</p>
					</div>
				</div>
			</div>
		</div>

		<div id="container">
			<div class="container">
				<div class="tnb">
					<a href=""><img src="/resources/homepage/lib/img/icon01.png" alt="홈으로"/><span>홈으로</span></a>
					<span class="txt-bar"></span>
					<a href=""><img src="/resources/homepage/lib/img/icon02.png" alt="로그인"/><span>로그인</span></a>
					<span class="txt-bar"></span>
					<a href=""><img src="/resources/homepage/lib/img/icon03.png" alt="회원가입"/><span>회원가입</span></a>
					<span class="txt-bar"></span>
					<a href=""><img src="/resources/homepage/lib/img/icon04.png" alt="MY LIBRARY"/><span>MY LIBRARY</span></a>
					<span class="txt-bar"></span>
					<a href=""><img src="/resources/homepage/lib/img/icon05.png" alt="사이트맵"/><span>사이트맵</span></a>
					<!-- <a href="" class="btn"><i class="fa fa-print"></i><span>인쇄</span></a> -->
				</div>