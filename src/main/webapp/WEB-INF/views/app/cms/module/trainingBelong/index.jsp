<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script src="https://t1.kakaocdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(function() {
	$('button#search_btn').on('click', function(e) {
		$('#viewPage').val(1);
		$('#mfile').prop('disabled', true);
		$('#trainingBelongListForm').submit();
	});
	
	
	$('a#dialog-add').on('click', function(e) {
		if ( $('#homepage_id_1').val() == '' ) {
			alert('홈페이지정보가 없습니다.');	
		}
		else {
			$('#dialog-1').load('edit.do?editMode=ADD&homepage_id=' + $('#homepage_id_1').val(), function( response, status, xhr ) {
				$('#dialog-1').dialog('open');
			});
		}
		e.preventDefault();
	});
	$('a.dialog-modify').on('click', function(e) {
		$('#dialog-2').load('edit.do?editMode=MODIFY&homepage_id=' + $('#homepage_id_1').val() + '&belong_idx=' + $(this).attr('keyValue2') + '&belong_name=' + $(this).attr('keyValue3'), function( response, status, xhr ) {
			$('#dialog-2').dialog('open');
		});
		
		e.preventDefault();
	});
	
	$('a.delete-btn').on('click', function(e) {
		if ( confirm('해당 기관을 삭제 하시겠습니까?') ) {
			$('#hiddenForm #editMode').val('DELETE');
			$('#hiddenForm #homepage_id').val($(this).attr('keyValue1'));
			$('#hiddenForm #belong_idx').val($(this).attr('keyValue2'));
			if(doAjaxPost($('#hiddenForm'))) {
				location.reload();
			}	
		}
	});

	$('select#homepage_id_1').on('change', function(e) {
		if($(this).val() != '') {
			$('input#homepage_id_1').val($(this).val());
			$('#teacherListForm').submit();
		}
		
		e.preventDefault();
	});

	$('#excelDownload').click(function(){
		doGetLoad('excelDownload.do', serializeCustom($('form#trainingBelongListForm')));
	});

	$('#excelUpload').click(function(){
		if($('#mfile').val() == '') {
			alert('엑셀 파일을 선택해주세요.');
			return;
		}
		var form = $('form#trainingBelongListForm')[0];
		var data = new FormData(form);

		$.ajax({
			type : "POST",
			enctype: 'multipart/form-data',
			url : 'excelUploadSave.do',
			data : data,
			dataType : 'json',
			processData: false,
			contentType: false,
			success: function(response) {
				if(response.valid) {
					alert('엑셀데이터 일괄 연수기관등록에 성공하였습니다.');
				} else {
					alert(response.message);
				}
				location.reload();
			},
			error : function() {
				alert('엑셀등록에 실패했습니다.\n관리자에게 문의해 주세요.');
			}
		});
	});

	$('#all-check').on('click', function() {
		if($(this).attr('keyValue') == 'N') {
			$(this).attr('keyValue', 'Y');
			$('.chkOne').prop('checked', true);
		} else {
			$(this).attr('keyValue', 'N');
			$('.chkOne').prop('checked', false);
		}
	});
});

function deleteAll() {
	if($('input:checkbox[name=belong_idx_arr]:checked').length < 1) {
		alert('삭제할 아이디를 선택해 주세요.');
	} else {
		if(confirm('전체 삭제 하시겠습니까?')) {
			$.ajax({
				type: "POST",
				url: 'deleteAll.do',
				data: $('input[name=belong_idx_arr]').serialize(),
				success: function(response) {
					if(response.valid) {
						alert('전체삭제 되었습니다.');
					}
					location.reload();
				},
				error : function() {
					alert('전체 삭제에 실패했습니다.\n\n관리자에게 문의해 주세요.');
				}
			});
		}
	}
}

function deleteEvery() {
	if(confirm('전체 삭제 하시겠습니까?')) {
		if(confirm('전체 삭제 후 데이터 복원은 불가능합니다.\n\n그래도 전체 삭제를 진행하시겠습니까?')) {
			$.ajax({
				type: "POST",
				url: "deleteEvery.do",
				dataType: "json",
				success: function(response) {
					if(response && response.valid){
						alert("전체 삭제되었습니다.");
						location.reload();
					}else{
						alert("삭제 처리 중 문제가 발생했습니다.");
					}
				},
				error: function() {
					alert("전체 삭제에 실패했습니다.\n\n관리자에게 문의해 주세요.");
				}
			});

		}
	}
}

