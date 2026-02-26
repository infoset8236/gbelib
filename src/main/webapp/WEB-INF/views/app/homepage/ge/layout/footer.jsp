<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
					<dd>
						(${homepage.zipcode }) ${homepage.address1 }
						<p>&copy; 2016. ${homepage.homepage_eng_name }, ALL RIGHTS RESERVED</p>
					</dd>
					<dd><a href="/${homepage.context_path}/html.do?menu_idx=112">찾아오시는 길</a></dd>
				</dl>
			</div>
			<div class="fcont fc2">
				<dl>
					<!-- <dt>연락처</dt> -->
					<dd><label>대표번호</label> <span>Tel.${fn:split(homepage.homepage_tell,',')[0]} Fax.${fn:split(homepage.homepage_fax,',')[0]}</span></dd>
					<dd><label>총무과</label> <span>Tel.${fn:split(homepage.homepage_tell,',')[1]}  Fax.${fn:split(homepage.homepage_fax,',')[1]}</span></dd>
					<dd><label>정보화과</label> <span>Tel.${fn:split(homepage.homepage_tell,',')[2]}  Fax.${fn:split(homepage.homepage_fax,',')[2]}</span></dd>
					<dd><label>문헌정보과</label> <span>Tel.${fn:split(homepage.homepage_tell,',')[3]}  Fax.${fn:split(homepage.homepage_fax,',')[3]}</span></dd>
				</dl>
			</div>
			<div class="fcont fc3">
				<dl>
					<!-- <dt>기관정책</dt> -->
					<dd><strong><a href="/${homepage.context_path}/html.do?menu_idx=99">개인정보처리방침</a></strong></dd>
					<dd><a href="/${homepage.context_path}/html.do?menu_idx=98">홈페이지이용약관</a></dd>
					<dd><a href="/${homepage.context_path}/html.do?menu_idx=100">영상정보처리기기운영관리방침</a></dd>
					<dd><a href="/${homepage.context_path}/html.do?menu_idx=102">이용자서비스헌장</a></dd>
					<%-- <dd class="link">
						<homepageTag:siteLink homepageList="${homepageList}" width="160px"/>
					</dd> --%>
				</dl>
			</div>
		</div>
	</div>
</body>
</html>