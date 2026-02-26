<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
$(function() {

	$('a#auth-child').on('click', function() {
		<%-- <% if(!"".equals(child_name) || (type != null && type.equals("child"))) {%>
		alert('본인은 인증된 상태입니다. 보호자의 인증이 필요합니다.');
		<% } else {%> --%>
		$('#ipin_type').val('child');
		wWidth = 360;
		wHight = 120;
		wX = (window.screen.width - wWidth) / 2;
		wY = (window.screen.height - wHight) / 2;
		var url = 'http://gnelib.gne.go.kr/g-pin/Sample-AuthRequest.jsp?site_url=cwlib&mid=m1234&act=register&type=child';
		window.open("", "gPinLoginWin1", "directories=no,toolbar=no,left="+wX+",top="+wY+",width="+wWidth+",height="+wHight);
		document.ipinForm.target = "gPinLoginWin1";
		document.ipinForm.action = url;
		document.ipinForm.submit();
		<%-- <% } %> --%>
	});

	<%-- // 보호자 공공아이핀
	function Auth_protector() {
		<% if(!(!"".equals(child_name) || (type != null && type.equals("child")))) {%>
			alert('14세 미만 본인확인을 먼저 하세요.');
		<% } else if(request.getParameter("protector_name") != null || (type != null && type.equals("protector"))) {%>
		alert('보호자는 인증된 상태입니다.');
		<% } else {%>
		if($('#deputyCheck').prop('checked') != true) {
			alert('법정대리인(보호자)동의 체크해 주세요.');
			return false;
		}
		$('#ipin_type').val('protector');
		wWidth = 360;
		wHight = 120;
		wX = (window.screen.width - wWidth) / 2;
		wY = (window.screen.height - wHight) / 2;
		var url = "http://gnelib.gne.go.kr/g-pin/Sample-AuthRequest.jsp?site_url=<%=site_url%>&mid=<%=mid%>&act=register&type=protector";
		//window.open(url, "gPinLoginWin2", "directories=no,toolbar=no,left="+wX+",top="+wY+",width="+wWidth+",height="+wHight);
		// var w = window.open("http://gnelib.gne.go.kr/g-pin/Sample-AuthRequest.jsp?site_url=<%=site_url%>&mid=<%=mid%>&act=register&type=protector", "gPinLoginWin2", "directories=no,toolbar=no,left="+wX+",top="+wY+",width="+wWidth+",height="+wHight);
		window.open("", "gPinLoginWin2", "directories=no,toolbar=no,left="+wX+",top="+wY+",width="+wWidth+",height="+wHight);
		document.ipinForm.target = "gPinLoginWin2";
		document.ipinForm.action = url;
		document.ipinForm.submit();
		<% } %>
	}

	// 본인확인
	function openPCCWindow_child(){
		<% //if(request.getParameter("protector_name") == null && (type == null || (type != null && type.equals("child")))) {%>
		<% if(!"".equals(child_name) || (type != null && type.equals("child"))) {%>
		alert('본인은 인증된 상태입니다. 보호자의 인증이 필요합니다.');
		<% } else {%>
		$('#type').val('child');
		document.pccForm.target="pccFrame";
		document.pccForm.submit();
		<% } %>
	}

	// 보호자확인
	function openPCCWindow_protector(){
		<% if(!(!"".equals(child_name) || (type != null && type.equals("child")))) {%>
			alert('14세 미만 본인확인을 먼저 하세요.');
		<% } else if(request.getParameter("protector_name") != null || (type != null && type.equals("protector"))) {%>
		alert('보호자는 인증된 상태입니다.');
		<% } else {%>
		if($('#deputyCheck').prop('checked') != true) {
			alert('법정대리인(보호자)동의 체크해 주세요.');
			return false;
		}
		$('#type').val('protector');
		document.pccForm.target="pccFrame";
		document.pccForm.submit();
		<% } %>
	}
	 --%>
	
	
});

</script>
<div style="width:75%;">
	<h1>본인확인</h1>
	<form:form modelAttribute="register" action="save.do" method="post" onsubmit="return false;">
		<h4>본인확인</h4>
		<h5>우리 도서관에서는 원활한 서비스 이용과 익명 사용자로 인한 피해를 방지하기 위하여 본인확인 절차를 거치고 있습니다.</h5>
		<table class="type2">
			<colgroup>
				<col width="*"/>
				<col width="*"/>
			</colgroup>
			<tbody>
				<tr><td colspan=2>만 14세 미만 회원 본인확인</td></tr>
				<tr>
					<th>
						공공 아이핀 본인인증
					</th>
					<th>
						휴대폰 본인인증
					</th>
				</tr>
				<tr>
					<td>
						<a id="auth-child" class="btn btn2 gubun" keyValue="N">인증하기</a>
					</td>
					<td>
						<a class="btn btn2 gubun" keyValue="N">인증하기</a>
					</td>
				</tr>
				<tr><td colspan=2>법정대리인 (보호자) 동의</td></tr>
				<tr>
					<th>
						공공 아이핀 본인인증
					</th>
					<th>
						휴대폰 본인인증
					</th>
				</tr>
				<tr>
					<td>
						<a class="btn btn2 gubun" keyValue="N">인증하기</a>
					</td>
					<td>
						<a class="btn btn2 gubun" keyValue="N">인증하기</a>
					</td>
				</tr>
			</tbody>
		</table>
		
		<h4>공공 I-PIN 이용 및 발급 안내</h4>
		<a class="col_green" href="http://i-pin.kisa.or.kr/kor/use/use.jsp" target="_blank" title="새창열림">[공공 I-PIN 이용방법 안내]</a> <a class="col_green" href="http://www.gpin.go.kr/center/join/join_index.gpin" target="_blank" title="새창열림">[공공 I-PIN 신규발급]</a> <a class="col_green" href="http://i-pin.kisa.or.kr/kor/issue/children.jsp" target="_blank" title="새창열림">[우리아이 공공 I-PIN 발급 안내]</a>
		<h5>* 공공 I-PIN 콜센터 안내  : 공공 아이핀 / 마이핀 콜센터 : 02-818-3050 (운영시간 : 평일 09시~18시)</h5>
		<h5>* 휴대폰 본인인증 콜센터 안내 : 휴대폰 본인인증 콜센터 : 1577-1006(운영시간 : 평일 09시 ~18시)</h5>
		
	</form:form>
	
<form name="ipinForm" id="ipinForm" method="POST">
	<input type="hidden" name="type" id="ipin_type" value="child">
	<input type="hidden" name="returnUrl" value="http://localhost:81/cms/register/term.do">
	<input type="hidden" name="failedUrl" value="http://localhost:81/cms/register/check.do">
	<input type="hidden" name="child_name" value="<%=request.getParameter("child_name")%>">
	<input type="hidden" name="d_data" value="<%=request.getParameter("di")%>">
	<input type="hidden" name="c_data" value="<%=request.getParameter("ci1")%>">
	<input type="hidden" name="v_data" value="<%=request.getParameter("ci2")%>">
	<input type="hidden" name="s_data" value="<%=request.getParameter("sex")%>">
	<input type="hidden" name="b_data" value="<%=request.getParameter("birYMD")%>">
</form>
</div>