<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
$(function() {
	
	//신청자 수정버튼
	$('a.facility-cancel-btn').on('click', function(e) {
		e.preventDefault();
		if(confirm("해당 신청내역을 취소 하시겠습니까?")) {
			$('#applyEdit #homepage_id').val($(this).data('homepage'));
			$('#applyEdit #facility_idx').val($(this).data('facility'));
			$('#applyEdit #facility_req_idx').val($(this).data('req'));
			
			if ( doAjaxPost($('#applyEdit')) ) {
				location.reload();
			}
		}
		
	});
	
	
});
</script>
<c:choose>
	<c:when test="${facilityReq.menu_idx eq '247' or facilityReq.menu_idx eq '248' or facilityReq.menu_idx eq '206' or facilityReq.menu_idx eq '257' or facilityReq.menu_idx eq '258'}">
		<form:form modelAttribute="facilityReq" id="applyEdit" action="module/facility/save.do" method="post">
			<form:hidden path="editMode" value="CANCEL"/>
			<form:hidden path="homepage_id"/>
			<form:hidden path="facility_idx"/>
			<form:hidden path="facility_req_idx"/>
			<form:hidden path="desired_start_time"/>
			<form:hidden path="desired_end_time"/>
		</form:form>
	</c:when>
	<c:otherwise>
		<form:form modelAttribute="facilityReq" id="applyEdit" action="save.do" method="post">
			<form:hidden path="editMode" value="CANCEL"/>
			<form:hidden path="homepage_id"/>
			<form:hidden path="facility_idx"/>
			<form:hidden path="facility_req_idx"/>
			<form:hidden path="desired_start_time"/>
			<form:hidden path="desired_end_time"/>
		</form:form>
	</c:otherwise>
</c:choose>
	
<div class="table-wrap">
	<table class="type1 center">
		<colgroup>
			<col width="180"/>
			<col width="120"/>
			<col width="120"/>
			<col width="*"/>

			<c:if test="${facilityReq.homepage_id eq 'h2'}">
				<col width="90"/>
				<col width="90"/>
				<col width="90"/>
			</c:if>

			<c:if test="${facilityReq.homepage_id eq 'h23'}">
				<col width="120"/>
			</c:if>

			<col width="90"/>
			<col width="100"/>
		</colgroup>

		<thead>
			<tr>
				<th>시설물 명</th>
				<th>이용가능일</th>
				<th>이용시간</th>
				<th>사용목적</th>

				<c:if test="${facilityReq.homepage_id eq 'h2'}">
					<th>희망이용시작시간</th>
					<th>희망이용종료시간</th>
					<th>사용자신청인원</th>
				</c:if>

				<c:if test="${facilityReq.homepage_id eq 'h23'}">
					<th>전자칠판<br/>사용 여부</th>
				</c:if>

				<th>신청상태</th>
				<th>기능</th>
			</tr>
		</thead>

		<tbody>
			<c:choose>
				<c:when test="${fn:length(applyList) > 0}">
					<c:forEach var="i" items="${applyList}">
						<tr>
							<td>${empty i.facility_name ? '-' : i.facility_name}</td>
							<td>${empty i.use_date ? '-' : i.use_date}</td>
							<td>${i.start_time} ~ ${i.end_time}</td>
							<td>${empty i.apply_desc ? '-' : i.apply_desc}</td>

							<c:if test="${facilityReq.homepage_id eq 'h2'}">
								<td>${i.desired_start_time}</td>
								<td>${i.desired_end_time}</td>
								<td>${i.user_aplly_count}</td>
							</c:if>

							<c:if test="${facilityReq.homepage_id eq 'h23'}">
								<td>
									<c:choose>
										<c:when test="${i.blackboard_use_yn eq 'Y'}">사용함</c:when>
										<c:otherwise>사용안함</c:otherwise>
									</c:choose>
								</td>
							</c:if>

							<td>
								<c:choose>
									<c:when test="${i.apply_status eq '신청'}">
										<span class="status status1">신청</span>
									</c:when>
									<c:when test="${i.apply_status eq '승인'}">
										<span class="status status2">승인</span>
									</c:when>
									<c:when test="${i.apply_status eq '취소'}">
										<span class="status status3">취소</span>
									</c:when>
									<c:otherwise>-</c:otherwise>
								</c:choose>
							</td>

							<td>
								<c:if test="${i.apply_status ne '3'}">
									<a class="btn btn5 facility-cancel-btn"
									   data-homepage="${i.homepage_id}"
									   data-facility="${i.facility_idx}"
									   data-req="${i.facility_req_idx}">
									   취소
									</a>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</c:when>

				<c:otherwise>
					<tr>
						<td colspan="${facilityReq.homepage_id eq 'h2' ? 9 : (facilityReq.homepage_id eq 'h23' ? 8 : 6)}">
							데이터가 존재하지 않습니다.
						</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>
