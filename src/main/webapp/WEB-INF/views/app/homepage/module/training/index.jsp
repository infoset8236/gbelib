<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tag" uri="/WEB-INF/config/tld/cmsTag.tld" %>
<script type="text/javascript">
$(function(){
	$('a.detail-btn').on('click', function(e) {
		$('#training #group_idx').val($(this).attr('keyValue1'));
		$('#training #category_idx').val($(this).attr('keyValue2'));
		$('#training #training_idx').val($(this).attr('keyValue3'));
		$('#training #large_category_idx').val($(this).attr('keyValue4'));
		doGetLoad('/${homepage.context_path}/module/training/detail.do', serializeCustom($('form#training')));
		e.preventDefault();
	});
	
	$('a.add').on('click', function(e) {
		var $this = $(this);
		doGetLoad('/${homepage.context_path}/module/training/student2/edit.do', 
				'editMode=ADD&homepage_id='+$this.attr('keyValue1')+'&group_idx='+$this.attr('keyValue2')+'&category_idx='+$this.attr('keyValue3')
				+'&training_idx='+$this.attr('keyValue4')+'&large_category_idx='+$this.attr('keyValue5')+ '&apply_status='+ $this.attr('apply_status')+'&menu_idx='+$('input#menu_idx').val());
		
		e.preventDefault();
	});
	
	$('a.cancel').on('click', function(e) {
		e.preventDefault();
		
		if (confirm("취소하시면 해당강의에 재신청이 불가합니다.\n프로그램 신청을 취소하시겠습니까?")) {
			$('input#homepage_id').val($(this).attr('keyValue1'));
			$('input#category_idx').val($(this).attr('keyValue2'));
			$('input#training_idx').val($(this).attr('keyValue3'));
			$('input#editMode').val('CANCEL');
			
			doAjaxPost($('form#training'));
		}
	});
	
	$('a.trainingBook-btn').on('click', function(e) {
		e.preventDefault();
		var $this = $(this);
		doGetLoad('/${homepage.context_path}/module/trainingBook/index.do','menu_idx='+$('#menu_idx').val()+'&homepage_id='+$this.attr('keyValue1')+'&group_idx='+$this.attr('keyValue2')+'&category_idx='+$this.attr('keyValue3')+'&training_idx='+$this.attr('keyValue4')+'&large_category_idx='+$this.attr('keyValue5'));
	});
	
	$('select#category_idx').change(function() {
		
		doGetLoad('/${homepage.context_path}/module/training/index.do','menu_idx='+$('#menu_idx').val()+'&group_idx='+$('#group_idx').val()+'&category_idx='+$('#category_idx').val()+'&large_category_idx='+$('#large_category_idx').val());
	});
	
	$('div.tabmenu a').on('click', function(e) {
		e.preventDefault();
		var url = 'index.do';
		$('input#category_idx').attr('value', $(this).attr('keyValue'));
		var $form = $('form#training');
		var formData = serializeCustom($form);
		doGetLoad(url, formData);
	});

});
</script>
<form:form modelAttribute="training" action="/${homepage.context_path}/module/training/student/save.do" method="POST">
	<form:hidden path="group_idx"/>
	<form:hidden path="training_idx"/>
	<form:hidden path="menu_idx"/>
	<form:hidden path="category_idx"/>
	<form:hidden path="large_category_idx"/>

	<c:choose>
		<c:when test="${training.group_idx > 0 and fn:length(categoryList) > 0}">
			<div class="tabmenu tab1">
				<ul>
					<li class="${training.category_idx eq 0 ? 'active':''}"><a href="" keyValue=""style="font-size: 13px;">전체</a></li>
					<c:forEach items="${categoryList}" var="i" varStatus="status">
						<c:if test="${training.group_idx eq i.group_idx}">
					<li class="${training.category_idx eq i.category_idx ? 'active':''}"><a href="" keyValue="${i.category_idx}" style="font-size: 13px;">${i.category_name}</a></li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</c:when>
		<c:otherwise>
			<form:hidden path="category_idx"/>
		</c:otherwise>
	</c:choose>
