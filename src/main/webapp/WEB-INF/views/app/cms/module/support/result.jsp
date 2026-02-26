<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	._padding {padding-left: 30px;}
</style>
<script>
$(function() {
	$('div#dialog-2.dialog-common').dialog({ //모달창 기본 스크립트 선언
		autoOpen: false,
		resizable: false,
		modal: true, 
	    open: function(){
	        $('.ui-widget-overlay').addClass('custom-overlay');
	    },
	    close: function(){
	        $('.ui-widget-overlay').removeClass('custom-overlay');
	        $('body > div.ui-dialog').remove();
	        location.reload();
	    },
		buttons: [
			{
				text: "저장",
				"class": 'btn btn1',
				click: function() {
					if(doAjaxPost($('#rsupport_result'))) {
						$(this).dialog('destroy');
						location.reload();
					}
				}
			},{
				text: "취소",
				"class": 'btn',
				click: function() {
					$(this).dialog('destroy');
					location.reload();
				}
			},{
				text: "삭제",
				"class": 'btn btn1',
				"id": 'del_btn',
				click: function() {
					if ( confirm("정말 삭제 하시겠습니까?") ) {
						$('input#editMode').val('DELETE');
						if(doAjaxPost($('#rsupport_result'))) {
							$(this).dialog('destroy');
							location.reload();
						}	
					}
				}
			}
		]
	});
	
	if($('input#editMode').val() == 'ADD'){
		$('#del_btn').hide();
	} else {
		$('#del_btn').show();
	}
	
	$("div#dialog-2").dialog({ //개별 모달창 띄울 시 선택자 선언 및 크기 값 설정
		width: 600,
		height: 700
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
					<li><input type="checkbox" id="_field00" class="_field" value="Y"> 교육정보시스템(나이스, K-에듀파인) 권한관리 컨설팅</li>
					
				</ul>
				<ul class="_padding">
					<li><input type="checkbox" id="_field01" class="_field" value="Y"> 학내전산망 지원</li>
					<ul class="_padding">
						<li><input type="checkbox" id="_field02" class="_field" value="Y" disabled> 유‧무선망 점검(인터넷 속도 저하)</li>
						<li><input type="checkbox" id="_field03" class="_field" value="Y" disabled> 무선 AP</li>
						<li><input type="checkbox" id="_field04" class="_field" value="Y" disabled> 기타</li>
					</ul>
				</ul>
				<ul class="_padding">
					<li><input type="checkbox" id="_field05" class="_field" value="Y"> 단말관리시스템(MDM) 미등록 단말기 등록 지원</li>
				</ul>
				<ul class="_padding">
					<li><input type="checkbox" id="_field06" class="_field" value="Y"> 불용장비의 물품대장, 정보시스템관리대장 정비 및 불용처리 절차 컨설팅</li>
				</ul>
			</td>
		</tr>
		<tr>
			<th>신청내용</th>
			<td>${support.req_content}</td>
		</tr>
		<tr>
			<th>진행상태</th>
			<td>
			<c:choose>
				<c:when test="${support.process_state eq 'Y'}">완료</c:when>
				<c:when test="${support.process_state eq 'N'}">접수</c:when>
				<c:when test="${support.process_state eq 'S'}">신청</c:when>
			</c:choose>
			</td>
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
				<form:radiobutton path="support_div" value="1"/>&nbsp;방문지원&nbsp;
				<form:radiobutton path="support_div" value="2"/>&nbsp;원격지원&nbsp;
				<form:radiobutton path="support_div" value="3"/>&nbsp;전화지원&nbsp;
			</td>
		</tr>
		<tr>
			<th>*지원자</th>
			<td><form:input path="supporter" class="text" cssStyle="width:80%"/></td>			
		</tr>
		<tr>
			<th>협력업체</th>
			<td><form:input path="subcontractor" class="text" cssStyle="width:80%"/></td>
		</tr>
		<tr>
			<th>*지원내용</th>
			<td><form:textarea path="support_content" class="text" cssStyle="width:100%; height:150px"/></td>
		</tr>		
	</tbody>
</table>
<em>*항목은 반드시 기록 하셔야 합니다.</em>
</form:form>

