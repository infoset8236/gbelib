<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8" />
		<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
		<title>B타입 이용안내</title>
		<meta content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=1" name="viewport" />
		<link href="/resources/ict/kioskVertical/css/font.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/kioskVertical/css/reset.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/kioskVertical/css/type_a/info/course_information.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/kioskVertical/css/jquery.bxslider.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/kioskVertical/css/type_a/info/common.css" rel="stylesheet" type="text/css " />
		<link href="/resources/ict/common/css/modal.css" rel="stylesheet" type="text/css" />
		<script src="/resources/ict/common/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
		<script src="/resources/ict/kioskVertical/plugin/jquery.bxslider.js" type="text/javascript"></script>
		<script src="/resources/ict/kioskVertical/js/type_a/info/course_information.js" type="text/javascript"></script>
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

		<div class="culture-wrap info">
			<div class="header">
				<p>Course Information</p>
				<h1>강좌안내</h1>
			</div>
			<div class="contents">
				<div class="culture-inner-box bslide-box">
					<c:if test="${fn:length(teachList) > 0}">
						<div class="bx-slide">
							<c:forEach items="${teachList}" var="i" varStatus="status" begin="0" end="6">
								<div class="culture-list">
									<a class="detail-btn" href="javascript:void(0);">
										<div class="outer">
											<div class="inner" onclick="goDetail('${i.group_idx}','${i.category_idx}','${i.teach_idx}','${i.large_category_idx}');">
												<div class="cul-status">
													<c:choose>
														<c:when test="${i.teach_status eq '0'}">
															<span class="status_${i.teach_status}">수강신청</span>
														</c:when>
														<c:when test="${i.teach_status eq '1'}">
															<span class="status_${i.teach_status}">대기자신청</span>
														</c:when>
														<c:when test="${i.teach_status eq '2' or i.teach_status eq '10'}">
															<span class="status_${i.teach_status}">신청완료</span>
														</c:when>
														<c:when test="${i.teach_status eq '3'}">
															<span class="status_${i.teach_status}">대기자 신청완료</span>
														</c:when>
														<c:when test="${i.teach_status eq '9'}">
															<span class="status_${i.teach_status}">수강종료</span>
														</c:when>
														<c:when test="${i.teach_status eq '4'or i.teach_status eq '44'}">
															<span class="status_${i.teach_status}">접수마감</span>
														</c:when>
														<c:when test="${i.teach_status eq '5'}">
															<span class="status_${i.teach_status}">정원마감</span>
														</c:when>
														<c:when test="${i.teach_status eq '6'}">
															<span class="status_${i.teach_status}">신청대기</span>
														</c:when>
													</c:choose>
												</div>
												<div class="cul-info">
													<ul>
														<li>${i.teach_name}</li>
														<li><span class="">접수기간&nbsp;&nbsp;</span>${i.start_join_date} ~ ${i.end_join_date}</li>
														<li><span class="">모집대상&nbsp;&nbsp;</span>${i.teach_target}</li>
													</ul>
												</div>
												<div class="cul-cnt">
													<ul>
														<li>
															<p class="cul-cnt-tit">접수인원</p>
															<p class="cul-cnt-state">
																<span class="">${i.teach_join_count}</span>
																<span class="slash_01">/</span>${i.teach_limit_count}
															</p>
														</li>
														<li>
															<p class="cul-cnt-tit">후보인원</p>
															<p class="cul-cnt-state">
																<span class="">${i.teach_backup_join_count}</span>
																<span class="slash_01">/</span>${i.teach_backup_count}
															</p>
														</li>
													</ul>
												</div>
											</div>
										</div>
									</a>
								</div>
							</c:forEach>
						</div>
					</c:if>

					<c:if test="${fn:length(teachList) > 6}">
						<div class="bx-slide">
							<c:forEach items="${teachList}" var="i" varStatus="status" begin="7" end="13">
								<div class="culture-list">
									<a class="detail-btn" href="javascript:void(0);">
										<div class="outer">
											<div class="inner" onclick="goDetail('${i.group_idx}','${i.category_idx}','${i.teach_idx}','${i.large_category_idx}');">
												<div class="cul-status">
													<c:choose>
														<c:when test="${i.teach_status eq '0'}">
															<span class="status_${i.teach_status}">수강신청</span>
														</c:when>
														<c:when test="${i.teach_status eq '1'}">
															<span class="status_${i.teach_status}">대기자신청</span>
														</c:when>
														<c:when test="${i.teach_status eq '2' or i.teach_status eq '10'}">
															<span class="status_${i.teach_status}">신청완료</span>
														</c:when>
														<c:when test="${i.teach_status eq '3'}">
															<span class="status_${i.teach_status}">대기자 신청완료</span>
														</c:when>
														<c:when test="${i.teach_status eq '9'}">
															<span class="status_${i.teach_status}">수강종료</span>
														</c:when>
														<c:when test="${i.teach_status eq '4'or i.teach_status eq '44'}">
															<span>접수마감</span>
														</c:when>
														<c:when test="${i.teach_status eq '5'}">
															<span class="status_${i.teach_status}">정원마감</span>
														</c:when>
														<c:when test="${i.teach_status eq '6'}">
															<span class="status_${i.teach_status}">신청대기</span>
														</c:when>
													</c:choose>
												</div>
												<div class="cul-info">
													<ul>
														<li>${i.teach_name}</li>
														<li><span class="">접수기간&nbsp;&nbsp;</span>${i.start_join_date}&nbsp;&nbsp;${i.start_join_time} ~ ${i.end_join_date}&nbsp;&nbsp;${i.end_join_time}</li>
														<li><span class="">모집대상&nbsp;&nbsp;</span>${i.teach_target}</li>
													</ul>
												</div>
												<div class="cul-cnt">
													<ul>
														<li>
															<p class="cul-cnt-tit">접수인원</p>
															<p class="cul-cnt-state">
																<span class="">${i.teach_join_count}</span>
																<span class="slash_01">/</span>${i.teach_limit_count}
															</p>
														</li>
														<li>
															<p class="cul-cnt-tit">후보인원</p>
															<p class="cul-cnt-state">
																<span class="">${i.teach_backup_join_count}</span>
																<span class="slash_01">/</span>${i.teach_backup_count}
															</p>
														</li>
													</ul>
												</div>
											</div>
										</div>
									</a>
								</div>
							</c:forEach>
						</div>
					</c:if>
				</div>
			</div>
		</div>

	</form:form>

	<jsp:include page="/WEB-INF/views/app/ict/typeA/kiosk/vertical/userNav.jsp"/>

	<jsp:include page="/WEB-INF/views/app/ict/typeA/kiosk/vertical/nav.jsp"/>

	</body>
</html>