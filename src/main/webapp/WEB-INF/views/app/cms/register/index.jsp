<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
$(function() {
	$('a.gubun').on('click', function(e) {
		$('#isChild').val($(this).attr('keyValue'));
		doGetLoad('step1.do', $('#register').serialize());
		e.preventDefault();
	});
});
</script>
<div >
	<h1>회원구분</h1>
	<form:form modelAttribute="register" action="step1.do" method="post" onsubmit="return false;">
	<form:hidden path="isChild"/>
	
	<h4>회원구분</h4>
	<h5>회원 유형에 따라 가입 절차가 다르니 본인에 해당하는 회원 유형을 선택하여 주세요.</h5>
	<table class="type2">
		<colgroup>
			<col width="130"/>
			<col width="*"/>
		</colgroup>
		<tbody>
			<tr>
				<td>
					<a class="btn gubun" keyValue="Y">만 14세 미만</a>
				</td>
				<td>
					<a class="btn gubun" keyValue="N">만 14세 이상</a>
				</td>
			</tr>
			<tr>
				
			</tr>
		</tbody>
	</table>
	</form:form>
	
	<h4>회원가입 주의사항</h4>
	<h5>* 통합로그인은 한번의 로그인으로 연계된 모든 홈페이지를 이용할 수 있습니다.</h5>
	<h5>* 만 14세 미만 회원의 경우 개인정보 수집 및 이용을 위해 법정대리인(보호자)의 동의가 필요합니다.</h5>
</div>