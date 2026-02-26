<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="/resources/cms/js/malsup.jquery.form.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(function() {

	$('#save-btn').on('click', function() {
		if($('#apply_phone1').val() != "") {
			$('#apply_phone').val($('#apply_phone1').val()+'-'+$('#apply_phone2').val()+'-'+$('#apply_phone3').val());	
		}	
		if ($('#homepage_id').val() == 'h2') {
          var check = /^[1-9][0-9]*$/; // 숫자가 1로 시작하고 뒤에 숫자가 올 수 있도록 수정
          var userApllyCount = $('#user_aplly_count').val();
          if (!check.test(userApllyCount)) {
            alert("신청인원은 0보다 큰 숫자만 입력 가능합니다.");
            return false;
          }
		}
		doAjaxPost($('#facilityReqForm'));
	});
	
	$('#cancel-btn').on('click', function() {
		var url = '/${homepage.context_path}/module/facility/index.do';
		var formData = serializeParameter(['menu_idx']);
		doGetLoad(url, formData);
	});
	
	// 연락처 필드 숫자만 입력 가능
	$(document).on("keyup", "input:text[numberOnly]", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});
	
});

</script>
<c:forEach items="${termsList}" var="terms">
	${terms.contents }
</c:forEach>
<c:choose>
	<c:when test="${facility.homepage_id eq 'h2' and (facilityReq.menu_idx eq '247' or facilityReq.menu_idx eq '248' or facilityReq.menu_idx eq '206' or facilityReq.menu_idx eq '257' or facilityReq.menu_idx eq '258' or facilityReq.menu_idx eq '210' or facilityReq.menu_idx eq '209')}">
		<form:form id="facilityReqForm" modelAttribute="facilityReq" method="post" action="module/facility/save.do" >
			<div style="text-align: right"><b>이용약관 및 개인정보의 수집·이용 동의 여부</b>(<span style="color: red; font-weight: bold;">*</span>)
				<form:select path="self_info_yn" cssClass="selectmenu" cssStyle="width : 70px">
					<form:option value="Y" label="동의"/>
					<form:option value="N" label="미동의"/>
				</form:select>
			</div>
			<br/>
			<form:hidden path="homepage_id"/>
			<form:hidden path="editMode"/>									
			<form:hidden path="facility_req_idx"/>
			<form:hidden path="facility_idx"/>
			<form:hidden path="menu_idx"/>
			<form:hidden path="facilityType"/>
			<form:hidden path="apply_id" value="${facilityReq.apply_id}"/>
			<form:hidden path="member_key"/>
			<table class="type1">
				<colgroup>
			       <col width="130" />
			       <col width="*"/>
		       	</colgroup>
		       	<tbody>
			        <tr>
			         	<th>시설물명</th>
			         	<td>${facility.facility_name}</td>
			        </tr>   
			        <tr>
			         	<th>이용일</th>
			         	<td>${facility.use_date}</td>
			        </tr>       		
			        <tr>
			         	<th>신청자명 (<span style="color: red; font-weight: bold;">*</span>)</th>
			         	<td>
		        			<form:input path="apply_name" class="text" readonly="true" value="${member.member_name }"/>	
		         		</td>
			        </tr>
			        <tr>
						<th>휴대전화번호 (<span style="color: red; font-weight: bold;">*</span>)</th>
						<td>
							<form:hidden path="apply_phone"/>
							<form:input path="apply_phone1" class="text" cssStyle="width:40px;" maxlength="3" numberonly="true" value="${fn:substring(member.mobile_no,0,3)}"/>
						 	- <form:input path="apply_phone2" class="text" cssStyle="width:50px;" maxlength="4" numberonly="true" value="${fn:substring(member.mobile_no,3,7)}"/>
						 	- <form:input path="apply_phone3" class="text" cssStyle="width:50px;" maxlength="4" numberonly="true" value="${fn:substring(member.mobile_no,7,11)}"/>
						</td>
					</tr>
					<c:choose>
						<c:when test="${homepage.context_path eq 'gm'}">
							<form:hidden path="desired_start_time"/>
							<form:hidden path="desired_end_time"/>
