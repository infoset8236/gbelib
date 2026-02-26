<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="search_table_header">
	<div class="search_table_header_cell">소장위치</div>
	<div class="search_table_header_cell">청구기호</div>
	<div class="search_table_header_cell">등록정보</div>
	<div class="search_table_header_cell">도서상태</div>
</div>
<c:forEach items="${detail.dsItemDetail}" var="i" varStatus="status">
	<div class="search_table_body">
		<div class="search_table_body_cell bold">${fn:escapeXml(i.SUB_LOCA_NAME)}</div>
		<div class="search_table_body_cell">${fn:escapeXml(i.CALL_NO)}</div>
		<div class="search_table_body_cell">${fn:escapeXml(i.ACSSON_NO)}</div>
		<div class="search_table_body_cell">${fn:escapeXml(i.BOOK_STATE)}</div>
	</div>
</c:forEach>