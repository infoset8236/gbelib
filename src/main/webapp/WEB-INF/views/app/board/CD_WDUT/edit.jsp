<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${boardManage.add_html_use_yn eq 'Y' and fn:length(boardManage.top_html) > 0}">
${boardManage.top_html}
</c:if>

<jsp:include page="/WEB-INF/views/app/board/common/edit/script.jsp" flush="false" />
<script>
$(document).ready(function() {

	$('a#board_save_btn').unbind('click');
	$('a#board_save_btn').on('click', function(e) {
		e.preventDefault();

		if ($('select#terms_yn option:selected').val() == 'N') {
			alert('개인정보 수집 이용동의 하셔야 응모가능합니다.');
			return false;
		}

		$('#boardFileArray > option').prop('selected', true);

		<c:if test="${boardManage.editor_use_yn eq 'Y'}">
		if(isEditorOn()) {
			oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
		}
		</c:if>

		doAjaxPostBoard($('#board'));

	});

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
				<th>성 명</th>
				<td>
					<jsp:include page="/WEB-INF/views/app/board/common/edit/userName.jsp" flush="false" />
				</td>
				<th>생년월일</th>
				<td><form:input path="imsi_v_1" cssClass="text"/></td>
			</tr>
			<tr>
				<th>학교</th>
				<td>
					<form:input path="imsi_v_2" cssClass="text"/> (학생인 경우 입력)
				</td>
				<th>학년</th>
				<td><form:input path="imsi_v_3" cssClass="text"/> (학생인 경우 입력)</td>
			</tr>
			<tr>
				<th>휴대전화번호</th>
				<td>
					<form:input path="imsi_v_4" cssClass="text"/>
				</td>
				<th>이메일</th>
				<td><form:input path="imsi_v_5" cssClass="text"/></td>
			</tr>
			<tr>
				<th>작품명</th>
				<td colspan="3">
					<form:input path="imsi_v_6" cssClass="text" cssStyle="width:90%" maxlength="100" />
				</td>
			</tr>
			<tr>
				<th>작품설명</th>
				<td colspan="3">
					<form:textarea path="content" rows="8" cols="100" cssStyle="width:95%;"/>
				</td>
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
			<c:if test="${boardManage.file_use_yn eq 'Y'}">
			<tr>
				<td colspan="4" class="file_attach mmm1">
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