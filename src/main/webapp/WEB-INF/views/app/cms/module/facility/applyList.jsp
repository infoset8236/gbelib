<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="/resources/cms/js/malsup.jquery.form.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(function() {
	$('#dialog-3.dialog-common').dialog({ //모달창 기본 스크립트 선언
		autoOpen: false,
		resizable: false,
		modal: true, 
	    open: function(){
	        $('.ui-widget-overlay').addClass('custom-overlay');
	    },
	    close: function(){
	        $('.ui-widget-overlay').removeClass('custom-overlay');
	        location.reload();
	    },
		buttons: [
			{
				text: "닫기",
				"class": 'btn',
				click: function() {
					$(this).dialog('destroy');
				}
			}
		]
	});
	
	$("#dialog-3").dialog({ //개별 모달창 띄울 시 선택자 선언 및 크기 값 설정
		width: 1100,
		height: 450
	});
 
	$('a.apply-modify-btn').on('click', function(e) {
		e.preventDefault();
		$('#dialog-2').load('editApply.do?editMode=MODIFY&homepage_id=' + $(this).attr('keyValue1') + '&facility_idx=' + $(this).attr('keyValue2') + '&facility_req_idx=' + $(this).attr('keyValue3'), function( response, status, xhr ) {
			$('#dialog-2').dialog('open');
		});
	});
	
	$('a.apply-delete-btn').on('click', function(e) {
		e.preventDefault();
		if ( confirm('해당 신청자를 정말 삭제 하시겠습니까?') ) {
			$('#facilityApplyListForm #editMode').val('DELETE');
			$('#facilityApplyListForm #homepage_id').val($(this).attr('keyValue1'));
			$('#facilityApplyListForm #facility_idx').val($(this).attr('keyValue2'));
			$('#facilityApplyListForm #facility_req_idx').val($(this).attr('keyValue3'));
			if ( doAjaxPost($('#facilityApplyListForm')) ) {
				$('#dialog-3').load('applyList.do?homepage_id=' + $(this).attr('keyValue1') + '&facility_idx=' + $(this).attr('keyValue2'), function( response, status, xhr ) {
					$('#dialog-3').dialog('open');
				});
			}	
		}
	});
	
	$('a.apply-ok-btn').on('click', function(e) {
		e.preventDefault();
		if ( confirm('해당 신청자를 승인 하시겠습니까?') ) {
			$('#facilityApplyListForm #editMode').val('OK');
			$('#facilityApplyListForm #homepage_id').val($(this).attr('keyValue1'));
			$('#facilityApplyListForm #facility_idx').val($(this).attr('keyValue2'));
			$('#facilityApplyListForm #facility_req_idx').val($(this).attr('keyValue3'));
			$('#facilityApplyListForm #apply_id').val($(this).attr('keyValue4'));
			$('#facilityApplyListForm #apply_phone').val($(this).attr('keyValue5'));
			if ( doAjaxPost($('#facilityApplyListForm')) ) {
				$('#dialog-3').load('applyList.do?homepage_id=' + $(this).attr('keyValue1') + '&facility_idx=' + $(this).attr('keyValue2') + '&apply_phone=' + $(this).attr('keyValue5'), function( response, status, xhr ) {
					$('#dialog-3').dialog('open');
				});
			}	
		}
	});
	
	$('a.apply-cancel-btn').on('click', function(e) {
		e.preventDefault();
		if ( confirm('해당 신청자를 취소 하시겠습니까?') ) {
			$('#facilityApplyListForm #editMode').val('CANCEL');
			$('#facilityApplyListForm #homepage_id').val($(this).attr('keyValue1'));
			$('#facilityApplyListForm #facility_idx').val($(this).attr('keyValue2'));
			$('#facilityApplyListForm #facility_req_idx').val($(this).attr('keyValue3'));
			if ( doAjaxPost($('#facilityApplyListForm')) ) {
				$('#dialog-3').load('applyList.do?homepage_id=' + $(this).attr('keyValue1') + '&facility_idx=' + $(this).attr('keyValue2'), function( response, status, xhr ) {
					$('#dialog-3').dialog('open');
				});
			}	
		}
	});
	
	$('a.add_blackList').on('click', function(e) {		
		$('#dialog-4').load('/cms/module/blackList/edit.do?editMode=ADD&black_type=30&after_click_btn=a.list_${facilityReq.facility_idx}&homepage_id=' + $(this).attr('homepage_id') + '&member_id=' + $(this).attr('keyValue')+ '&member_key=' + $(this).attr('keyValue1'), function( response, status, xhr ) {
			$('#dialog-4').dialog({
				width: 600,
				height: 300
			});
			$('#dialog-4').dialog('open');
		});
		
		e.preventDefault();
	});
	
	$('a.delete_blackList').on('click', function(e) {
		e.preventDefault();
		
		if (confirm('해당 수강생을 블랙리스트 목록에서 삭제하시겠습니까?')) {
			var data = {
					editMode : 'BLACKTYPEDELETE',
					homepage_id : $(this).attr('homepage_id'),
					member_key : $(this).attr('keyValue'),
					black_type	: '30'
			}
			
			jQuery.ajaxSettings.traditional = true;
		    $.ajax({
		        type: "POST",
		        url: '/cms/module/blackList/save.do',
		        async: false,
		        data: data,
		        dataType:'json',
		        success: function(response) {
		        	response = eval(response);
		            if(response.valid) {            	
		                 if(response.message != null && response.message.replace(/\s/g,'').length!=0) {
		                	 alert(response.message);
		                 }
		                 $('#dialog-3').load('applyList.do?homepage_id=${facilityReq.homepage_id}&facility_idx=${facilityReq.facility_idx}', function( response, status, xhr ) {
		         			 $('#dialog-3').dialog('open');
		         		 });
					} else {
						if(response.message != null && response.message.replace(/\s/g,'').length!=0) {
							alert(response.message);
		                } else {
		                	for(var i =0 ; i < response.result.length ; i++) {
		    					alert(response.result[i].code);
		    					$('#'+response.result[i].field).focus();
		    					$('#'+response.result[i].field, $(form)).css('border-color', 'red');
		                		$('#'+response.result[i].field, $(form)).on('change', function() {
		                			$(this).css('border-color', '');
		                		});
		    					break;
		    				}
		                }
					}
		         },
		         error: function(jqXHR, textStatus, errorThrown) {
		             alert('[' + textStatus + ']관리자에게 문의하세요. : ' + errorThrown);
		         }
		    });
		}
	});
	
});

