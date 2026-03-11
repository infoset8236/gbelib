<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
    $(function(){
        $('a#returnBtn').on('click', function(e) {
            e.preventDefault();
            $('input#editMode').val("RETURN");
            $('input#delivery_idx').val($(this).attr('keyValue1'));
            $('input#delivery_return_status').val(2);
            if (doAjaxPost($('#delivery'))) {
                location.reload();
            }
        })
    });
</script>
<form:form modelAttribute="delivery" action="save.do" method="post" onsubmit="return false;">
    <form:hidden path="editMode"/>
    <form:hidden path="delivery_idx"/>
    <form:hidden path="delivery_return_status"/>
    <div class="infodesk">
        검색 결과 : ${deliveryCount}건
    </div>
    <table class="type1 center">
        <colgroup>
            <col width="3%"/>
            <col width="5%"/>
            <col width="10%"/>
            <col width="10%"/>
            <col width="10%"/>
            <col width="10%"/>
            <col width="6%"/>
            <col width="6%"/>
            <col width="6%"/>
            <col width="8%"/>
        </colgroup>
        <thead>
        <tr>
            <th>순번</th>
            <th>이름</th>
            <th>회원번호</th>
            <th>전화번호</th>
            <th>등록번호</th>
            <th>제목</th>
            <th>소장처</th>
            <th>취소일</th>
            <th>상태</th>
            <th>기능</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${fn:length(deliveryList) < 1}">
            <tr style="height:100%">
                <td colspan="11"
>데이터가 존재하지 않습니다.</td>
            </tr>
        </c:if>
        <c:forEach var="i" varStatus="status" items="${deliveryList}">
            <tr style="word-break:unset;">
                <td class="num">${((paging.viewPage-1)*paging.rowCount) + status.count}</td>
                <td>${i.member_name}</td>
                <td>${i.member_id}</td>
                <td>${fn:substring(i.member_cell_phone, 0, 3)}-${fn:substring(i.member_cell_phone, 3, 7)}-${fn:substring(i.member_cell_phone, 7, 11)}</td>
                <td>${i.book_acsson_no}</td>
                <td>${i.book_title}</td>
                <td>${i.book_loca_name}</td>
                <td>
                    <fmt:formatDate value="${i.delivery_delete_date}" var="format_reqst_date" type="date"/>
                    ${format_reqst_date}
                </td>
                <td>
                    <c:choose>
                        <c:when test="${i.delivery_return_status eq 1}">
                            반납신청
                        </c:when>
                        <c:when test="${i.delivery_return_status eq 2}">
                            반납완료
                        </c:when>
                        <c:otherwise>
                            반납대기
                        </c:otherwise>
                    </c:choose>
                <td>
                    <a id="returnBtn" href="" class="btn modify_btn" keyValue1="${i.delivery_idx}">완료</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <jsp:include page="/WEB-INF/views/app/cms/common/paging.jsp" flush="false">
        <jsp:param name="formId" value="#delivery"/>
        <jsp:param name="pagingUrl" value="returndelivery.do"/>
    </jsp:include>
</form:form>