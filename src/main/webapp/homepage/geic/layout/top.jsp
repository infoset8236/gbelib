<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="homepageTag" uri="/WEB-INF/config/tld/homepageTag.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
$(document).ready(function() {
});
</script>
<div id="header">
	<nav id="menu"></nav>

	<div class="tnb">
		<div class="util-left">
			<ul>
				<li><a href="https://www.info.go.kr/" target="_blank">교육행정포털</a></li>
				<li><a href="https://www.gbelib.kr/gbelib/index.do" target="_blank">통합공공도서관</a></li>
				<li><a href="https://www.gbelib.kr/elib/index.do" target="_blank">전자도서관</a></li>
			</ul>
		</div>
		<div class="util-right">
			<ul>
			<c:choose>
				<c:when test="${sessionScope.member.loginType eq 'HOMEPAGE' and sessionScope.member.login}">
					<li><a href="#" id="memberInfoBtn">${sessionScope.member.member_name}님</a></li>
					<li><a href="/${homepage.context_path}/intro/login/logout.do">로그아웃</a></li>
					<li><a href="https://www.gbelib.kr/${homepage.context_path}/module/myDashBoard/index.do?menu_idx=195" class='tnb-box-1'>나의도서관</a></li>
				</c:when>
				<c:when test="${sessionScope.member.loginType eq 'CMS' and sessionScope.member.login}">
					<li><a href="#">관리자 로그인 중</a></li>
					<li><a href="/${homepage.context_path}/intro/login/logout.do">로그아웃</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="https://www.gbelib.kr/${homepage.context_path}/intro/login/index.do?menu_idx=121">로그인</a></li>
					<li><a href="https://www.gbelib.kr/${homepage.context_path}/intro/join/index.do?menu_idx=120">회원가입</a></li>
					<li><a href="https://www.gbelib.kr/${homepage.context_path}/module/myDashBoard/index.do?menu_idx=195" class='tnb-box-1'>나의도서관</a></li>
				</c:otherwise>
			</c:choose>
				<li><a href="#" class='tnb-box-2'>통합팝업열기 <span class="tot-popup-cnt">2</span></a>
			</ul>
		</div>
	</div>

<jsp:include page="/WEB-INF/views/app/homepage/common/mainName.jsp" flush="false" />
