<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
$(function(){

	<%--검색--%>
	$('button#search_btn').on('click', function(e) {
		$('#viewPage').val(1);
		doGetLoad('member_access.do', $('form#member_access_index').serialize());
	});

	<%--10개씩보기--%>
	$('select#rowCount').change(function(e) {
		$('#viewPage').val(1);
		doGetLoad('member_access.do', $('form#member_access_index').serialize());
	});

	$('select#workerList').change(function(e) {
		$('#viewPage').val(1);
		doGetLoad('member_access.do', $('form#member_access_index').serialize());
	});

	$('select#accessTypeList').change(function(e) {
		$('#viewPage').val(1);
		doGetLoad('member_access.do', $('form#member_access_index').serialize());
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

	$('button#search-btn').on('click', function(e) {
		$('#viewPage').val(1);
		doGetLoad('member_access.do', $('form#member_access_index').serialize());
	});

	$('a#excelDownload').on('click', function(e){
		e.preventDefault();
		$('#excelDownForm').attr('action', 'excelDownloadMemberAccess.do').submit();
	})
});
</script>
<form:form id="excelDownForm" modelAttribute="excelDownLog">
	<form:hidden path="add_id"/>
	<form:hidden path="add_ip"/>
	<form:hidden path="add_date"/>
	<form:hidden path="type"/>
	<form:hidden path="search_type"/>
	<form:hidden path="search_text"/>
	<form:hidden path="totalDataCount" value="${paging.totalDataCount}"/>
	<form:hidden path="start_date" id=""/>
	<form:hidden path="end_date" id=""/>
	<form:hidden path="site_id"/>
	<form:hidden path="worker_id"/>
</form:form>

<form:form id="member_access_index" modelAttribute="member" action="member_access.do" method="post" onsubmit="return false;">
<div class="search">
	<fieldset>
		<label class="blind">검색</label>
		작업자 선택:&nbsp;
		<select id="workerList" name="worker_id" class="selectmenu" style="width: 200px;">
			<option value=""></option>
			<c:forEach var="i" varStatus="status" items="${workerList}">
			<option value="${i.worker_id}" <c:if test="${i.worker_id eq param.worker_id}"> selected="selected"</c:if>>${i.worker_id}(${i.member_name})</option>
			</c:forEach>
		</select>
<!-- 		접근타입:&nbsp; -->
<!-- 		<select id="accessTypeList" name="access_type" class="selectmenu" style="width: 200px;"> -->
<!-- 			<option value=""></option> -->
<%-- 			<option value="L" <c:if test="${'L' eq param.access_type}"> selected="selected"</c:if>>L(목록 조회)</option> --%>
<%-- 			<option value="C" <c:if test="${'C' eq param.access_type}"> selected="selected"</c:if>>C(사용자 등록)</option> --%>
<%-- 			<option value="R" <c:if test="${'R' eq param.access_type}"> selected="selected"</c:if>>R(상세 정보 조회)</option> --%>
<%-- 			<option value="U" <c:if test="${'U' eq param.access_type}"> selected="selected"</c:if>>U(정보 수정)</option> --%>
<%-- 			<option value="D" <c:if test="${'D' eq param.access_type}"> selected="selected"</c:if>>D(사용자 삭제)</option> --%>
<!-- 		</select> -->
		기간:&nbsp;
		<input type="text" id="start_date" name="start_date" class="text ui-calendar" value="${param.start_date}"/>
		<input type="text" id="end_date" name="end_date" class="text ui-calendar" value="${param.end_date}"/>
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
			<col width="80"/>
			<col width="80"/>
			<col width="50"/>
			<col width="50"/>
			<col width="100"/>
			<col width="150"/>
			<col width="100"/>
			<col width="100"/>
			<col width="150"/>
			<col width="80"/>
		</colgroup>
		<thead>
			<tr>
				<th>순번</th>
				<th>년</th>
				<th>월</th>
				<th>일</th>
				<th>시</th>
				<th>도서관</th>
				<th>작업자</th>
				<th>이름</th>
				<th>메뉴</th>
				<th>접근IP</th>
			</tr>
		</thead>
		<tbody>
		<c:if test="${fn:length(accessLogList) < 1}">
			<tr>
				<td colspan="8">데이터가 존재하지 않습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="i" varStatus="status" items="${accessLogList}">
			<tr>
				<td>${paging.listRowNum - status.index}</td>
				<td>${i.year}</td>
				<td>${i.month}</td>
				<td>${i.day}</td>
				<td>${fn:substring(i.time, 0, 2)}:${fn:substring(i.time, 2, 4)}:${fn:substring(i.time, 4, 6)}</td>
				<td>${i.homepage_name}</td>
				<td>${i.worker_id}</td>
				<td>${i.member_name}</td>
				<td>${i.menu_id}</td>
				<td>${i.access_ip}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div style="padding-top: 10px;">
		<a href="#" id="excelDownload" class="btn btn2" style="float:right;"><i class="fa fa-file-excel-o"></i><span>엑셀 다운로드</span></a>
	</div>

	<jsp:include page="/WEB-INF/views/app/cms/common/paging.jsp" flush="false">
		<jsp:param name="formId" value="#member_access_index"/>
		<jsp:param name="pagingUrl" value="member_access.do"/>
	</jsp:include>

</form:form>

<div id="dialog-1" class="dialog-common" title="상세정보">
</div>