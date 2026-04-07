<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript">
  $(function () {
    $('.dialog-common').dialog({ //모달창 기본 스크립트 선언
      autoOpen: false,
      resizable: false,
      modal: true,
      open: function () {
        $('.ui-widget-overlay').addClass('custom-overlay');
      },
      close: function () {
        $('.ui-widget-overlay').removeClass('custom-overlay');
      },
      buttons: [
        {
          text: "저장",
          "class": 'btn btn1',
          click: function () {
            if (doAjaxPost($('#hopeElibBook'))) {
              location.reload();
            }
          }
        }, {
          text: "취소",
          "class": 'btn',
          click: function () {
            $(this).dialog('destroy');
          }
        }
      ]
    });

  });

</script>
<form:form id="hopeElibBook" modelAttribute="hopeElibBook" method="post" action="changeStatus.do">
    <form:hidden path="book_idx"/>
    <form:hidden path="application_idx"/>
    <form:hidden path="editMode"/>
    <form:hidden path="application_cell_phone"/>
    <form:hidden path="type"/>
    <form:hidden path="book_name"/>
    <table class="type2">
        <colgroup>
            <col width="130"/>
            <col width="*"/>
        </colgroup>
        <tbody>
        <tr>
            <th>상태</th>
            <td>
                <form:select path="application_status" class="selectmenu" style="width:300px;">
                    <form:option value="">-- 선택 --</form:option>
                    <form:option value="1">신청</form:option>
                    <form:option value="2">처리</form:option>
                    <form:option value="3">구입</form:option>
                    <form:option value="4">이용자취소</form:option>
                    <form:option value="5">기관취소</form:option>
                </form:select>
            </td>
        </tr>
        <c:if test="${hopeElibBook.application_status eq 2 or hopeElibBook.application_status eq 3}">
            <tr>
                <th>승인ID</th>
                <td>
                    <form:input path="application_approval_id" class="text" style="width:100%"/>
                </td>
            </tr>
        </c:if>
        <c:if test="${hopeElibBook.application_status eq 4 or hopeElibBook.application_status eq 5}">
            <tr>
                <th>취소ID</th>
                <td>
                    <form:input path="application_cancel_id" class="text" style="width:100%"/>
                </td>
            </tr>
        </c:if>
        <tr>
            <th>사유</th>
            <td>
                <form:input path="application_remarks" class="text" style="width:100%"/>
            </td>
        </tr>
        </tbody>
    </table>
</form:form>
