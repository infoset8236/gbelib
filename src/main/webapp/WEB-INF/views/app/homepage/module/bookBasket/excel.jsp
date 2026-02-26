<%@ page language="java" contentType="application/vnd.ms-excel;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
response.setHeader("Content-Disposition","attachment;filename=book.xls");
response.setHeader("Content-Description", "JSP Generated Data");
response.setContentType("application/vnd.ms-excel");
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<script>
</script>
<body>
<div class="wrapper-bbs">
	<div class="table-wrap">
		<div class="web-show">
		<table class="bbs center" summary="내서재 목록">
			<caption>내서재 목록</caption>
			<colgroup>
				<col width="5%">
				<col width="19%">
				<col width="14%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
			</colgroup>
			<thead>
				<tr>
					<th class="important">번호</th>
					<th class="important">서명</th>
					<th class="important">소장도서관</th>
					<th class="important">청구기호</th>
					<th class="important">등록일</th>
				</tr>
			</thead>
			<tbody id="board_tbody">

			<c:forEach var="i" varStatus="status" items="${bookBasketList}">
				<tr>
					<td class="important num">${status.count}</td>
					<td class="important">${i.title}</td>
					<td class="important">${i.lib_name}</td>
					<td class="important">${i.call_no}</td>
					<td class="important num"><fmt:formatDate value="${i.add_date}" pattern="yyyy.MM.dd" /></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		</div>
	</div>


</div>
</body>
</html>