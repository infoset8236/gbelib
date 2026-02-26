<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
var idCheck = false;
var pwCheck = false;
var pwCheck2 = false;
$(function() {
	$('a#dlsCheck').on('click', function(e) {
		e.preventDefault();
		$('input#dlsId').val($('input#dlsId').val());
		
		if ($('input#dlsId').val() == '') {
			alert('DLSC 아이디를 입력해주세요.');
			$('input#dlsId').focus();
			return false;
		}
		
		if ($('input#dlsPw').val() == '') {
			alert('DLSC 비밀번호를 입력해주세요.');
			$('input#dlsPw').focus();
			return false;
		}
		
		$.get('dlsIdCheck.do?dls_id='+$('input#dlsId').val(), function(response) {
			if (response.valid) {
				alert('이미 인증 받은 아이디입니다.\nDLSC 아이디를 확인 하시기 바랍니다.');
				return false;
			} else {
				$('input#reading_id').val($('input#dlsId').val());
				$('input#reading_pw').val($('input#dlsPw').val());
				
				var wWidth = 500;
		 		var wHight = 360;
		 		var wX = (window.screen.width - wWidth) / 2;
		 		var wY = (window.screen.height - wHight) / 2;
				
				var dlsWindow = window.open('', "dlsWindow", "directories=no,toolbar=no,resizeable=yes,left="+wX+",top="+(wY-200)+",width="+wWidth+",height="+wHight);
				$('form#dlsCheckForm').submit();
				dlsWindow.focus();
			}
		});
		
		
	});
	
	
});

$(document).on("keyup", "input:text[numberOnly]", function() {
	$(this).val($(this).val().replace(/[^0-9]/gi, ""));
});
</script>
<style>
.join-step li { margin: 0% 2%;}
</style>
<div class="join-wrap">

	<form:form id="dlsCheckForm" method="post" target="dlsWindow" action="https://reading.gyo6.net/r/reading/search/ebookView_kb_ck.jsp">
		<input type="hidden" name="reading_pw" id="reading_pw" >
		<input type="hidden" name="reading_id" id="reading_id" >
		<input type="hidden" name="return_url" value="https://www.gbelib.kr/geic/intro/join/checkDls.do">
		<div style="text-align: right;">
			(<span style="color: red; font-weight: bold;">*</span>) 항목은 필수 입력값입니다.
		</div>
		<table id="memberForm" >
			<colgroup>
				<col width="10%">
				<col>
			</colgroup>
			<tbody>
				<tr>
					<th>DLS 정보입력</th>
					<td>
						<div style="padding-top: 5px; padding-bottom: 5px; " id="dlsForm">
							<p><span style='display:inline-block;width:23%;'>DLS 아이디 : </span><span class=""><input type="text" id="dlsId" class="text" /></span></p>
							<p style='padding-top:3px;'><span style='display:inline-block;width:23%;'>이름 : </span><span class=""><input type="text" id="dlsPw" class="text" /> <a href="#" id="dlsCheck" class="btn">확인</a></span></p>
							
						</div>
						<div id="dlsCmt" class="ui-state-highlight">
							* DLS 아이디, 이름 인증으로 정회원 가입이 가능합니다.
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</form:form>
	<br/>
</div>