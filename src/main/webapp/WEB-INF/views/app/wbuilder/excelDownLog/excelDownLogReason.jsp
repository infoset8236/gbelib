<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table class="type2">
	<colgroup>
		<col width="150" />
		<col width="*"/>
	</colgroup>
	<tbody>
	<tr>
		<th>다운로드 사유</th>
		<td>${excelDownLog.excel_down_reason}</td>
	</tr>
	</tbody>
</table>