<%--							<tr>--%>
<%--								<th>희망이용시간</th>--%>
<%--								<td>--%>
<%--									<div class="ui-state-highlight">--%>
<%--										<em>사용 가능 시간 : 오전 09:00~13:00, 오후 14:00~17:00(주말 14:00~16:00)</em>--%>
<%--									</div>--%>
<%--								</td>--%>
<%--							</tr>--%>
						</c:when>
						<c:otherwise>
							<tr>
								<th>희망이용시간</th>
								<td>
									<form:input path="desired_start_time" class="text"/>~<form:input path="desired_end_time" class="text"/>
									<div class="ui-state-highlight">
										<em>* 시간 입력 ex) 10:30</em>
									</div>
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${homepage.context_path eq 'gm'}">
							<tr>
								<th>신청인원(<span style="color: red; font-weight: bold;">*</span>)</th>
								<td>
									<form:input path="user_aplly_count" class="text"/>
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<th>신청인원</th>
								<td>
									<form:input path="user_aplly_count" class="text"/>
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
					<tr>
						<th>사용목적 (<span style="color: red; font-weight: bold;">*</span>)</th>
						<td>
							<form:textarea path="apply_desc" class="text" cssStyle="width:100%; height:100px;"/>
						</td>
					</tr>
				</tbody>
			</table>
		</form:form>
	</c:when>
	<c:otherwise>
		<form:form id="facilityReqForm" modelAttribute="facilityReq" method="post" action="save.do" >
			<div style="text-align: right"><b>이용약관 및 개인정보의 수집·이용 동의 여부</b>(<span style="color: red; font-weight: bold;">*</span>)
				<form:select path="self_info_yn" cssClass="selectmenu" cssStyle="width : 70px">
					<form:option value="Y" label="동의"/>
					<form:option value="N" label="미동의"/>
				</form:select>
			</div>
			<br/>
			
			<form:hidden path="homepage_id"/>
			<form:hidden path="editMode"/>									
			<form:hidden path="facility_req_idx"/>
			<form:hidden path="facility_idx"/>
			<form:hidden path="menu_idx"/>
			<form:hidden path="facilityType"/>
			<form:hidden path="apply_id" value="${facilityReq.apply_id}"/>
			<form:hidden path="member_key"/>
			<table class="type1">
				<colgroup>
			       <col width="130" />
			       <col width="*"/>
		       	</colgroup>
		       	<tbody>
			        <tr>
			         	<th>시설물명</th>
			         	<td>${facility.facility_name}</td>
			        </tr>   
			        <tr>
			         	<th>이용일</th>
			         	<td>${facility.use_date}</td>
			        </tr>
					<%--<c:if test="${facility.homepage_id eq 'h19'}">
						<tr>
							<th>이용시간</th>
							<td>
								<form:select path="start_time" cssClass="select">
									<c:forEach begin="9" end="23" var="i">
										<c:choose>
											<c:when test="${i eq 9}">
												<form:option value="0${i}:00">0${i}:00</form:option>
											</c:when>
											<c:otherwise>
												<form:option value="${i}:00">${i}:00</form:option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</form:select>
								~
								<form:select path="end_time" cssClass="select">
									<c:forEach begin="9" end="23" var="i">
										<c:choose>
											<c:when test="${i eq 9}">
												<form:option value="0${i}:00">0${i}:00</form:option>
											</c:when>
											<c:otherwise>
												<form:option value="${i}:00">${i}:00</form:option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</form:select>
							</td>
						</tr>
					</c:if>--%>
			        <tr>
			         	<th>신청자명 (<span style="color: red; font-weight: bold;">*</span>)</th>
			         	<td>
		        			<form:input path="apply_name" class="text" readonly="true" value="${member.member_name }"/>	
		         		</td>
			        </tr>
			        <tr>
						<th>휴대전화번호 (<span style="color: red; font-weight: bold;">*</span>)</th>
						<td>
							<form:hidden path="apply_phone"/>
							<form:input path="apply_phone1" class="text" cssStyle="width:40px;" maxlength="3" numberonly="true" value="${fn:substring(member.mobile_no,0,3)}"/>
						 	- <form:input path="apply_phone2" class="text" cssStyle="width:50px;" maxlength="4" numberonly="true" value="${fn:substring(member.mobile_no,3,7)}"/>
						 	- <form:input path="apply_phone3" class="text" cssStyle="width:50px;" maxlength="4" numberonly="true" value="${fn:substring(member.mobile_no,7,11)}"/>
						</td>
					</tr>
					<tr>
						<th>사용목적 (<span style="color: red; font-weight: bold;">*</span>)</th>
						<td>
							<form:textarea path="apply_desc" class="text" cssStyle="width:100%; height:100px;"/>
						</td>
					</tr>
				</tbody>
			</table>
		</form:form>
	</c:otherwise>
</c:choose>
<br/>
<div class="txt-right">
	<button id="save-btn" class="btn btn2">신청하기</button>
	<button id="cancel-btn" class="btn btn5">취소</button>
</div>
