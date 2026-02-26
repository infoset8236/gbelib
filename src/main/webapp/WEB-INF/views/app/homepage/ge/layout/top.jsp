<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="homepageTag" uri="/WEB-INF/config/tld/homepageTag.tld"%>
<nav id="menu"></nav>
<nav id="tnb"></nav>

<div id="header">
	<div class="tnb">
		<div class="tnbl">
			<ul>
				<li><a href="javascript:alert('페이지 준비중 입니다.')">대표도서관</a></li>
				<li><a href="javascript:alert('페이지 준비중 입니다.');">전자도서관</a></li>
				<li><a href="" class="fsite"><span>관련사이트</span><i></i></a>
					
					<ul style="display:none">
						<c:forEach items="${siteList}" var="i">
							<li><a href="${i.link_target}" target="_blank">${i.site_name}</a>
						</c:forEach>
					 
					</ul>					
				</li>
			</ul>
		</div>
		<div class="tnbr">
			<a href="/${homepage.context_path}/index.do"><img src="/resources/homepage/ge/img/icon01.png" alt="홈으로"/><span>처음으로</span></a>
			<c:choose>
					<c:when test="${sessionScope.member.loginType eq 'HOMEPAGE' and sessionScope.member.login}">
						<span class="txt-bar"></span>
						<a href="/${homepage.context_path}/intro/login/logout.do"><img src="/resources/homepage/ge/img/icon02.png" alt="로그아웃"/><span>로그아웃</span></a>
						<span class="txt-bar"></span>
						<a href="/${homepage.context_path}/module/myDashBoard/index.do?menu_idx=88"><img src="/resources/homepage/ge/img/icon04.png" alt="MY LIBRARY"/><span>MY LIBRARY</span></a>
						<span class="txt-bar"></span>
					</c:when>
					<c:when test="${sessionScope.member.loginType eq 'CMS' and sessionScope.member.login}">
						<span class="txt-bar"></span>
						<a href="#"><span style="color:#ffb289">관리자 로그인 중</span></a>
						<span class="txt-bar"></span>
						<a href="/${homepage.context_path}/intro/login/logout.do"><img src="/resources/homepage/ge/img/icon02.png" alt="로그아웃"/><span>로그아웃</span></a>
						<span class="txt-bar"></span>
					</c:when>
					<c:otherwise>
						<span class="txt-bar"></span>
						<a href="/${homepage.context_path}/intro/login/index.do?menu_idx=94"><img src="/resources/homepage/ge/img/icon02.png" alt="로그인"/><span>로그인</span></a>
						<span class="txt-bar"></span>
						<%-- 					<a href="/${homepage.context_path}/intro/join/index.do?menu_idx=119">회원가입</a> --%>
						<a href="https://www.gbelib.kr/${homepage.context_path}/intro/join/index.do?menu_idx=134" target="_blank"><img src="/resources/homepage/ge/img/icon03.png" alt="회원가입"/><span>회원가입</span></a>
						<span class="txt-bar"></span>
						<a href="/${homepage.context_path}/module/myDashBoard/index.do?menu_idx=88"><img src="/resources/homepage/ge/img/icon04.png" alt="MY LIBRARY"/><span>MY LIBRARY</span></a>
						<span class="txt-bar"></span>
					</c:otherwise>
				</c:choose>
			<a href="/${homepage.context_path}/sitemap/index.do?menu_idx=137"><img src="/resources/homepage/ge/img/icon05.png" alt="사이트맵"/><span>사이트맵</span></a>
		</div>
	</div>