</form:form>
<c:if test="${fn:length(trainingList) <1 }">
	<div class="nodata">
			<i class="fa fa-frown-o"></i>
		<p>등록된 프로그램이 없습니다.</p>
	</div>
</c:if>
<div class="op_wrap">
	<div class="smain">
		<c:forEach items="${trainingList}" var="i">
			<div class="item">
				<div class="op_title category">
					<span class="ca ty2">${i.group_name} ${i.category_name}</span>
					<c:if test="${fn:length(i.training_name) > 20}">
					<br/>
					</c:if>
					<a href="" class="name detail-btn" keyValue1="${i.group_idx}" keyValue2="${i.category_idx}" keyValue3="${i.training_idx}" keyValue4="${i.large_category_idx}">
						${i.training_name}
					</a>
					<a href="" class="name detail-btn btn btn6" style="float:right; text-align:center; width:85px; font-size: 13px;" keyValue1="${i.group_idx}" keyValue2="${i.category_idx}" keyValue3="${i.training_idx}" keyValue4="${i.large_category_idx}">
						<i class="fa fa-search"></i>상세보기
					</a>
				</div>
				<div class="box">
					<div class="box2">
						<ul class="con2">
							<li class="first"><div><label>접수기간 </label> : ${i.start_join_date}&nbsp;&nbsp;${i.start_join_time}&nbsp;&nbsp;&nbsp;~ &nbsp;&nbsp;&nbsp;${i.end_join_date}&nbsp;&nbsp;${i.end_join_time}</div></li>
							<li><div><label>장소</label> : ${i.training_stage}</div></li>
							<li><div><label>강좌일</label> : ${i.start_date} <c:if test="${i.start_date ne i.end_date}">~ ${i.end_date}</c:if> (
															<c:forEach var="j" varStatus="status_j" items="${i.training_day_arr}">
																<c:choose>
																	<c:when test="${j eq '1'}">일</c:when>
																	<c:when test="${j eq '2'}">월</c:when>
																	<c:when test="${j eq '3'}">화</c:when>
																	<c:when test="${j eq '4'}">수</c:when>
																	<c:when test="${j eq '5'}">목</c:when>
																	<c:when test="${j eq '6'}">금</c:when>
																	<c:when test="${j eq '7'}">토</c:when>
																</c:choose>
																<c:if test="${!status_j.last}">
																	, 
																</c:if>
															</c:forEach>
														) ${i.start_time} ~ ${i.end_time}
							</div></li>
							<li><div><label>강사명</label> : ${i.teacher_name}</div></li>
							<li><div>
				        		<label>강의계획서</label> : 
					         	<span class="important td1">
					         		<c:if test="${i.real_file_name ne null and i.real_file_name ne '' }">
					         			<a style="color:#00f" href="download/${i.homepage_id}/${i.group_idx}/${i.category_idx}/${i.training_idx}.do"><i class="fa fa-floppy-o"></i> ${i.plan_file_name}</a>
					         		</c:if>
				         		</span>
					        </div></li>
							
							<%-- <li><div><label>강좌설명</label> : ${i.training_desc}</div></li> --%>
							<li><div class="status">
								<label>모집인원</label> :
								<span><strong>온라인</strong> ${i.training_limit_count}명 </span>
								<c:if test="${i.training_offline_count > 0}"><span>, <strong>오프라인</strong> ${i.training_offline_count}명</span></c:if>
								<c:if test="${i.training_backup_count > 0}"><span>, ( <strong>후보자</strong> ${i.training_backup_count}명 )</span></c:if>
							</div></li>
							<li><div class="status">
								<label>접수현황</label> :
								<span>
									온라인 :
									<span ${i.training_join_count > 0 and (i.training_join_count eq i.training_limit_count)? 'style="color:red;"' : 'style="color:#e55832"'}>${i.training_join_count}</span> / ${i.training_limit_count}
								</span>
								<c:if test="${i.training_offline_count > 0}">
									<span>
										오프라인 :
										<span ${i.training_off_join_count > 0 and (i.training_off_join_count eq i.training_offline_count)? 'style="color:red;"' : 'style="color:#e55832"'}>${i.training_off_join_count}</span> / ${i.training_offline_count}
									</span>
								</c:if>
								<c:if test="${i.training_backup_count > 0}">
									<span>
										(
										후보자 :
										<span ${i.training_backup_join_count > 0 and (i.training_backup_join_count eq i.training_backup_count)? 'style="color:red;"' : 'style="color:#e55832"'}>${i.training_backup_join_count}</span> / ${i.training_backup_count}
										)
									</span>
								</c:if>
							</div></li>
							<li><div><label>모집대상</label> : ${i.training_target}</div></li>
							<c:if test="${i.cancle_use_yn eq 'Y'}">
							<li><div><label>취소기간</label> : ${i.start_cancle_date}&nbsp;${i.start_cancle_time} ~ ${i.end_cancle_date}&nbsp;${i.end_cancle_time} <c:if test="${i.apply_limit eq 'Y'}">(취소 기간 동안 신청 불가)</c:if></div></li>
							</c:if>
							<c:if test="${i.limit_hak_yn eq 'Y'}">
							<li><div><label>학년제한</label> : ${i.limit_hak_str} ~ ${i.limit_hak2_str}</div></li>
							</c:if>
						</ul>
					</div>
				</div>
				<div class="stat">
					<c:choose>
						<c:when test="${member.login and (member.loginType eq 'HOMEPAGE') and (i.member_key eq member.seq_no)}">
							<a class="btn btn3 trainingBook-btn" keyValue1="${i.homepage_id}" keyValue2="${i.group_idx}" keyValue3="${i.category_idx}" keyValue4="${i.training_idx}"keyValue5="${i.large_category_idx}" >출석부</a>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${i.training_status eq '0'}">
									<a href="" class="btn btn1 add" keyValue1="${i.homepage_id}" keyValue2="${i.group_idx}" keyValue3="${i.category_idx}" keyValue4="${i.training_idx}" keyValue5="${i.large_category_idx}" apply_status="1">
									<i class="fa fa-pencil-square-o"></i><span>연수신청 </span></a>
								</c:when>
								<c:when test="${i.training_status eq '1'}">
									<a href="" class="btn btn1 add" keyValue1="${i.homepage_id}" keyValue2="${i.group_idx}" keyValue3="${i.category_idx}" keyValue4="${i.training_idx}" keyValue5="${i.large_category_idx}" apply_status="2">
									<i class="fa fa-pencil-square-o"></i><span>대기자신청</span></a>
								</c:when>
								<c:when test="${i.training_status eq '2' or i.training_status eq '10'}">
									<a href="/${homepage.context_path}/module/training/applyList.do?menu_idx=${myTrainingListMenuIdx}" class="btn btn2">
									<i class="fa fa-circle-o"></i><span>신청완료</span></a>
								</c:when>
								<c:when test="${i.training_status eq '3'}">
									<a href="/${homepage.context_path}/module/training/applyList.do?menu_idx=${myTrainingListMenuIdx}" class="btn btn2">
									<i class="fa fa-circle-o"></i><span>대기자 신청완료</span></a>
								</c:when>
								<c:when test="${i.training_status eq '9'}">
									<a href="javascript:void(0);" class="btn" style="cursor: default;">
									<i class="fa fa-pencil"></i><span>종료</span></a>
								</c:when>
								<c:when test="${i.training_status eq '4'or i.training_status eq '44'}">
									<a href="javascript:void(0);" class="btn" style="cursor: default;">
									<i class="fa fa-pencil"></i><span>접수마감</span></a>
								</c:when>
								<c:when test="${i.training_status eq '5'}">
									<a href="javascript:void(0);" class="btn" style="cursor: default;">
									<i class="fa fa-user"></i><span>정원마감</span></a>
								</c:when>
								<c:when test="${i.training_status eq '6'}">
									<a href="javascript:void(0);" class="btn btn4" style="cursor: default;">
									<i class="fa fa-clock-o"></i><span>신청대기</span></a>
								</c:when>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

<div id="dialog-1" class="dialog-common" title="수강생 정보">
</div>