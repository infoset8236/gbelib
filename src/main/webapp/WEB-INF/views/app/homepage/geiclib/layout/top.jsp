<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
$(function() {
	$('#main-search-btn').on('click', function() {
		if( $('input#search_text_1').val() == '' ) {
			alert('검색어를 입력하세요.');
			$('input#search_text_1').focus();
			return false;
		}
			$('#mainSearchForm').submit();
	});
	

});


</script>	
	
	<nav id="menu"></nav>
	<nav id="tnb"></nav>

	<div id="header">
		<div class="tnb">
			<div class="tnbl">
				<ul>
					<li><a href="http://www.gbelib.kr/gbelib/index.do">통합홈페이지</a></li>
					<li><a href="http://www.gbelib.kr/elib/index.do" target="_blank">전자도서관</a></li>
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
				<a href="http://www.gbelib.kr/geic/index.do"><img src="/resources/homepage/geic/img/icon01.png" alt="경상북도교육청정보센터로"/><span>경상북도교육청정보센터 메인으로</span></a>
				<c:choose>
						<c:when test="${sessionScope.member.loginType eq 'HOMEPAGE' and sessionScope.member.login}">
							<c:if test="${not empty sessionScope.member.status_code and sessionScope.member.status_code eq '0'}">
								<c:set var="grade" value="(정회원)" />
							</c:if>
							<c:if test="${not empty sessionScope.member.status_code and sessionScope.member.status_code eq '1'}">
								<c:set var="grade" value="(준회원)" />
							</c:if>
							<span class="txt-bar"></span>
							<a href="#" id="memberInfoBtn"><img src="/resources/homepage/geic/img/icon06.png" alt="사용자정보"/><span>${sessionScope.member.member_name}님${grade}</span></a>
							<span class="txt-bar"></span>
							<a href="/${homepage.context_path}/intro/login/logout.do"><img src="/resources/homepage/geic/img/icon02.png" alt="로그아웃"/><span>로그아웃</span></a>
							<span class="txt-bar"></span>
							<a href="https://www.gbelib.kr/${homepage.context_path}/module/myDashBoard/index.do?menu_idx=154"><img src="/resources/homepage/geic/img/icon04.png" alt="MY LIBRARY"/><span>MY Library</span></a>
							<span class="txt-bar"></span>
						</c:when>
						<c:when test="${sessionScope.member.loginType eq 'CMS' and sessionScope.member.login}">
							<span class="txt-bar"></span>
							<a href="#" id="memberInfoBtn">${sessionScope.member.member_name}님</a>
							<span class="txt-bar"></span>
							<a href="#"><span style="color:#ffb289">관리자 로그인 중</span></a>
							<span class="txt-bar"></span>
							<a href="/${homepage.context_path}/intro/login/logout.do"><img src="/resources/homepage/geic/img/icon02.png" alt="로그아웃"/><span>로그아웃</span></a>
							<span class="txt-bar"></span>
						</c:when>
						<c:otherwise>
							<span class="txt-bar"></span>
							<a href="https://www.gbelib.kr/${homepage.context_path}/intro/login/index.do?menu_idx=135"><img src="/resources/homepage/geic/img/icon02.png" alt="로그인"/><span>로그인</span></a>
							<span class="txt-bar"></span>
							<%-- 					<a href="/${homepage.context_path}/intro/join/index.do?menu_idx=119">회원가입</a> --%>
							<a href="https://www.gbelib.kr/${homepage.context_path}/intro/join/index.do?menu_idx=134" target="_blank"><img src="/resources/homepage/geic/img/icon03.png" alt="회원가입"/><span>회원가입</span></a>
							<span class="txt-bar"></span>
							<a href="https://www.gbelib.kr/${homepage.context_path}/module/myDashBoard/index.do?menu_idx=154"><img src="/resources/homepage/geic/img/icon04.png" alt="MY LIBRARY"/><span>MY Library</span></a>
							<span class="txt-bar"></span>
						</c:otherwise>
					</c:choose>
				<a href="/${homepage.context_path}/sitemap/index.do?menu_idx=137"><img src="/resources/homepage/geic/img/icon05.png" alt="사이트맵"/><span>사이트맵</span></a>
			</div>
		</div>
		<div class="section">
			<h1><a href="http://www.gbelib.kr/${homepage.context_path}/index.do">
				<img src="/resources/homepage/geiclib/img/logo.png" alt="${homepage.homepage_name}"/>
			</a></h1>
			<div class="mmode m-menu">
				<a href="#menu"><i class="fa fa-navicon"></i><span class="blind">메뉴</span></a>
			</div>
			<!-- search S -->
			<div class="search">
				<form id="mainSearchForm" action="/${homepage.context_path}/intro/search/index.do">
					<input type="hidden" name="menu_idx" value="15"/>
					<input type="hidden" name="search_type2" value="L_TITLEAUTHOR">
					<fieldset>
						<legend class="blind">자료검색</legend>
						<div class="schs">
							<div class="box">
								<label for="search_text_1" class="blind">자료검색</label>
								<input name="search_text" id="search_text_1" type="text" class="text" placeholder="자료검색"/>
								<button id="main-search-btn"><i class="fa fa-search"></i><span class="blind">검색</span></button>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
			<!-- search E -->
		</div>
		
<jsp:include page="/WEB-INF/views/app/homepage/common/mainName.jsp" flush="false" />
