<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	._padding {padding-left: 30px;}
</style>
<script>
var checkCodeId = '';

$(function() {
	$('.dialog-common').dialog({ //모달창 기본 스크립트 선언
		autoOpen: false,
		resizable: false,
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
					
					if (checkCodeId != $('#code_id').val() && $('#editMode').val == 'ADD') {
						$('#code_check').val("N");	
						alert("조직코드 중복확인 후, 조직코드가 변경 되었습니다. 재확인 후 다시 진행해주세요.");
					} else {
						if(doAjaxPost($('#dept_edit'))) {
	 						$(this).dialog('destroy');
	 						location.reload();
						}
					}
				}
			},{
				text: "취소",
				"class": 'btn',
				click: function() {
					$(this).dialog('destroy');
				}
			}
		]
	});
	
	$("#dialog-1").dialog({ //개별 모달창 띄울 시 선택자 선언 및 크기 값 설정
		width: 550,
		height: 500
	});
	
	$('.idCheck').on('click',function(){
		$.ajax({
	        type: "POST",
	        url: 'codeCheck.do',
	        async: false,
	        data: {"code_id":$('#code_id').val()},
	        dataType:'json',
	        success: function(response) {
	        	response = eval(response);
	        	responseValid = response.valid;
	            if(response.valid) {            
	                alert("해당 조직코드는 이미 등록되어 있습니다. 다시 진행해주세요.");
	            	$('#code_check').val("N");
				} else {
					if ($('#code_id').val() != '') {
						checkCodeId = $('#code_id').val();
						alert("중복된 조직코드가 없습니다.");
						$('#code_check').val("Y");	
					} else {
						$('#code_id').focus();
						alert("조직코드를 입력해주세요.");
					}
				}
	         },
	         error: function(jqXHR, textStatus, errorThrown) {
	             alert('[' + textStatus + ']관리자에게 문의하세요. : ' + errorThrown + ', ' + jqXHR.status);
	         }
	    });	
	});
	
});
</script>
<form:form modelAttribute="dept" id="dept_edit" action="save.do" method="post">
<form:hidden path="editMode"/>
<form:hidden path="code_check"/>
<div class="ui-state-highlight">
	<em>
		* 항목은 반드시 기록 하셔야 합니다.
	</em>
</div>
<table class="type2">
	<colgroup>
		<col width="140"/>
		<col width="*"/>
	</colgroup>
	<tbody>
		<tr>
			<th>조직코드*</th>
			<td>
				<c:choose>
         			<c:when test="${dept.editMode eq 'ADD' }">
         				<form:input path="code_id" class="text" /> <a class="btn btn1 idCheck">조직코드 중복확인</a>	
         			</c:when>
         			<c:otherwise>
         				<form:hidden path="code_id"/>
						${dept.code_id }
         			</c:otherwise>
         		</c:choose>
			</td>
		</tr>
		<tr>
         	<th>조직명*</th>			
         	<td>
         		<form:input path="code_name" class="text" />	
        	</td>
       	</tr>
		<tr>
			<th>관할조직명*</th>
			<td>
				<form:input path="group_name" class="text"/>
			</td>
		</tr>
		<tr>
			<th>우편번호*</th>
			<td>
				<form:input path="zipcode" class="text" cssStyle="width:80%"/>
			</td>
		</tr>
		<tr>
			<th>상세주소*</th>
			<td>
				<form:input path="address" class="text" cssStyle="width:80%"/>
			</td>
		</tr>
		<tr>
			<th>담당자이름</th>
			<td>
				<form:input path="manager_name" class="text"/>
			</td>
		</tr>
		<tr>
			<th>담당자 휴대폰번호</th>
			<td>
				<form:input path="manager_phone" class="text" maxlength="13" placeholder="ex) 010-1234-1234"/>
			</td>
		</tr>
		<tr>
			<th>사용여부*</th>
			<td>
				<form:select path="use_yn">
					<form:option value="Y">사용</form:option>
					<form:option value="N">미사용</form:option>
				</form:select>	
			</td>			
		</tr>
	</tbody>
</table>
</form:form>