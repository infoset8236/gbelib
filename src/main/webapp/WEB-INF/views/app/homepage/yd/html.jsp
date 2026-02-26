<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<c:choose>
<c:when test="${html ne null}">
${html.html}
</c:when>
<c:otherwise>
등록된 HTML이 없습니다. 
</c:otherwise>
</c:choose>
</html>