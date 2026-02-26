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
		<link href="/resources/ict/kioskVertical/css/type_c/font.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/kioskVertical/css/type_c/reset.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/kioskVertical/css/type_c/styles.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/kioskVertical/css/type_c/swiper-bundle.min.css" rel="stylesheet" type="text/css " />
		<script src="/resources/ict/kioskVertical/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
		<script src="/resources/ict/kioskVertical/plugin/swiper-bundle.min.js" type="text/javascript"></script>
		<script src="/resources/ict/kioskVertical/js/type_c/script.js" type="text/javascript"></script>
		<title>Document</title>
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

		<div class="kiosk_course_information_container_x">
			<div class="kiosk_common_content_x">
				<div class="kiosk_common_header_wrapper_x">
					<div class="kiosk_common_header_kr_x">강좌안내</div>
					<div class="kiosk_common_header_en_x">COURSE INFORMATION</div>
				</div>

				<div class="kiosk_course_information_swiper_x">
					<c:if test="${fn:length(teachList) > 0}">
						<div class="swiper">
							<div class="swiper-wrapper">
								<!-- 슬라이드 아이템 -->
								<c:forEach items="${teachList}" var="i" varStatus="status">
								<div class="swiper-slide" onclick="goDetail('${i.group_idx}','${i.category_idx}','${i.teach_idx}','${i.large_category_idx}');">
									<div class="swiper-item">
										<c:choose>
											<c:when test="${i.teach_status eq '0'}">
												<div class="kiosk_course_information_badge_x status_${i.teach_status}">수강신청</div>
											</c:when>
											<c:when test="${i.teach_status eq '1'}">
												<div class="status apply">대기자신청</div>
												<div class="kiosk_course_information_badge_x status_${i.teach_status}">수강신청</div>
											</c:when>
											<c:when test="${i.teach_status eq '2' or i.teach_status eq '10'}">
												<div class="kiosk_course_information_badge_x status_${i.teach_status}">신청완료</div>
											</c:when>
											<c:when test="${i.teach_status eq '3'}">
												<div class="kiosk_course_information_badge_x status_${i.teach_status}">대기자 신청완료</div>
											</c:when>
											<c:when test="${i.teach_status eq '9'}">
												<div class="kiosk_course_information_badge_x status_${i.teach_status}">수강종료</div>
											</c:when>
											<c:when test="${i.teach_status eq '4'or i.teach_status eq '44'}">
												<div class="kiosk_course_information_badge_x status_${i.teach_status}">접수마감</div>
											</c:when>
											<c:when test="${i.teach_status eq '5'}">
												<div class="kiosk_course_information_badge_x status_${i.teach_status}">정원마감</div>
											</c:when>
											<c:when test="${i.teach_status eq '6'}">
												<div class="kiosk_course_information_badge_x status_${i.teach_status}">신청대기</div>
											</c:when>
										</c:choose>
										<div>
											<div class="kiosk_course_information_title_x">${i.teach_name}</div>
											<div class="kiosk_course_information_caption_wrapper_x">
												<div class="kiosk_course_information_caption_x"><span>접수기간</span>${i.start_join_date} ~ ${i.end_join_date}</div>
												<div class="kiosk_course_information_caption_x"><span>수강대상</span>${i.teach_target}</div>
											</div>
										</div>
										<div class="kiosk_course_information_counter_wrapper_x">
											<div class="kiosk_course_information_counter_top_x">
												<div class="kiosk_course_information_counter_label_x">모집인원</div>
												<div class="kiosk_course_information_counter_value_x"><span class="highlight">${i.teach_join_count}</span><span class="dash">/</span>${i.teach_limit_count}</div>
											</div>
											<div class="kiosk_course_information_counter_bottom_x">
												<div class="kiosk_course_information_counter_label_x">후보인원</div>
												<div class="kiosk_course_information_counter_value_x"><span class="highlight">${i.teach_backup_join_count}</span><span class="dash">/</span>${i.teach_backup_count}</div>
											</div>
										</div>
									</div>
								</div>
								</c:forEach>
							</div>
						</div>
						<div class="navigation-wrapper">
							<div class="swiper-button-prev"></div>
							<div class="swiper-button-next"></div>
						</div>
					</c:if>
				</div>
			</div>
			<jsp:include page="/WEB-INF/views/app/ict/typeC/kiosk/horizon/nav.jsp"/>
			<jsp:include page="/WEB-INF/views/app/ict/typeC/kiosk/horizon/userNav.jsp"/>
		</div>
	</form:form>

	</body>
</html>