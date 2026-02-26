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
	
	$(document).ready(function () {

    $("#loading").show();


    setTimeout(function () {
        $("#loading").fadeOut(); 
    }, 3000);
});

</script>

	<form:form modelAttribute="librarySearch" id="verDetailForm" action="detail.do" method="post">
		<input type="hidden" id="vLoca" name="vLoca"/>
		<input type="hidden" id="vCtrl" name="vCtrl"/>
	</form:form>

	<div class="kiosk_best_book_container_x">
		<div class="kiosk_common_content_x">
			<div class="kiosk_common_header_wrapper_x">
				<div class="kiosk_common_header_kr_x">대출베스트</div>
				<div class="kiosk_common_header_en_x">BEST BOOK</div>
			</div>
			<div class="kiosk_best_book_wrapper_x">
				<!-- 슬라이드 아이템 -->
				<c:forEach items="${bestBookList.dsLoanBestList}" var="i" varStatus="status">
					<div class="kiosk_best_book_x" onclick="goDetail('${i.LOCA}','${i.CTRLNO}');">
						<c:choose>
							<c:when test="${i.COVER_SMALLURL eq ''}">
								<img src="/resources/ict/common/img/noimg.png" />
							</c:when>
							<c:otherwise>
								<img src="${i.COVER_SMALLURL}" />
							</c:otherwise>
						</c:choose>
						<div class="kiosk_best_book_badge_x">${i.RANK}위</div>
						<div class="kiosk_best_book_title_x">${i.TITLE}</div>
						<div class="kiosk_best_book_writer_x">${i.AUTHOR}</div>
						<div class="kiosk_best_book_year_x">${i.PUBLER_YEAR}</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/app/ict/typeC/kiosk/horizon/nav.jsp"/>
		<jsp:include page="/WEB-INF/views/app/ict/typeC/kiosk/horizon/userNav.jsp"/>
	</div>

	<div class="loading">
		<img alt="" src="/resources/ict/kioskHorizon/img/type_c/loading.gif" />
	</div>

	</body>
	<script>
		$(document).ready(function () {
			setTimeout(function () {
				$('.loading').fadeOut('slow');
			}, 5000);
		});
	</script>
</html>