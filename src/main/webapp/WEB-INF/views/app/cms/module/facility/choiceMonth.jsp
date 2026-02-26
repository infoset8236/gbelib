<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				text: "엑셀 다운로드",
				"class": 'btn btn2',
				click: function() {
					console.log($("input:checkbox[name=choice_Month]:checked").length);
					if ($("input:checkbox[name=choice_Month]:checked").length < 1){
						alert('월을 선택해 주십시오.');
						return false;
					}
					excelDownLogPop();
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
	
	$("#dialog-4").dialog({ //개별 모달창 띄울 시 선택자 선언 및 크기 값 설정
		width: 700,
		height: 700
	});

});

$(document).on("excelDownLogSaved", function() {
	$('#choiceExcelDownloadForm').attr('action', 'choiceExcelDownload.do').submit();
});

</script>
<form:form id="choiceExcelDownloadForm" modelAttribute="facility" method="post" action="choiceExcelDownload.do" >
	<form:hidden path="homepage_id"/>
	<table class="type2">
		<colgroup>
	       <col width="150" />
	       <col width="*"/>
       	</colgroup>
       	<tbody>
	        <tr>
	         	<th>월 선택(<span style="color: red; font-weight: bold;">*</span>)</th>
	         	<td>
						<c:forEach begin="1" end="12" var="i">
							<c:choose>
								<c:when test="${i < 10}">
									<input type="checkbox" name="choice_Month" id="${i}" value="0${i}"><label for="${i}"> ${i}월</label>
								</c:when>
								<c:otherwise>
									<input type="checkbox" name="choice_Month" id="${i}" value="${i}"><label for="${i}"> ${i}월</label>
								</c:otherwise>
							</c:choose>
						</c:forEach>
				</td>
	        </tr>
		</tbody>
	</table>
</form:form>
