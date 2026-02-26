<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script type="text/javascript">
function cancelSettingSave() {
	if ( doAjaxPost($('#untactBookReservation_1')) ) {
		location.reload();
	}
}
</script>

<form:form id="untactBookReservation_1" modelAttribute="untactBookReservation" action="cancelSettingSave.do">
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
			</tr>
			<tr>
				<td>${untactBookReservation.member_id}</td>
				<td>${untactBookReservation.member_name}</td>
				<td>${untactBookReservation.member_address}</td>
				<td>${untactBookReservation.member_phone}</td>
				<td>${untactBookReservation.member_email}</td>
			</tr>
		</tbody>
	</table>
	
</form:form>

