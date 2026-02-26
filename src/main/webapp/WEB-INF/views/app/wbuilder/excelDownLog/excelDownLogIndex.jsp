<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
$(function(){
	$('select#rowCount').change(function(e) {
		$('#viewPage').val(1);
		doGetLoad('excelDownLogIndex.do', $('form#excelDownLogIndexForm').serialize());
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
		doGetLoad('excelDownLogIndex.do',$('form#excelDownLogIndexForm').serialize());
	});

	$('select#type').change(function(e) {
		$('#viewPage').val(1);
		doGetLoad('excelDownLogIndex.do', $('form#excelDownLogIndexForm').serialize());
	});
	
	$('a#excelDownload').on('click', function(e){
		e.preventDefault();
		if(  $('#excelDownForm #totalDataCount').val() == 0  ){
			alert('목록이 존재하지 않습니다.');
			return false;
		}
		var excel_idx_arr = $('input[name=excel_idx_arr]:checked').map(function() { return $(this).val(); }).get().join(',');
		$('input#excel_idx_arr').val(excel_idx_arr);
		$('#excelDownForm').attr('action', 'excelDownloadReasonDown.do').submit();
	})

	$('input#checkAll').on('click', function() {
		$('input[type=checkbox][name=excel_idx_arr]').prop('checked', $(this).is(':checked'));
	});
})

function viewReason(idx, type) {
	var ajaxData = {
		'idx' : idx
	};

	$.ajax({
		url: 'excelDownLogReason.do',
		method: 'POST',
		data : ajaxData,
		success: function(html) {
			modal_layer_add('dialog_layer');
			$('#dialog_layer').html(html);

			$('#dialog_layer').dialog({
				resizable: false,
				modal: true,
				title: type + ' 다운로드 사유 조회',
				open: function(){
					$('.ui-widget-overlay').addClass('custom-overlay');
				},
				close: function(){
				},
				buttons: [
					{
						text: "닫기",
						"class": 'btn btn_round btn_gray',
						click: function() {
							$(this).dialog('close');
						}
					}
				]
			});

			$("#dialog_layer").dialog({
				width: 700,
				height: 175
			});
		},error: function(html) {
		}
	});
}
</script>
<form:form id="excelDownForm" modelAttribute="excelDownLog">
<form:hidden path="excel_idx_arr"/>
<form:hidden path="add_id"/>
<form:hidden path="add_ip"/>
<form:hidden path="add_date"/>
<form:hidden path="type"/>
<form:hidden path="search_type"/>
<form:hidden path="search_text"/>
<form:hidden path="totalDataCount" value="${paging.totalDataCount}"/>
<form:hidden path="start_date" id=""/>
<form:hidden path="end_date" id=""/>
<form:hidden path="homepage_id"/>
</form:form>

<form:form id="excelDownLogIndexForm" modelAttribute="excelDownLog" onsubmit="return false;">
<div class="search">
	<fieldset>
		<label class="blind">검색</label>
		다운로드 종류:&nbsp;
		<select id="type" name="type" class="selectmenu" style="width: 170px;">
			<option value>전체</option>
			<option value="excel" <c:if test="${excelDownLog.getType() eq 'excel'}"> selected="selected"</c:if>>엑셀</option>
			<option value="csv" <c:if test="${excelDownLog.getType() eq 'csv'}"> selected="selected"</c:if>>CSV</option>
			<option value="file" <c:if test="${excelDownLog.getType() eq 'file'}"> selected="selected"</c:if>>파일</option>

		</select>
		기간 :&nbsp;
		<input type="text" id="start_date" name="start_date" class="text ui-calendar" value="${excelDownLog.getStart_date()}"/>
		<input type="text" id="end_date" name="end_date" class="text ui-calendar" value="${excelDownLog.getEnd_date()}"/>
		&nbsp;
		검색 대상 :
		<form:select path="search_type" cssClass="selectmenu">
			<form:option value="add_id">접근ID</form:option>
			<form:option value="add_ip">접근IP</form:option>
		</form:select>
		<form:input path="search_text" cssClass="text" cssStyle="width:180px;"/>
		&nbsp;
		<button id="search-btn"><i class="fa fa-search"></i><span>검색</span></button>
	</fieldset>
</div>
<div class="infodesk">
	검색 결과 : ${paging.totalDataCount}건
	&nbsp;
	<form:select path="rowCount" class="selectmenu" style="width:100px;">
		<form:option value="10">10개씩 보기</form:option>
		<form:option value="20">20개씩 보기</form:option>
		<form:option value="30">30개씩 보기</form:option>
		<form:option value="50">50개씩 보기</form:option>
		<form:option value="${paging.totalDataCount}">전체 보기</form:option>
	</form:select>

	<form:select path="homepage_id" class="selectmenu" style="width:170px;">
		<form:option value="">전체</form:option>
		<c:forEach var="i" items="${homepageList}">
			<form:option value="${i.homepage_id}">${i.homepage_name}</form:option>
		</c:forEach>
	</form:select>
</div>

<table class="type1 center">
		<colgroup>
			<col width="50"/>
			<col width="80"/>
			<col width="210"/>
			<col width=""/>
			<col width="160"/>
			<col width="200"/>
			<col width="200"/>
			<col width="100"/>
			<col width="160"/>
		</colgroup>
		<thead>
			<tr>
				<th><input id="checkAll" type="checkbox"></th>
				<th>번호</th>
				<th>도서관명</th>
				<th>메뉴경로</th>
				<th>접근ID</th>
				<th>일시</th>
				<th>접근IP</th>
				<th>다운로드 종류</th>
				<th>관리</th>
			</tr>
		</thead>
		<tbody>
		<c:if test="${fn:length(excelDownLogReasonList) < 1}">
			<tr>
				<td colspan="8">데이터가 존재하지 않습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="i" varStatus="status" items="${excelDownLogReasonList}">
			<tr>
				<td><form:checkbox path="excel_idx_arr" value="${i.idx}"/></td>
				<td>${paging.listRowNum - status.index}</td>
				<td>${i.homepage_name}</td>
				<td>${i.menu_path}</td>
				<td>${i.add_id}</td>
				<td>${i.add_date}</td>
				<td>${i.add_ip}</td>
				<td>${i.type}</td>
				<td>
					<a href="javascript:void(0);" class="btn btn1" onclick="viewReason('${i.idx}', '${i.type}');">사유조회</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div style="padding-top: 10px;">
		<a href="#" id="excelDownload" class="btn btn2" style="float:right;"><i class="fa fa-file-excel-o"></i><span>엑셀 다운로드</span></a>
	</div>
	<jsp:include page="/WEB-INF/views/app/cms/common/paging.jsp" flush="false">
		<jsp:param name="formId" value="#excelDownLogIndexForm"/>
		<jsp:param name="pagingUrl" value="excelDownLogIndex.do"/>
	</jsp:include>
</form:form>