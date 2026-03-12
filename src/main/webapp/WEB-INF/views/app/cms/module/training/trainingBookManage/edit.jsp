<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script src="https://unpkg.com/qr-code-styling@1.5.0/lib/qr-code-styling.js"></script>
<script type="text/javascript">
$(function() {
	$('#dialog-1').dialog({ //모달창 기본 스크립트 선언
		autoOpen: false,
		resizable: false,
		modal: true,
	    open: function(){
	        $('.ui-widget-overlay').addClass('custom-overlay');
	    },
	    close: function(){
	        $('.ui-widget-overlay').removeClass('custom-overlay');
	        $('body > div.ui-dialog').remove();
	    },
		buttons: [
			{
				text: "저장",
				"class": 'btn btn1',
				click: function() {
					if(doAjaxPost($('#trainingBookManageForm'))) {
						$(this).dialog('destroy');

						$('.training_btn_${training.training_idx}').click();

						$('#dialog-2').load('qr.do?homepage_id=' + $('#trainingBookManageForm #homepage_id').val() + '&training_idx=' + $('#trainingBookManageForm #training_idx').val() + '&qr_count=' + $('#trainingBookManageForm input[name="qr_count"]:checked').val(), function() {
							$('#dialog-2').dialog('open');
						});
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
		width: 600,
		height: 300
	});

});

</script>
<form:form id="trainingBookManageForm" modelAttribute="trainingBookManage" method="post" action="save.do">
	<form:hidden path="homepage_id"/>
	<form:hidden path="training_idx"/>
	<form:hidden path="editMode"/>

	<div style="text-align: right; margin-bottom: 5px;">
		(<span style="color: red; font-weight: bold;">*</span>) 항목은 필수 입력값입니다.
	</div>
	<table class="type2">
		<colgroup>
	       <col width="160" />
	       <col width="*"/>
       	</colgroup>
       	<tbody>
       		<tr>
	         	<th>회차 설정(<span style="color: red; font-weight: bold;">*</span>)</th>
	         	<td>
                    <c:forEach var="i" begin="1" end="${training.qr_check_count}">
                        <label>
                            <form:radiobutton path="qr_count" value="${i}"/>${i}회차
                        </label>
                    </c:forEach>
                </td>
        	</tr>
        </tbody>
    </table>
</form:form>