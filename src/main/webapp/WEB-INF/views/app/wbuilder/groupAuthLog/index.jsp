<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
$(function(){
	$('select#rowCount').change(function(e) {
		$('#viewPage').val(1);
		doGetLoad('index.do', $('form#memberGroupAuthLog_index').serialize());
	});
	
	$('input#start_date').datepicker({
		maxDate: $('input#end_date').val(),
		onClose: function(selectedDate) {
			$('input#end_date').datepicker('option', 'minDate', selectedDate);
		}
	});
		
	$('input#end_date').datepicker({
		minDate: $('input#start_date').val(),
		onClose: function(selectedDate) {
			$('input#start_date').datepicker('option', 'maxDate', selectedDate);
		}
	});
	
	$('button#search-btn').on('click', function(e){
		$('#viewPage').val(1);
		doGetLoad('index.do',$('form#memberGroupAuthLog_index').serialize());
	});
	
	$('a#excelDownload').on('click', function(e) {
		e.preventDefault();

		if('${fn:length(memberGroupAuthLogList)}' > 0) {
			$('#memberGroupAuthLog_index').attr('action', 'excelDownload.do').submit();
		} else {
			alert('해당 내역이 없습니다.');
		}
	});
})

</script>

<form:form id="memberGroupAuthLog_index" modelAttribute="memberGroupAuthLog">
<div class="search">
	<fieldset>
		<label class="blind">검색</label>
		권한 수정 일시 :&nbsp;
		<input type="text" id="start_date" name="start_date" class="text ui-calendar" value="${memberGroupAuthLog.getStart_date()}"/>
		<input type="text" id="end_date" name="end_date" class="text ui-calendar" value="${memberGroupAuthLog.getEnd_date()}"/>
		&nbsp;
		검색 대상 :&nbsp; 
			<form:select path="search_type" cssClass="selectmenu">
				<form:option value="mod_id">권한 수정자 ID</form:option>
				<form:option value="member_id">권한 변경 대상</form:option>
			</form:select>
			<form:input path="search_text" cssClass="text" cssStyle="width:150px;"/>
		&nbsp;
		<button id="search-btn"><i class="fa fa-search"></i><span>검색</span></button>
	</fieldset>
</div>

<div class="infodesk" style="position: relative;">
	검색 결과 : ${paging.totalDataCount}건
	&nbsp;
	<form:select path="rowCount" class="selectmenu" style="width:100px;">
		<form:option value="10">10개씩 보기</form:option>
		<form:option value="20">20개씩 보기</form:option>
		<form:option value="30">30개씩 보기</form:option>
		<form:option value="50">50개씩 보기</form:option>
		<form:option value="${paging.totalDataCount}">전체 보기</form:option>
	</form:select>
</div>
<table class="type1 center">
	<colgroup>
		<col width="45"/>
		<col width="110"/>
		<col width="160"/>
		<col width="120"/>
		<col width="110"/>
		<col width=""/>
		<col width=""/>
	</colgroup>
	<thead>
		<tr>
			<th>순번</th>
			<th>권한 변경 대상</th>
			<th>권한 수정 일시</th>
			<th>권한 수정 IP</th>
			<th>권한 수정자 ID</th>
			<th>추가 권한</th>
			<th>삭제 권한</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${fn:length(memberGroupAuthLogList) < 1}">
			<tr>
				<td colspan="11">데이터가 존재하지 않습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="i" varStatus="status" items="${memberGroupAuthLogList}">
			<tr>
				<td>${paging.listRowNum - status.index}</td>
				<td>${i.member_id}</td>
				<td>${i.add_date}</td>
				<td>${i.add_ip}</td>
				<td>${i.mod_id}</td>
				<td>${i.added_auth}</td>
				<td>${i.removed_auth}</td>
			</tr>	
		</c:forEach>
	</tbody>
</table>
<div style="padding-top: 10px;">
<a href="#" id="excelDownload" class="btn btn2" style="float:right;"><i class="fa fa-file-excel-o"></i><span>엑셀 다운로드</span></a>
</div>
<jsp:include page="/WEB-INF/views/app/cms/common/paging.jsp" flush="false">
	<jsp:param name="formId" value="#memberGroupAuthLog_index"/>
	<jsp:param name="pagingUrl" value="index.do"/>
</jsp:include>
</form:form>
