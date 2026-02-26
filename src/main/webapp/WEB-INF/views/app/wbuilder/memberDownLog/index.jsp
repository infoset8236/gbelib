<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
$(function(){
	
	$('select#rowCount').change(function(e) {
		$('#viewPage').val(1);
		doGetLoad('index.do', $('form#excelDownLog_index').serialize());
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
		doGetLoad('index.do',$('form#excelDownLog_index').serialize());
	});

	$('select#type').change(function(e) {
		$('#viewPage').val(1);
		doGetLoad('index.do', $('form#excelDownLog_index').serialize());
	});
	
	$('a#excelDownload').on('click', function(e){
		e.preventDefault();
		if(  $('#excelDownForm #totalDataCount').val() == 0  ){
			alert('목록이 존재하지 않습니다.');
			return false;
		} 
		$('#excelDownForm').attr('action', 'excelDownload.do').submit();
	})
})
</script>
<form:form id="excelDownForm" modelAttribute="excelDownLog">
<form:hidden path="add_id"/>
<form:hidden path="os"/>
<form:hidden path="browser"/>
<form:hidden path="ip"/>
<form:hidden path="add_date"/>
<form:hidden path="teach_name"/>
<form:hidden path="type"/>
<form:hidden path="search_type"/>
<form:hidden path="search_text"/>
<form:hidden path="totalDataCount" value="${paging.totalDataCount}"/>
<form:hidden path="start_date" id=""/>
<form:hidden path="end_date" id=""/>
</form:form>

<form:form id="excelDownLog_index" modelAttribute="excelDownLog" onsubmit="return false;">
<div class="search">
	<fieldset>
		<label class="blind">검색</label>
		다운로드 종류:&nbsp;
		<select id="type" name="type" class="selectmenu" style="width: 170px;">
			<option value>전체</option>
			<option value="1" <c:if test="${excelDownLog.getType() eq 1}"> selected="selected"</c:if>>수강생 리스트</option>
			<option value="2" <c:if test="${excelDownLog.getType() eq 2}"> selected="selected"</c:if>>출석부 리스트</option>
			
		</select>
		기간 :&nbsp;
		<input type="text" id="start_date" name="start_date" class="text ui-calendar" value="${excelDownLog.getStart_date()}"/>
		<input type="text" id="end_date" name="end_date" class="text ui-calendar" value="${excelDownLog.getEnd_date()}"/>
		&nbsp;
		검색 대상 :
		<form:select path="search_type" cssClass="selectmenu">
			<form:option value="add_id">다운로드 사용자 ID</form:option>
			<form:option value="teach_name">강좌명</form:option>
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


	<form:select path="site_id" class="selectmenu" style="width:170px;">
		<form:option value="">전체</form:option>
		<c:forEach var="i" items="${homepageList}">
			<form:option value="${i.homepage_id}">${i.homepage_name}</form:option>
		</c:forEach>
	</form:select>
</div>

<table class="type1 center">
		<colgroup>
			<col width="40"/>
			<col width="50"/>
			<col width="50"/>
			<col width="110"/>
			<col width="110"/>
			<col width="80"/>
			<col width="100"/>
			<col width="120"/>
			<col width="80"/>
			<col width=""/>

		</colgroup>
		<thead>
			<tr>
				<th>순번</th>
				<th>도서관</th>
				<th>다운로드<br>사용자 ID</th>
				<th>OS</th>
				<th>브라우저</th>
				<th>IP</th>
				<th>다운로드 일시</th>
				<th>강좌명</th>
				<th>다운로드 종류</th>
			</tr>
		</thead>
		<tbody>
		<c:if test="${fn:length(getAllExcelDownLog) < 1}">
			<tr>
				<td colspan="11">데이터가 존재하지 않습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="i" varStatus="status" items="${getAllExcelDownLog}">
			<tr>
				<td>${paging.listRowNum - status.index}</td>
				<td>${i.homepage_name}</td>
				<td>${i.add_id}</td>
				<td>${i.os}</td>
				<td>${i.browser}</td>
				<td>${i.ip}</td>
				<td>${i.add_date}</td>
				<td>${i.teach_name}</td>
				<c:if test="${(i.type)==1}">
					<td>수강생 리스트</td>
				</c:if>
				<c:if test="${(i.type)==2}">
					<td>출석부 리스트</td>
				</c:if>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div style="padding-top: 10px;">
	<a href="#" id="excelDownload" class="btn btn2" style="float:right;"><i class="fa fa-file-excel-o"></i><span>엑셀 다운로드</span></a>
	</div>
	<jsp:include page="/WEB-INF/views/app/cms/common/paging.jsp" flush="false">
		<jsp:param name="formId" value="#excelDownLog_index"/>
		<jsp:param name="pagingUrl" value="index.do"/>
	</jsp:include>
	
	
</form:form>