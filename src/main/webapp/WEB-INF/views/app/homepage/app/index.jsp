<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="homepageTag" uri="/WEB-INF/config/tld/homepageTag.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8"/>
<meta id="_csrf" name="_csrf" th:content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" th:content="${_csrf.headerName}"/>
<meta property="og:type" content="website"/>
<meta property="og:title" content="${homepage.homepage_name}"/>
<meta property="og:description" content="${homepage.homepage_name}"/>
<meta property="og:url" content="http://www.gbelib.kr/app/index.do"/>
<link rel="canonical" href="http://www.gbelib.kr/app/index.do">
<title>${homepage.homepage_name}<c:if test="${not empty menuOne.menu_name}"> > </c:if>${menuOne.menu_full_path_name }</title>
<!--[if IE]>
<meta http-equiv="x-ua-compatible" content="ie=edge"/>
<![endif]-->
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=10"/>
<link rel="stylesheet" type="text/css" href="/resources/common/css/fontawesome.min.css"/>
<link rel="stylesheet" type="text/css" href="/resources/common/css/select2.min.css"/>
<link rel="stylesheet" type="text/css" href="/resources/common/css/jquery.mmenu.css"/>
<link rel="stylesheet" type="text/css" href="/resources/common/css/default.css"/>
<link rel="stylesheet" type="text/css" href="/resources/common/css/login.css"/>
<link rel="stylesheet" type="text/css" href="/resources/board/css/default.css"/>
<link rel="stylesheet" type="text/css" href="/resources/book/css/common.css"/>

<link rel="stylesheet" type="text/css" href="/resources/common/css/app_default.css"/><!-- 신규CSS -->
<link rel="stylesheet" type="text/css" href="/resources/homepage/app/css/default.css"/><!-- 신규CSS -->
<!--[if lte IE 7]>
<link rel="stylesheet" type="text/css" href="/resources/common/css/fontawesome-ie7.min.css"/>
<![endif]-->
<!--[if lte IE 8]>
<link rel="stylesheet" type="text/css" href="/resources/homepage/app/css/ie.css"/>
<![endif]-->
<script type="text/javascript" src="/resources/common/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/common/js/jquery-ui-1.12.0.min.js"></script>
<script type="text/javascript" src="/resources/common/js/jquery-ui-1.12.0-datepicker.min.js"></script>
<script type="text/javascript" src="/resources/common/js/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="/resources/common/js/jquery.mmenu.min.js"></script>
<script type="text/javascript" src="/resources/common/js/default.js"></script>
<script type="text/javascript" src="/resources/common/js/common.js"></script>
<script type="text/javascript" src="/resources/board/js/common.js"></script>
<script type="text/javascript" src="/resources/homepage/app/js/common.js"></script>
<script type="text/javascript" src="/resources/homepage/app/js/default.js"></script>
<script type="text/javascript" src="/resources/common/js/kakao.min.js"></script>
</head>
<body>

<a href="#container" class="skip-to">본문 바로가기</a>
<a href="#g-menu" class="skip-to">주메뉴 바로가기</a>

<script type="text/javascript">

function setLnbopen(){
	$("#lnb").attr("class","open");
}

function setMylibraryopen(){
	$("#lnb").attr("class","open");
	$(".depth2").attr("style","display: block");   
}

</script>
<div id="wrap">
	<tiles:insertAttribute name="top" />
	<tiles:insertAttribute name="topMenu" />

	<div class="containers">
		<div class="outer">
			<div class="inner"> <!-- 순서를 맞춰서 적어주어야 한다. -->
					<div class="main content">
						<div class="quickMenu">
							<ul>
								<li class="quick-1">
									<a href="/${homepage.context_path}/intro/search/index.do?menu_idx=1" class="quick01">
									<div>
										<h4>자료검색</h4>
									</div>
								</a>
								</li>
								<li class="quick-2">
								<a href="/${homepage.context_path}/module/qrcode/app.do?menu_idx=17" class="quick02">
									<div>
										<h4>모바일회원증</h4>
									</div>
								</a>
								</li>
								<li class="quick-3">
								<a href="/${homepage.context_path}/html.do?menu_idx=2" class="quick03">
									<div>
										<h4>이용안내</h4>
									</div>
								</a>
								</li>
								<li class="quick-4">
								<a href="https://www.gbelib.kr/elib/index.do" target="_blank" class="quick04">
									<div>
										<h4>전자도서관</h4>
									</div>
								</a>
								</li>
								<li class="quick-5">
								<c:choose>
								<c:when test="${sessionScope.member.loginType eq 'HOMEPAGE' and sessionScope.member.login}">
								<a href="/${homepage.context_path}/intro/login/logout.do" class="quick05">
									<div>
										<h4>로그아웃</h4>
									</div>
								</a>
								</c:when>
								<c:otherwise>
								<a href="/${homepage.context_path}/intro/login/index.do?menu_idx=8" class="quick05">
									<div>
										<h4>로그인</h4>
									</div>
								</a>
								</c:otherwise>
								</c:choose>
								</li>
								<li class="quick-6">
								<a href="/${homepage.context_path}/intro/search/loan/index.do?menu_idx=5" class="quick06">
									<div>
										<h4>My Library</h4>
									</div>
								</a>
								</li>
							</ul>
						</div>
					</div>
			</div>
		</div>
	</div>
	<tiles:insertAttribute name="footer" />
</div>
<div class="dimd"></div>
</body>
</html>
