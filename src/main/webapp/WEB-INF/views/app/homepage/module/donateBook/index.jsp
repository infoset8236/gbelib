<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript">
$(function() {
	
});
</script>
<form:form id="hiddenForm" modelAttribute="donateBook">
<form:hidden path="editMode" value="DELETE"/>
<form:hidden path="homepage_id"/>
<form:hidden path="donate_idx"/>
</form:form>
<form:form id="donateBookListForm"  modelAttribute="donateBook" action="index.do" >
<form:hidden id="homepage_id_1" path="homepage_id"/>
	<div style="text-align: left;"><b>*신청 접수 후 도서를 기증하지 않고 3개월이 지나면 ‘처리상태’가 ‘취소’로 변경됩니다.</b></div>

	<div class="infodesk">		
		<div class="txt-right">검색 결과 : 총 ${donateBookListCount}건</div>		
	</div>
	<!-- 교육소식 관리 table -->
	<div class="rsv-info"></div>
	<div class="auto-scroll">
	<table class="type1 center">
		<colgroup>
			<col width="5%"/>
			<col width="15%"/>
			<col width="12%"/>
			<col width=""/>
			<col width="10%"/>
			<col width="10%"/>
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>기증일자</th>
				<th>기증자</th>
				<th>기증도서정보</th>
				<th>기증권수</th>
				<th>처리상태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="i" varStatus="status" items="${donateBookList}">
				<tr>
					<td>${paging.listRowNum -(status.index)}</td>
					<td>${i.add_date}</td>
					<td>${i.name}</td>
					<td>${i.donate_book}</td>
					<td>${i.donate_count}권</td>
					<td>
						<span class="state state2">
							<c:if test="${i.process_status eq '1'}">신청</c:if>
							<c:if test="${i.process_status eq '2'}">접수</c:if>
							<c:if test="${i.process_status eq '3'}">취소</c:if>
							<c:if test="${i.process_status eq '4'}">완료</c:if>
						</span>
					</td>
				</tr>
			</c:forEach>
			
			<c:if test="${donateBookListCount eq 0}">
				<tr>
					<td colspan="5">조회된 자료가 없습니다.</td>
				</tr>
			</c:if>
		</tbody>
	</table>
	</div>
	<form:hidden path="viewPage"/>
	<jsp:include page="/WEB-INF/views/app/cms/common/paging.jsp" flush="false">
		<jsp:param name="formId" value="#donateBookListForm"/>
	</jsp:include>
</form:form>