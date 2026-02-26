<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<style type="text/css">
#printDiv {display:none;}
</style>
<script type="text/javascript">
function cancelSettingSave() {
	if ( doAjaxPost($('#untactBookReservation_1')) ) {
		location.reload();
	}
}

function contentPrint(e) {
	this.event.preventDefault();
	var browser = navigator.userAgent.toLowerCase();
    if (browser.indexOf('chrome') != -1){
    	var initBody = document.body.innerHTML;
		$('div#printDiv').printThis({
			pageTitle: "비대면 도서대출 출력",
			printContainer: false,
			removeInline : true,
			removeInlineSelector : "*",
			loadCSS: "/resources/common/css/bookInfoPrint.css",
		});
    }else if (browser.indexOf('trident') != -1 || browser.indexOf('MSIE') != -1){
    	var printContent = document.getElementById('printDiv');
        var windowUrl = '';
        var uniqueName = new Date();
        var windowName = 'Print' + uniqueName.getTime();
        var printWindow = window.open(windowUrl, windowName, 'left=200,top=100,width=700,height=800');
        printWindow.document.write(printContent.innerHTML);
        printWindow.document.close();
        printWindow.focus();
        printWindow.print();
        printWindow.close();
    }
}
</script>

<form:form id="untactBookReservation_1" modelAttribute="untactBookReservation">
<form:hidden path="homepage_id"/>
<form:hidden path="member_id"/>
<form:hidden path="member_name"/>
<form:hidden path="request_number"/>
	<table class="type2">
		<%-- <colgroup>
			<col width="25%">
			<col width="25%">
			<col width="25%">
			<col width="25%">
			<col width="25%">
		</colgroup> --%>
		<tbody id="board_tbody">
			<tr>
				<th>신청자ID</th>
				<th>신청자명</th>
				<th>신청자주소</th>
				<th>신청자전화번호</th>
				<th>신청자이메일</th>
				<th>출력하기</th>
			</tr>
			<tr>
				<td>${untactBookReservation.member_id}</td>
				<td>${untactBookReservation.member_name}</td>
				<td>${untactBookReservation.member_address}</td>
				<td>${untactBookReservation.member_phone}</td>
				<td>${untactBookReservation.member_email}</td>
				<td onclick="contentPrint(); return false;"><i class="fa fa-print"></i></td>
			</tr>
		</tbody>
	</table>
	
</form:form>
<div id="printDiv">
	<div id="printTitle" style="margin-top: 50px;border: 5px solid #d6d6d6;padding: 10px;border-bottom: 1px solid #d6d6d6;">
		비대면 도서대출 신청정보 출력
	</div>
	<div id="printContent" style="border: 5px solid #d6d6d6;padding: 20px;padding-bottom:0px;;border-top: 1px solid #d6d6d6;">
		<div id="printBookName" style="font-size: 20px;font-weight: bold;margin-top: 10px;margin-bottom: 10px;">
			도서명 [ ${untactBookReservation.book_name} ]
		</div>
		<table style="border-top: 3px solid black;width: 100%;margin-bottom: 15px;">
			<thead>
				<tr height="50">
					<th style="background: white;border: none;border-bottom: 1px solid #d6d6d6;">신청자명</th>
					<td style="border: none;border-bottom: 1px solid #d6d6d6;">${untactBookReservation.member_name}</td>
				</tr>
				<tr height="50">
					<th style="background: white;border: none;border-bottom: 1px solid #d6d6d6;">신청일</th>
					<td style="border: none;border-bottom: 1px solid #d6d6d6;">${untactBookReservation.request_date}</td>
				</tr>
			</thead>
		</table>
	</div>
</div>

