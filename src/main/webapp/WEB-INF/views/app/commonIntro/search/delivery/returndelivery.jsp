<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="/resources/book/search/css/default.css"/>
<script type="text/javascript">
    $(function() {
        $('a#delivery_return_btn').on('click', function(e) {
            e.preventDefault();
            var delivery_idx_arr = $('input[name=delivery_idx_arr]:checked').map(function() { return $(this).val(); }).get().join(',');

            if ( !delivery_idx_arr ){
                alert('반납할 택배를 선택해 주세요.');
                return false;
            }

            $('input#editMode').val("RETURN");
            $('input#delivery_return_status').val(1);
            doAjaxPost($('#delivery'));
        })

        $('input#checkAll').on('click', function() {
            $('input[type=checkbox][name=delivery_idx_arr]').prop('checked', $(this).is(':checked'));
        });
    });
</script>
<form:form modelAttribute="delivery" action="save.do" method="post" onsubmit="return false;">
    <form:hidden path="delivery_return_status"/>
    <form:hidden path="editMode"/>
    <form:hidden path="menu_idx"/>
    <form:hidden path="delivery_idx_arr"/>
    <div class="book-list">
        <c:if test="${fn:length(deliveryList) < 1 }"> <h3>반납할 도서 내역이 없습니다.</h3></c:if>
        <c:if test="${fn:length(deliveryList) > 0 }">
            <table summary="신청정보">
                <colgroup>
                    <col/>
                    <col/>
                    <col/>
                    <col/>
                    <col width="30%"/>
                    <col/>
                    <col/>
                </colgroup>
                <thead>
                <tr>
                    <th><input id="checkAll" type="checkbox"></th>
                    <th>No.</th>
                    <th>신청일</th>
                    <th>반납예정일</th>
                    <th>서명</th>
                    <th>청구기호</th>
                    <th>등록번호</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${deliveryList}" var="i" varStatus="status">
                    <tr class="view-detail" data-seq_no="${i.delivery_idx}">
                        <td>
                            <c:if test="${i.delivery_return_status ne 2}">
                                <form:checkbox path="delivery_idx_arr" value="${i.delivery_idx}"/>
                            </c:if>
                        </td>
                        <td>${status.index+1}</td>
                        <td>
                            <fmt:formatDate value="${i.delivery_reqst_date}" var="format_date" type="date"/>
                            ${format_date}
                        </td>
                        <td>
                            <fmt:formatDate value="${i.delivery_return_date}" var="format_date" type="date"/>
                            ${format_date}
                        </td>
                        <td>${i.book_title}</td>
                        <td>${i.book_call_no}</td>
                        <td>${i.book_acsson_no}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <a style="margin: 20px 0 0 450px;" href="" class="btn btn1" id="delivery_return_btn"><i class="fa fa-pencil"></i><span>반납 신청</span></a>
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
                        $('input#menu_idx').val(245);
                        $('input#viewPage').val($(this).attr('keyValue'));
                        doGetLoad('returndelivery.do', $('form#delivery').serialize());
                    });
                });
            </script>
        </c:if>
    </div>
</form:form>
