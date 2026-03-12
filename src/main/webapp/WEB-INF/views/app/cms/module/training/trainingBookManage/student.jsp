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

		if ( '${trainingBookManage.training_idx}' == 0 ){
			alert('선택된 연수가 없습니다.');
			return false;
		}

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

<form:form id="studentListForm" modelAttribute="trainingBookManage" action="student.do">
	<form:hidden path="homepage_id"/>
	<form:hidden path="training_idx"/>
	<form:hidden path="student_idx" />
	<form:hidden path="training_book_manage_idx"/>
	<form:hidden path="training_status"/>
	<form:hidden path="training_type"/>
	<form:hidden path="editMode"/>
		<div class="mask"></div>
	<div class="btn-wrapper">
        <div style="display: flex; gap: 12px;">
            검색 결과 : ${trainingBookManageCount}건
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

        <div style="display: flex; align-items: center; gap: 5px;">
            <div class="button btn-group inline">
                <a class="btn btn2" id="checkBtn">출석처리</a>
                <a class="btn btn2" id="uncheckBtn">미출석처리</a>
            </div>
			회차 선택:
			<form:select path="qr_count" cssClass="selectmenu">
				<form:option value="">전체</form:option>
				<c:forEach var="i" begin="1" end="${training.qr_check_count}">
					<form:option value="${i}">${i}회차</form:option>
				</c:forEach>
			</form:select>
        </div>
	</div>
	<table class="type1 center">
		<colgroup>
			<col width="3%">
			<col width="5%" />
			<col width="5%" />
			<col width="5%" />
			<col width="10%" />
			<col width="5%" />
			<col width="5%" />
			<col width="5%" />
			<col width="5%" />
			<col width="10%" />
			<col width="10%" />
		</colgroup>
		<thead>
			<tr>
				<th><input type="checkbox" id="checkAll"></th>
				<th>이름</th>
				<th>ID</th>
				<th>생년월일</th>
				<th>신청시 소속기관</th>
				<th>휴대폰 번호</th>
				<th>직급</th>
				<th>출석현황</th>
				<th>출석방식</th>
				<th>출석일시</th>
				<th>기능</th>
			</tr>
		</thead>
		<tbody>
		<c:if test="${fn:length(trainingBookManageList) < 1}">
			<tr style="height:100%">
				<td colspan="11"
>데이터가 존재하지 않습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="i" varStatus="status" items="${trainingBookManageList}">
			<tr>
				<td><form:checkbox path="training_book_manage_idx_arr" cssClass="training_book_manage_idx_arr" value="${i.training_book_manage_idx}"/></td>
				<td class="num">${i.student_name}</td>
				<td class="num">${i.web_id}</td>
				<td class="num">${i.student_birth}</td>
				<td class="num">${i.belong_name}</td>
				<td class="num">${i.applicant_cell_phone}</td>
				<td class="num">${i.student_rank}</td>
				<td class="num">
					<c:choose>
						<c:when test="${i.training_status eq '1'}">
							미출석
						</c:when>
						<c:when test="${i.training_status eq '2'}">
							출석
						</c:when>
					</c:choose>
				</td>
				<td class="num">
					<c:choose>
						<c:when test="${i.training_type eq '1'}">
							QR출석
						</c:when>
						<c:when test="${i.training_type eq '2'}">
							수동출석
						</c:when>
					</c:choose>
				</td>
				<td class="num">
					<fmt:formatDate value="${i.training_date}" pattern="yyyy-MM-dd HH:mm:ss" />
				</td>
				<td>
					<a href="" class="btn check-btn" keyValue1="${i.training_book_manage_idx}">수동출석</a><br/>
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
				<form:option value="belong_name">소속기관</form:option>
				<form:option value="student_rank">직급</form:option>
			</form:select>
			<form:input path="search_text" cssClass="text" cssStyle="width:200px;"/>
			<button id="search_btn"><i class="fa fa-search"></i><span>검색</span></button>
			<a href="#" id="excelDownload" class="btn btn2"><i class="fa fa-file-excel-o"></i><span>엑셀저장</span></a>
		</fieldset>
	</div>
</form:form>

<form:form id="excelDownloadForm" action="excelDownload.do" modelAttribute="TraininigBookManage" hidden="hidden" >
	<input type="hidden" name="_csrf" value="${_csrf.token}">
	<input type="hidden" name="training_idx" value="${training.training_idx}">
</form:form>
