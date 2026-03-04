<%@ page language="java" pageEncoding="utf-8" %>
<%@ page import="java.util.*, sun.misc.BASE64Encoder" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="homepageTag" uri="/WEB-INF/config/tld/homepageTag.tld" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<script>
  $(document).ready(function () {
    //예약취소
    $('a.book_cancel').on('click', function (e) {
      e.preventDefault();
      updateCancelInfo($(this).data('application'));

      if (confirm('취소하시겠습니까?')) {
        if(doAjaxPost($('form#hopeCancelForm'))) {
          location.reload();
        }
      }
    });
  });

  function updateCancelInfo(applicationData) {
    var $form = $('form#hopeCancelForm');
    $form.find('#book_code').val(applicationData.book_code);
    $form.find('#book_idx').val(applicationData.book_idx);
    $form.find('#application_user_name').val(applicationData.application_user_name);
    $form.find('#application_user_no').val(applicationData.application_user_no);
    $form.find('#application_user_id').val(applicationData.application_user_id);
  }

</script>

<form:form id="hopeCancelForm" modelAttribute="hopeElibBook" action="hopeElibsave.do">
    <form:hidden path="menu_idx"/>
    <form:hidden path="editMode" value="CANCEL"/>
    <form:hidden path="book_code"/>
    <form:hidden path="book_idx"/>
    <form:hidden path="application_status" value="4"/>
    <form:hidden path="application_user_name"/>
    <form:hidden path="application_user_no"/>
    <form:hidden path="application_user_id"/>
</form:form>

<form:form id="hopeElibBookForm" modelAttribute="hopeElibBook" action="hopeApplicationList.do" method="GET">
    <div class="elib_top">
        <div class="sub001">
            <span>
				<fmt:formatNumber value="${hopeBookListCnt}" pattern="#,###"/></span> 권의 전자책이 있습니다. &nbsp; <span>${hopeElibBook.viewPage}</span> of <fmt:formatNumber value="${hopeElibBook.totalPageCount}" pattern="#,###"/> pages
        </div>
    </div>
    <ul class="bbs_webzine elib">
        <c:forEach items="${hopeBookApplicationList}" var="i" varStatus="status">
            <li>
                <div class="thumb">
                    <a href="#" class="book_link" data-book_idx="${i.book_idx}" data-type="${i.type}" style="background:url(/resources/board/img/lock-bg.gif) no-repeat center center">
                        <c:if test="${not empty i.book_image}">
                            <img src="${i.book_image}" alt="${i.book_name}" onError="this.src='/resources/homepage/elib/img/noImg.gif'"/>
                        </c:if>
                        <c:if test="${empty i.book_image}">
                            <img src="/resources/common/img/noImg.gif" alt="noImage"/>
                        </c:if>
                    </a>
                </div>
                <div class="list-body">
                    <div class="flexbox">
                            <b>제목 : ${i.book_name}</b>
                        <div class="info">
                            <span>출판사 : ${i.book_pubname}</span>
                            <span class="txt-bar">&nbsp;</span>
                            <span>저자 : ${i.author_name}</span>
                            <span class="txt-bar">&nbsp;</span>
                            <span>제조년 : ${i.book_pubdt}</span>
                        </div>
                    </div>
                    <div class="meta">
                        <label>공급사 : </label>
                        <span>${i.comp_name}</span>
                        <br/>
                        <label>신청일 : <fmt:formatDate value="${i.application_add_date}" pattern="yyyy.MM.dd"/></label>
                        <span></span>
                        <div style="float: right;">
                            <span>
                            <c:choose>
                                <c:when test="${i.application_status eq '1'}">
                                    <a href="#" class="btn btn1 book_cancel"
                                       data-application='{
                                           "book_code": "${i.book_code}",
                                           "book_idx": "${i.book_idx}",
                                           "application_user_name": "${i.application_user_name}",
                                           "application_user_id": "${i.application_user_id}",
                                           "application_user_no": "${i.application_user_no}"
                                       }'> 신청취소</a>
                                </c:when>
                                <c:when test="${i.application_status eq '2'}">
                                    <a href="#" class="btn btn2">처리중</a>
                                </c:when>
                                <c:when test="${i.application_status eq '3'}">
                                    <a href="#" class="btn btn8">구입완료</a>
                                </c:when>
                                <c:when test="${i.application_status eq '4'}">
                                    <a href="#" class="btn btn4">이용자취소완료</a>
                                </c:when>
                                <c:when test="${i.application_status eq '5'}">
                                    <a href="#"  class="btn btn5">기관취소완료</a>
                                </c:when>
                            </c:choose>
							</span>

                        </div>
                    </div>
                </div>
            </li>
        </c:forEach>
    </ul>
    <jsp:include page="/WEB-INF/views/app/cms/common/paging.jsp" flush="false">
        <jsp:param name="formId" value="#hopeElibBookForm"/>
        <jsp:param name="pagingUrl" value="hopeApplicationList.do"/>
    </jsp:include>
</form:form>