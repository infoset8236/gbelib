<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="dataF-wr mg15f">
	<ul class="info_list">
		<li>
			<div class="list_cell">
				<p class="icon"><img src="/resources/common/img/dw02.png" alt="" width="164"></p>
				<p class="title">경북도민인증</p>
				<ul class="dot_txt_list">
					<li>자격 확인이 필요한 행정·공공 서비스 이용 신청 시 신청인이 직접 본인 동의하에 행정안전부 행정정보공동이용 시스템을 통해 신청 자격을 확인하는 서비스입니다.<br>
					주소지가 경북으로 가입된 회원은 추가 인증을 통해 비대면 정회원 가입으로 전자도서관 이용이 가능합니다. 아래의 <strong>경북도민인증</strong> 버튼을 클릭하시면 추가 인증 페이지로 이동합니다.</li>
				</ul>
			</div>
		</li>
	
		<li>
			<div class="list_cell">
				<p class="icon"><img src="/resources/common/img/dw01.png" alt="" width="164"></p>
				<p class="title">경북학생인증</p>
				<ul class="dot_txt_list">
					<li>독서교육종합지원시스템(DLS)에 가입된 회원은 추가 인증을 통해 비대면 정회원 가입으로 전자도서관 이용이 가능합니다.<br>
					아래의 <strong>경북학생인증</strong> 버튼을 클릭하시면 추가 인증 페이지로 이동합니다.</li>
				</ul>
			</div>
		</li>
	</ul>
</div>

<div class="txt-box-adv2" style="padding-top:18px;">
	<ul class="con">
		<li>신규 회원가입하여 로그인 후 인증 가능합니다.</li>
		<li><b>비대면 인증 정회원은 원칙적으로 전자도서관만 이용할 수 있습니다.</b> 도서대출회원증을 발급받고자 하는 경우 본인확인을 위한 구비서류(신분증 등)를 직접 지참하여 도서관을 방문하여 주시기 바랍니다. </li>
	</ul>
</div>
<div class="btn-wrap" style="text-align:center;padding:20px 0">
	<a href="untactForm.do?menu_idx=${untactMenuIdx}" class="btn btn02" style="background: #f56627;border: 1px solid #f56627;color:#fff;">경북도민인증</a>
	<a href="indexDls.do?menu_idx=${dlsMenuIdx}" class="btn btn01" style="background: #3c6ad9;border: 1px solid #3c6ad9;color:#fff;">경북학생인증</a>
	<a href="/${homepage.context_path}/index.do" class="btn btn03">메인으로</a>
</div>
