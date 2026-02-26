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
		<link href="/resources/ict/mediawall/css/reset.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/mediawall/css/font.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/mediawall/css/type_a/common.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/mediawall/css/type_a/best_book.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/mediawall/css/slick-theme.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/mediawall/css/slick.css" rel="stylesheet" type="text/css" />
		<script src="/resources/ict/mediawall/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
		<script src="/resources/ict/mediawall/plugin/slick.js" type="text/javascript"></script>
		<script src="/resources/ict/mediawall/js/type_a/best_book.js" type="text/javascript"></script>
		<title>도서정보</title>
	</head>
	<body>
	<div class="div_wrap bookinfo-wrap" id="fade-effect">
		<img class="bg_wrap" src="/resources/ict/mediawall/img/type_a/best_book/bookinfo.png" />
		<div class="bg_point_01"></div>
		<div class="bg_point_02"></div>
		<div class="header_wrap">
			<div class="header_frame">
				<div class="header_group">
					<div class="ict_tit_01">도서정보</div>
					<div class="ict_tit book-information">BOOK INFORMATION</div>
				</div>
			</div>
		</div>
		<!--신착도서-->
		<div class="new_wrap">
			<!-- MAIN SLIDES -->
			<div class="newbook_main">
				<c:choose>
					<c:when test="${fn:length(newBookList.dsNewBookList) > 0}">
						<c:forEach items="${newBookList.dsNewBookList}" var="i" varStatus="status">
							<div class="bookwrap" data-index="${status.count}">
								<div class="img_frame">
									<div class="img_frame_w">
										<c:choose>
											<c:when test="${i.COVER_SMALLURL eq ''}">
												<img alt="book" class="book_images" src="/resources/homepage/geic/img/noimg2.png" />
											</c:when>
											<c:otherwise>
												<img alt="book" class="book_images" src="${i.COVER_SMALLURL}" />
											</c:otherwise>
										</c:choose>
									</div>
								</div>
								<div class="exwrap">
									<div class="book_title">
										<div class="book_title_tit">${i.TITLE}</div>
									</div>
									<div class="book_auth">${i.AUTHOR} ㆍ ${i.PUBLER} ㆍ ${i.PUBLER_YEAR}</div>
									<div class="book_explain_w">
										<div class="book_explain">
												${i.contentsDetail}
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:when>
				</c:choose>
			</div>

			<!-- THUMBNAILS -->
			<div class="newbook_thumbnails">
				<c:choose>
					<c:when test="${fn:length(newBookList.dsNewBookList) > 0}">
						<c:forEach items="${newBookList.dsNewBookList}" var="i" varStatus="status">
							<div class="thum_frame_w">
								<div class="img_frame_w">
									<c:choose>
										<c:when test="${i.COVER_SMALLURL eq ''}">
											<img alt="book" class="book_images" slide="slide_${status.count}" src="/resources/homepage/geic/img/noimg2.png" />
										</c:when>
										<c:otherwise>
											<img alt="book" class="book_images" slide="slide_${status.count}" src="${i.COVER_SMALLURL}" />
										</c:otherwise>
									</c:choose>
								</div>
								<div class="thum_frame">
									<div class="div_tit">${i.TITLE}</div>
								</div>
							</div>
						</c:forEach>
					</c:when>
				</c:choose>
			</div>
		</div>
		<!--인기도서-->
		<div class="best_wrap">
			<div class="newbook_main02">
				<c:choose>
					<c:when test="${fn:length(bestBookList.dsLoanBestList) > 0}">
						<c:forEach items="${bestBookList.dsLoanBestList}" var="i" varStatus="status">
							<div class="bookwrap" data-index="${status.count}">
								<div class="img_frame">
									<div class="img_frame_w">
										<c:choose>
											<c:when test="${i.COVER_SMALLURL eq ''}">
												<img alt="book" class="book_images" src="/resources/homepage/geic/img/noimg2.png" />
											</c:when>
											<c:otherwise>
												<img alt="book" class="book_images" src="${i.COVER_SMALLURL}" />
											</c:otherwise>
										</c:choose>
									</div>
								</div>
								<div class="exwrap">
									<div class="book_title">
										<div class="book_title_tit">${i.TITLE}</div>
									</div>
									<div class="book_auth">${i.AUTHOR} ㆍ ${i.PUBLER} ㆍ ${i.PUBLER_YEAR}</div>
									<div class="book_explain_w">
										<div class="book_explain">
												${i.contentsDetail}
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:when>
				</c:choose>
			</div>

			<!-- THUMBNAILS -->
			<div class="newbook_thumbnails02">
				<c:choose>
					<c:when test="${fn:length(bestBookList.dsLoanBestList) > 0}">
						<c:forEach items="${bestBookList.dsLoanBestList}" var="i" varStatus="status">
							<div class="thum_frame_w">
								<div class="img_frame_w">
									<c:choose>
										<c:when test="${i.COVER_SMALLURL eq ''}">
											<img alt="book" class="book_images" slide="slide_${status.count}" src="/resources/homepage/geic/img/noimg2.png" />
										</c:when>
										<c:otherwise>
											<img alt="book" class="book_images" slide="slide_${status.count}" src="${i.COVER_SMALLURL}" />
										</c:otherwise>
									</c:choose>
								</div>
								<div class="thum_frame">
									<div class="div_tit">${i.TITLE}</div>
								</div>
							</div>
						</c:forEach>
					</c:when>
				</c:choose>
			</div>
		</div>

		<div class="book_new_h5">
			신착
			<br />
			도서
		</div>
		<img class="book_mark_01" src="/resources/ict/mediawall/img/type_a/best_book/group-230.svg" />
		<div class="book_best_h5">
			인기
			<br />
			도서
		</div>
		<img class="book_mark_02" src="/resources/ict/mediawall/img/type_a/best_book/group-230.svg" />
	</div>
	</body>
</html>