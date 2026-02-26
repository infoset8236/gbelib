<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link href="/resources/ict/info/css/courseList.css" rel="stylesheet" type="text/css" />
<script src="/resources/ict/info/js/courseList.js"></script>

<div class="container">
	<div class="header">
		<div class="gray">COURSE INFORMATION</div>
		<div class="black">강좌안내</div>
	</div>
	<div class="content">
		<c:if test="${fn:length(teachList) > 0}">
			<div class="slide">
				<c:forEach items="${teachList}" var="i" varStatus="status">
					<div class="slide_item">
						<div class="wrapper">
							<c:choose>
								<c:when test="${i.teach_status eq '0'}">
									<div class="status${i.teach_status}">수강신청</div>
								</c:when>
								<c:when test="${i.teach_status eq '1'}">
									<div class="status${i.teach_status}">대기자신청</div>
								</c:when>
								<c:when test="${i.teach_status eq '2' or i.teach_status eq '10'}">
									<div class="status${i.teach_status}">신청완료</div>
								</c:when>
								<c:when test="${i.teach_status eq '3'}">
									<div class="status${i.teach_status}">대기자 신청완료</div>
								</c:when>
								<c:when test="${i.teach_status eq '9'}">
									<div class="status${i.teach_status}">수강종료</div>
								</c:when>
								<c:when test="${i.teach_status eq '4'or i.teach_status eq '44'}">
									<div class="status${i.teach_status}">접수마감</div>
								</c:when>
								<c:when test="${i.teach_status eq '5'}">
									<div class="status${i.teach_status}">정원마감</div>
								</c:when>
								<c:when test="${i.teach_status eq '6'}">
									<div class="status${i.teach_status}">신청대기</div>
								</c:when>
							</c:choose>
							<div class="course_info">
								<div class="course_title">${i.teach_name}</div>
								<div class="course_detail">
									<div class="course_detail_item">접수기간<span>${i.start_join_date} ~ ${i.end_join_date}</span></div>
									<div class="course_detail_item">수강대상<span>${i.teach_target}</span></div>
								</div>
							</div>
						</div>
						<div class="wrapper">
							<div class="count">
								<div class="count_label">접수인원</div>
								<div class="count_value"><span>${i.teach_join_count}</span><span>/</span>${i.teach_limit_count}</div>
							</div>
							<div class="count">
								<div class="count_label">후보인원</div>
								<div class="count_value"><span>${i.teach_backup_join_count}</span><span>/</span>${i.teach_backup_count}</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:if>
	</div>
	<div class="common_caption">Gyeongsangbuk-do office of ${homepage.homepage_eng_name}</div>
</div>
</body>

</html>