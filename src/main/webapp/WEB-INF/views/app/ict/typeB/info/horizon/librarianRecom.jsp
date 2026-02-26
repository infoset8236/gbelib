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
	<meta content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"
		  name="viewport" />
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
<link href="/resources/ict/info/css/librarianRecommended.css" rel="stylesheet" type="text/css" />
<script src="/resources/ict/libraryBoard/js/librarianRecommended.js"></script>

<div class="container">
	<div class="header">
		<div>LIBRARIAN RECOMMEND BOOK</div>
		<div>사서추천도서</div>
	</div>
	<div class="content">
		<div class="slide">
			<c:if test="${fn:length(librarianRecommendList) > 0}">
				<c:forEach items="${librarianRecommendList}" var="i">
					<div class="slide_item">
						<c:choose>
							<c:when test="${fn:contains(i.preview_img, 'https')}">
								<img src="${i.preview_img}" alt="${i.title}" title="${i.title}"/>
							</c:when>
							<c:otherwise>
								<img src="/resources/ict/smartBook/img/common/noimg.png" alt="${i.title}" title="${i.title}"/>
							</c:otherwise>
						</c:choose>
						<div class="title">${i.title}</div>
						<div class="writer">${i.imsi_v_3} / ${i.imsi_v_1.split('-')[0]}</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
	<div class="common_caption">Gyeongsangbuk-do office of ${homepage.homepage_eng_name}</div>
</div>
</body>

</html>