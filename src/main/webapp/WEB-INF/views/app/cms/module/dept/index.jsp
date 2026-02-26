<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
$(function() {
	$('a#searchBtn').on('click', function(e){
		e.preventDefault();
		$('#viewPage').val(1);
		doGetLoad('index.do', serializeCustom($('form#dept')));
	});
	
	<%--수정--%>
	$('a.modify').on('click', function(event) {
		$('#dialog-1').load('edit.do?editMode=MODIFY&code_id=' + $(this).attr('keyValue'), function( response, status, xhr ) {
			$('#dialog-1').dialog('open');
		});
		
		event.preventDefault();
	});
	<%--등록--%>
	$('a.add').on('click', function(event) {
		$('#dialog-1').load('edit.do?editMode=ADD', function( response, status, xhr ) {
			$('#dialog-1').dialog('open');
		});
		
		event.preventDefault();
	});
	$('#excelDownload').click(function(){
		doGetLoad('excelDownload.do', serializeCustom($('form#dept')));
	});

	$('#excelUpload').click(function(){
		if($('input#mfile').val() == '') {
			alert('엑셀 파일을 선택해주세요.');
			return;
		}
		var form = $('form#dept')[0];
		var data = new FormData(form);

		$.ajax({
			type : "POST",
			enctype: 'multipart/form-data',
			url : 'excelUploadSave.do',
			data : data,
			dataType : 'json',
			processData: false,
			contentType: false,
			success: function(response) {
				if(response.valid) {
					alert('엑셀데이터 일괄 회원가입에 성공하였습니다.');
				} else {
					alert(response.message);
				}
				location.reload();
			},
			error : function() {
				alert('엑셀등록에 실패했습니다.\n관리자에게 문의해 주세요.');
			}
		});
	});
});
</script>
<form:form modelAttribute="dept" action="index.do" method="get" onsubmit="return false;">	

<div class="infodesk">
	<form:select path="search_type" class="selectmenu">
		<form:option value="GROUP_NAME">관할조직명</form:option>
		<form:option value="CODE_NAME">조직명</form:option>
	</form:select>		
	<form:input path="search_text" class="text" />
	<a class="btn btn1 btn-small btn-inverse" id="searchBtn">
		<span>검색</span>
	</a>
	<div class="button">
		<c:if test="${authC}">
			<a href="javascript:void(0)" class="btn btn5 left add"><i class="fa fa-plus"></i><span>등록</span></a>
			<a href="javascript:void(0)" id="excelDownload" class="btn btn1 left"><span>양식다운로드</span></a>
			<form:input path="mfile" name="mfile" type="file"/><a href="javascript:void(0)" id="excelUpload" class="btn btn1 left"></i><span>일괄등록</span></a>
		</c:if>
	</div>
</div>

<spna>검색 결과 : 총 ${paging.totalDataCount}건 </spna>

<table class="type2 center">
	<colgroup>
       	<col width="100" />
       	<col width="200" />
       	<col width="200" />
       	<col width="*" />
       	<col width="150"/>
       	<col width="50"/>
       	<col width="100"/>
     	</colgroup>
     	<thead>
     		<tr>
     			<th>조직코드</th>
     			<th>조직명</th>
     			<th>관할조직명</th>
     			<th>(우편번호) 주소</th>
     			<th>담당자정보</th>
     			<th>사용여부</th>
     			<th>기능</th>
     		</tr>
     	</thead>
     	<tbody>
     		<c:forEach items="${deptList}" var="i">
      		<tr>
      			<td>${i.code_id}</td>
      			<td>${i.code_name}</td>
      			<td>${i.group_name}</td>
      			<td>(${fn:trim(i.zipcode)}) ${i.address}</td>
      			<td>
      				<c:if test="${not empty i.manager_name and not empty i.manager_phone }">
	      				${i.manager_name} <br> (${i.manager_phone})
      				</c:if>
      			</td>
				<td>${i.use_yn eq 'Y' ? '사용' : '미사용'}</td>
				<td><a class="btn modify" keyValue="${i.code_id}">수정</a></td>
			</tr>
    	</c:forEach>
	</tbody>
</table>

<jsp:include page="/WEB-INF/views/app/cms/common/paging.jsp" flush="false">
	<jsp:param name="formId" value="#dept"/>
</jsp:include>
</form:form>

<div id="dialog-1" class="dialog-common" title="관할기관 관리"></div>