<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8" />
		<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
		<title>신착도서</title>
		<meta content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=1" name="viewport" />
		<link href="/resources/ict/kioskVertical/css/font.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/kioskVertical/css/reset.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/kioskVertical/css/type_a/info/book.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/kioskVertical/css/jquery.bxslider.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/kioskVertical/css/type_a/info/common.css" rel="stylesheet" type="text/css " />
		<script src="/resources/ict/common/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
		<script src="/resources/ict/kioskVertical/plugin/jquery.bxslider.js" type="text/javascript"></script>
		<script src="/resources/ict/kioskVertical/js/type_a/info/book.js" type="text/javascript"></script>
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

	<div class="new_wrap info">
		<div class="header">
			<p>NEW BOOK</p>
			<h1>신착도서</h1>
		</div>
		<div class="contents">
			<div class="slider">
				<div class="slider_inner">
					<div class="grid">
						<c:choose>
							<c:when test="${fn:length(newBookList.dsNewBookList) > 0}">
								<c:forEach items="${newBookList.dsNewBookList}" var="i" varStatus="status" begin="0" end="8">
									<div class="grid-item" onclick="goDetail('${i.LOCA}','${i.CTRLNO}');">
										<c:choose>
											<c:when test="${i.COVER_SMALLURL eq ''}">
												<img src="/resources/ict/common/img/noimg.png" />
											</c:when>
											<c:otherwise>
												<img src="${i.COVER_SMALLURL}" />
											</c:otherwise>
										</c:choose>
										<div class="book-title">${i.TITLE}</div>
										<div class="name">${i.AUTHOR}</div>
									</div>
								</c:forEach>
							</c:when>
						</c:choose>
					</div>
				</div>
				<div class="slider_inner">
					<div class="grid">
						<c:choose>
							<c:when test="${fn:length(newBookList.dsNewBookList) > 8}">
								<c:forEach items="${newBookList.dsNewBookList}" var="i" varStatus="status" begin="9" end="17">
									<div class="grid-item" onclick="goDetail('${i.LOCA}','${i.CTRLNO}');">
										<c:choose>
											<c:when test="${i.COVER_SMALLURL eq ''}">
												<img src="/resources/ict/common/img/noimg.png" />
											</c:when>
											<c:otherwise>
												<img src="${i.COVER_SMALLURL}" />
											</c:otherwise>
										</c:choose>
										<div class="book-title">${i.TITLE}</div>
										<div class="name">${i.AUTHOR}</div>
									</div>
								</c:forEach>
							</c:when>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/app/ict/typeA/kiosk/vertical/userNav.jsp"/>

	<jsp:include page="/WEB-INF/views/app/ict/typeA/kiosk/vertical/nav.jsp"/>

	</body>
</html>