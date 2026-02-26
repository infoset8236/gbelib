<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="homepageTag" uri="/WEB-INF/config/tld/homepageTag.tld"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>
$(document).ready(function() {
	location.href='https://dz.gbelib.kr/wb_booking/sso_login_proc.php?flag=app&ssoId=${sessionScope.member.user_no}&ssoNo=${sessionScope.member.seq_no}&goPage=http%3A%2F%2Fdz.gbelib.kr%2F${homepage.context_path}/index.do';
});
</script>
