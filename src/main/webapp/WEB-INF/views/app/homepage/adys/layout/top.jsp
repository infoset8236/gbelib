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
				<li><a href="https://www.gbelib.kr/gbelib/index.do" target="_blank">통합공공도서관</a></li>
				<li><a href="https://www.gbelib.kr/elib/index.do" target="_blank">전자도서관</a></li>
				<li><a href="https://www.gbelib.kr/ad/index.do" target="_blank">안동도서관</a></li>
				<li><a href="https://www.gbelib.kr/adps/index.do" target="_blank">풍산분관</a></li>
				<li class="smart-banner">
				<c:choose>
				<c:when test="${sessionScope.member.loginType eq 'HOMEPAGE' and sessionScope.member.login}">
				<a href="https://nsmart.koedu.co.kr/library.php?chk=Y2hrdGltZT0xNDQ0Nzc1ODE4JmxpYnJhcnk97JWI64%2BZ64%2BE7ISc6rSAIOyaqeyDgeu2hOq0gCZ1YXNlcl9uYW1lPeyViOuPmeuPhOyEnOq0gCDsmqnsg4HrtoTqtIAmdWFzZXJfaWQ9YWR5czAwMg%3D%3D" target="_blank">스마트체험도서관</a>
				</c:when>
				<c:otherwise>
				<a href="javascript:alert('로그인 후 이용 바랍니다.'); location.href='/adys/intro/login/index.do?menu_idx=121';">스마트체험도서관</a>
				</c:otherwise>
				</c:choose>
				</li>
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
					<li><a href="https://www.gbelib.kr/${homepage.context_path}/module/myDashBoard/index.do?menu_idx=183" class='tnb-box-1'>나의도서관</a></li>
				</c:when>
				<c:when test="${sessionScope.member.loginType eq 'CMS' and sessionScope.member.login}">
					<li><a href="#">관리자 로그인 중</a></li>
					<li><a href="/${homepage.context_path}/intro/login/logout.do">로그아웃</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="https://www.gbelib.kr/${homepage.context_path}/intro/login/index.do?menu_idx=121">로그인</a></li>
					<li><a href="https://www.gbelib.kr/${homepage.context_path}/intro/join/index.do?menu_idx=120">회원가입</a></li>
					<li><a href="https://www.gbelib.kr/${homepage.context_path}/module/myDashBoard/index.do?menu_idx=183" class='tnb-box-1'>나의도서관</a></li>
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
