<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<title>SSO 중복 로그인 확인</title>
	<script type="text/javascript">
		window.onload = function() {
			var memberId = '${memberId}';
			var userIp = '${userIp}';

			var userResponse = confirm(memberId + " 아이디가 " + userIp + " IP에 로그인 되어있습니다.\n이전 로그인을 종료하시겠습니까?\n관리자페이지로 이동합니다.");

			if (userResponse) {
				location.href = 'https://www.gbelib.kr/cms/login/ssoLogout.do';
			} else {
				location.href = 'https://www.gbelib.kr/cms/login/logout.do';
			}
		}
	</script>
</head>
</html>