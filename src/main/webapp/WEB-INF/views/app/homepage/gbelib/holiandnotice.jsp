<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="homepageTag" uri="/WEB-INF/config/tld/homepageTag.tld"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!-- 도서관별 휴관 및 공지 시작 - 따로 빼서 holidayandnotice.do를 만들어서 holiday-notice-info에 로드 할수 있도록 처리 부탁-->
<div class="holiday">
	<span class=""><h5>이달의 휴관일</h5></span> <span class="">
		<dl class="info">
			<dd>
				<c:forEach var="i" items="${closedDateList}">
					<span>${i.dd}</span>
				</c:forEach>
			</dd>
		</dl>
	</span>
</div>
<div class="notice">
	<h5>공지사항</h5>
	<ul>
		<c:forEach var="i" items="${noticeList}">
			<li>
				<a href="/${homepageOne.context_path}/board/view.do?menu_idx=${menu_idx}&manage_idx=${i.manage_idx}&board_idx=${i.board_idx}" title="도서 자세히 보기" target="_blank"> 
					<span class="date"><fmt:formatDate value="${i.add_date}" pattern="yy-MM-dd"/></span> 
					<em>${i.title}</em>
				</a>
			</li>
		</c:forEach>
	</ul>
</div>
<!-- 도서관별 휴관 및 공지 끝 -->