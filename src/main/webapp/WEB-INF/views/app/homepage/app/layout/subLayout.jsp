<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="homepageTag" uri="/WEB-INF/config/tld/homepageTag.tld"%>
<tiles:insertAttribute name="header" />
<style>
/* 서브페이지 */
#container .section,
#container{clear:both;overflow:visible}
</style>
<script type="text/javascript">
$(function() {
	$('li#menu_${menuOne.parent_menu_idx }').addClass('active');
	$('li#menu_${menuOne.menu_idx}').addClass('active');
	var halbaeNode = $('li#menu_${menuOne.parent_menu_idx }').parent().parent()[0];
	if ( halbaeNode != null && halbaeNode.nodeName == 'LI' ) {
		$(halbaeNode).addClass('active');
	}
});
</script>
<div id="wrap">
	
	<tiles:insertAttribute name="top" />
	<tiles:insertAttribute name="topMenu" />
	
	<div id="container" class="subpage">

		<div class="content">

			<div class="doc-body con${menuOne.menu_idx}" id="contentArea">
				<div class="body" style="background:#fff;padding:0;overflow:hidden">


						<tiles:insertAttribute name="body" />


				</div>
			</div>

		</div>

	</div>

<!--
	<div id="footer">

		<div class="section">
			<p class="copyright-section">
				&copy; 2018. <span style="color:#fff;font-weight:200;">Gyeongsangbuk-do office of Education Information Center</span><br />ALL RIGHTS RESERVED
			</p>
		</div>

	</div>
-->
</div>
<div class="dimd"></div>
</body>
</html>