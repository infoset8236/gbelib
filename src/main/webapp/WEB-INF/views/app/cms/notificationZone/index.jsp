<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
$(function(){
	//모달창 링크 버튼
	$('a#dialog-add').on('click', function(e) {
		if ( $('#homepage_id_1').val() == '' ) {
			alert('홈페이지정보가 없습니다.');	
		}
		else {
			$('#dialog-1').load('edit.do?editMode=ADD&homepage_id=' + $('#homepage_id').val(), function( response, status, xhr ) {
				$('#dialog-1').dialog('open');
			});
		}
		
		e.preventDefault();
	});
	
	$('a#dialog-modify').on('click', function(e) {
		$('#dialog-1').load('edit.do?editMode=MODIFY&homepage_id=' + $(this).attr('keyValue') + '&notification_zone_idx=' + $(this).attr('keyValue1'), function( response, status, xhr ) {
			$('#dialog-1').dialog('open');
		});
		
		e.preventDefault();
	});
	
	$('a#delete').on('click', function(e) {
		if(confirm('선택된 알림을 삭제 하시겠습니까?')) {
			$('input#homepage_id').val($(this).attr('keyValue'));
			$('input#notification_zone_idx').val($(this).attr('keyValue1'));
			
			$.ajax({
				url : 'delete.do',
				async : false,
				data : serializeObject($('#notificationZone')),
				method : 'POST',
				success : function(data) {
					if(data.valid) {
						alert(data.message);
						location.reload();
					}
					else {
						if ( data.message != null ) {
							alert(data.message);
						}
						else {
							alert(data.result);	
						}
					}
				}
			});
		}
		
		e.preventDefault();
	}); 
});	
</script> 
<form:form id="notificationZone" modelAttribute="notificationZone" method="POST" action="save.do" onsubmit="return false;">
<form:hidden path="editMode"/>
<form:hidden path="notification_zone_idx"/>
<form:hidden path="homepage_id"/>

<div id="editDisable" class="disableBox">
	<div class="infodesk">
		검색 결과 : ${paging.totalDataCount}건, 홈페이지 ID : ${notificationZone.homepage_id}
		<div class="button btn-group inline">
			<c:if test="${authC}">
				<a href="" class="btn btn5 left" id="dialog-add"><i class="fa fa-plus"></i><span>알림존등록</span></a>
			</c:if>
		</div>
	</div>
	<table class="type1 center">
		<thead>
			<tr>
				<th width="40">순번</th>
				<th width="100">종류</th>
				<th width="">대제목</th>
				<th width="">중제목</th>
				<th width="50">사용유무</th>
				<th width="200">게시기간</th>
				<th width="120">등록일</th>
				<th width="100">기능</th>
			</tr>
		</thead>
		<tbody>
		<c:if test="${fn:length(notificationZoneList) < 1}">
			<tr>
				<td colspan="7" style="background:#f8fafb;">데이터가 존재하지 않습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="i" varStatus="status" items="${notificationZoneList}">
			<tr>
				<td>${notificationZone.listRowNum - status.index}</td>
				<td>${i.notification_zone_code_name}</td>
				<td class="left" width="">${i.title}</td>
				<td class="left" width="">${i.sub_title}</td>
				<td>${i.use_yn eq 'Y' ? '사용' : '미사용'}</td>
				<td>${i.start_date} ~ ${i.end_date}</td>
				<td><fmt:formatDate value="${i.add_date}" pattern="yyyy-MM-dd"/></td>
				<td>
					<c:if test="${authU}">
						<a href="" class="btn" id="dialog-modify" keyValue="${i.homepage_id}" keyValue1="${i.notification_zone_idx}">수정</a>
					</c:if>
					<c:if test="${authD}">
						<a href="" class="btn" id="delete" keyValue="${i.homepage_id}" keyValue1="${i.notification_zone_idx}">삭제</a>
					</c:if>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<jsp:include page="/WEB-INF/views/app/cms/common/paging.jsp" flush="false">
		<jsp:param name="formId" value="#notificationZone"/>
	</jsp:include>
	
<!-- 	<div class="search txt-center" style="margin-top:25px;">하단 정렬 시 margin-top 입력 -->
<!-- 		<fieldset> -->
<%-- 			<form:select path="search_type" cssClass="selectmenu"> --%>
<%-- 				<form:option value="TITLE">알림명</form:option> --%>
<%-- 				<form:option value="">팝업타입</form:option> --%>
<%-- 				<form:option value="USE_YN">사용여부</form:option> --%>
<%-- 				<form:option value="START_DATE">시작일</form:option> --%>
<%-- 				<form:option value="END_DATE">종료일</form:option> --%>
<%-- 			</form:select> --%>
<%-- 			<form:input path="search_text" cssClass="text" cssStyle="width:200px;"/> --%>
<!-- 			<button id="search_btn"><i class="fa fa-search"></i><span>검색</span></button> -->
<!-- 		</fieldset> -->
<!-- 	</div> -->
</div>
</form:form>

<div id="dialog-1" class="dialog-common" title="알림 정보">
</div>