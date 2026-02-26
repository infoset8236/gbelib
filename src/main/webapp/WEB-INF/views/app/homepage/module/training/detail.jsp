<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script src="/resources/cms/js/malsup.jquery.form.min.js"
	type="text/javascript"></script>
<script type="text/javascript">
$(function() {
	$('a.apply-btn').on('click', function(e) {
		doGetLoad('/${homepage.context_path}/module/training/student2/edit.do', 'editMode=ADD&homepage_id=${homepage.homepage_id}&group_idx=${training.group_idx}'
			+'&category_idx=${training.category_idx}&training_idx=${training.training_idx}&large_category_idx=${training.large_category_idx}&apply_status='+$(this).attr('apply_status')+'&menu_idx=${training.menu_idx}');
		e.preventDefault();
	});

	$('a#back-btn').on('click', function(e) {
		e.preventDefault();
		history.back();
	});
	
});
</script>


<div class="teach_wrap">
	<div class="teach_top">
		<h3>${training.training_name}</h3>
	</div>

	<div class="auto-scroll teach_detail">
		<table class="tstyle nohead" id="teach_table" summary="강의 상세내용입니다.">
			<caption>강의 상세내용입니다.</caption>
			<colgroup>
				<col width="20%"/>
				<col width="30%"/>
				<col width="20%"/>
				<col width="30%"/>
			</colgroup>
			<tbody>
				<c:if test="${not empty training.image_real_file_name}">
				<tr>
					<th class="center" colspan="4">
						<img src="/data/training/${homepage.homepage_id}/img/${training.image_real_file_name}" style="width: 100%;" > 
					</th>
				</tr>
				</c:if>
				<tr>
					<th class="center">강의 분류</th>
					<td colspan="3">${training.group_name} ${training.category_name}</td>
				</tr>
				<tr>
					<th class="center">강의 설명</th>
					<td colspan="3">${training.training_desc}</td>
				</tr>
				<tr class="mAllpx">
					<th class="center">강의장소</th>
					<td>${training.training_stage}</td>
					<th class="center">강사명</th>
					<td>${training.teacher_name}</td>
				</tr>
				<tr class="mAllpx">
					<th class="center">준비물 및 재료비</th>
					<td>${training.training_etc}</td>
					<th class="center">강의대상</th>
					<td>${training.training_target}</td>
				</tr>
				
				
				<tr class="m330px">
					<th class="center">강의장소</th>
					<td colspan="3">${training.training_stage}</td>
				</tr>
				<tr class="m330px">
					<th class="center">강사명</th>
					<td colspan="3">${training.training_name}</td>
				</tr>
				<tr class="m330px">
					<th class="center">준비물 및 재료비</th>
					<td colspan="3">${training.training_etc}</td>
				</tr>
				<tr class="m330px">
					<th class="center">강의대상</th>
					<td colspan="3">${training.training_target}</td>
				</tr>
				
				
				
				
				
				<c:if test="${training.limit_hak_yn eq 'Y'}">
				<tr>
					<th class="center">학년제한</th>
					<td colspan="3">${training.limit_hak_str} ~ ${training.limit_hak2_str}</td>
				</tr>
				</c:if>
				<tr>
					<th class="center">강의계획서</th>
					<td colspan="3">
						<c:if test="${training.real_file_name ne null and training.real_file_name ne '' }">
							<a style="color: #00f" href="download/${training.homepage_id}/${training.group_idx}/${training.category_idx}/${training.training_idx}.do">
							<i class="fa fa-floppy-o"></i> ${training.plan_file_name}</a>
						</c:if>
					</td>
				</tr>
				<tr>
					<th class="center">접수기간</th>
					<td colspan="3">${training.start_join_date} ${training.start_join_time} ~ ${training.end_join_date} ${training.end_join_time}</td>
				</tr>
				<tr>
					<th class="center">강의기간(*)</th>
					<td colspan="3">${training.start_date} ~ ${training.end_date}</td>
				</tr>
				
				
				
				<tr class="mAllpx">
					<th class="center">강의시간</th>
					<td>${training.start_time } ~ ${training.end_time }</td>
					<th class="center">강의요일</th>
					<td>
						<c:forEach var="i" varStatus="stats_j" items="${training.training_day_arr}">
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
					</td>
				</tr>
				
				
				<tr class="m330px";>
					<th class="center">강의시간</th>
					<td colspan="3">${training.start_time } ~ ${training.end_time }</td>
				</tr>
				<tr class="m330px";>
					<th class="center">강의요일</th>
					<td colspan="3">
						<c:forEach var="i" varStatus="stats_j" items="${training.training_day_arr}">
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
					</td>
				</tr>
				
				
				
				
				
				<tr>
					<th class="center">현재 참여 / 모집</th>
					<td colspan="3">${training.training_join_count} 명 / ${training.training_limit_count} 명</td>
				</tr>
				<c:if test="${training.training_offline_count ne 0}">
				<tr>
					<th class="center">현재 오프라인 / 오프라인</th>
					<td colspan="3">${training.training_off_join_count} 명 / ${training.training_offline_count} 명</td>
				</tr>
				</c:if>
				<c:if test="${training.training_backup_count ne 0}">
				<tr>
					<th class="center">현재 대기자 / 대기자</th>
					<td colspan="3">${training.training_backup_join_count}명 / ${training.training_backup_count} 명</td>
				</tr>
				</c:if>
				<c:if test="${fn:length(training.holidays) > 0}">
				<tr>
					<th class="center">휴강일</th>
					<td colspan="3">
						<c:forEach items="${training.holidays}" var="i" varStatus="status">
						<c:if test="${!status.first}">, </c:if>
						${i}
						</c:forEach>
					</td>
				</tr>
				</c:if>
			</tbody>
		</table>
	</div>

