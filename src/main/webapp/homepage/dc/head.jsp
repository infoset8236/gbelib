<%@ page language="java" pageEncoding="utf-8" %>

<nav id="menu"></nav>

<div id="header">
	<div class="logo">
		<h1><a href="">경상북도공공도서관<br /><strong>디자인센터</strong></a></h1>
		<p>든든한 미래,시민과 미래를 함께합니다.</p>
	</div>
	<div class="mmode m-menu">
		<a href="#menu"><i class="fa fa-navicon"></i><span class="blind">메뉴</span></a>
	</div>
	<div class="Gnb">
		<h2 class="blind">주메뉴</h2>
		<div class="g-menu">
			<!-- menu S -->
			<ul class="gnb-menu">
				<li class="List active"><a href=""><span>평생교육강좌</span></a>
					<ul class="SubMenu">
						<li><a href="">- A3 사이즈</a></li>
						<li><a href="">- Web 사이즈</a></li>
						<li><a href="">- 기타</a></li>
					</ul>
				</li>
				<li class="List"><a href=""><span>문화가있는날</span></a></li>
				<li class="List"><a href=""><span>세계책의날</span></a></li>
				<li class="List"><a href=""><span>도서관주간행사</span></a></li>
				<li class="List"><a href=""><span>독서교실</span></a></li>
				<li class="List"><a href=""><span>방학특강</span></a></li>
				<li class="List"><a href="sub.jsp?menu_seq="><span>기타 홍보</span></a></li>
			</ul>
			<!-- menu E -->
		</div>
	</div>
	<div class="call">
		<span>HELP DESK</span>
		<p>053-810-9999</p>
		<em>평일  :  09: 00 ~ 22 : 00<br />토요일 /일요일 :  09 : 00 ~ 17 :  00</em>
	</div>
	<%@ include file="layout/footer.jsp"%>
</div>