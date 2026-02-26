<%@ page import="org.apache.bcel.generic.ClassGen" %>
<%@ page import="org.springframework.ui.Model" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Collections" %>
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
		<link href="/resources/ict/smartBook/css/font.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/smartBook/css/reset.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/smartBook/css/type_a/styles.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/smartBook/css/swiper-bundle.min.css" rel="stylesheet" type="text/css " />
		<link href="/resources/ict/common/css/modal.css" rel="stylesheet" type="text/css" />
		<script src="/resources/ict/smartBook/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
		<script src="/resources/ict/smartBook/plugin/swiper-bundle.min.js" type="text/javascript"></script>
		<script src="/resources/ict/smartBook/js/type_a/script.js" type="text/javascript"></script>
		<title>스마트 도서 A 타입</title>
	</head>

	<script>
		function recom(publicPopularAge) {
			$('#librarySearch #publicPopularAge').val(publicPopularAge);
			$('form#librarySearch').submit();
		}
	</script>

	<body>
		<div class="common_content">
			<form:form modelAttribute="librarySearch" action="bigDataRecom.do">
			<input type="hidden" id="publicPopularAge" name="publicPopularAge"/>
			<div class="common_header_wrapper">
				<div class="common_header_kr">빅데이터추천</div>
				<div class="common_header_en">BIG DATA RECOMMENDED</div>
			</div>
			<div class="common_content_title">빅데이터는 어떤 책을 추천했을까요?</div>
			<div class="common_content_caption">전국 공공도서관 연령대별 추천도서를 만나보세요</div>
			<div class="bigdata_slide_wrapper">
			<div class="bigdata_filtering_list">
				<div class="bigdata_filtering_list_item ${librarySearch.publicPopularAge eq '0' ? 'bigdata_filtering_list_item_active' : ''}" onclick="recom('0');">아동</div>
				<div class="bigdata_filtering_list_item ${librarySearch.publicPopularAge eq '14' ? 'bigdata_filtering_list_item_active' : ''}" onclick="recom('14');">청소년</div>
				<div class="bigdata_filtering_list_item ${librarySearch.publicPopularAge eq '20' ? 'bigdata_filtering_list_item_active' : ''}" onclick="recom('20');">20~30대</div>
				<div class="bigdata_filtering_list_item ${librarySearch.publicPopularAge eq '40' ? 'bigdata_filtering_list_item_active' : ''}" onclick="recom('40');">40~50대</div>
				<div class="bigdata_filtering_list_item ${librarySearch.publicPopularAge eq '60' ? 'bigdata_filtering_list_item_active' : ''}" onclick="recom('60');">60대 이상</div>
			</div>

				<div class="bigdata_swiper">
					<div class="swiper">
						<div class="swiper-wrapper">
							<c:forEach items="${popularBookList}" var="i" varStatus="status">
								<div class="swiper-slide">
									<img alt="" src="${i.bookImageURL}" />
									<div class="common_book_title">${i.bookname}</div>
									<div class="common_writer">${i.authors}</div>
									<div class="common_publication">${i.publication_year}</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>
					<div class="swiper-pagination"></div>
				</div>
			</div>
		</div>

			<div class="common_back_btn" onclick="history.back();">
				<div class="common_back_btn_icon"></div>
				<div class="common_back_btn_text">이전</div>
			</div>

			<jsp:include page="/WEB-INF/views/app/ict/typeA/smartBook/nav.jsp"/>
			</form:form>
		</div>
	</body>
</html>