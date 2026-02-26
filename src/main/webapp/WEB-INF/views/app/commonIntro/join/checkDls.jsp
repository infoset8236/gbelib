<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript">
<c:if test="${isDlsMember}">
alert('DLSC 인증이 완료되었습니다. 재 로그인하여 정회원으로 이용가능합니다.');
window.opener.location.href = '/${homepage.context_path}/intro/login/logout.do?relogin=true';
</c:if>

<c:if test="${!isDlsMember}">
	alert('DLSC 인증에 실패하였습니다. 재로그인하여 진행하시길 요청 드리며, 그럼에도 실패시 DLS아이디와 비밀번호를 확인해주시길 바랍니다.');
// 	<c:if test="${isDlsMemberName eq 'Y'}">
// 	alert('DLSC 인증에 실패하였습니다. 아이디 또는 비밀번호를 확인해주세요.');
// 	</c:if>
// 	<c:if test="${isDlsMemberName eq 'N'}">
// 	alert('DLSC 인증에 실패하였습니다. 이름을 확인해주십시오.');
// 	</c:if>
</c:if>
window.close();
</script>
