<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="homepageTag" uri="/WEB-INF/config/tld/homepageTag.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script>
$(document).ready(function() {
	$('#popup_open').on('click',function(){
		var popup_count = '${fn:length(popupFullList)}';
		
		if (popup_count > 0) {
			$('#all-popup-wrap').empty;
			$('#all-popup-wrap').show();
			$('#all-popup-wrap').load('popupAll.do', function() {
			});
		} else {
			alert('등록된 팝업이 없습니다.');
			return false;
		}
	})
});
</script>
<div id="header">
	<nav id="menu"></nav>

	<div class="tnb">
		<div class="util-left">
			<ul>
				<li class="geic"><a href="https://www.gbelib.kr/geic/index.do" target="_blank">교육청정보센터</a></li>
				<li class="gbelib"><a href="https://www.gbelib.kr/elib/index.do" target="_blank">전자도서관</a></li>
			</ul>
		</div>
		<div class="util-right">
			<ul>
			<c:choose>
				<c:when test="${sessionScope.member.loginType eq 'HOMEPAGE' and sessionScope.member.login}">
					<c:if test="${not empty sessionScope.member.status_code and sessionScope.member.status_code eq '0'}">
						<c:set var="grade" value="(정회원)" />
					</c:if>
					<c:if test="${not empty sessionScope.member.status_code and sessionScope.member.status_code eq '1'}">
						<c:set var="grade" value="(준회원)" />
					</c:if>
					<li><a href="#" id="memberInfoBtn">${sessionScope.member.member_name}님${grade}</a></li>
					<li><a href="/${homepage.context_path}/intro/login/logout.do">로그아웃</a></li>
					<li><a href="https://www.gbelib.kr/${homepage.context_path}/module/myDashBoard/index.do?menu_idx=154" class='tnb-box-1'>나의도서관</a></li>
				</c:when>
				<c:when test="${sessionScope.member.loginType eq 'CMS' and sessionScope.member.login}">
					<li><a href="#">관리자 로그인 중</a></li>
					<li><a href="/${homepage.context_path}/intro/login/logout.do">로그아웃</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="https://www.gbelib.kr/${homepage.context_path}/intro/login/index.do?menu_idx=137">로그인</a></li>
					<li><a href="https://www.gbelib.kr/${homepage.context_path}/intro/join/index.do?menu_idx=136">회원가입</a></li>
					<li><a href="https://www.gbelib.kr/${homepage.context_path}/module/myDashBoard/index.do?menu_idx=154" class='tnb-box-1'>나의도서관</a></li>
				</c:otherwise>
			</c:choose>
				<c:set var="url" value="${pageContext.request.requestURL}" />
				<c:set var="pageUrl" value="${homepage.context_path}/index" />
				<c:if test="${fn:contains(url,pageUrl) }">
					<li><a href="#" class='tnb-box-2' id="popup_open">통합팝업열기 <span class="tot-popup-cnt">${fn:length(popupFullList)}</span></a></li>
				</c:if>
			</ul>
		</div>
	</div>


<jsp:include page="/WEB-INF/views/app/homepage/common/mainName.jsp" flush="false" />
