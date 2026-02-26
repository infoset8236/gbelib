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
<link href="/resources/ict/libraryBoard/css/bestBook.css" rel="stylesheet" type="text/css" />
<script src="/resources/ict/info/js/bestBook.js"></script>

<div class="container">
	<div class="header">
		<div>BEST BOOK</div>
		<div>인기도서</div>
	</div>
	<div class="content">
		<div class="slide">
			<c:if test="${fn:length(bestBookList.dsLoanBestList) > 0}">
				<c:forEach items="${bestBookList.dsLoanBestList}" var="i" varStatus="status" begin="0" end="9">
					<div class="slide_item">
						<div class="badge">${status.count}</div>
						<c:choose>
							<c:when test="${i.COVER_SMALLURL eq ''}">
								<img src="/resources/ict/common/img/noimg.png" />
							</c:when>
							<c:otherwise>
								<img src="${i.COVER_SMALLURL}" />
							</c:otherwise>
						</c:choose>
						<div class="title">${i.TITLE}</div>
						<div class="writer">${i.AUTHOR}</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
	<div class="common_caption">Gyeongsangbuk-do office of ${homepage.homepage_eng_name}</div>
</div>
</body>

</html>