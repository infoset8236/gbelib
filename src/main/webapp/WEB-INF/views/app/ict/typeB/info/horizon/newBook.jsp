<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!doctype html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" name="viewport" />
<meta content="ie=edge" http-equiv="X-UA-Compatible" />
<title>Document</title>
<link href="/resources/ict/libraryBoard/css/reset.css" rel="stylesheet" type="text/css" />
<link href="/resources/ict/libraryBoard/css/font.css" rel="stylesheet" type="text/css" />
<link href="/resources/ict/libraryBoard/css/common.css" rel="stylesheet" type="text/css" />
<link href="/resources/ict/libraryBoard/css/slick.css" rel="stylesheet" type="text/css" />
<link href="/resources/ict/libraryBoard/css/slick-theme.css" rel="stylesheet" type="text/css" />
<script src="/resources/ict/libraryBoard/plugin/jquery-3.7.1.min.js"></script>
<script src="/resources/ict/libraryBoard/plugin/slick.min.js"></script>
<script src="/resources/ict/libraryBoard/js/common.js" type="text/javascript"></script>
</head>

<body>
<link href="/resources/ict/libraryBoard/css/newBook.css" rel="stylesheet" type="text/css" />
<script src="/resources/ict/info/js/newBook.js"></script>

<div class="container">
	<div class="header">
		<div>NEW BOOK</div>
		<div>신착도서</div>
	</div>
	<div class="content">
		<div class="book_slide">
			<c:if test="${fn:length(newBookList.dsNewBookList) > 0}">
				<c:forEach items="${newBookList.dsNewBookList}" var="i">
					<div class="book_slide_item">
						<div class="wrapper">
							<c:choose>
								<c:when test="${i.COVER_SMALLURL eq ''}">
									<img class="book_img" src="/resources/ict/common/img/noimg.png" />
								</c:when>
								<c:otherwise>
									<img class="book_img" src="${i.COVER_SMALLURL}" />
								</c:otherwise>
							</c:choose>
							<div class="book_title">
								${i.TITLE}
							</div>
						</div>
						<div class="wrapper">
							<div class="book_info">
								<div class="book_info_item">저자명<span>${i.AUTHOR}</span></div>
								<div class="book_info_item">발행년도<span>${i.PUBLER_YEAR}</span></div>
								<div class="book_info_item">출판사<span>${i.PUBLER}</span></div>
								<div class="book_info_item">소장위치<span>${i.LOCA_NAME}</span></div>
								<div class="book_info_item">ISBN<span>${i.ISBN}</span></div>
								<div class="book_info_item">청구기호<span>${i.CALL_NO}</span></div>
							</div>
							<div class="summary">
								<c:if test="${empty i.contentsDetail}">
									등록된 책 소개가 없어요
								</c:if>
									${i.contentsDetail}
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
	<div class="book_list_slide">
		<c:forEach items="${newBookList.dsNewBookList}" var="i">
			<div class="book_list_slide_item">
				<c:choose>
					<c:when test="${i.COVER_SMALLURL eq ''}">
						<img src="/resources/ict/common/img/noimg.png" />
					</c:when>
					<c:otherwise>
						<img src="${i.COVER_SMALLURL}" />
					</c:otherwise>
				</c:choose>
			</div>
		</c:forEach>
	</div>
	<div class="common_caption">Gyeongsangbuk-do office of ${homepage.homepage_eng_name}</div>
</div>
</body>

</html>