<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
$(function(){
	$('button#search_btn, .search_qr_btn').on('click', function(e) {
		$('#viewPage_ajax').val(1);
		doAjaxLoad('#studentLayer', 'student.do', serializeCustom($('#studentListForm')));
		e.preventDefault();
	});

	$('#qr_count, input[name="attendance_status"]').on('change', function(e) {
		$('#viewPage_ajax').val(1);
		doAjaxLoad('#studentLayer', 'student.do', serializeCustom($('#studentListForm')));
		e.preventDefault();
	});

	$('.check-btn').on('click', function(e) {
		e.preventDefault();
		$('#studentListForm #editMode').val('QR');
		$('#studentListForm #training_book_manage_idx').val($(this).attr('keyValue1'));
		$('#studentListForm #training_status').val('2');
		$('#studentListForm #training_type').val('2');
		$('#studentListForm').attr('action', 'save.do');
		if (doAjaxPost($('#studentListForm'))) {
			$('.training_btn_${training.training_idx}').click();
		}
		$('#studentListForm').attr('action', 'student.do');
	});

	$('#checkBtn').on('click', function(e) {
		e.preventDefault();

		if ($('.training_book_manage_idx_arr:checked').length === 0) {
			alert('출석 처리할 대상을 선택해주세요.');
			return;
		}

		$('#studentListForm #editMode').val('QR');
		$('#studentListForm #training_status').val('2');
		$('#studentListForm #training_type').val('2');
		$('#studentListForm').attr('action', 'save.do');
		if (doAjaxPost($('#studentListForm'))) {
			$('.training_btn_${training.training_idx}').click();
		}
		$('#studentListForm').attr('action', 'student.do');
	});

	$('#uncheckBtn').on('click', function(e) {
		e.preventDefault();

		if ($('.training_book_manage_idx_arr:checked').length === 0) {
			alert('미출석 처리할 대상을 선택해주세요.');
			return;
		}

		$('#studentListForm #editMode').val('notQR');
		$('#studentListForm #training_status').val('1');
		$('#studentListForm').attr('action', 'save.do');
		if (doAjaxPost($('#studentListForm'))) {
			$('.training_btn_${training.training_idx}').click();
		}
		$('#studentListForm').attr('action', 'student.do');
	});

	$('a#excelDownload').on('click', function(e) {
		e.preventDefault();

		if ( '${teachBookManage.teach_idx}' == 0 ){
			alert('선택된 강좌가 없습니다.');
			return false;
		}

		$('#excelDownloadForm #sel_date').val($('#search_start_date').val().substring(0,7));

		$('#excelDownloadForm').submit();
	});

	$('a#csvDownload').on('click', function(e) {
		e.preventDefault();

		if ( '${trainingBookManage.training_idx}' == 0 ){
			alert('선택된 연수가 없습니다.');
			return false;
		}

		$('#excelDownloadForm').attr('action', 'csvDownload.do').submit();
	});

	$('input#checkAll').on('click', function(e) {
		$('input[type=checkbox].training_book_manage_idx_arr').prop('checked', $(this).is(':checked'));
	});

	$('#search_start_date').datepicker({
		dateFormat: 'yy-mm-dd',
		maxDate: $('#search_end_date').val(),
		onClose: function(selectedDate){
			$('#search_end_date').datepicker('option', 'minDate', selectedDate);
		}
	});

	$('#search_end_date').datepicker({
		dateFormat: 'yy-mm-dd',
		minDate: $('#search_start_date').val(),
		onClose: function(selectedDate){
			$('#search_start_date').datepicker('option', 'maxDate', selectedDate);
		}
	});
});
</script>

<style>
    #checkBtn{
        background-color: #0059ac;
        border-color: #395eac;
        margin-right: 5px;
    }
    #uncheckBtn{
        background-color: #4da5ff;
        border-color: #149aeb;
    }
    .btn-wrapper{
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 10px;
    }
	input.ui-calendar{
		background: #fff url(/resources/common/img/calendar-icon.gif) no-repeat 103px center;
	}
</style>

