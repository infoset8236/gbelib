<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html xml:lang="ko" lang="ko">
<head>
    <title>Document</title>
    <meta charset="utf-8" />
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
    <meta content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=1" name="viewport" />
    <link href="/resources/ict/info/css/reset.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/info/css/font.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/info/css/book.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/info/css/lib.css" rel="stylesheet" type="text/css" />
    <link href="/resources/ict/info/css/swiper-bundle.min.css" rel="stylesheet" type="text/css" />
    <script src="/resources/ict/info/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
    <script src="/resources/ict/info/plugin/swiper-bundle.min.js" type="text/javascript"></script>
    <script src="/resources/ict/info/js/book.js" type="text/javascript"></script>
    <script src="/resources/ict/info/js/lib.js" type="text/javascript"></script>
</head>
<body>

<div class="lib_notice_container">
    <c:if test="${fn:length(noticeList) < 1}">
        <div class="lib_notice_nodata_wrapper">
            <img alt="" src="/resources/ict/common/img/Astronaut.gif" />
            <div>등록된 공지사항이 없어요</div>
        </div>
    </c:if>
	
    <c:if test="${fn:length(noticeList) > 0}">
		<div class='lib_notice_new'>
			<div class="lib_notice_selected_item_swiper swiper">
				<div class="swiper-wrapper">
					<c:forEach items="${noticeList}" var="i" varStatus="status">
						<div class="swiper-slide">
							<c:choose>
								<c:when test="${empty i.preview_img}">
									<img alt="" src="/resources/ict/common/img/noimg.png" />
								</c:when>
								<c:otherwise>
									<img alt="" src="/data/board/${i.manage_idx}/${i.board_idx}/${i.preview_img}" onerror="this.onerror=null; this.src='/resources/ict/common/img/noimg.png';"/>
								</c:otherwise>
							</c:choose>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
        
        <div class="lib_notice_swiper">
            <div class="swiper">
                <div class="swiper-wrapper">
                    <c:forEach items="${noticeList}" var="i" varStatus="status">
                        <div class="swiper-slide">
                            <c:choose>
                                <c:when test="${empty i.preview_img}">
                                    <img alt="" src="/resources/ict/common/img/noimg.png" />
                                </c:when>
                                <c:otherwise>
                                    <img alt="" src="/data/board/${i.manage_idx}/${i.board_idx}/${i.preview_img}" onerror="this.onerror=null; this.src='/resources/ict/common/img/noimg.png';"/>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="swiper-pagination"></div>
        </div>
    </c:if>
</div>

</body>
</html>