<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
$(function() {
	if(window.location.protocol == "http:"){
		window.location.protocol = "https:";
	}
});
</script>
<style>
	.regularUser span.link2{margin-top:140px;}
	.regularUser p.regularUser_b span.dls_txt{background:none;font-size:15px;color:#777;display:block;margin-top:-5px;letter-spacing:0;font-weight:400;}
	p.txt-info{float:left;margin-top:10px;}

	@media all and (max-width:767px){
		.regularUser span.link2{margin-top:5px;}
		.regularUser p.regularUser_b span.dls_txt{font-size:12px;}
		p.txt-info{font-size:12px;}
	}
</style>

<div class="regularUser">
	<a href="untactForm.do?menu_idx=${member.menu_idx}" title="새창열림" class="certtype" id="parentSms">
		<p class="regularUser_a">
			경북도민인증
			<span class="link">바로가기</span>
		</p>
	</a>
</div>

<p class="txt-info">* 경북도민인증으로 정회원전환이 가능합니다.</p>

<div class="space"></div>