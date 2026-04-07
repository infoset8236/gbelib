<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript">
  $(function () {
    $('#searchBtn').on('click', function (e) {
      e.preventDefault();
      doGetLoad('rank.do', $('form#rankIndex').serialize());
    });

    $('a#excelDownload').on('click', function (e) {
      $('#rankIndex').attr('action', 'rankExcelDownload.do').submit();
      e.preventDefault();
    });
  });
</script>
<form:form modelAttribute="hopeElibBook" id="rankIndex" action="rank.do" method="POST">
    <div class="infodesk">
        <div class="button">
            <a href="#" id="excelDownload" class="btn btn2"><i class="fa fa-file-excel-o"></i><span>엑셀저장</span></a>
        </div>
    </div>

    <table class="type1 center">
        <colgroup>
            <col width="25%"/>
            <col width="25%"/>
            <col width="25%"/>
            <col width="25%"/>
        </colgroup>
        <thead>
        <tr>
            <th>도서명</th>
            <th>저자명</th>
            <th>출판사</th>
            <th>신청횟수</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="i" varStatus="status" items="${hopeElibBookApplicantRank}">
            <tr>
                <td>${i.book_name}</td>
                <td>${i.author_name}</td>
                <td>${i.book_pubname}</td>
                <td>${i.cnt}</td>
            </tr>
        </c:forEach>
        <c:if test="${fn:length(hopeElibBookApplicantRank) < 1}">
            <tr>
                <td colspan="4">조회된 자료가 없습니다.</td>
            </tr>
        </c:if>
        </tbody>
    </table>
</form:form>