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
        $('#secret_yn_yes').prop('checked', true);

        $('a#getIlus').on('click', function(e) {
            e.preventDefault();
            if ('${homepage.context_path}' == '') {
                alert('홈페이지에서만 가능합니다');
            } else {
                var ilusList = window.open('/${homepage.context_path}/intro/search/indexForBoard.do', 'ilusLnkBook', 'width=800 height=600,scrollbars=yes');
            }
        });
	});

    function getIlusData(arg) {
        arg = arg.split('///');
        //${i.TITLE}//${i.PUBLER_YEAR}//${i.AUTHOR}//${i.PUBLER}//${i.ISBN}//${i.CALL_NO}//${i.i.COVER_SMALLURL}//${i.CTRLNO}//${i.PLACE_NAME}

        $.ajax({
            type: 'POST',
            url: '/${homepage.context_path}/intro/search/getBookDetail.do' ,
            data: 'vCtrl='+arg[7] ,
            dataType : 'json',
            success: function(response){
                if(response.valid) {
                    $('input#imsi_v_6').val(response.data);
                } else {
                    for(var i =0 ; i < response.result.length ; i++) {
                        alert(response.result[i].code);
                        $('#'+response.result[i].field).focus();
                        break;
                    }
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                alert('[' + textStatus + ']관리자에게 문의하세요. : ' + errorThrown);
            }
        });

        $('input#title').val(arg[0]);
        $('input#imsi_v_2').val(arg[1]);
        $('input#imsi_v_3').val(arg[2]);
        $('input#imsi_v_4').val(arg[3]);
        $('input#imsi_v_5').val(arg[4]);
        $('input#imsi_v_7').val(arg[5]);
        $('input#imsi_v_9').val(arg[6]);
        $('input#imsi_v_8').val(arg[7]);
        $('input#imsi_v_10').val(arg[0]);

        return false;
    }
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
<form:hidden path="imsi_v_9"/>

<div class="wrapper-bbs">
	<table class="bbs-edit">
		<tbody>
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
            <tr>
                <th>출판년도</th>
                <td>
                    <form:input path="imsi_v_2" cssClass="text" maxlength="4" numberOnly="true" />
                </td>
                <th>저자</th>
                <td>
                    <form:input path="imsi_v_3" cssClass="text" maxlength="100"/>
                </td>
            </tr>
            <tr>
                <th>출판사</th>
                <td>
                    <form:input path="imsi_v_4" cssClass="text" maxlength="100"/>
                </td>
                <th>소장자료실</th>
                <td>
                    <form:input path="imsi_v_6" cssClass="text" maxlength="100"/>
                </td>
            </tr>
            <tr>
                <th>ISBN</th>
                <td>
                    <form:input path="imsi_v_5" cssClass="text" maxlength="100"/>
                </td>
                <th>청구기호</th>
                <td>
                    <form:input path="imsi_v_7" cssClass="text" maxlength="100"/>
                </td>
            </tr>
            <c:choose>
                <c:when test="${boardManage.secret_use_yn eq 'Y'}">
                    <tr>
                        <th>서명</th>
                        <td>
                            <form:input path="imsi_v_10" cssClass="text" cssStyle="width:90%" maxlength="100"/>
                        </td>
                        <th>비밀글 여부</th>
                        <td>
                            <form:radiobutton path="secret_yn" id="secret_yn_yes" value="Y"/>
                            <label for="secret_yn_yes">예</label>
                            <form:radiobutton path="secret_yn" id="secret_yn_no" value="N" />
                            <label for="secret_yn_no">아니요</label>
                        </td>
                    </tr>
                    <tr>
                        <th>도서검색</th>
                        <td colspan="3">
                            <a href="#" class="btn btn2" id="getIlus"><i class="fa fa-plus"></i><span>도서검색</span></a>
                            <br/>
                            *도서검색을 통해 등록할 경우 <br/>책 이미지 등록하지 않으셔도 됩니다.
                        </td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <tr>
                        <th>서명</th>
                        <td>
                            <form:input path="imsi_v_10" cssClass="text" cssStyle="width:90%" maxlength="100"/>
                        </td>
                        <th>도서검색</th>
                        <td>
                            <a href="#" class="btn btn2" id="getIlus"><i class="fa fa-plus"></i><span>도서검색</span></a>
                            <br/>
                            *도서검색을 통해 등록할 경우 <br/>책 이미지 등록하지 않으셔도 됩니다.
                        </td>
                    </tr>
                </c:otherwise>
            </c:choose>
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