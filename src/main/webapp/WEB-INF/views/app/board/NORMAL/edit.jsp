<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${boardManage.add_html_use_yn eq 'Y' and fn:length(boardManage.top_html) > 0}">
${boardManage.top_html}
</c:if>
<jsp:include page="/WEB-INF/views/app/board/common/edit/script.jsp" flush="false" />

<script type="text/javascript">
	$(document).ready(function() {
		if('${param.manage_idx}' == '673'){
			$('#secret_yn_yes').prop('checked', true);
		}
	});
</script>

<form:form modelAttribute="board" action="save.do" method="post" onsubmit="return false;">
<jsp:include page="/WEB-INF/views/app/board/common/form_param.jsp" flush="false" />
<jsp:include page="/WEB-INF/views/app/board/common/form_paging_param.jsp" flush="false" />
<form:hidden path="editMode"/>
<form:hidden path="group_idx"/>
<form:hidden path="vulnerabilityMenu" value="${board.menu_idx}" />
<form:hidden path="VulnerabilityManage" value="${board.manage_idx}"/>
<form:hidden path="parent_idx"/>
<c:if test="${board.editMode eq 'REPLY'}">
<form:hidden path="group_depth"/>
</c:if>

<c:if test="${param.manage_idx eq '726'}">
<div class="join-wrap" style="padding: 0px; width: 100%; height: 200px;">

	<h3>개인정보의 수집·이용 동의</h3>
	<div tabindex="0" class="Box" style="height: 100px;">

		<span style="font-size: 10pt;">
		1. 개인정보의 수집·이용 목적: 독도는 우리 땅 개사 필사 이벤트 진행(응모자 확인, 중복 응모 방지, 추첨 안내) <br/>
		2. 수집하는 개인정보 항목: 이름, 휴대전화번호<br/>
		3. 개인정보의 보유 및 이용 기간: 행사 종료 시 즉시 파기<br/>
		4. 개인정보 수집·이용에 대한 동의를 거부할 권리<br/>
		   - 개인정보 수집·이용을 거부할 수 있으며, 미동의 시 독도는 우리 땅 개사 필사 이벤트에 행사에 응모할 수 없습니다.<br/>
		</span>

	</div>
	
</div>

<div style="text-align: right">
<b>개인정보의 수집·이용 동의에 모두 동의 합니다.</b>(<span style="color: red; font-weight: bold;">*</span>)
<select id="terms_yn_mngcode726" name="terms_yn_mngcode726" class="selectmenu" style="width : 70px" title="개인정보 이용동의 선택">
<option value="Y">동의</option>
<option value="N">미동의</option>
</select>
</div>
</c:if>

<div class="wrapper-bbs">
	<table class="bbs-edit">
		<tbody>
			<jsp:include page="/WEB-INF/views/app/board/common/edit/notice.jsp" flush="false" />
			<jsp:include page="/WEB-INF/views/app/board/common/edit/category.jsp" flush="false" />
			<tr>
				<th>제목</th>
				<td colspan="3">
					<form:input path="title" cssClass="text" cssStyle="width:90%" maxlength="100" />
				</td>
			</tr>
			<tr> 
				<th>작성자</th>
				<td>
					<jsp:include page="/WEB-INF/views/app/board/common/edit/userName.jsp" flush="false" />
				</td>
				<th>작성일</th>
				<td><fmt:formatDate value="${board.editMode eq 'ADD'?getToday:board.add_date}" pattern="yyyy-MM-dd"/></td>
			</tr>
			<c:if test="${boardManage.secret_use_yn eq 'Y'}">
			<tr>
				<th>비밀글 여부</th>
				<td colspan="3">
					<form:radiobutton path="secret_yn" id="secret_yn_yes" value="Y"/>
					<label for="secret_yn_yes">예</label>
					<form:radiobutton path="secret_yn" id="secret_yn_no" value="N" />
					<label for="secret_yn_no">아니요</label>
				</td>
			</tr>
			</c:if>
			<tr>
				<td colspan="4" class="editor">
					<div class="bbs-textarea">
						<form:textarea path="content" rows="10" cols="100" cssStyle="width:95%;${boardManage.editor_use_yn eq 'Y'?' display:none':''}"/>
					</div>
				</td>
			</tr>
			<c:if test="${boardManage.file_use_yn eq 'Y'}">
			<tr>
				<td colspan="4" class="file_attach">
					<jsp:include page="/WEB-INF/views/app/board/common/edit/jqueryFileUpload.jsp" flush="false">
						<jsp:param name="formId"  value="#board"/>
					</jsp:include>
				</td>
			</tr>
			</c:if>
		</tbody>
	</table>
	
	<jsp:include page="/WEB-INF/views/app/board/common/edit/button.jsp" flush="false" />
</div>
</form:form>
<c:if test="${boardManage.add_html_use_yn eq 'Y' and fn:length(boardManage.bottom_html) > 0}">
${boardManage.bottom_html}
</c:if>
<div id="addPreview"></div>