<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
$(function(){
	$('select#rowCount').change(function(e) {
		$('#viewPage').val(1);
		doGetLoad('index.do', $('form#adminAuthLog_index').serialize());
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
		doGetLoad('index.do',$('form#adminAuthLog_index').serialize());
	});
	
	$('select#module_type').change(function(e) {
		$('#viewPage').val(1);
		doGetLoad('index.do', $('form#adminAuthLog_index').serialize());
	});
	
	$('a#excelDownload').on('click', function(e) {
		e.preventDefault();
		if ( $('#excelDownForm #totalDataCount').val() == 0 ) {
			alert('목록이 존재하지 않습니다.');
			return false;
		}
		$('#s').val($('#end_date').val());
		$('#excelDownForm').attr('action', 'excelDownload.do').submit();
	});
	
	
})

</script>
<form:form id="excelDownForm" modelAttribute="adminAuthLog">
<form:hidden path="add_id"/>
<form:hidden path="os"/>
<form:hidden path="browser"/>
<form:hidden path="ip"/>
<form:hidden path="add_dttm"/>
<form:hidden path="member_group_name"/>
<form:hidden path="menu_name"/>
<form:hidden path="auth_code_id"/>
<form:hidden path="change_type"/>
<form:hidden path="module_type"/>
<form:hidden path="search_type"/>
<form:hidden path="search_text"/>
<form:hidden path="search_type_1"/>
<form:hidden path="start_date" id=""/>
<form:hidden path="end_date" id=""/>
<form:hidden path="totalDataCount" value="${paging.totalDataCount}"/>
</form:form>

<form:form id="adminAuthLog_index" modelAttribute="adminAuthLog" onsubmit="return false;">
<div class="search">
	<fieldset class="table-action">
		<label class="blind">검색</label>
		권한 종류 :&nbsp;
		<select id="module_type" name="module_type" class="selectmenu" style="width: 150px;">
			<option value>전체</option>
			<option value="CMS" <c:if test="${adminAuthLog.getModule_type() eq 'CMS'}"> selected="selected"</c:if>>관리자 페이지</option>
			<option value="SITE" <c:if test="${adminAuthLog.getModule_type() eq 'SITE'}"> selected="selected"</c:if>>이용자 페이지</option>
		</select>&nbsp;
		기간 :&nbsp;
		<input type="text" id="start_date" name="start_date" class="text ui-calendar" value="${adminAuthLog.getStart_date()}"/>
		<input type="text" id="end_date" name="end_date" class="text ui-calendar" value="${adminAuthLog.getEnd_date()}"/>
		&nbsp;
		검색 대상 :&nbsp; 
			<form:select path="search_type" cssClass="selectmenu">
				<form:option value="add_id">권한 수정자 ID</form:option>
				<form:option value="member_group_name">권한 변경 대상</form:option>
			</form:select>
			<form:input path="search_text" cssClass="text" cssStyle="width:150px;"/>
		&nbsp;
		권한 여부 :&nbsp;
			<form:select path="search_type_1" cssClass="selectmenu">
				<form:option value="">전체</form:option>
				<form:option value="+">추가</form:option>
				<form:option value="-">삭제</form:option>
			</form:select>
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
		<col width="75"/>
		<col width="75"/>
		<col width="110"/>
		<col width="120"/>
		<col width="90"/>
		<col width="110"/>
		<col width="60"/>		
		<col width="80"/>
		<col width="120"/>
		<col width="60"/>
		<col width="40"/>
	</colgroup>
	<thead>
		<tr>
			<th>순번</th>
			<th>도서관</th>
			<th>권한 수정자 ID</th>
			<th>OS</th>
			<th>브라우저</th>
			<th>IP</th>
			<th>권한수정 일시</th>
			<th>권한 종류</th>
			<th>권한 변경 대상</th>
			<th>메뉴명</th>
			<th>권한</th>
			<th>구분</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${fn:length(getAdminAuthLogList) < 1}">
			<tr>
				<td colspan="11">데이터가 존재하지 않습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="i" varStatus="status" items="${getAdminAuthLogList}">
			<tr>
				<td>${paging.listRowNum - status.index}</td>
				<td>${i.homepage_name}</td>
				<td>${i.add_id }</td>
				<td>${i.os }</td>
				<td>${i.browser }</td>
				<td>${i.ip }</td>
				<td>${i.add_dttm }</td>
				<td>
					<c:if test="${i.module_type eq 'CMS' }">
					관리자
					</c:if>
					<c:if test="${i.module_type eq 'SITE' }">
					이용자
					</c:if>
				</td>
				<td>${i.member_group_name}</td>
				<td>${i.menu_name}</td>	
				<td>
					<c:if test="${i.auth_code_id eq 'C'}">
					등록 기능
					</c:if>
					<c:if test="${i.auth_code_id eq 'R'}">
					조회 기능
					</c:if>
					<c:if test="${i.auth_code_id eq 'U'}">
					수정 기능
					</c:if>
					<c:if test="${i.auth_code_id eq 'D'}">
					삭제 기능
					</c:if>
				</td>
				<td>
					<c:if test="${i.change_type eq '+'}">
						추가
					</c:if>
					<c:if test="${i.change_type eq '-' }">
						삭제
					</c:if>
				</td>
			</tr>	
		</c:forEach>
	</tbody>
</table>
<div style="padding-top: 10px;">
<a href="#" id="excelDownload" class="btn btn2" style="float:right;"><i class="fa fa-file-excel-o"></i><span>엑셀 다운로드</span></a>
</div>
<jsp:include page="/WEB-INF/views/app/cms/common/paging.jsp" flush="false">
	<jsp:param name="formId" value="#adminAuthLog_index"/>
	<jsp:param name="pagingUrl" value="index.do"/>
</jsp:include>
</form:form>
