<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<title>대출베스트</title>
		<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=1" />
		<link rel="stylesheet" type="text/css" href="/resources/ict/kioskHorizon/css/font.css" />
		<link rel="stylesheet" type="text/css" href="/resources/ict/kioskHorizon/css/reset.css" />
		<link rel="stylesheet" type="text/css" href="/resources/ict/kioskHorizon/css/type_b/best_book.css" />
		<link rel="stylesheet" type="text/css " href="/resources/ict/kioskHorizon/css/type_b/common.css" />
		<link rel="stylesheet" type="text/css" href="/resources/ict/kioskHorizon/css/swiper-bundle.min.css" />
		<script type="text/javascript" src="/resources/ict/kioskHorizon/plugin/jquery-3.7.1.min.js"></script>
		<script type="text/javascript" src="/resources/ict/kioskHorizon/js/type_b/best_book.js"></script>
		<script type="text/javascript" src="/resources/ict/kioskHorizon/plugin/swiper-bundle.min.js"></script>
	</head>
	<body>

	<script type="text/javascript">
		function goDetail(LOCA, CTRLNO) {
			$('#verDetailForm #vLoca').val(LOCA);
			$('#verDetailForm #vCtrl').val(CTRLNO);
			$('form#verDetailForm').submit();
		}
	</script>

	<form:form modelAttribute="librarySearch" id="verDetailForm" action="detail.do" method="post">
		<input type="hidden" id="vLoca" name="vLoca"/>
		<input type="hidden" id="vCtrl" name="vCtrl"/>
	</form:form>

	<div class="notice_wrap info detail_wrap info">
		<div class="header">
			<p>BEST BOOK</p>
			<h1>대출베스트</h1>
		</div>
		<div class="content">
			<c:if test="${fn:length(bestBookList.dsLoanBestList) < 1}">
				<div class="no_content">
					<div class="no_wrapper">
						<img src="/resources/ict/common/img/Astronaut.gif" alt="">
						<h3>등록된 책소개가 없어요</h3>
					</div>
				</div>
			</c:if>

			<div class="swiper-container">
				<div class="swiper-wrapper">
					<c:choose>
						<c:when test="${fn:length(bestBookList.dsLoanBestList) > 0}">
							<div class="swiper-slide">
								<c:forEach items="${bestBookList.dsLoanBestList}" var="i" varStatus="status" begin="0" end="4">
									<div class="slide-item" onclick="goDetail('${i.LOCA}','${i.CTRLNO}');">
										<c:choose>
											<c:when test="${i.COVER_SMALLURL eq ''}">
												<img src="/resources/ict/common/img/noimg.png" />
											</c:when>
											<c:otherwise>
												<img src="${i.COVER_SMALLURL}" />
											</c:otherwise>
										</c:choose>
										<div class="ranking"><fmt:formatNumber value="${status.count}" pattern="00"/></div>
										<div class="book_title">${i.TITLE}</div>
										<div class="writer"><span>${i.AUTHOR}</span><span>/ ${i.PUBLER}</span></div>
									</div>
								</c:forEach>
							</div>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${fn:length(bestBookList.dsLoanBestList) > 4}">
							<div class="swiper-slide">
								<c:forEach items="${bestBookList.dsLoanBestList}" var="i" varStatus="status" begin="5" end="9">
									<div class="slide-item" onclick="goDetail('${i.LOCA}','${i.CTRLNO}');">
										<c:choose>
											<c:when test="${i.COVER_SMALLURL eq ''}">
												<img src="/resources/ict/common/img/noimg.png" />
											</c:when>
											<c:otherwise>
												<img src="${i.COVER_SMALLURL}" />
											</c:otherwise>
										</c:choose>
										<div class="ranking"><fmt:formatNumber value="${status.count + 5}" pattern="00"/></div>
										<div class="book_title">${i.TITLE}</div>
										<div class="writer"><span>${i.AUTHOR}</span><span>/ ${i.PUBLER}</span></div>
									</div>
								</c:forEach>
							</div>
						</c:when>
					</c:choose>
				</div>
				<div class="swiper-pagination"></div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/app/ict/typeB/kiosk/horizon/userNav.jsp"/>

	<jsp:include page="/WEB-INF/views/app/ict/typeB/kiosk/horizon/nav.jsp"/>

	</body>
</html>