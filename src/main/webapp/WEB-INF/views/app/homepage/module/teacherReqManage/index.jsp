<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tag" uri="/WEB-INF/config/tld/customTag.tld" %>
<script type="text/javascript">
$(function() {
	$('a.modify-btn').on('click', function(e) {
		e.preventDefault();
		doGetLoad('detail.do', 'teacher_idx=' + $(this).attr('keyValue2') + '&menu_idx=' + $('#teacherListForm #menu_idx').val());
// 		$(location).attr('href', )
	});

	$('button#search_btn').on('click', function(e) {
		$('#viewPage').val(1);
		doGetLoad('index.do', $('#teacherListForm').serialize());
// 		$(location).attr('href', 'index.do?'+$('#teacherListForm').serialize())
	});

	$('select#largeSubjectCode').on('change', function() {
		if ($(this).val() == '') {
			$('select#smallSubjectCode').val('');
		}
		$('#viewPage').val(1);
		doGetLoad('index.do', $('#teacherListForm').serialize());
	});

	$('select#smallSubjectCode').on('change', function() {
		$('#viewPage').val(1);
		doGetLoad('index.do', $('#teacherListForm').serialize());
	});
	
	$('select#teacher_location_code').on('change', function() {
		$('#viewPage').val(1);
		doGetLoad('index.do', $('#teacherListForm').serialize());
	});
});
</script>

<style>
	@media all and (max-width:768px){
		.m-none{display:none;}
	}

	@media all and (max-width:560px){
		.m-none2{display:none;}
	}
</style>

<form:form id="teacherListForm" modelAttribute="teacher" action="index.do">
	<form:hidden path="homepage_id"/>
	<form:hidden path="menu_idx"/>
	<div class="button btn-group inline" style="float: left; margin-bottom: 20px;">
		<span class="bbs-result">과목 계열 : </span>
		<label for="largeSubjectCode" />
		<form:select path="largeSubjectCode" cssClass="selectmenu" cssStyle="width:150px;" title="대과목 계열 선택">
			<form:option value="" label="전체"></form:option>
			<form:option value="Z" label="미지정"></form:option>
			<form:options items="${largeCodeList}" itemValue="code_id" itemLabel="code_name"/>
		</form:select>
		<label for="smallSubjectCode" />
		<form:select path="smallSubjectCode" cssClass="selectmenu" cssStyle="width:150px;"  title="소과목 계열 선택">
			<form:option value="" label="전체"></form:option>
			<form:options items="${smallCodeList}" itemValue="code_id" itemLabel="code_name"/>
		</form:select>
		&nbsp;<span class="bbs-result">강의가능지역 : </span>
   		<form:select path="teacher_location_code" cssClass="selectmenu"  title="지역 선택">
   			<form:option value="" label="없음"></form:option>
   			<form:options items="${locationCodeList}" itemLabel="code_name" itemValue="code_id"/>
   		</form:select>
	</div>
	<div class="button btn-group inline" style="float: right;">
	<span class="bbs-result">총 게시물 : <b><fmt:formatNumber value="${paging.totalDataCount}" pattern="#,###"/> </b>건</span>
		<label for="rowCount" />
		<form:select path="rowCount" cssClass="selectmenu" cssStyle="width:110px;" title="보기개수선택">
		<c:forEach var="i" begin="10" end="50" step="10">
			<form:option value="${i}">${i}개씩 보기</form:option>
		</c:forEach>
		</form:select>
	</div>
	<div class="" style="clear: both;">
		<table class="bbs center">
		<caption>강사현황 게시판</caption>
			<thead>
				<tr>
					<th class="m-none" width="50">번호</th>
					<th class="important">강사명</th>
					<th>강의가능지역</th>
					<th>과목구분</th>
					<th class="important m-none2" width="200">과목명</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${teacherListCount > 0 }">
						<c:forEach items="${teacherList}" var="i" varStatus="status">
							<tr>
								<td width="50" class="num m-none">${paging.listRowNum - status.index}</td>
								<c:set var="teacherName" value="${i.teacher_name}" />
								<c:set var="nameLength" value="${fn:length(teacherName)}" />
								<td class="important">
										${fn:substring(teacherName, 0, 1)}*${fn:substring(teacherName, 2, nameLength)}
								</td>
								<td class="file">${i.teacher_location_code_name}</td>
								<td >${i.subject_cd_name}</td>
								<td class="important left m-none2">${i.teacher_subject_name}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
					<tr>
						<td colspan="7">데이터가 존재하지 않습니다.</td>
					</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<p style="color: red;margin: 30px auto;">강사정보는 정보주체의 동의를 받아 공개된 정보이며 해당 정보를 목적
외 이용 시 개인정보보호법 등에 의거하여 처벌 받을 수 있습니다.</p>
		<jsp:include page="/WEB-INF/views/app/cms/common/paging.jsp" flush="false">
			<jsp:param name="formId" value="#teacherListForm"/>
		</jsp:include>

		<div class="search txt-center" style="margin-top:25px;"><!-- 하단 정렬 시 margin-top 입력 -->
			<fieldset>
				<form:select path="search_type" cssClass="selectmenu" cssStyle="width:100px;" title="검색분류선택">
					<form:option value="TEACHER_NAME">강사명</form:option>
					<form:option value="TEACHER_SUBJECT_NAME">과목명</form:option>
					<!--<form:option value="TEACHER_SEX">성별</form:option>20240507-->
				</form:select>
				<form:input path="search_text" cssClass="text" cssStyle="width:200px;" title="검색어 입력"/>
				<button id="search_btn"><i class="fa fa-search"></i><span>검색</span></button>
			</fieldset>
		</div>
	</div>
</form:form>
