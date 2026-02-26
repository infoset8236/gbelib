<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<ul class="keyword_bubble_chart">
    <c:forEach items='${bookKeywordList}' var="i" begin="0" end="19">
        <li class="keyword_bubble_chart_item" onclick="addSelectedKeyword('${i.keyword_name}')" >${i.keyword_name}</li>
    </c:forEach>
</ul>