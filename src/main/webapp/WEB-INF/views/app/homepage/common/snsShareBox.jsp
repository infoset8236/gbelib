<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="homepageTag" uri="/WEB-INF/config/tld/homepageTag.tld"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>
$(document).ready(function() {
	$('a.shareBtn').on('click', function(e) {
	    if($('div#share_layer').css('display') == 'none') {
	           $('div#share_layer').show();
	           $('div.shareAllBtn').show();
	           e.preventDefault();
	    } else {
	           $('div#share_layer').hide();
	           $('div.shareAllBtn').hide();
	           e.preventDefault();
	    }
	});
	$('a#closeshareBox').on('click', function(e) {
		$('a.shareBtn').focus();
		$('div#share_layer').hide();
	});
});
</script>


<ul>
	<c:if test="${member.loginType eq 'CMS' and member.login}">
	<li><a href="/cms/menu/${homepage.context_path}/htmlEdit.do?menu_idx=${menuOne.menu_idx}" class="btn"><i class="fa fa-edit"></i><span>본문내용 수정</span></a></li>
	</c:if>
	<li><a href="" class="noBox shareBtn"><img src="/resources/common/img/sns_share_ov.png" alt="SNS 공유 목록" class="shareBtn"/></a>
		<div id="shareBtnArea">
			<div class="inbox" id="share_layer" style="display: none;"  >     
				<div class="shareAllBtn" >
					<ul class="shareBox">
						<!--<li><a href="#" class="sub-kakao shareIconArea"    title="새창열림"  keyValue1="${homepage.homepage_id}" keyValue2="${menuOne.menu_idx}" keyValue3="${menuOne.menu_name}" keyValue4="${homepage.homepage_name}"><img src="/resources/common/img/icon_kakaostory.png"  alt="카카오스토리 공유" class="shareIcon"/><span>카카오스토리</span></a></li>-->     
						<li><a href="#" class="sub-facebook shareIconArea" title="새창열림"  keyValue1="${homepage.homepage_id}" keyValue2="${menuOne.menu_idx}" keyValue3="${menuOne.menu_name}" keyValue4="${homepage.homepage_name}"><img src="/resources/common/img/icon_facebook.png" alt="페이스북 공유" class="shareIcon"/><span>페이스북</span></a></li>
						<li><a href="#" class="sub-twitter shareIconArea"  title="새창열림"  keyValue1="${homepage.homepage_id}" keyValue2="${menuOne.menu_idx}" keyValue3="${menuOne.menu_name}" keyValue4="${homepage.homepage_name}"><img src="/resources/common/img/icon_twitter.png" alt="트위터 공유" class="shareIcon"/><span>트위터</span></a></li>   
					</ul>
				</div>
						 <a href="#" id="closeshareBox" class="close" title="닫기" ><i class="fa fa-close" title="닫기"  ></i></a>
			</div>
		</div>
		</li>
	<li><a href="#" class="noBox" title="새창열림"  onclick="contentPrint(); return false;"><img src="/resources/common/img/sns_prt_ov.png" alt="페이지 내용 인쇄" ></a></li>
	<li><a href="#qrcode" class="sub-qrcode noBox" keyValue="true"><img src="/resources/common/img/sns_qr_ov.png" alt="${homepage.homepage_name} QR코드"></a></li>
</ul>