<div class="sbtn">
	<a id="back-btn" href="" class="btn"><i class="fa fa-reorder"></i><span>목록으로</span></a>
	<c:choose>
	<c:when test="${training.training_status eq '0'}">
		<a href="" class="btn btn1 apply-btn" apply_status="1">
		<i class="fa fa-pencil-square-o"></i><span>수강신청 </span></a>
	</c:when>
	<c:when test="${training.training_status eq '1'}">
		<a href="" class="btn btn1 apply-btn" apply_status="2">
		<i class="fa fa-pencil-square-o"></i><span>대기자신청</span></a>
	</c:when>
	<c:when test="${training.training_status eq '2' or training.training_status eq '10'}">
		<a href="/${homepage.context_path}/module/training/applyList.do?menu_idx=${myTrainingListMenuIdx}" class="btn btn2">
		<i class="fa fa-circle-o"></i><span>신청완료</span></a>
	</c:when>
	<c:when test="${training.training_status eq '3'}">
		<a href="/${homepage.context_path}/module/training/applyList.do?menu_idx=${myTrainingListMenuIdx}" class="btn btn2">
		<i class="fa fa-circle-o"></i><span>대기자 신청완료</span></a>
	</c:when>
	<c:when test="${training.training_status eq '9'}">
		<a href="javascript:void(0);" class="btn" style="cursor: default;">
		<i class="fa fa-pencil"></i><span>수강종료</span></a>
	</c:when>
	<c:when test="${training.training_status eq '4'or i.training_status eq '44'}">
		<a href="javascript:void(0);" class="btn" style="cursor: default;">
		<i class="fa fa-pencil"></i><span>접수마감</span></a>
	</c:when>
	<c:when test="${training.training_status eq '5'}">
		<a href="javascript:void(0);" class="btn" style="cursor: default;">
		<i class="fa fa-user"></i><span>정원마감</span></a>
	</c:when>
	<c:when test="${tach.training_status eq '6'}">
		<a href="javascript:void(0);" class="btn btn4" style="cursor: default;">
		<i class="fa fa-clock-o"></i><span>신청대기</span></a>
	</c:when>
</c:choose>
</div>

</div>
