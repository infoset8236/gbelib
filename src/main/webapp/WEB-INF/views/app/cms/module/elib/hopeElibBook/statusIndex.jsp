<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript">
  $(function () {
    $('select#rowCount').change(function (e) {
      $('#viewPage').val(1);
      doGetLoad('statusIndex.do', $('form#hopeElibBookStatusIndex').serialize());
    });

    $('.selectmenu-search').on('change', function (e) {
      $('#viewPage').val(1);
      $('#hopeElibBookStatusIndex').submit();
      e.preventDefault();
    });

    $('#manage_code').on('change', function (e) {
      $('#viewPage').val(1);
      $('#hopeElibBookStatusIndex').submit();
      e.preventDefault();
    });


    $('#searchBtn').on('click', function (e) {
      e.preventDefault();
      doGetLoad('statusIndex.do', $('form#hopeElibBookStatusIndex').serialize());
    });

    $('a#excelDownload').on('click', function (e) {
      $('#hopeElibBookStatusIndex').attr('action', 'statusExcelDownload.do').submit();
      e.preventDefault();
    });

    $('a#dialog-modify').on('click', function(e) {
      var applicationData = $(this).data('application');

      $('#dialog-1').load(
          'statusEdit.do?editMode=MODIFY&homepage_id=' + $('#homepage_id').val() +
          '&book_code=' + encodeURIComponent(applicationData.book_code) +
          '&book_idx=' + encodeURIComponent(applicationData.book_idx) +
          '&application_user_name=' + encodeURIComponent(applicationData.application_user_name) +
          '&application_user_id=' + encodeURIComponent(applicationData.application_user_id) +
          '&application_user_no=' + encodeURIComponent(applicationData.application_user_no),
          function(response, status, xhr) {
            $('#dialog-1').dialog({
              width: 600,
              height: 600
            });
            $('#dialog-1').dialog('open');
          }
      );

      e.preventDefault();
    });

  });

  // function changeStatus(data, $this) {
  //
  //   var statusMessage = {
  //     '1': "신청",
  //     '2': "처리",
  //     '3': "구입",
  //     '4': "이용자취소",
  //     '5': "기관취소"
  //   };
  //
  //   var currentStatus = statusMessage[data.application_status];
  //   var newStatus = statusMessage[$this.val()];
  //   var changeMessage = currentStatus + " 상태를 " + newStatus + " 상태로 변경하시겠습니까?";
  //
  //   var ajaxData = {
  //     'book_idx': data.book_idx,
  //     'application_status': $this.val(),
  //     'application_user_id': data.application_user_id,
  //     'application_user_no': data.application_user_no,
  //     'book_code': data.book_code
  //   };
  //
  //   if (confirm(changeMessage)) {
  //     $.ajax({
  //       type: "POST",
  //       url: 'changeStatus.do',
  //       data: ajaxData,
  //       success: function (response) {
  //         if (response.valid) {
  //           alert('변경 되었습니다.');
  //         } else {
  //           alert(response.message);
  //         }
  //         location.reload();
  //       },
  //       error: function () {
  //         alert('상태 변경에 실패했습니다.\n관리자에게 문의해 주세요.');
  //       }
  //     });
  //   } else {
  //     $this.val(data.application_status);
  //   }
  // }
</script>
<form:form modelAttribute="hopeElibBook" id="hopeElibBookStatusIndex" action="statusIndex.do" method="POST">
    <div class="search">
        검색 결과 : <fmt:formatNumber value="${paging.totalDataCount}" pattern="#,###"/> 건
        <form:select path="rowCount" class="selectmenu" style="width:150px;">
            <form:option value="10">10개씩 보기</form:option>
            <form:option value="20">20개씩 보기</form:option>
            <form:option value="30">30개씩 보기</form:option>
            <form:option value="50">50개씩 보기</form:option>
            <form:option value="${paging.totalDataCount}">전체 보기</form:option>
        </form:select>

        신청상태 :
        <form:select class="selectmenu-search" style="width:150px;" path="application_status">
            <form:option value="" label="전체"/>
            <form:option value="1" label="신청"/>
            <form:option value="2" label="처리"/>
            <form:option value="3" label="구입"/>
            <form:option value="4" label="이용자취소"/>
            <form:option value="5" label="기관취소"/>
        </form:select>

        <button id="searchBtn"><i class="fa fa-search"></i><span>검색</span></button>
        <a href="#" id="excelDownload" class="btn btn2"><i class="fa fa-file-excel-o"></i><span>엑셀저장</span></a>
    </div>

    <table class="type1 center">
        <colgroup>
            <col width="4%"/>
            <col width="8%"/>
            <col width="8%"/>
            <col width="10%"/>
            <col width="20%"/>
            <col width="10%"/>
            <col width="20%"/>
        </colgroup>
        <thead>
        <tr>
            <th>번호</th>
            <th>회원ID</th>
            <th>회원명</th>
            <th>도서명</th>
            <th>신청날짜</th>
            <th>상태</th>
            <th>기능</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="i" varStatus="status" items="${getHopeBookAdminList }">
            <tr>
                <td>${paging.listRowNum - status.index}</td>
                <td>${i.application_user_id }</td>
                <td>${i.application_user_name }</td>
                <td>${i.book_name}</td>
                <td><fmt:formatDate value="${i.application_add_date}" pattern="yyyy.MM.dd HH:mm"/></td>
                <td>
                    <c:choose>
                        <c:when test="${i.application_status eq '1'}">
                            <span style="color:#f63434;">신청</span>
                        </c:when>
                        <c:when test="${i.application_status eq '2'}">
                            <span style="color:#f63434;">처리</span>
                        </c:when>
                        <c:when test="${i.application_status eq '3'}">
                            <span style="color:#f63434;">구입</span>
                        </c:when>
                        <c:when test="${i.application_status eq '4'}">
                            <span style="color:#f63434;">이용자취소</span>
                        </c:when>
                        <c:when test="${i.application_status eq '5'}">
                            <span style="color:#f63434;">기관취소</span>
                        </c:when>
                        <c:otherwise>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <a href="" class="btn" id="dialog-modify" data-application='{
                                           "book_code": "${i.book_code}",
                                           "book_idx": "${i.book_idx}",
                                           "application_user_name": "${i.application_user_name}",
                                           "application_user_id": "${i.application_user_id}",
                                           "application_user_no": "${i.application_user_no}"
                                       }'>수정</a>
                </td>
            </tr>
        </c:forEach>
        <c:if test="${paging.totalDataCount <= 0}">
            <tr>
                <td colspan="16">조회된 자료가 없습니다.</td>
            </tr>
        </c:if>
        </tbody>
    </table>

    <jsp:include page="/WEB-INF/views/app/cms/common/paging.jsp" flush="false">
        <jsp:param name="formId" value="#"/>
    </jsp:include>

    <div class="search txt-center" style="margin-top:25px;">
        <fieldset>
            <form:select path="search_type" cssClass="selectmenu">
                <form:option value="application_user_id">신청자아이디</form:option>
                <form:option value="application_user_name">신청자명</form:option>
                <form:option value="book_name">도서명</form:option>
            </form:select>
            <form:input path="search_text" cssClass="text" cssStyle="width:200px;"/>
            <button id="search_btn"><i class="fa fa-search"></i><span>검색</span></button>
        </fieldset>
    </div>
</form:form>


<div id="dialog-1" class="dialog-common" title="상태 변경"></div>