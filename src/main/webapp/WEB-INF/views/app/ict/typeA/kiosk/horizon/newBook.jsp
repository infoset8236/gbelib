<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" name="viewport" />
		<meta content="ie=edge" http-equiv="X-UA-Compatible" />
		<link href="/resources/ict/kioskHorizon/css/reset.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/kioskHorizon/css/swiper-bundle.min.css" rel="stylesheet" />
		<link href="/resources/ict/kioskHorizon/css/type_a/new_book.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/kioskHorizon/css/type_a/common.css" rel="stylesheet" type="text/css" />
		<script src="/resources/ict/kioskHorizon/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
		<script src="/resources/ict/kioskHorizon/plugin/swiper-bundle.min.js" type="text/javascript"></script>
		<script src="/resources/ict/kioskHorizon/js/type_a/common.js" type="text/javascript"></script>
		<script src="/resources/ict/kioskHorizon/js/type_a/new_book.js" type="text/javascript"></script>
		<title>신착도서</title>
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

	<div class="container">
		<div class="header_wrapper">
			<div class="header_caption">NEW BOOK</div>
			<div class="header_title">신착도서</div>
		</div>
		<div class="content">
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<c:choose>
						<c:when test="${fn:length(newBookList.dsNewBookList) > 0}">
							<div class="swiper-slide">
								<c:forEach items="${newBookList.dsNewBookList}" var="i" varStatus="status" begin="0" end="11">
									<div class="slide-item" onclick="goDetail('${i.LOCA}','${i.CTRLNO}');">
										<c:choose>
											<c:when test="${i.COVER_SMALLURL eq ''}">
												<img alt="book" src="/resources/ict/common/img/noimg.png" />
											</c:when>
											<c:otherwise>
												<img alt="book" src="${i.COVER_SMALLURL}" />
											</c:otherwise>
										</c:choose>
										<div class="book_title">${i.TITLE}</div>
										<div class="writer">${i.AUTHOR}</div>
									</div>
								</c:forEach>
							</div>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${fn:length(newBookList.dsNewBookList) > 11}">
							<div class="swiper-slide">
								<c:forEach items="${newBookList.dsNewBookList}" var="i" varStatus="status" begin="11" end="22">
									<div class="slide-item" onclick="goDetail('${i.LOCA}','${i.CTRLNO}');">
										<c:choose>
											<c:when test="${i.COVER_SMALLURL eq ''}">
												<img alt="book" src="/resources/ict/common/img/noimg.png" />
											</c:when>
											<c:otherwise>
												<img alt="book" src="${i.COVER_SMALLURL}" />
											</c:otherwise>
										</c:choose>
										<div class="book_title">${i.TITLE}</div>
										<div class="writer">${i.AUTHOR}</div>
									</div>
								</c:forEach>
							</div>
						</c:when>
					</c:choose>
				</div>
				<div class="swiper-pagination"></div>
			</div>
		</div>
		
		<jsp:include page="/WEB-INF/views/app/ict/typeA/kiosk/horizon/userNav.jsp"/>

		<jsp:include page="/WEB-INF/views/app/ict/typeA/kiosk/horizon/nav.jsp"/>
	</div>
	</body>
</html>