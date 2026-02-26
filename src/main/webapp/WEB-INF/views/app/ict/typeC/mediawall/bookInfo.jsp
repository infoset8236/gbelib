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
		<link href="/resources/ict/mediawall/css/type_c/font.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/mediawall/css/type_c/reset.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/mediawall/css/type_c/styles.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/mediawall/css/type_c/swiper-bundle.min.css" rel="stylesheet" type="text/css " />
		<script src="/resources/ict/mediawall/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
		<script src="/resources/ict/mediawall/plugin/swiper-bundle.min.js" type="text/javascript"></script>
		<script src="/resources/ict/mediawall/js/type_c/script.js" type="text/javascript"></script>
		<title>인기도서</title>
	</head>
	<body>
	<div class="media_best_book_container">
		<!--	 공통 헤더 / 배경 색상마다 폰트 컬러가 달라 media_common_black 클래스 추가됨	 	-->
		<div class="media_common_header_wrapper">
			<div class="media_common_header">
				<div class="media_common_header_kr media_common_black">인기도서</div>
				<div class="media_common_header_en">BEST BOOK</div>
			</div>
			<div class="media_common_header">
				<div class="media_common_header_time media_common_black"></div>
				<div class="media_common_header_date media_common_black"></div>
			</div>
		</div>
		<div class="media_best_book_content_wrapper">
			<div class="media_best_book_top_content">
				<!--		1위			-->
				<c:forEach items="${bestBookList.dsLoanBestList}" var="i" varStatus="status" begin="0" end="0">
				<div class="media_best_book_content">
					<div class="media_best_book_img_wrapper">
						<c:choose>
							<c:when test="${i.COVER_SMALLURL eq ''}">
								<img src="/resources/ict/common/img/noimg.png" />
							</c:when>
							<c:otherwise>
								<img src="${i.COVER_SMALLURL}" />
							</c:otherwise>
						</c:choose>
						<div>01</div>
					</div>
					<div class="media_best_book_text">
						<div class="media_best_book_title">${i.TITLE}</div>
						<div class="media_best_book_information">${i.AUTHOR} / ${i.PUBLER} / ${i.PUBLER_YEAR}</div>
						<div class="media_best_book_summary">
								${i.contentsDetail}
						</div>
					</div>
				</div>
				</c:forEach>
				<!--		2위			-->
				<c:forEach items="${bestBookList.dsLoanBestList}" var="i" varStatus="status" begin="1" end="1">
				<div class="media_best_book_content">
					<div class="media_best_book_img_wrapper">
						<c:choose>
							<c:when test="${i.COVER_SMALLURL eq ''}">
								<img src="/resources/ict/common/img/noimg.png" />
							</c:when>
							<c:otherwise>
								<img src="${i.COVER_SMALLURL}" />
							</c:otherwise>
						</c:choose>
						<div>02</div>
					</div>
					<div class="media_best_book_text">
						<div class="media_best_book_title">${i.TITLE}</div>
						<div class="media_best_book_information">${i.AUTHOR} / ${i.PUBLER} / ${i.PUBLER_YEAR}</div>
						<div class="media_best_book_summary">
							${i.contentsDetail}
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
			<div class="media_best_book_bottom_content">
				<!--		3위 ~ 10위 / 8개 list item			-->
				<c:forEach items="${bestBookList.dsLoanBestList}" var="i" varStatus="status" begin="2" end="9">
					<div class="media_best_book_list_item">
						<div class="media_best_book_list_item_img_wrapper">
							<c:choose>
								<c:when test="${i.COVER_SMALLURL eq ''}">
									<img src="/resources/ict/common/img/noimg.png" />
								</c:when>
								<c:otherwise>
									<img src="${i.COVER_SMALLURL}" />
								</c:otherwise>
							</c:choose>
							<div><fmt:formatNumber value="${status.count + 2}" pattern="00"/></div>
						</div>
						<div class="media_best_book_list_item_title">${i.TITLE}</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	</body>
</html>