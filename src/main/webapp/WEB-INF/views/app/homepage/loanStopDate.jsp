<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.loanStopDateInfoBox {border:1px solid #ddd;box-sizing:border-box;padding:10px 15px;text-align:center;margin-bottom:10px;}
.loanStopDateInfoBoxTitle {color:#900000;font-weight:600;font-size:17px;}

@media all and (max-width:1024px){
.loanStopDateInfoBox {font-size:15px;}
.loanStopDateInfoBoxTitle {font-size:16px;}
}
@media all and (max-width:768px){
.loanStopDateInfoBox {font-size:13px;}
.loanStopDateInfoBoxTitle {font-size:14px;}
}
</style>

<c:if test="${not empty sessionScope.member.not_loan_sdate && not empty sessionScope.member.not_loan_edate}">
<div class="loanStopDateInfoBox">
	<fmt:parseDate value="${sessionScope.member.not_loan_sdate}" var="not_loan_sdate" pattern="yyyyMMdd" />
	<fmt:parseDate value="${sessionScope.member.not_loan_edate}" var="not_loan_edate" pattern="yyyyMMdd" />
	<div class="loanStopDateInfoBoxTitle">대출중지기간 </div>
	<fmt:formatDate value="${not_loan_sdate}" pattern="yyyy-MM-dd" /> 부터 <fmt:formatDate value="${not_loan_edate}" pattern="yyyy-MM-dd" /> 까지
</div>
</c:if>