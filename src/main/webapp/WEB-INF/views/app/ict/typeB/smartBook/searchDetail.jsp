<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<table class="own_book_info">
	<thead>
	<tr>
		<th>NO</th>
		<th>소장위치</th>
		<th>청구기호</th>
		<th>등록정보</th>
		<th>도서상태</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach items="${detail.dsItemDetail}" var="i" varStatus="status">
	<tr>
		<td>${status.count}</td>
		<td>${fn:escapeXml(i.SUB_LOCA_NAME)} <c:if test="${not empty i.BOOKSH_NAME}">/</c:if> ${fn:escapeXml(i.BOOKSH_NAME)}</td>
		<td>${fn:escapeXml(i.CALL_NO)}</td>
		<td>${fn:escapeXml(i.ACSSON_NO)}</td>
		<td>${fn:escapeXml(i.BOOK_STATE)}</td>
	</tr>
	</c:forEach>
	</tbody>
</table>