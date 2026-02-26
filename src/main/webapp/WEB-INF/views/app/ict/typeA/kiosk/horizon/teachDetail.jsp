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
	<link href="/resources/ict/kioskHorizon/css/type_a/course_detail.css" rel="stylesheet" type="text/css" />
	<link href="/resources/ict/kioskHorizon/css/type_a/common.css" rel="stylesheet" type="text/css" />
	<script src="/resources/ict/kioskHorizon/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
	<script src="/resources/ict/kioskHorizon/js/type_a/common.js" type="text/javascript"></script>
	<title>강좌정보</title>
</head>
<body>

<script type="text/javascript">
	$(document).ready(function() {
		$('#popup').hide();

		$('.close').on('click', function () {
			$('#popup').fadeOut();
		});

		$(window).on('click', function (e) {
			if ($(e.target).is('.popup_overlay')) {
				$('#popup').fadeOut();
			}
		});

		$('.black').on('click', function () {
			$('form#loginForm').submit();
		});
	});

	function teachEdit(group_idx, category_idx, teach_idx, large_category_idx, apply_status) {
		if ('${sessionScope.member.login}' == 'true' && '${sessionScope.member.loginType}' == 'HOMEPAGE') {
			$('#teachEditForm #group_idx').val(group_idx);
			$('#teachEditForm #category_idx').val(category_idx);
			$('#teachEditForm #teach_idx').val(teach_idx);
			$('#teachEditForm #large_category_idx').val(large_category_idx);
			$('form#teachEditForm').submit();
		} else {
			$('#popup').fadeIn();
		}
	}
</script>

<form:form modelAttribute="member" id="loginForm" action="login.do" method="post">
</form:form>

<form:form modelAttribute="student" id="teachEditForm" action="teachEdit.do" method="post">
	<input type="hidden" id="group_idx" name="group_idx"/>
	<input type="hidden" id="category_idx" name="category_idx"/>
	<input type="hidden" id="teach_idx" name="teach_idx"/>
	<input type="hidden" id="large_category_idx" name="large_category_idx"/>
	<input type="hidden" id="apply_status" name="apply_status"/>
