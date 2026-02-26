<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div id="tabContentArea"></div>

<%--<div class="filterArea">
    <div class="recentMonthFilter">
        &lt;%&ndash;<label class="filterItem" tabindex="0">
            <input type="radio" name="monthFilter" value="1" checked>
            <span class="customRadio selected"></span>전체
        </label>&ndash;%&gt;
        &lt;%&ndash;<label class="filterItem" tabindex="0">
            <input type="radio" name="monthFilter" value="2" checked>
            <span class="customRadio"></span>1개월
        </label>
        <label class="filterItem" tabindex="0">
            <input type="radio" name="monthFilter" value="3">
            <span class="customRadio"></span>3개월
        </label>&ndash;%&gt;
    </div>
    <div class="customDateFilter">
        &lt;%&ndash;<div class="filterLabel" tabindex="0">기간</div>
        <div class="filterInput">
            <label><input type="date" id="startDate" class="startDate" aria-label="시작날짜" tabindex="0"></label>
            <span class="dateSeparator">~</span>
            <label><input type="date" id="endDate" class="endDate" aria-label="마지막날짜"  tabindex="0"></label>
        </div>&ndash;%&gt;
    </div>
</div>--%>
<c:if test="${fn:length(reserveList.dsMyLibraryList) < 1 }">
    <div class="exception" style="margin-top: 30rem">예약중인 도서 내역이 없습니다.</div>
</c:if>
<c:if test="${fn:length(reserveList.dsMyLibraryList) > 0 }">
<div>
    <ul class="resultList" id="loanList">
        <c:forEach items="${reserveList.dsMyLibraryList}" var="i" varStatus="status">
            <li class="resultItem">
                <div class="bookInfo">
                    <div class="bookDetail">
                        <div class="bookTitle" tabIndex="0">${i.TITLE}</div>
                        <div class="bookMeta">
                            <div tabIndex="0" class="dataRoom">소장처명<span>${i.LOCA_NAME}</span></div>
                            <div tabIndex="0" class="loanDate">예약일<span><fmt:parseDate var="curDate" value="${i.RESVE_DATE}" pattern="yyyyMMdd"/>
							<fmt:formatDate value="${curDate}" type="both" pattern="yyyy-MM-dd"/></span></div>
                            <div tabIndex="0" class="libraryName">예약순위<span>${i.RESVE_RANK}</span></div>
                            <div tabIndex="0" class="returnDate">자료실명<span>${i.SUB_LOCA_NAME}</div>
                        </div>
                    </div>
                </div>
                <div class="loanStatus code1">${i.STATUS_NAME}</div>
                <%--<div class="loanStatus code1">대출</div>--%>
                <%--                        <div class="loanStatus">알수없음</div>--%>
                <%--                        <div class="loanStatus code2">반납<br>연기</div>--%>
                <%--                        <div class="loanStatus code5">반납<br>완료</div>--%>
                <%--                        <div class="loanStatus code3">예약중</div>--%>
                <%--                        <div class="loanStatus code3">일반예약</div>--%>
                <%--                        <div class="loanStatus code3">무인예약</div>--%>
                <%--                        <div class="loanStatus code3">야간예약</div>--%>
                <%--                        <div class="loanStatus code4">예약<br>취소</div>--%>
                <%--                        <div class="loanStatus code5">반납<br>완료</div>--%>
            </li>
        </c:forEach>
    </ul>
    <%--<div class="pagination" id="loanPagination">
        <a href="#" tabindex="0" class="first"></a>
        <a href="#" tabindex="0" class="prev"></a>
        <ul>
            <li class="active">1</li>
        </ul>
        <a href="#" tabindex="0"  class="next"></a>
        <a href="#" tabindex="0"  class="last"></a>
    </div>--%>
</div>
</c:if>
