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
	<link href="/resources/ict/kioskHorizon/css/reset.css" rel="stylesheet" type="text/css" />
	<link href="/resources/ict/kioskHorizon/css/swiper-bundle.min.css" rel="stylesheet" />
	<link href="/resources/ict/kioskHorizon/css/type_a/course_information.css" rel="stylesheet" type="text/css" />
	<link href="/resources/ict/kioskHorizon/css/type_a/common.css" rel="stylesheet" type="text/css" />
	<script src="/resources/ict/kioskHorizon/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
	<script src="/resources/ict/kioskHorizon/plugin/swiper-bundle.min.js" type="text/javascript"></script>
	<script src="/resources/ict/kioskHorizon/js/type_a/common.js" type="text/javascript"></script>
	<script src="/resources/ict/kioskHorizon/js/type_a/course_information.js" type="text/javascript"></script>
	<title>강좌안내</title>
</head>
<body>

<script type="text/javascript">
	function goDetail(group_idx, category_idx, teach_idx, large_category_idx) {
		$('#teachDetailForm #group_idx').val(group_idx);
		$('#teachDetailForm #category_idx').val(category_idx);
		$('#teachDetailForm #teach_idx').val(teach_idx);
		$('#teachDetailForm #large_category_idx').val(large_category_idx);
		$('form#teachDetailForm').submit();
	}
</script>

<form:form modelAttribute="teach" id="teachDetailForm" action="teachDetail.do" method="post">
	<input type="hidden" id="group_idx" name="group_idx"/>
	<input type="hidden" id="category_idx" name="category_idx"/>
	<input type="hidden" id="teach_idx" name="teach_idx"/>
	<input type="hidden" id="large_category_idx" name="large_category_idx"/>
</form:form>

<form:form modelAttribute="teach" id="teach" action="teach.do" method="GET">
<form:hidden path="searchCate1"/>
<form:hidden path="teach_day_arr"/>
<div class="container">
	<div class="header_wrapper">
		<div class="header_caption">COURSE INFORMATION</div>
		<div class="header_title white">강좌안내</div>
	</div>
	<div class="content">
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<c:if test="${fn:length(teachList) > 0}">
					<div class="swiper-slide">
						<c:forEach items="${teachList}" var="i" varStatus="status" begin="0" end="4">
							<div class="slide-item" onclick="goDetail('${i.group_idx}','${i.category_idx}','${i.teach_idx}','${i.large_category_idx}');">
								<div class="left">
									<c:choose>
										<c:when test="${i.teach_status eq '0'}">
											<div class="status progress">수강신청</div>
										</c:when>
										<c:when test="${i.teach_status eq '1'}">
											<div class="status apply">대기자신청</div>
										</c:when>
										<c:when test="${i.teach_status eq '2' or i.teach_status eq '10'}">
											<div class="status done">신청완료</div>
										</c:when>
										<c:when test="${i.teach_status eq '3'}">
											<div class="status done">대기자 신청완료</div>
										</c:when>
										<c:when test="${i.teach_status eq '9'}">
											<div class="status done">수강종료</div>
										</c:when>
										<c:when test="${i.teach_status eq '4'or i.teach_status eq '44'}">
											<div class="status done">접수마감</div>
										</c:when>
										<c:when test="${i.teach_status eq '5'}">
											<div class="status done">정원마감</div>
										</c:when>
										<c:when test="${i.teach_status eq '6'}">
											<div class="status pending">신청대기</div>
										</c:when>
									</c:choose>
									<div class="text_wrapper">
										<div class="course_title">${i.teach_name}</div>
										<div class="course_detail">접수기간<span class="date">${i.start_join_date} ~ ${i.end_join_date}</span>수강대상<span class="date">${i.teach_target}</span></div>
									</div>
								</div>
								<div class="right">
									<div class="black">
										<div class="label">접수인원</div>
										<div class="count"><span class="highlight">${i.teach_join_count}</span><span class="dash">/</span>${i.teach_limit_count}</div>
									</div>
									<div class="gray">
										<div>후보인원</div>
										<div><span class="highlight">${i.teach_backup_join_count}</span><span class="dash">/</span>${i.teach_backup_count}</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:if>
				<c:if test="${fn:length(teachList) > 4}">
					<div class="swiper-slide">
						<c:forEach items="${teachList}" var="i" varStatus="status" begin="5" end="9">
							<div class="slide-item" onclick="goDetail('${i.group_idx}','${i.category_idx}','${i.teach_idx}','${i.large_category_idx}');">
								<div class="left">
									<c:choose>
										<c:when test="${i.teach_status eq '0'}">
											<div class="status progress">수강신청</div>
										</c:when>
										<c:when test="${i.teach_status eq '1'}">
											<div class="status apply">대기자신청</div>
										</c:when>
										<c:when test="${i.teach_status eq '2' or i.teach_status eq '10'}">
											<div class="status done">신청완료</div>
										</c:when>
										<c:when test="${i.teach_status eq '3'}">
											<div class="status done">대기자 신청완료</div>
										</c:when>
										<c:when test="${i.teach_status eq '9'}">
											<div class="status done">수강종료</div>
										</c:when>
										<c:when test="${i.teach_status eq '4'or i.teach_status eq '44'}">
											<div class="status done">접수마감</div>
										</c:when>
										<c:when test="${i.teach_status eq '5'}">
											<div class="status done">정원마감</div>
										</c:when>
										<c:when test="${i.teach_status eq '6'}">
											<div class="status pending">신청대기</div>
										</c:when>
									</c:choose>
									<div class="text_wrapper">
										<div class="course_title">${i.teach_name}</div>
										<div class="course_detail">접수기간<span class="date">${i.start_join_date} ~ ${i.end_join_date}</span>수강대상<span class="date">${i.teach_target}</span></div>
									</div>
								</div>
								<div class="right">
									<div class="black">
										<div class="label">접수인원</div>
										<div class="count"><span class="highlight">${i.teach_join_count}</span><span class="dash">/</span>${i.teach_limit_count}</div>
									</div>
									<div class="gray">
										<div>후보인원</div>
										<div><span class="highlight">${i.teach_backup_join_count}</span><span class="dash">/</span>${i.teach_backup_count}</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:if>
			</div>
			<div class="swiper-pagination"></div>
		</div>
	</div>
	</form:form>

	<jsp:include page="/WEB-INF/views/app/ict/typeA/kiosk/horizon/userNav.jsp"/>

	<jsp:include page="/WEB-INF/views/app/ict/typeA/kiosk/horizon/nav.jsp"/>
</div>
</body>
</html>