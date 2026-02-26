<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet" type="text/css" href="/resources/book/search/css/default.css"/>
<jsp:include page="/WEB-INF/views/app/board/common/edit/script.jsp" flush="false" />
<script type="text/javascript">
    $(function () {
        $('a#delivery_save_btn').on('click', function(e) {
            e.preventDefault();
            if ($('input#book_title').val() === '' || $('input#book_loca_name').val() === '' || $('input#book_call_no').val() === '' || $('input#book_acsson_no').val() === '') {
                alert('다시 택배 신청을 해주시길 바랍니다.');
                return false;
            }
            $('input#editMode').val("ADD");
            doAjaxPost($('#delivery'));
        });
    })
</script>
<form:form modelAttribute="delivery" action="save.do" method="post" onsubmit="return false;">
    <form:hidden path="book_title" htmlEscape="true"/>
    <form:hidden path="book_loca_name" htmlEscape="true"/>
    <form:hidden path="book_call_no" htmlEscape="true"/>
    <form:hidden path="book_acsson_no" htmlEscape="true"/>
    <form:hidden path="member_name" htmlEscape="true" value="${member.member_name}"/>
    <form:hidden path="member_cell_phone" htmlEscape="true" value="${member.mobile_no}"/>
    <form:hidden path="member_address" htmlEscape="true" value="${member.address1}"/>
    <form:hidden path="editMode"/>
    <div class="book-list">
        <c:if test="${member.member_id != null && not empty member.member_id}">
            <table summary="신청정보">
                <colgroup>
                    <col width="50%"/>
                    <col width="50%"/>
                </colgroup>
                <thead>
                <tr>
                    <td colspan="2">
                        도서택배서비스 신청 규정에 어긋날 경우 신청이 거부될 수 있습니다.
                        <div style="text-align: initial;">- 관외대출회원 중 임산부(일반 및 어린이도서, 월 1회, 10권까지)</div>
                        <div style="text-align: initial;">- 관외대출회원 중 읍·면지역 거주자 및 근무자(일반도서, 월 1회, 5권까지)</div>
                        <div style="text-align: initial;">- 관외대출회원 중 65세 이상(일반도서, 월 1회, 5권까지)</div>
                    </td>
                </tr>
                <tr>
                    <th>성명</th>
                    <td>${member.member_name}</td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td>${fn:substring(member.mobile_no, 0, 3)}-${fn:substring(member.mobile_no, 3, 7)}-${fn:substring(member.mobile_no, 7, 11)}</td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td>${member.address1}</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <span style="color:red;">전화번호와 주소를 반드시 확인 해주세요.</span>
                        <br>
                        <span style="color:red;">주소나 전화번호가 틀리다면 회원정보 수정 후 다시 신청해 주세요.</span>
                    </td>
                </tr>
                </thead>
            </table>
            <a style="margin: 10px 0 0 450px;" href="" class="btn btn1" id="delivery_save_btn"><i class="fa fa-pencil"></i><span>신청하기</span></a>
        </c:if>
    </div>
</form:form>
