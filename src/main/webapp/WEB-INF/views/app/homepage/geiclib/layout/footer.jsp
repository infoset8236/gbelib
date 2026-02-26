<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="homepageTag" uri="/WEB-INF/config/tld/homepageTag.tld"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript">
$(function() {
	$('select.site-list').change(function(e) {
		var openNewWindow = window.open("about:blank");
		
		openNewWindow.location.href = $(this).val();
	});
});
</script>
	<div id="footer">
		<div class="section">
			<div class="fcont fc1">
				<dl>
					<dt><img src="/resources/homepage/ge/img/logo_copy.png" alt="경상북도교육청정보센터"/></dt>
				</dl>
			</div>
			<div class="fcont fc2">
				<dl>
					<dd>
						(${homepage.zipcode }) ${homepage.address1 }
						<p style="font-size: 13px;">&copy; 2016. ${homepage.homepage_eng_name }, ALL RIGHTS RESERVED</p>
						<label>대표번호</label> <span>Tel.${fn:split(homepage.homepage_tell,',')[0]} Fax.${fn:split(homepage.homepage_fax,',')[0]}</span> <strong><a href="/${homepage.context_path}/html.do?menu_idx=157">찾아오시는 길</a></strong>
					</dd>
					<dd></dd>
					<!-- <dt>연락처</dt> -->
					<%-- <dd></dd>
					<dd><label>총무과</label> <span>Tel.${fn:split(homepage.homepage_tell,',')[1]}  Fax.${fn:split(homepage.homepage_fax,',')[1]}</span></dd>
					<dd><label>정보화과</label> <span>Tel.${fn:split(homepage.homepage_tell,',')[2]}  Fax.${fn:split(homepage.homepage_fax,',')[2]}</span></dd>
					<dd><label>문헌정보과</label> <span>Tel.${fn:split(homepage.homepage_tell,',')[3]}  Fax.${fn:split(homepage.homepage_fax,',')[3]}</span></dd> --%>
				</dl>
			</div>
			<div class="fcont fc3">
				<dl>
					<!-- <dt>기관정책</dt> -->
					<dd><strong><a href="/${homepage.context_path}/html.do?menu_idx=142">개인정보처리방침</a></strong></dd>
					<dd><a href="/${homepage.context_path}/html.do?menu_idx=141">홈페이지이용약관</a></dd>
					<dd><a href="/${homepage.context_path}/html.do?menu_idx=143">영상정보처리기기운영관리방침</a></dd>
					<dd><a href="/${homepage.context_path}/html.do?menu_idx=144">이용자서비스헌장</a></dd>
					<%-- <dd class="link">
						<homepageTag:siteLink homepageList="${homepageList}" width="160px"/>
					</dd> --%>
				</dl>
			</div>
		</div>
	</div>

</body>
</html>