<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="homepageTag" uri="/WEB-INF/config/tld/homepageTag.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script>
window.onload = function () {
	var loginType = "<c:out value='${sessionScope.member.loginType}'/>";
	var isLogin = "<c:out value='${sessionScope.member.login}'/>";
	var statusCode = "<c:out value='${sessionScope.member.status_code}'/>";
	if(loginType.valueOf() == 'HOMEPAGE' && isLogin.valueOf() === 'true' && statusCode.valueOf() === '0'){
window.location.href='https://nsmart.koedu.co.kr/library.php?chk=Y2hrdGltZT0xNDQ0Nzc1ODE4JmxpYnJhcnk96rK97IOB67aB64%2BE6rWQ7Jyh7LKtIOq1rOuvuOuPhOyEnOq0gCZ1YXNlcl9uYW1lPeqyveyDgeu2geuPhOq1kOycoeyyrSDqtazrr7jrj4TshJzqtIAmdWFzZXJfaWQ9Z21wbDAwMg%3D%3D';
	} else if(loginType.valueOf() == 'HOMEPAGE' && isLogin.valueOf() === 'true' && statusCode.valueOf() === '1'){
		alert('정회원인증후 이용가능합니다.');
		window.location.href='https://www.gbelib.kr/gm/module/myDashBoard/index.do?menu_idx=191';
	} else {
		alert('로그인 후 이용가능합니다.');
		window.location.href='http://www.gbelib.kr/gm/intro/login/index.do?menu_idx=115';
	}
}
</script>