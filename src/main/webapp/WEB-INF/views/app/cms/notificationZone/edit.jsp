<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
$(function() {
	$('.dialog-common').dialog({ //모달창 기본 스크립트 선언
		autoOpen: false,
		resizable: true,
		modal: true, 
	    open: function(){
	        $('.ui-widget-overlay').addClass('custom-overlay');
	    },
	    close: function(){
	        $('.ui-widget-overlay').removeClass('custom-overlay');
	    },
		buttons: [
			{
				text: "저장",
				"class": 'btn btn1',
				click: function() {
					if ( doAjaxPost($('#notificationZoneEdit')) ) {
						location.reload();
					}
				}
			},{
				text: "취소",
				"class": 'btn',
				click: function() {
					$('#dialog-1').dialog('destroy');
				}
			}
		]
	});
	
	$("#dialog-1").dialog({ //개별 모달창 띄울 시 선택자 선언 및 크기 값 설정
		width: 600,
		height: 550
	});
	
	$('input#start_date').datepicker({
		maxDate: $('input#end_date').val(), 
		onClose: function(selectedDate){
			$('input#end_date').datepicker('option', 'minDate', selectedDate);
		}
	});
	
	$('input#end_date').datepicker({
		minDate: $('input#start_date').val(), 
		onClose: function(selectedDate){
			$('input#start_date').datepicker('option', 'maxDate', selectedDate);
		}
	});
});
</script>
<form:form id="notificationZoneEdit" modelAttribute="notificationZone" action="save.do" method="POST" onsubmit="return false;" enctype="multipart/form-data">
<form:hidden path="editMode"/>
<form:hidden path="homepage_id"/>
<form:hidden path="notification_zone_idx"/>
<div id="imgFileTemp" hidden="hidden"></div>
<table class="type2">
	<colgroup>
		<col width="130"/>
		<col width="*"/>
	</colgroup>
	<tbody>
		<tr>
			<th>알림존종류(<span style="color: red; font-weight: bold;">*</span>)</th>
			<td>
				<form:select path="notification_zone_code">
					<form:options items="${codeList}" itemValue="code_id" itemLabel="code_name"/>
				</form:select>
			</td>
		</tr>
		<tr>
			<th>대제목(<span style="color: red; font-weight: bold;">*</span>)</th>
			<td>
				<form:input path="title" cssStyle="width:200px;" cssClass="text"/>
			</td>
		</tr>
		<tr>
			<th>중제목(<span style="color: red; font-weight: bold;">*</span>)</th>
			<td>
				<form:input path="sub_title" cssStyle="width:200px;" cssClass="text"/>
			</td>
		</tr>
		<tr>
			<th>게시기간(<span style="color: red; font-weight: bold;">*</span>)</th>
			<td>
				<form:input path="start_date" cssClass="text ui-calendar"/> ~ <form:input path="end_date" cssClass="text ui-calendar"/>
			</td>
		</tr>
		<tr>
			<th>링크종류(<span style="color: red; font-weight: bold;">*</span>)</th>
			<td>
				<form:select path="link_type" cssStyle="width:160px;" cssClass="selectmenu">
					<form:option value="APPLY">신청하기</form:option>
					<form:option value="VIEW">자세히보기</form:option>
				</form:select>
			</td>
		</tr>
		<tr>
			<th>링크타겟(<span style="color: red; font-weight: bold;">*</span>)</th>
			<td>
				<form:radiobutton path="link_target" value="CURRENT"/> <label for="link_target1" style="cursor:pointer;">현재창</label>&nbsp;
				<form:radiobutton path="link_target" value="BLANK"/> <label for="link_target2" style="cursor:pointer;">새창</label>
			</td>
		</tr>
		<tr> 
			<th>링크URL(<span style="color: red; font-weight: bold;">*</span>)</th>
			<td>
				<form:input path="link_url" cssClass="text" cssStyle="width:300px;" maxlength="200"/>	
			</td>
		</tr>
		<tr class="detailContent"> 
			<th>내용</th>
			<td> 
				<form:textarea path="contents" cssStyle="width:100%;height:60px;"/>
			</td>
		</tr>
		<tr>
			<th>사용여부(<span style="color: red; font-weight: bold;">*</span>)</th>
			<td>
				<form:radiobutton path="use_yn" value="Y"/> <label for="use_yn1" style="cursor:pointer;">사용함</label>&nbsp;
				<form:radiobutton path="use_yn" value="N"/> <label for="use_yn2" style="cursor:pointer;">사용안함</label>
			</td>
		</tr>
	</tbody>
</table>
</form:form>