</form:form>

	<div class="container">
		<div class="header_wrapper">
			<div class="header_caption">COURSE INFORMATION</div>
			<div class="header_title white">강좌정보</div>
		</div>
		<div class="content">
			<div class="box">
				<div class="first">
					<div class="icon_wrapper">
						<img alt="" src="/resources/ict/kioskHorizon/img/type_a/course_detail/pencil.svg" />
					</div>
					<div class="text_wrapper">
						<div class="label black">강좌명</div>
						<div class="course_title">
								${teach.teach_name}
						</div>
					</div>
				</div>
				<div class="second">
					<div class="border date_wrapper">
						<div class="icon_wrapper">
							<img alt="" src="/resources/ict/kioskHorizon/img/type_a/course_detail/calendar.svg" />
						</div>
						<div class="course_date_wrapper">
							<div class="label">강의기간</div>
							<div class="course_date">${teach.start_date} ~ ${teach.end_date}</div>
						</div>
					</div>
					<div class="date_wrapper">
						<div class="icon_wrapper">
							<img alt="" src="/resources/ict/kioskHorizon/img/type_a/course_detail/mouse.svg" />
						</div>
						<div class="apply_date_wrapper">
							<div class="label">접수기간</div>
							<div class="apply_date">${teach.start_join_date}&nbsp;${teach.start_join_time} ~ ${teach.end_join_date}&nbsp;${teach.end_join_time}</div>
						</div>
					</div>
				</div>
				<div class="third">
					<div class="black_box">
						<div class="label white">접수인원</div>
						<div class="count"><span class="highlight">${teach.teach_join_count}</span><span class="dash">/</span>${teach.teach_limit_count}</div>
					</div>
					<div class="gray_box">
						<div class="label white">후보인원</div>
						<div class="count"><span class="highlight">${teach.teach_backup_join_count}</span><span class="dash">/</span>${teach.teach_backup_count}</div>
					</div>
				</div>
			</div>
			<div class="course_detail">
				<div class="course_detail_first">
					<div class="course_detail_label"><span class="mr">• 강사명</span>
						<c:choose>
						<c:when test="${teach.teacher_idx eq 0 }">
							${teach.typing_teacher_name}
						</c:when>
						<c:otherwise>
							${teach.teacher_name}
						</c:otherwise>
					</c:choose>
					</div>
					<div class="course_detail_label"><span>• 강좌시간</span>
						<c:forEach var="i" varStatus="stats_j" items="${teach.teach_day_arr}">
							<c:choose>
								<c:when test="${i eq '1'}">일</c:when>
								<c:when test="${i eq '2'}">월</c:when>
								<c:when test="${i eq '3'}">화</c:when>
								<c:when test="${i eq '4'}">수</c:when>
								<c:when test="${i eq '5'}">목</c:when>
								<c:when test="${i eq '6'}">금</c:when>
								<c:when test="${i eq '7'}">토</c:when>
							</c:choose>
							<c:if test="${!stats_j.last}">
								,
							</c:if>
						</c:forEach>
							${teach.start_time} ~ ${teach.end_time}
					</div>
				</div>
				<div class="course_detail_second">
					<div class="course_detail_label"><span>• 강좌장소</span>${teach.teach_stage}</div>
					<div class="course_detail_label"><span>• 수강대상</span>${teach.teach_target}</div>
				</div>
				<div class="course_detail_third">
					<div class="course_detail_label padding">• 안내사항</div>
					<div class="scroll">
							${teach.teach_desc}
					</div>
				</div>
			</div>
			<c:choose>
				<c:when test="${teach.teach_status eq '0'}">
					<div class="apply" onclick="teachEdit('${teach.group_idx}','${teach.category_idx}','${teach.teach_idx}','${teach.large_category_idx}', '1');">신청하기</div>
				</c:when>
				<c:when test="${teach.teach_status eq '1'}">
					<div class="apply" onclick="teachEdit('${teach.group_idx}','${teach.category_idx}','${teach.teach_idx}','${teach.large_category_idx}', '2');">대기자신청</div>
				</c:when>
				<c:when test="${teach.teach_status eq '2' or teach.teach_status eq '10'}">
					<div class="apply">신청완료</div>
				</c:when>
				<c:when test="${teach.teach_status eq '3'}">
					<div class="apply">대기자 신청완료</div>
				</c:when>
				<c:when test="${teach.teach_status eq '9'}">
					<div class="apply">수강종료</div>
				</c:when>
				<c:when test="${teach.teach_status eq '4'or teach.teach_status eq '44'}">
					<div class="apply">접수마감</div>
				</c:when>
				<c:when test="${teach.teach_status eq '5'}">
					<div class="apply">정원마감</div>
				</c:when>
				<c:when test="${tach.teach_status eq '6'}">
					<div class="apply">신청대기</div>
				</c:when>
			</c:choose>
		</div>

		<div class="popup_overlay" id="popup" style="display: none">
			<div class="popup_wrapper">
				<div class="popup_title">로그인</div>
				<div class="popup_content">
					회원 전용 서비스입니다.<br>
					확인 버튼을 클릭하면 로그인 화면으로 이동합니다.
				</div>
				<div class="button_wrapper">
					<div class="action_button white close">
						취소
					</div>
					<div class="action_button black">
						확인
					</div>
				</div>
			</div>
		</div>

		<jsp:include page="/WEB-INF/views/app/ict/typeA/kiosk/horizon/userNav.jsp"/>

		<jsp:include page="/WEB-INF/views/app/ict/typeA/kiosk/horizon/nav.jsp"/>
	</div>

</body>
</html>