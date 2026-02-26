<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="/resources/book/search/css/default.css"/>
<script type="text/javascript">
    $(function() {
        $('a#delivery-cancel-btn').on('click', function(e) {
            e.preventDefault();
            $('input#editMode').val("CANCEL");
            $('input#delivery_idx').val($(this).attr('keyValue1'));
            doAjaxPost($('#delivery'));
        })
    });
</script>
<form:form modelAttribute="delivery" action="save.do" method="post" onsubmit="return false;">
    <form:hidden path="menu_idx"/>
    <form:hidden path="delivery_idx"/>
    <form:hidden path="editMode"/>
    <div class="book-list">
        <c:if test="${fn:length(deliveryList) < 1 }"> <h3>신청한 도서 내역이 없습니다.</h3></c:if>
        <c:if test="${fn:length(deliveryList) > 0 }">
            <table summary="신청정보">
                <colgroup>
                    <col width="50px"/>
                    <col width="15%"/>
                    <col/>
                    <col width="15%"/>
                    <col width="15%"/>
                    <col width="10%"/>
                    <col width="10%"/>
                </colgroup>
                <thead>
                <tr>
                    <th>No.</th>
                    <th>신청일</th>
                    <th>서명</th>
                    <th>청구기호</th>
                    <th>등록번호</th>
                    <th>상태</th>
                    <th>취소하기</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${deliveryList}" var="i" varStatus="status">
                    <tr class="view-detail" data-seq_no="${i.delivery_idx}">
                        <td>${status.index+1}</td>
                        <td>
                            <fmt:formatDate value="${i.delivery_reqst_date}" var="format_reqst_date" type="date"/>
                            ${format_reqst_date}
                        </td>
                        <td>${i.book_title}</td>
                        <td>${i.book_call_no}</td>
                        <td>${i.book_acsson_no}</td>
                        <td>
                            <c:choose>
                                <c:when test="${i.delivery_status eq 0}">승인대기</c:when>
                                <c:when test="${i.delivery_status eq 1}">승인</c:when>
                                <c:when test="${i.delivery_status eq 2}">반려</c:when>
                            </c:choose>
                        </td>
                        <td>
                            <c:if test="${i.delivery_status eq 0}">
                                <a id="delivery-cancel-btn" href="" class="btn cancel-btn" keyValue1="${i.delivery_idx}">취소</a>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>
    <form:hidden path="viewPage"/>
    <div id="delivery_paging" class="dataTables_paginate">
        <c:if test="${paging.firstPageNum > 0}">
            <a href="" class="paginate_button previous" keyValue="${paging.firstPageNum}">처음</a>
        </c:if>
        <c:if test="${paging.prevPageNum > 0}">
            <a href="" class="paginate_button previous" keyValue="${paging.prevPageNum}">이전</a>
        </c:if>
        <span>
        <c:forEach var="i" varStatus="status" begin="${paging.startPageNum}" end="${paging.endPageNum}">
            <c:choose>
                <c:when test="${i eq paging.viewPage}">
                    <a id="${i}" href="" class="paginate_button current" keyValue="${i}">${i}</a>
                </c:when>
                <c:otherwise>
                    <a id="${i}" href="" class="paginate_button" keyValue="${i}">${i}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:if test="${paging.nextPageNum > 0}">
            <a href="" class="paginate_button next" keyValue="${paging.nextPageNum}">다음</a>
        </c:if>
        <c:if test="${paging.totalPageCount ne paging.lastPageNum}">
            <a href="" class="paginate_button next" keyValue="${paging.totalPageCount}">맨끝</a>
        </c:if>
        </span>
    </div>

    <script type="text/javascript">
        $(function() {
            $('div#delivery_paging a').on('click', function(e) {
                e.preventDefault();
                $('input#viewPage').val($(this).attr('keyValue'));
                doGetLoad('list.do', $('form#delivery').serialize());
            });
        });
    </script>
</form:form>