<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script type="text/javascript">
$(function() {
	$('button#search_btn').on('click', function(e) {
		$('#viewPage').val(1);
		$('#trainingListForm').submit();
		
		e.preventDefault();
	});
	
	$('a#dialog-add').on('click', function(e) {
		if ( $('#homepage_id_1').val() == '' ) {
			alert('홈페이지정보가 없습니다.');	
		}
		else {
			$('#dialog-1').load('edit.do?editMode=ADD&homepage_id=' + $('#homepage_id_1').val() + '&group_idx=' + $('select#group_idx').val() + '&category_idx=' + $('select#category_idx').val() , function( response, status, xhr ) {
				$('#dialog-1').dialog('open')
			});
		}
		
		e.preventDefault();
	});
	
	$('a.certificate-btn').on('click', function(e) {
		$('#dialog-2').load('getTrainingCertificateList.do?homepage_id=' + $('#homepage_id_1').val() + '&group_idx=' + $(this).attr('keyValue1') + '&category_idx=' + $(this).attr('keyValue2') + '&training_idx=' + $(this).attr('keyValue3'), function( response, status, xhr ) {
			$('#dialog-2').dialog('open')
		});
		
		e.preventDefault();
	});
	
	$('a#dialog-search-cert').on('click', function(e) {
		$('#dialog-3').load('getTrainingCertificateListByDate.do?editMode=FIRST&homepage_id=' + $('#homepage_id_1').val(), function( response, status, xhr ) {
			$('#dialog-3').dialog('open')
		});
		
		e.preventDefault();
	});
	
	$('a.dialog-modify').on('click', function(e) {
		$('#dialog-1').load('edit.do?editMode=MODIFY&homepage_id=' + $('#homepage_id_1').val() + '&group_idx=' + $(this).attr('keyValue1') + '&category_idx=' + $(this).attr('keyValue2') + '&training_idx=' + $(this).attr('keyValue3'), function( response, status, xhr ) {
			$('#dialog-1').dialog('open');
		});
		
		e.preventDefault();
	});
	
	$('a.delete-btn').on('click', function(e) {
		if (confirm("해당 강의를 삭제 하시겠습니까?")) {
			$('#hiddenForm #group_idx').val($(this).attr('keyValue1'));
			$('#hiddenForm #category_idx').val($(this).attr('keyValue2'));
			$('#hiddenForm #training_idx').val($(this).attr('keyValue3'));
			if(doAjaxPost($('#hiddenForm'))) {
				location.reload();
			}
		}
		e.preventDefault();
	});
	
	$('a#dialog-setting').on('click', function(e) {
		if ( $('#homepage_id_1').val() == '' ) {
			alert('홈페이지정보가 없습니다.');	
		} else {
			$('#dialog-4').load('setting.do?homepage_id=' + $('#homepage_id_1').val() , function( response, status, xhr ) {
				$('#dialog-4').dialog('open');
			});
		}
		
		e.preventDefault();
	});
	
	$('a#excelDownload').on('click', function(e) {
		$('#hiddenForm').attr('action', 'excelDownload.do').submit();
		$('#hiddenForm').attr('action', 'save.do');
		e.preventDefault();
	});
	
	$('select#homepage_id_1').on('change', function(e) {
		if($(this).val() != '') {
			$('input#homepage_id_1').val($(this).val());
			$('#trainingListForm').submit();
		}
		
		e.preventDefault();
	});
	
	$('select#large_category_idx').on('change', function() {
		$('#trainingListForm select#group_idx option.all').prop('selected', true);
		$('#trainingListForm select#category_idx option.all').prop('selected', true);
		$('#trainingListForm option.default').prop('selected', true);
		$('#trainingListForm #search_text').val('');
		$('#trainingListForm #viewPage').val(1);
		$('#trainingListForm').submit();
	});
	
	$('select#group_idx').on('change', function() {
		$('#trainingListForm select#category_idx option.all').prop('selected', true);
		$('#trainingListForm option.default').prop('selected', true);
		$('#trainingListForm #search_text').val('');
		$('#trainingListForm #viewPage').val(1);
		$('#trainingListForm').submit();
	});
	
	$('select#category_idx').on('change', function() {
		$('#trainingListForm option.default').prop('selected', true);
		$('#trainingListForm #search_text').val('');
		$('#trainingListForm #viewPage').val(1);
		$('#trainingListForm').submit();
	});
	
	$('#trainingListForm select#category_idx option').hide();
	$('#trainingListForm select#category_idx option.group_${training.group_idx}').show();
	$('#trainingListForm select#category_idx option.all').show();
	
	$('a#csvDownload').on('click', function(e) {
		e.preventDefault();
		$('#hiddenForm').attr('action', 'csvDownload.do').submit();
	});
	
});
</script>
<form:form id="hiddenForm" modelAttribute="training" action="save.do">
	<form:hidden path="editMode" value="DELETE"/>
	<form:hidden path="homepage_id"/>
	<form:hidden path="group_idx"/>
	<form:hidden path="category_idx"/>
	<form:hidden path="training_idx"/>
</form:form>

