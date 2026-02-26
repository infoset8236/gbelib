<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	._padding {padding-left: 30px;}
</style>
<script>
$(function() {
	$('#cancel-btn').on('click', function() {
		var url = '/${homepage.context_path}/module/support/index.do';
		var formData = serializeParameter(['menu_idx']);
		if($('#pageType').val() == 'ajax') {
			$('#tabCon1').load('/${homepage.context_path}/module/support/index.do?menu_idx=' + $('#menu_idx').val()+'&pageType=ajax');
		} else {
			doGetLoad(url, formData);	
		}
	});
	
	json_text_to_fields();
});

function json_text_to_fields() {
	var json = {};
	
	try {
		json = JSON.parse($('#categories').val());
		
		$.each(json, function(k, item) {
			var input = $('#' + k);
			if(input.attr('type') == 'text') {
				input.prop('disabled', false);
				input.val(json[k]);
			} else if(input.attr('type') == 'checkbox') {
				input.prop('disabled', false);
				input.prop('checked', true);
			}
		});
	} catch(e) {
		return;
	}
}
</script>
<form:form modelAttribute="support" id="rsupport_result" action="result.do" method="post">
<form:hidden path="editMode"/>
<form:hidden path="plan_date" value="${fn:substring(calendarManage.start_date,0,7)}"/>
<form:hidden path="homepage_id"/>
<form:hidden path="seq"/>
<form:hidden path="menu_idx"/>
<form:hidden path="pageType"/>
<form:hidden path="categories"/>
<em><strong>신청내역</strong></em>
<table class="type2">
	<colgroup>
		<col width="140"/>
		<col width="*"/>
	</colgroup>
	<tbody>
		<tr>
			<th>신청기관명</th>
			<td>${support.req_name}</td>
		</tr>
		<tr>
			<th>신청자성명</th>
			<td>${support.requer_name}</td>
		</tr>
		<tr>
			<th>신청자휴대폰</th>
			<td>${support.requer_tel}</td>
		</tr>
		<tr>
			<th>지원희망일자</th>
			<td>${support.hope_req_dt}</td>
		</tr>
		<tr>
			<th>*희망지원분야</th>
			<td>
				<ul class="_padding">
					<li><input type="checkbox" id="_field20" class="_field" value="Y"> 업무처리시스템 권한관리</li>
					<ul class="_padding">
						<li>※ 지원 분야: 나이스 교무업무 권한관리, K-에듀파인 권한관리</li>
					</ul>
				</ul>
				<ul class="_padding">
					<li><input type="checkbox" id="_field04" class="_field" value="Y"> 정보화장비 불용처리 지원</li>
					<ul class="_padding">
						<li><input type="checkbox" id="_field05" class="_field" value="Y" disabled> PC <input type="text" class="_field" id="_field06" maxlength="3" style="width: 30px;" value="0" disabled numberOnly="true">대</li>
						<li><input type="checkbox" id="_field07" class="_field" value="Y" disabled> 모니터 <input type="text" class="_field" id="_field08" maxlength="3" style="width: 30px;" value="0" disabled numberOnly="true">대</li>
						<ul>※ 지원 분야
							<li>- 불용 물품 확인 및 물품대장 대조하여 불용장비 목록 작성</li>
							<li>- 하드디스크 분리하여 지역교육청으로 파쇄 신청 공문 작성</li>
							<li>- 사전 준비(학교): com.gbe.kr 사이트의 접속 게정 필요</li>
						</ul>
					</ul>
				</ul>
				<ul class="_padding">
					<li><input type="checkbox" id="_field00" class="_field" value="Y"> 학내 전산망</li>
					<ul class="_padding">
						<li>용도별 망 분리 확인 및 회선 속도 측정</li>
						<li>학내전산망 구성도 설명 및 컨설팅</li>
					</ul>
				</ul>
				<ul class="_padding">
					<li><input type="checkbox" id="_field16" class="_field" value="Y"> 내 PC지키미</li>
					<ul class="_padding">
						<li><input type="checkbox" id="_field18" class="_field" value="Y" disabled> 취약점항목 조치 <input type="text" class="_field" id="_field19" maxlength="3" style="width: 30px;" value="0" disabled numberOnly="true">대</li>
						<li>※ 관리자콘솔 사용법 설명 및 100점 미점검 PC 조치 </li>
						<li>※ 사전 준비(학교): 지키미 관리자콘솔의 접속 계정 필요</li>
					</ul>
				</ul>
				<ul class="_padding">
					<li><input type="checkbox" id="_field11" class="_field" value="Y"> 컴퓨터실 PC OS 재설치 (윈도우7 PC는 지원불가)</li>
					<ul class="_padding">
						<li><input type="checkbox" id="_field12" class="_field" value="Y" disabled> 윈도우8 PC <input type="text" class="_field" id="_field13" maxlength="3" style="width: 30px;" value="0" disabled numberOnly="true">대</li>
						<li><input type="checkbox" id="_field14" class="_field" value="Y" disabled> 윈도우10 PC <input type="text" class="_field" id="_field15" maxlength="3" style="width: 30px;" value="0" disabled numberOnly="true">대</li>
					</ul>
				</ul>
			</td>
		</tr>
		<tr>
			<th>신청내용</th>
			<td>${support.req_content}</td>
		</tr>		
	</tbody>
</table>
<br/>
<em><strong>현장지원결과등록</strong></em>
<table class="type2">
	<colgroup>
		<col width="140"/>
		<col width="*"/>
	</colgroup>
	<tbody>
		<tr>
			<th>*지원구분</th>
			<td>
				<c:if test="${support.support_div eq '1' }">
					방문지원
				</c:if>
				<c:if test="${support.support_div eq '2' }">
					원격지원
				</c:if>
				<c:if test="${support.support_div eq '3' }">
					전화지원
				</c:if>
			</td>
		</tr>
		<tr>
			<th>*지원자</th>
			<td>${support.supporter }</td>
		</tr>
		<tr>
			<th>협력업체</th>
			<td>${support.subcontractor }</td>
		</tr>
		<tr>
			<th>*지원내용</th>
			<td>${support.support_content }</td>
		</tr>		
	</tbody>
</table>
</form:form>
<div class="txt-right">	
	<button id="cancel-btn" class="btn btn5">목록으로</button>
</div>