<form:form id="studentListForm" modelAttribute="teachBookManage" action="student.do">
	<form:hidden path="homepage_id"/>
	<form:hidden path="teach_idx"/>
	<form:hidden path="student_idx" />
	<form:hidden path="teach_book_manage_idx"/>
	<form:hidden path="teach_status"/>
	<form:hidden path="teach_type"/>
	<form:hidden path="editMode"/>
		<div class="mask"></div>
	<div class="btn-wrapper">
        <div style="display: flex; align-items: center; gap: 12px;">
            검색 결과 : ${teachBookManageCount}건
            <div class="radio-group attendance">
                <label>
                    <form:radiobutton path="attendance_status" value="ALL"/>
                    <span>전체</span>
                </label>

                <label>
					<form:radiobutton path="attendance_status" value="2"/>
                    <span>출석완료</span>
                </label>

                <label>
					<form:radiobutton path="attendance_status" value="1"/>
                    <span>미출석</span>
                </label>
            </div>
            <div style="display: flex; align-items: center; gap: 5px;">
                <form:input id="search_start_date" path="search_start_date" class="text ui-calendar" placeholder="조회시작일 선택" readonly="true"/> ~
                <form:input id="search_end_date" path="search_end_date" class="text ui-calendar" placeholder="조회종료일 선택" readonly="true"/>
				<a class="btn btn1 search_qr_btn">검색</a>
            </div>
        </div>
	</div>
	<table class="type1 center">
		<colgroup>
			<col width="5%"/>
			<col width="5%"/>
			<col width="5%"/>
			<col width="10%"/>
			<col width="5%"/>
			<col width="10%"/>
		</colgroup>
		<thead>
			<tr>
				<th>이름</th>
				<th>ID</th>
				<th>생년월일</th>
				<th>휴대폰 번호</th>
				<th>출석현황</th>
				<th>출석일시</th>
			</tr>
		</thead>
		<tbody>
		<c:if test="${fn:length(teachBookManageList) < 1}">
			<tr style="height:100%">
				<td colspan="6">데이터가 존재하지 않습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="i" varStatus="status" items="${teachBookManageList}">
			<tr>
				<td class="num">${i.student_name}</td>
				<td class="num">${i.web_id}</td>
				<td class="num">${i.student_birth}</td>
				<td class="num">${i.applicant_cell_phone}</td>
				<td class="num">
					<c:choose>
						<c:when test="${i.teach_status eq '1'}">
							미출석
						</c:when>
						<c:when test="${i.teach_status eq '2'}">
							출석
						</c:when>
					</c:choose>
				</td>
				<td class="num">
					<fmt:formatDate value="${i.teach_date}" pattern="yyyy-MM-dd HH:mm:ss" />
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>

	<jsp:include page="/WEB-INF/views/app/cms/common/paging_ajax.jsp" flush="false">
		<jsp:param name="formId" value="#studentListForm"/>
		<jsp:param name="layerId" value="#studentLayer"/>
		<jsp:param name="pagingUrl" value="student.do"/>
	</jsp:include>

	<div class="search txt-center" style="margin-top:25px;"><!-- 하단 정렬 시 margin-top 입력 -->
		<fieldset>
			<form:select path="search_type" cssClass="selectmenu">
				<form:option value="student_name">이름</form:option>
			</form:select>
			<form:input path="search_text" cssClass="text" cssStyle="width:200px;"/>
			<button id="search_btn"><i class="fa fa-search"></i><span>검색</span></button>
			<a href="#" id="excelDownload" class="btn btn2"><i class="fa fa-file-excel-o"></i><span>엑셀저장</span></a>
		</fieldset>
	</div>
</form:form>

<form:form id="excelDownloadForm" action="/cms/module/teachBook/excelDownload.do" modelAttribute="teachBook" hidden="hidden" method="get">
	<input type="hidden" name="_csrf" value="${_csrf.token}">
	<input type="hidden" name="teach_idx" value="${teach.teach_idx}">
	<input type="hidden" name="homepage_id" value="${teach.homepage_id}">
	<input type="hidden" name="group_idx" value="${teach.group_idx}">
	<input type="hidden" name="category_idx" value="${teach.category_idx}">
	<input type="hidden" name="large_category_idx" value="${teach.large_category_idx}">
	<input type="hidden" id="sel_date" name="sel_date">
</form:form>