<form:form id="trainingListForm"  modelAttribute="training" action="index.do" >
	<form:hidden id="homepage_id_1" path="homepage_id"/>
	
	<div class="infodesk">
		검색 결과 : 총 ${trainingListCount}건
		<div class="button">
			<span>대분류 : 
				<form:select path="large_category_idx">
					<form:option class="all" value="0" label="전체" />
					<form:options itemValue="training_code" itemLabel="code_name" items="${trainingLargeCategoryList}"/>
				</form:select>
			</span>
			<span>중분류 : 
				<form:select path="group_idx">
					<form:option class="all" value="0" label="전체" />
					<form:options itemValue="group_idx" itemLabel="group_name" items="${categoryGroupList}"/>
				</form:select>
			</span>
			<span>소분류 : 
				<form:select path="category_idx" >
					<form:option class="all" value="0" label="전체" />
					<c:forEach items="${categoryList}" var="i">
		       				<form:option class="group_${i.group_idx}" value="${i.category_idx}" hidden="hidden">${i.category_name}</form:option>
		       			</c:forEach>
				</form:select>
			</span>
			<c:if test="${authC}">
				<a href="#" class="btn btn5 left" id="dialog-add"><i class="fa fa-plus"></i><span>등록</span></a>
				<a href="#" class="btn btn1 left" id="dialog-search-cert"><i class="fa fa-plus"></i><span>기간별 수료자 조회</span></a>
<!-- 				<a href="#" class="btn btn4 left" id="dialog-setting"><i class="fa fa-plus"></i><span>설정</span></a> -->
			</c:if>
		</div>
	</div>
	<!-- 교육소식 관리 table -->
	<table class="type1 center">
		<colgroup>
			<col width="50" />
			<col width="120" />
			<col width=""/>
			<col width="100" />
			<col width="100" />
			<col width="200" />
			<col width="120" />
			<col width="100" />
			<col width="80" />
			<col width="80" />
			<col width="80" />
			<col width="100" />
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>연수분류</th>
				<th>연수명</th>
				<th>연수계획서</th>	
				<th>연수대상</th>
				<th>연수일</th>
				<th>연수시간</th>	
				<th>연수장소</th>	
				<th>참여/모집</th>
				<th>참여/후보</th>
				<th>참여/오프</th>
				<th>기능</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="i" varStatus="status" items="${trainingList}">
				<tr>
					<td>${training.listRowNum - status.index}</td>
					<td>${i.large_category_name}<br/>${i.group_name}<br/>${i.category_name}</td>
					<td>
						${i.training_name}
					</td>
					<td><c:if test="${i.real_file_name ne null and i.real_file_name ne ''}"><a href="/cms/module/training/download/${i.homepage_id}/${i.group_idx}/${i.category_idx}/${i.training_idx}.do"><i class="fa fa-floppy-o"></i>${i.plan_file_name}</a></c:if></td>
					<td>${i.training_target}</td>
					<td>
						${i.start_date} ~ ${i.end_date}<br/>
						( 매주&nbsp;
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
						)
					</td>
					<td>${i.start_time} ~ ${i.end_time}</td>
					<td>${i.training_stage}</td>
					<td>${i.training_join_count} / ${i.training_limit_count}</td>
					<td>${i.training_backup_join_count} / ${i.training_backup_count}</td>
					<td>${i.training_off_join_count} / ${i.training_offline_count}</td>
					<td>
						<c:if test="${authU}">
							<a href="" class="btn dialog-modify" keyValue1="${i.group_idx}" keyValue2="${i.category_idx}" keyValue3="${i.training_idx}">수정</a>
						</c:if>
						<c:if test="${authD and i.training_join_count eq 0 and i.training_backup_join_count eq 0 and i.training_off_join_count eq 0}">
							<a href="" class="btn delete-btn" keyValue1="${i.group_idx}" keyValue2="${i.category_idx}" keyValue3="${i.training_idx}">삭제</a>
						</c:if>
						<a href="" class="btn btn1 certificate-btn" keyValue1="${i.group_idx}" keyValue2="${i.category_idx}" keyValue3="${i.training_idx}">수료자 조회</a>
					</td>
				</tr>
			</c:forEach>
			<c:if test="${trainingListCount eq 0}">
				<tr>
					<td colspan="12">데이터가 존재하지 않습니다.</td>
				</tr>
			</c:if>
		</tbody>
	</table>
	<jsp:include page="/WEB-INF/views/app/cms/common/paging.jsp" flush="false">
		<jsp:param name="formId" value="#trainingListForm"/>
	</jsp:include>
	
	<div class="search txt-center" style="margin-top:25px;">
		<fieldset>
			<form:select path="search_type" cssClass="selectmenu">
				<form:option class="default" value="">선택</form:option>
				<form:option value="a.TRAINING_NAME">연수명</form:option>
				<form:option value="a.TRAINING_TARGET">연수대상</form:option>
				<form:option value="a.TRAINING_STAGE">연수장소</form:option>
			</form:select>
			<form:input path="search_text" cssClass="text" cssStyle="width:200px;"/>
			<button id="search_btn"><i class="fa fa-search"></i><span>검색</span></button>
			<a href="#" id="excelDownload" class="btn btn2"><i class="fa fa-file-excel-o"></i><span>엑셀저장</span></a>
			<a href="#" id="csvDownload" class="btn btn2"><i class="fa fa-file-excel-o"></i><span>CSV저장</span></a>
		</fieldset>
		
	</div>
	<br/>
	<div class="ui-state-highlight">
		<em>* 연수 삭제는 해당 연수에 참여/후보/오프 신청 인원이 없는 연수만 가능 합니다.</em>
	</div>
</form:form>
	
<div id="dialog-1" class="dialog-common" title="연수 정보"></div>
<div id="dialog-2" class="dialog-common" title="수료자 조회"></div>
<div id="dialog-3" class="dialog-common" title="기간별 수료자 조회"></div>
<div id="dialog-4" class="dialog-common" title="1인당 연수수 설정"></div>
