<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	._padding {padding-left: 30px;}
</style>
<script>
$(function() {
	$('div#dialog-1.dialog-common').dialog({ //모달창 기본 스크립트 선언
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
					if($('#requer_tel1').val() != "") {
						$('#requer_tel').val($('#requer_tel1').val() + "-" + $('#requer_tel2').val() + "-" + $('#requer_tel3').val());
					}
					$('#categories').val(fields_to_json_text());

					if(doAjaxPost($('#support_edit'))) {
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
						if(doAjaxPost($('#support_edit'))) {
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
	
	$("#dialog-1").dialog({ //개별 모달창 띄울 시 선택자 선언 및 크기 값 설정
		width: 750,
		height: 550
	});
	
	$('a#btn_search').on('click', function(event) {
		$('#dialog-dept').load('searchDept.do?code_name='+encodeURIComponent($('#support_edit #req_name').val()), function( response, status, xhr ) {
			$('#dialog-dept').dialog('open');	
	    });
		event.preventDefault();
	});
	
	$('input#hope_req_dt').datepicker({
		onClose: function(selectedDate){
			$('input#req_title').focus();
		}
	});
	
	if('${support.requer_tel}' == '') {		
		$('#requer_tel1').val("010");	
	} else {
		var requer_tel = '${support.requer_tel}'.split('-');
		$('#requer_tel1').val(requer_tel[0]);
		$('#requer_tel2').val(requer_tel[1]);
		$('#requer_tel3').val(requer_tel[2]);	
	}
	
	$('a.idCheck').on('click', function(e) {
		$('#support_edit #requer_name').val("");
		$.get('checkId.do?homepage_id=' + $('#homepage_id').val() + '&req_id='+ $('#req_id').val(), function(response) {
			if ( response.resultMsg != null ) {
				alert(response.resultMsg);	
			}
			else {
				$('#support_edit #member_key').val(response.memberInfo.SEQ_NO);
				$('#support_edit #requer_name').val(response.memberInfo.USER_NAME);
			}
		});
		e.preventDefault();
	});
	
	if('${support.requer_tel}' == '') {		
		$('#requer_tel1').val("010");	
	} else {
		var requer_tel = '${support.requer_tel}'.split('-');
		$('#requer_tel1').val(requer_tel[0]);
		$('#requer_tel2').val(requer_tel[1]);
		$('#requer_tel3').val(requer_tel[2]);	
	}
	
	$('#_field00').off('click');
	$('#_field01').off('click');
	$('#_field02').off('click');
	$('#_field03').off('click');
	$('#_field04').off('click');
	$('#_field05').off('click');
	$('#_field06').off('click');
	$('#_field07').off('click');
	$('#_field08').off('click');
	$('#_field09').off('click');
	$('#_field10').off('click');
	$('#_field11').off('click');
	$('#_field12').off('click');
	$('#_field13').off('click');
	$('#_field14').off('click');
	$('#_field15').off('click');
	$('#_field16').off('click');
	$('#_field17').off('click');
	$('#_field18').off('click');
	$('#_field19').off('click');
	$('#_field20').off('click');
	$('#_field21').off('click');
	$('#_field22').off('click');
	
	$('#_field00').on('click', function(e) {
		var checked = $(this).prop('checked');
		$('#_field01').prop('disabled', !checked);
		$('#_field02').prop('disabled', !checked);
		$('#_field03').prop('disabled', !checked);
	});
	$('#_field04').on('click', function(e) {
		var checked = $(this).prop('checked');
		$('#_field05').prop('disabled', !checked);
		$('#_field07').prop('disabled', !checked);
		$('#_field09').prop('disabled', !checked);
	});
	$('#_field05').on('click', function(e) {
		var checked = $(this).prop('checked');
		$('#_field06').prop('disabled', !checked);
	});
	$('#_field07').on('click', function(e) {
		var checked = $(this).prop('checked');
		$('#_field08').prop('disabled', !checked);
	});
	$('#_field09').on('click', function(e) {
		var checked = $(this).prop('checked');
		$('#_field10').prop('disabled', !checked);
	});
	$('#_field11').on('click', function(e) {
		var checked = $(this).prop('checked');
		$('#_field12').prop('disabled', !checked);
		$('#_field14').prop('disabled', !checked);
	});
	$('#_field12').on('click', function(e) {
		var checked = $(this).prop('checked');
		$('#_field13').prop('disabled', !checked);
	});
	$('#_field14').on('click', function(e) {
		var checked = $(this).prop('checked');
		$('#_field15').prop('disabled', !checked);
	});
	$('#_field16').on('click', function(e) {
		var checked = $(this).prop('checked');
		$('#_field17').prop('disabled', !checked);
		$('#_field18').prop('disabled', !checked);
	});
	$('#_field18').on('click', function(e) {
		var checked = $(this).prop('checked');
		$('#_field19').prop('disabled', !checked);
	});
	$('#_field20').on('click', function(e) {
		var checked = $(this).prop('checked');
		$('#_field21').prop('disabled', !checked);
		$('#_field22').prop('disabled', !checked);
	});
	
	$(document).on("keyup", "input:text[numberOnly]", function() {
		$(this).val($(this).val().replace(/[^0-9]/gi, ""));
	});

	json_text_to_fields();
});

function fields_to_json_text() {
	var json = {};
	
	$('._field').each(function(i) {
		var type = $(this).attr('type');
		
		if($(this).prop('disabled')) return;
		
		if(type == 'checkbox') {
			if($(this).prop('checked')) {
				json[$(this).attr('id')] = $(this).val();
			}
		} else if(type == 'text') {
			if($(this).prop('disabled') == false) {
				json[$(this).attr('id')] = $(this).val();
			}
		}
	});
	
	return JSON.stringify(json);
}

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
<form:form modelAttribute="support" id="support_edit" action="save.do" method="post">
<form:hidden path="editMode"/>
<form:hidden path="plan_date" value="${fn:substring(calendarManage.start_date,0,7)}"/>
<form:hidden path="homepage_id"/>
<form:hidden path="member_key"/>
<form:hidden path="seq"/>
<form:hidden path="req_title" value="신청"/>
<form:hidden path="categories"/>
<table class="type2">
	<colgroup>
		<col width="140"/>
		<col width="*"/>
	</colgroup>
	<tbody>
<!-- 		<tr> -->
<!-- 			<th>*신청기관ID</th> -->
<!-- 			<td> -->
<%-- 				<form:input path="req_id" class="text" cssStyle="width:30%" readonly="true"/> --%>
<!-- 				<a href="" class="btn btn1" id="btn_search"><span>기관검색</span></a> -->
<!-- 			</td> -->
<!-- 		</tr> -->
		<tr>
			<th>*신청기관명</th>
			<td>
				<form:hidden path="req_organ_code"/>
				<form:input path="req_name" class="text" cssStyle="width:50%" />
				<a href="" class="btn" id="btn_search"><span>기관검색</span></a>
			</td>
		</tr>
<!-- 		<tr> -->
<!-- 			<th>*신청기관연락처</th> -->
<%-- 			<td><form:input path="req_tel" class="text" cssStyle="width:50%" readonly="true"/></td>			 --%>
<!-- 		</tr> -->
		<tr>
         	<th>신청자ID</th>			
         	<td>
         		<c:choose>
         			<c:when test="${support.editMode eq 'ADD' }">
         				<form:input path="req_id" class="text" /> <a class="btn btn1 idCheck">ID 확인</a>	
         			</c:when>
         			<c:otherwise>
         				${support.req_id}
         			</c:otherwise>
         		</c:choose>
        		</td>
       	</tr>
		<tr>
			<th>*신청자성명</th>
			<td><form:input path="requer_name" class="text" cssStyle="width:50%" readonly="true"/></td>
		</tr>
		<tr>
			<th>*신청자휴대폰</th>
			<td>
				<form:hidden path="requer_tel"/>
				<form:select path="requer_tel1" cssClass="selectmenu">
					<form:options items="${cellPhoneCode}" itemLabel="code_name" itemValue="code_id"/>
				</form:select> -
				<form:input path="requer_tel2" cssStyle="width:40px;" class="text" maxlength="4" numberonly="true"/> -
				<form:input path="requer_tel3" cssStyle="width:40px;" class="text" maxlength="4" numberonly="true"/>
			</td>
		</tr>
		<tr>
			<th>*지원희망일자</th>
			<td>
			<c:choose>
				<c:when test="${support.editMode eq 'MODIFY'}">
				<form:input path="hope_req_dt" cssClass="text ui-calendar"/>
				</c:when>
				<c:otherwise>
				${support.hope_req_dt}
				<form:hidden path="hope_req_dt"/> 
				</c:otherwise>
			</c:choose>
			</td>			
		</tr>
		<tr>
			<th>*희망지원분야<br>(중복체크가능)</th>
			<td>
				<ul class="_padding">
					<li><input type="checkbox" id="_field00" class="_field" value="Y"> 교육정보시스템(나이스, K-에듀파인) 권한관리 컨설팅</li>
				</ul>
				<ul class="_padding">
					<li><input type="checkbox" id="_field01" class="_field" value="Y"> 학내전산망 지원</li>
					<ul class="_padding">
						<li><input type="checkbox" id="_field02" class="_field" value="Y"> 유‧무선망 점검(인터넷 속도 저하)</li>
						<li><input type="checkbox" id="_field03" class="_field" value="Y"> 무선 AP</li>
						<li><input type="checkbox" id="_field04" class="_field" value="Y"> 기타</li>
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
			<td><form:textarea path="req_content" class="text" cssStyle="width:100%; height:150px"/></td>
		</tr>
		<c:if test="${support.editMode eq 'MODIFY'}">
		<tr>
			<th>진행상태</th>
			<td>
				<form:select path="process_state">
					<form:option value="Y">완료</form:option>
					<form:option value="N">접수</form:option>
					<form:option value="S">신청</form:option>
				</form:select>
			</td>
		</tr>
		</c:if>
	</tbody>
</table>
<em>*항목은 반드시 기록 하셔야 합니다.</em>
</form:form>

<div id="dialog-dept" class="common-dialog"></div>