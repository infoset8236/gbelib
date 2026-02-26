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
		<link href="/resources/ict/kioskVertical/css/type_c/font.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/kioskVertical/css/type_c/reset.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/kioskVertical/css/type_c/styles.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/kioskVertical/css/type_c/swiper-bundle.min.css" rel="stylesheet" type="text/css " />
		<script src="/resources/ict/kioskVertical/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
		<script src="/resources/ict/kioskVertical/plugin/swiper-bundle.min.js" type="text/javascript"></script>
		<script src="/resources/ict/kioskVertical/js/type_c/script.js" type="text/javascript"></script>
		<title>Document</title>
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

	<body>
	<div class="kiosk_new_book_container">
		<div class="kiosk_common_header_wrapper">
			<div class="kiosk_common_header_kr">신착도서</div>
			<div class="kiosk_common_header_en">NEW BOOK</div>
		</div>
		<div class="kiosk_new_book_swiper">
			<div class="swiper">
				<div class="swiper-wrapper">
					<!-- 슬라이드 아이템 -->
					<c:forEach items="${newBookList.dsNewBookList}" var="i" varStatus="status">
					<div class="swiper-slide">
						<div class="swiper-item">
							<c:choose>
								<c:when test="${i.COVER_SMALLURL eq ''}">
									<img src="/resources/ict/common/img/noimg.png" />
								</c:when>
								<c:otherwise>
									<img src="${i.COVER_SMALLURL}" />
								</c:otherwise>
							</c:choose>
							<div class="kiosk_new_book_title">${i.TITLE}</div>
							<div class="kiosk_new_book_writer">${i.AUTHOR}</div>
							<div class="kiosk_new_book_year">${i.PUBLER_YEAR}</div>
						</div>
					</div>
					</c:forEach>
				</div>
				<div class="swiper-pagination"></div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/app/ict/typeC/kiosk/vertical/nav.jsp"/>
		<jsp:include page="/WEB-INF/views/app/ict/typeC/kiosk/vertical/userNav.jsp"/>
	</div>
	</body>
</html>