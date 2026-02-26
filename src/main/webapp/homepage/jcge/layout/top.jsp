<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<div id="header" class="background-white">
		<nav id="menu"></nav>

		<div class="tnb">
			<div class="main-section">
				<div class="libSite">
					<ul>
						<li><a href="http://www.gbelib.kr/jc/index.do" target="_blank" class='ico01'>점촌도서관</a></li>
						<li><a href="http://www.gbelib.kr/gbelib/index.do" target="_blank" class='ico02'>통합도서관</a></li>
						<li><a href="https://www.instagram.com/gaeunlib/" target="_blank" class='ico03'>인스타그램</a></li>
					</ul>
				</div>

				<h1 class="mobile-logo"><a href="http://www.gbelib.kr/${homepage.context_path}/index.do">경상북도교육청 점촌도서관 가은분관</a></h1>

				<div class="mmode m-menu">
					<a href="#menu"><img src="/resources/homepage/${homepage.context_path}/img/sitemap_icon_black.png" alt="모바일메뉴" /></a>
				</div>

				<div class="util">
					<div class="box">

						<c:choose>
							<c:when test="${sessionScope.member.loginType eq 'HOMEPAGE' and sessionScope.member.login}">
								<!-- <span class="txt-bar"></span> -->
								<a href="#" id="memberInfoBtn">${sessionScope.member.member_name}님</a>
								<span class="txt-bar"></span>
								<a href="/${homepage.context_path}/module/myDashBoard/index.do?menu_idx=76" style="font-weight:bold;color:#ff7f0d;">MY LIBRARY</a>
								<span class="txt-bar"></span>
								<a href="/${homepage.context_path}/intro/login/logout.do">로그아웃</a>
							</c:when>
							<c:when test="${sessionScope.member.loginType eq 'CMS' and sessionScope.member.login}">
								<!-- <span class="txt-bar"></span> -->
								<a href="#">관리자 로그인 중</a>
								<span class="txt-bar"></span>
								<a href="/${homepage.context_path}/intro/login/logout.do">로그아웃</a>
								<span class="txt-bar"></span>
							</c:when>
							<c:otherwise>
								<!-- <span class="txt-bar"></span> -->
								<a href="https://www.gbelib.kr/${homepage.context_path}/intro/login/index.do?menu_idx=95">로그인</a>
								<span class="txt-bar"></span>
								<%--<a href="/${homepage.context_path}/intro/join/index.do?menu_idx=119">회원가입</a>--%>
								<a href="https://www.gbelib.kr/${homepage.context_path}/intro/join/index.do?menu_idx=94">회원가입</a>
							</c:otherwise>
						</c:choose>
						<!-- <a href="/${homepage.context_path}/sitemap/index.do?menu_idx=99">사이트맵</a> -->

					</div>
				<!-- top menu E -->
				</div>
			</div>
		</div>


<jsp:include page="/WEB-INF/views/app/homepage/common/mainName.jsp" flush="false" />
