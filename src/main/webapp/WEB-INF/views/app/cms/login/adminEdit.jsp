<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

$(function() {
	$('.dialog-common').dialog({ //모달창 기본 스크립트 선언
		autoOpen: false,
		resizable: false,
		modal: true, 
	    open: function(){
	        $('.ui-widget-overlay').addClass('custom-overlay');
	    },
	    close: function(){
	        $('.ui-widget-overlay').removeClass('custom-overlay');
	    },
		buttons: [
			{
				text: "저장",
				"class": 'btn btn1',
				click: function() {
					if($('#homepage_id').val() == ''){
						alert('관리자 권한을 부여 받을 홈페이지를 선택하세요');
					} else if(doAjaxPost($('form#admin_join'))) {
						$(this).dialog('destroy');
						location.reload();
					}
					
				}
			},{
				text: "취소",
				"class": 'btn',
				click: function() {
					$(this).dialog('destroy');
				}
			}
		]
	});
	
	$("#dialog-1").dialog({ //개별 모달창 띄울 시 선택자 선언 및 크기 값 설정
		width: 600,
		height: 550
	});
	

	
	$('a#linkMemberSearch').on('click', function(e) {
		
		var homepage_id = $('#admin_join #homepage_id').val();
		var member_id = $('#admin_id').val();
		
		if($('#homepage_id').val() == ''){
			alert('관리자 권한을 부여 받을 홈페이지를 선택하세요');
		} else if (member_id == null || member_id == "") {
			alert("자료관리ID를 입력해주세요.");
			$('#admin_id').focus();
			return false;
		} else {
			$.ajax({
				type : "GET",
				url : 'getLoginLinkMember.do',
				data : 'homepage_id=' + homepage_id + '&member_id=' + member_id,
				dataType : 'json',
				success:function(response){
					if ( response.resultMsg != null ) {
						alert(response.resultMsg);	
					}
					else {
						if( response.data != null){
							$('#admin_join #link_member_yn').val('Y');
							$('#admin_join #member_name').val(response.data["ADMIN_NAME"])
							$('#admin_join #admin_id').attr("readonly", true);
							$('#admin_join #member_name').attr("readonly", true);
						}else{
							alert('검색한 사용자 없습니다.');
						}
					}
				}
			});
			
		}
		e.preventDefault();
	});
	
});

</script>

<style>
	table.type2 tbody th {border-top-color: #d1d1d1 !important;}
</style>

<form:form modelAttribute="member" id="admin_join" action="save.do" method="post" onsubmit="return false;">
	<form:hidden path="editMode"/>
	<form:hidden path="link_member_yn" value="N"/>
	<form:hidden path="admin_yn" value="Y"/>
		<div style="text-align: right;">
			(<span style="color: red; font-weight: bold;">*</span>) 항목은 필수 입력값입니다.
		</div>
<table class="type2">
	<tbody>
		<tr>
			<th>해당 홈페이지(<span style="color: red;">*</span>)</th>
			<td>
				<p>
					<form:select path="homepage_id" cssStyle="width:320px;">
						<form:option value="" label="관리자 권한을 부여 받을 홈페이지를 선택하세요" />
						<c:forEach items="${homepageList}" var="i" varStatus="status">
							<c:if test="${i.homepage_id ne 'c0' and i.homepage_id ne 'h33' and i.homepage_id ne 'h34' and i.homepage_id ne 'c1' and i.homepage_id ne 'h27' and i.homepage_id ne 'h1'}">
								<option value="${i.homepage_id}" label="${i.homepage_name}"</option>
							</c:if>
						</c:forEach>
						<%-- <form:options items="${homepageList}" itemLabel="homepage_name" itemValue="homepage_id"/> --%>
					</form:select>
				</p>
			</td>
		</tr>
		<tr>
			<th>자료관리ID(<span style="color: red;">*</span>)</th>
			<td>
				<c:choose>
					<c:when test="${member.editMode eq 'ADD'}">
						<form:input path="member_id" id="admin_id" cssStyle="width:100px;" cssClass="text" maxlength="20"/>
						<a href="javascript:void(0);" class="btn btn5" id="linkMemberSearch"></i><span>관리자검색</span></a>
					</c:when>
					<c:otherwise>
						${member.member_id}
					</c:otherwise>
				</c:choose>
				
				<div class="ui-state-highlight" style="font-weight:bold; font-size:9pt; padding:2px 5px;">
					<span>※ 자료관리시스템 관리자 아이디로 검색하세요.</span>
				</div>
			</td>
		</tr>

		<tr>
			<th>관리자명(<span style="color: red;">*</span>)</th>
			<td>
				<form:input path="member_name" cssClass="text" maxlength="20"/>
			</td>
		</tr>
		<tr>
			<th>비밀번호(<span style="color: red;">*</span>)</th>
			<td>
				<form:password path="member_pw" cssStyle="width:178px;" cssClass="text" maxlength="20"/>
					<div class="ui-state-highlight" style="font-weight:bold; font-size:9pt; padding:2px 5px;">
						<span>※ 비밀번호는 영문, 숫자, 특수문자 조합 8자 이상 20자 이하로 입력하세요.</span>
					</div>
			</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>
				<form:select path="phone1" cssClass="selectmenu">
					<form:options items="${phoneCode}" itemLabel="code_name" itemValue="code_id"/>
				</form:select> -
				<form:input path="phone2" cssStyle="width:40px;" cssClass="text" maxlength="4"/> -
				<form:input path="phone3" cssStyle="width:40px;" cssClass="text" maxlength="4"/>
			</td>
		</tr>
		<tr> 
			<th>휴대전화번호</th>
			<td>
				<form:select path="cell_phone1" cssClass="selectmenu">
					<form:options items="${cellPhoneCode}" itemLabel="code_name" itemValue="code_id"/>
				</form:select> -
				<form:input path="cell_phone2" cssStyle="width:40px;" cssClass="text" maxlength="4"/> -
				<form:input path="cell_phone3" cssStyle="width:40px;" cssClass="text" maxlength="4"/>	
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
				<form:input path="email1" cssStyle="width:100px;" cssClass="text" maxlength="20"/> @
				<form:input path="email2" cssStyle="width:100px;" cssClass="text" maxlength="20"/> 
			</td>
		</tr>
	</tbody>
</table>

<%-- <table class="type2">
	<colgroup>
		<col width="30"/>
		<col width="*"/>
		<col width="180"/>
	</colgroup>
	<thead>
		<th colspan="3">권한</th>
	</thead>
	<tbody id="groupList">
		<c:forEach items="${getMemberGroupList}" var="i" varStatus="status" begin="1">
		<c:if test="${i.user_group_yn ne 'Y' and i.guest_group_yn ne 'Y' }">
		<tr>
			<c:set var="isSite" value="${i.site_id ne 'CMS' and i.parent_member_group_idx eq 0 ? 'th' : 'td'}"></c:set>
			<c:set var="_isSite" value="${i.site_id ne 'CMS' and i.parent_member_group_idx eq 0}"></c:set>
			<${isSite}><c:if test="${!_isSite}"><form:checkbox id="checkAll${status.index}" path="authGroupIdxList" value="${i.member_group_idx}"/></c:if></${isSite}>
			<${isSite} style="text-align: left;"><label for="checkAll${status.index}" style="padding-left:${(i.member_group_depth-1)*15}px;">${i.member_group_name}</label></${isSite}>
			<${isSite} style="text-align: left;"><label for="checkAll${status.index}">${i.remark}</label></${isSite}>
		</tr>
		</c:if>
		</c:forEach>
	</tbody>
</table> --%>
</form:form>