function PageReload(){
	location.reload();
}

</script>
<form:form id="hiddenForm" modelAttribute="trainingBelong" action="save.do">
	<form:hidden path="editMode" value="DELETE"/>
	<form:hidden path="homepage_id"/>
	<form:hidden path="belong_idx"/>
</form:form>
<form:form id="trainingBelongListForm"  modelAttribute="trainingBelong" action="index.do" >
	<form:hidden id="homepage_id_1" path="homepage_id"/>
	<form:hidden path="search_type" value="belong_name"/>
	
	<div class="infodesk">
		검색 결과 : 총 ${trainingBelongListCount}건
	</div>
    <div class="button table-action">
        <c:if test="${authC}">
            <a href="" class="btn btn5 left" id="dialog-add"><i class="fa fa-plus"></i><span>등록</span></a>
            <a href="javascript:void(0)" id="excelDownload" class="btn btn1 left"><span>양식다운로드</span></a>
            <form:input path="mfile" name="mfile" type="file"/>

            <div style="margin-left: auto">
				<a href="javascript:void(0)" id="excelUpload" class="btn btn1 left"><span>일괄등록</span></a>
                <a href="javascript:void(0)" id="deleteAll" class="btn btn4 left" onclick="deleteAll()"><span>선택삭제</span></a>
                <a href="javascript:void(0)" id="deleteEvery" class="btn btn5 left" onclick="deleteEvery()"><span>일괄삭제</span></a>
			</div>
        </c:if>
    </div>
	<!-- 교육소식 관리 table -->
	<table class="type1 center">
		<colgroup>
			<col width="50" />
			<col width="100" />
			<col width="100" />
			<col width="100" />
			<col width="100" />
			<col width="100" />
			<col width="100" />
			<col width="100" />
		</colgroup>
		<thead>
			<tr>
				<th style="width:22px">
					<input type="checkbox" id="all-check" keyValue="N"/>
				</th>
				<th>번호</th>
				<th>기관명</th>	
				<th>관할조직명</th>
				<th>우편번호</th>
				<th>상세주소</th>
				<th>담당자이름</th>
				<th>담당자 휴대폰 번호</th>
				<th>사용 여부</th>
				<th>등록일</th>
				<th>등록ID</th>
				<th>수정일</th>
				<th>수정ID</th>
				<th>기능</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="i" varStatus="status" items="${trainingBelongList}">
				<tr>
					<td><form:checkbox path="belong_idx_arr" value="${i.belong_idx}" id='chkOne' class='chkOne'/></td>
					<td>${trainingBelong.listRowNum - status.index}</td>
					<td>${i.belong_name}</td>
					<td>${i.group_name}</td>
					<td>${i.zip_code}</td>
					<td>${i.address}</td>
					<td>${i.manager_name}</td>
					<td>${i.manager_phone}</td>
					<td>${i.use_yn}</td>
					<td>${i.add_date}</td>
					<td>${i.add_id}</td>
					<td>${i.mod_date}</td>
					<td>${i.mod_id}</td>
					<td>
						<c:if test="${authU}">
							<a href="" class="btn dialog-modify" keyValue1="${i.homepage_id}" keyValue2="${i.belong_idx}">수정</a>
						</c:if>
						<c:if test="${authD}">
							<a href="" class="btn delete-btn" keyValue1="${i.homepage_id}" keyValue2="${i.belong_idx}" keyValue3="${i.belong_name}">삭제</a>
						</c:if>
					</td>
				</tr>
			</c:forEach>
			<c:if test="${trainingBelongListCount eq 0}">
				<tr>
					<td colspan="10">데이터가 존재하지 않습니다.</td>
				</tr>
			</c:if>
		</tbody>
	</table>
	<jsp:include page="/WEB-INF/views/app/cms/common/paging.jsp" flush="false">
		<jsp:param name="formId" value="#trainingBelongListForm"/>
	</jsp:include>
	
	<div class="search txt-center" style="margin-top:25px;"><!-- 하단 정렬 시 margin-top 입력 -->
		<fieldset>
			기관명  :   
			<form:input path="search_text" cssClass="text" cssStyle="width:200px;"/>
			<button id="search_btn"><i class="fa fa-search"></i><span>검색</span></button>
		</fieldset>
	</div>
</form:form>
	
<div id="dialog-1" class="dialog-common" title="기관 등록"></div>
<div id="dialog-2" class="dialog-common" title="기관 수정"></div>