</script>
<form:form id="facilityApplyListForm" modelAttribute="facilityReq" method="post" action="saveApply.do" >
	<form:hidden path="editMode"/>
	<form:hidden path="homepage_id"/>
	<form:hidden path="facility_idx"/>
	<form:hidden path="facility_req_idx"/>
	<form:hidden path="apply_id"/>
</form:form>

<table class="type1 center">
	<colgroup>
       	<col width="5%" />
       	<col width="8%" />
       	<col width="12%" />
    	<col width="*"/>
    	<col width="5%" />
    	<col width="10%" />
    	<col width="10%" />
    	<c:if test="${facilityReq.homepage_id eq 'h2' }">
    	<col width="12%" />
    	<col width="5%" />
    	</c:if>
    	<col width="18%" />
    </colgroup>
    <thead>
    	<tr>
    		<th>번호</th>
    		<th>신청자명</th>
    		<th>휴대전화번호</th>
    		<th>사용목적</th>
    		<th>신청상태</th>
    		<th>신청날짜</th>
    		<th>신청시간</th>
    		<c:if test="${facilityReq.homepage_id eq 'h2' }">
    		<th>희망<br>이용시간</th>
    		<th>신청인원</th>
    		</c:if>
    		<th>기능</th>
    	</tr>
    </thead>
    <tbody>
		<c:choose>
			<c:when test="${fn:length(applyList) > 0}">
				<c:forEach items="${applyList}" var="i" varStatus="status">
    				<tr>
         				<td>${status.count}</td>
			         	<td>${i.apply_name}</td>
			         	<td>${i.apply_phone}</td>
			         	<td>${i.apply_desc}</td>
			         	<td>
			         		<c:choose>
			         			<c:when test="${i.apply_status eq '1'}"><p style="color:black; font-weight:bold;">신청</p></c:when>
			         			<c:when test="${i.apply_status eq '2'}"><p style="color:blue; font-weight:bold;">승인</p></c:when>
			         			<c:when test="${i.apply_status eq '3'}"><p style="color:red; font-weight:bold;">취소</p></c:when>
			         		</c:choose>
			         	</td>
						<td>
							${fn:substring(i.add_date, 0, 11)}
						</td>
						<td>
							${fn:substring(i.add_date, 11, 19)}
						</td>
						<c:if test="${facilityReq.homepage_id eq 'h2' }">
							<td>
								${i.desired_start_time }~${i.desired_end_time }
							</td>
							<td>
								${i.user_aplly_count }
							</td>
						</c:if>
			         	<td>
			         		<c:choose>
			         			<c:when test="${i.apply_status eq '1' or i.apply_status eq '3'}">
			         				<a class="btn btn1 apply-ok-btn" keyValue1="${i.homepage_id}" keyValue2="${i.facility_idx}" keyValue3="${i.facility_req_idx}" keyValue4="${i.apply_id}" keyValue5="${i.apply_phone}">승인하기</a>
			         			</c:when>
			         			<c:when test="${i.apply_status eq '2'}">
			         				<a class="btn btn5 apply-cancel-btn" keyValue1="${i.homepage_id}" keyValue2="${i.facility_idx}" keyValue3="${i.facility_req_idx}">취소하기</a>	
			         			</c:when>
			         		</c:choose>
							<a class="btn apply-modify-btn" keyValue1="${i.homepage_id}" keyValue2="${i.facility_idx}" keyValue3="${i.facility_req_idx}">수정</a>
							<a class="btn apply-delete-btn" keyValue1="${i.homepage_id}" keyValue2="${i.facility_idx}" keyValue3="${i.facility_req_idx}">삭제</a>
							<c:if test="${i.isBlackList > 0 }">
							<a href="" class="btn btn4 delete_blackList" homepage_id="${i.homepage_id}" keyValue="${i.member_key}">블랙리스트 삭제</a>
							</c:if>
							<c:if test="${i.isBlackList < 1 }">
							<a href="" class="btn btn1 add_blackList" homepage_id="${i.homepage_id}" keyValue="${i.apply_id}" keyValue1="${i.member_key}">블랙리스트 추가</a>
							</c:if>
						</td>
			        </tr>
    			</c:forEach>	
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="6">조회된 정보가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>    
	</tbody>
</table>

<div id="dialog-4" class="dialog-common" title="블랙리스트 추가"></div>
