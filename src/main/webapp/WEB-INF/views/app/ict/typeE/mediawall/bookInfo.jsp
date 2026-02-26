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
        <link href="/resources/ict/typeE/common/css/reset.css" rel="stylesheet" type="text/css" />
        <link href="/resources/ict/typeE/common/css/font.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/typeE/mediawall/css/type_b/common.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/typeE/mediawall/css/type_b/best_book.css" rel="stylesheet" type="text/css" />
		<script src="/resources/ict/typeE/mediawall/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
		<title>인기도서</title>
	</head>
	<body>
		<div class="div_wrap bookinfo-wrap" id="fade-effect">
			<img class="bg_wrap" src="/resources/ict/typeE/mediawall/img/type_b/best_book/bookinfo.png" />
			<div class="bg_point_01"><img src="/resources/ict/typeE/mediawall/img/type_b/best_book/bg_binfo_02.svg" /></div>
			<div class="header_wrap">
				<div class="header_frame">
					<div class="header_group">
						<div class="ict_tit_01">인기도서</div>
						<div class="ict_tit book-information">BEST BOOK</div>
					</div>
				</div>
			</div>
			<div class="top_content">
				<c:choose>
					<c:when test="${fn:length(bestBookList.dsLoanBestList) > 0}">
						<c:forEach items="${bestBookList.dsLoanBestList}" var="i" varStatus="status" begin="0" end="1">
							<div class="content_wrapper">
								<div class="left">
									<div class="number"><fmt:formatNumber value="${status.count}" pattern="00"/></div>
									<c:choose>
										<c:when test="${i.COVER_SMALLURL eq ''}">
											<img alt="book" src="/resources/ict/smartBook/img/common/noimg.png" />
										</c:when>
										<c:otherwise>
											<img alt="book" src="${i.COVER_SMALLURL}" />
										</c:otherwise>
									</c:choose>
								</div>
								<div class="right">
									<div class="book_title">${i.TITLE}</div>
									<div class="writer">${i.AUTHOR} / ${i.PUBLER} / ${i.PUBLER_YEAR}</div>
									<div class="description">
										${i.contentsDetail}
									</div>
								</div>
							</div>
						</c:forEach>
					</c:when>
				</c:choose>
			</div>
			<div class="bottom_content">
    <c:choose>
        <c:when test="${fn:length(bestBookList.dsLoanBestList) > 0}">
            <c:forEach items="${bestBookList.dsLoanBestList}" var="i" varStatus="status" begin="2" end="9">
                <div class="wrapper">
                    <div class="small_number"><fmt:formatNumber value="${status.index + 1}" pattern="00"/></div>
                    <c:choose>
                        <c:when test="${i.COVER_SMALLURL eq ''}">
                            <img alt="book" src="/resources/ict/smartBook/img/common/noimg.png" />
                        </c:when>
                        <c:otherwise>
                            <img alt="book" src="${i.COVER_SMALLURL}" />
                        </c:otherwise>
                    </c:choose>
                    <div class="small_book_title">${i.TITLE}</div>
                </div>
            </c:forEach>
        </c:when>
    </c:choose>
</div>
		</div>
	</body>
</html>