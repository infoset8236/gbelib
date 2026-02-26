<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script type="text/javascript">
$(document).ready(function() {
    $('.search_btn').on('click', function(e) {
        e.preventDefault();
        $('#viewPage').val(1);
        $('#board').submit();
    });

    $('input#start_date').datepicker({
        maxDate: $('input#end_date').val(),
        onClose: function(selectedDate){
            $('input#end_date').datepicker('option', 'minDate', selectedDate);
        }
    });

    $('input#end_date').datepicker({
        minDate: $('input#start_date').val(),
        onClose: function(selectedDate){
            $('input#start_date').datepicker('option', 'maxDate', selectedDate);
        }
    });
});
</script>
<form:form modelAttribute="board" action="index.do">
	<form:hidden path="homepage_id"/>
    <div class="infodesk">
        검색 결과 : 총 ${guestbookListCount}건
        <br>
        등록 일자:
        <form:input path="start_date" class="text ui-calendar" readonly="true"/>
        <form:input path="end_date" class="text ui-calendar" readonly="true"/>
        <a class="btn btn1 search_btn" id="searchBtn">
            <span>검색</span>
        </a>
    </div>
	<table class="type1 center">
		<colgroup>
			<col width="8%">
			<col width="20%">
			<col>
			<col>
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>이용자</th>
				<th>내용</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${guestbookList}" var="i" varStatus="status">
				<tr>
					<td class="num">${paging.listRowNum - status.index}</td>
					<td>${i.user_name}</td>
					<td>${i.content}</td>
					<td><fmt:formatDate value="${i.add_date}" pattern="yyyy-MM-dd"/></td>
				</tr>
			</c:forEach>
			<c:if test="${fn:length(guestbookList) < 1}">
			<tr>
				<td colspan="4">등록된 정보가 없습니다.</td>
			</tr>
			</c:if>
		</tbody>
	</table>
    <jsp:include page="/WEB-INF/views/app/cms/common/paging.jsp" flush="false">
        <jsp:param name="formId" value="#board"/>
    </jsp:include>

    <div class="search txt-center" style="margin-top:25px;"><!-- 하단 정렬 시 margin-top 입력 -->
        <fieldset>
            <form:select path="search_type" cssClass="selectmenu">
                <form:option value="user_name">이용자명</form:option>
                <form:option value="content">내용</form:option>
            </form:select>
            <form:input path="search_text" cssClass="text" cssStyle="width:200px;"/>
            <button id="search_btn" class="search_btn"><i class="fa fa-search"></i><span>검색</span></button>
        </fieldset>
    </div>
</form:form>
