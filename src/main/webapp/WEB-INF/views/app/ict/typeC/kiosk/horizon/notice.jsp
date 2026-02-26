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
	<div class="kiosk_notice_container_x">
		<div class="kiosk_common_content_x">
			<div class="kiosk_common_header_wrapper_x">
				<div class="kiosk_common_header_kr_x">공지사항</div>
				<div class="kiosk_common_header_en_x">LIBRARY NOTICE</div>
			</div>
			<div class="kiosk_notice_swiper_box">
				<div class="swiper">
					<div class="swiper-wrapper">
						<c:forEach items="${noticeList}" var="i" varStatus="status">
							<div class="swiper-slide">
								<c:choose>
									<c:when test="${empty i.preview_img}">
										<img alt="" src="/resources/ict/kioskVertical/img/common/noimg.png" />
									</c:when>
									<c:otherwise>
										<img src="/data/board/${i.manage_idx}/${i.board_idx}/${i.preview_img}" onerror="this.src='/resources/ict/kioskVertical/img/common/noimg.png';"  />
									</c:otherwise>
								</c:choose>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="navigation-wrapper">
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>
				</div>
			</div>
		</div>

		<jsp:include page="/WEB-INF/views/app/ict/typeC/kiosk/horizon/nav.jsp"/>
		<jsp:include page="/WEB-INF/views/app/ict/typeC/kiosk/horizon/userNav.jsp"/>
	</div>
	</body>
</html>