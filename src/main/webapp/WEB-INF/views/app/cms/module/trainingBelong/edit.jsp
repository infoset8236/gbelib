<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="/resources/cms/js/malsup.jquery.form.min.js" type="text/javascript"></script>
<script type="text/javascript">
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
					jQuery.ajaxSettings.traditional = true;
					var option = {
						url : 'save.do',
						type : 'POST',
						data : $('#trainingBelongForm').serialize(),
						success: function(response) {
													
							if(response.valid) {
								if(response.message != null && response.message.replace(/\s/g,'').length!=0) {
									alert(response.message);
								}
								if(response.targetOpener) {
									window.open(response.url, '', 'width=500,height=510');
									return false;
								}																
								$('#dialog-1').dialog('destroy');	
								location.href="/cms/module/trainingBelong/index.do"
								if(response.reload) {
 									location.reload();								
								}
							} else {
								if ( response.message != null ) {
									alert(response.message);
								}
								else {
									$('td.fileTd').append($file);
									for(var i =0 ; i < response.result.length ; i++) {
										alert(response.result[i].code);
										$('#'+response.result[i].field).focus();
										break;
									}	
								}
							}
				         },
				         error: function(jqXHR, textStatus, errorThrown) {
				        	 $('td.fileTd').append($file);
				             alert('[' + textStatus + ']관리자에게 문의하세요. : ' + errorThrown);
				         }
					};
					$('#trainingBelongForm').ajaxSubmit(option);
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
	
	$('input[type="text"]').keydown(function() {
		  if (event.keyCode === 13) {
		    event.preventDefault();
		  };
		});
	
});

</script>
<form:form id="trainingBelongForm" modelAttribute="trainingBelong" method="post" action="save.do">
	<form:hidden path="homepage_id"/>
	<form:hidden path="belong_idx"/>	
	<form:hidden path="editMode"/>									
	<table class="type2">
		<colgroup>
	       <col width="130" />
	       <col width="*"/>
       	</colgroup>
       	<tbody>
       		<tr>
	         	<th>기관명</th>			
	         	<td><form:input path="belong_name" class="text" style="width:100%" maxlength="30"/></td>
        	</tr>
			<tr>
				<th>관할조직명</th>
				<td>
					<form:input path="group_name" class="text"/>
				</td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td>
					<form:input path="zip_code" class="text" cssStyle="width:80%"/>
				</td>
			</tr>
			<tr>
				<th>상세주소</th>
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
