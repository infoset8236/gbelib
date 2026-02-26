<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/common/js/jquery-ui-1.12.0-datepicker.min.js"></script>
<script type="text/javascript">
$(function(){
	$('button.select-btn').on('click', function(e) {
		$('tr.selectRow').css('background', 'white');
		$(this).parent().parent().css('background', '#b4e0fa');
		$('#studentLayer').load('student.do?homepage_id=' + $(this).attr('keyValue1') + '&training_idx=' + $(this).attr('keyValue2'));
		e.preventDefault();
	});
	
	$('select#large_category_idx').on('change', function() {
		$('#adminStudentForm select#group_idx option.all').prop('selected', true);
		$('#adminStudentForm select#category_idx option.all').prop('selected', true);
		doGetLoad('index.do', $('#adminStudentForm').serialize());
	});
	
	$('select#group_idx').on('change', function() {
		$('#adminStudentForm select#category_idx option.all').prop('selected', true);
		doGetLoad('index.do', $('#adminStudentForm').serialize());
	});
	
	$('select#category_idx').on('change', function() {
		doGetLoad('index.do', $('#adminStudentForm').serialize());
	});
	
	$('#studentLayer').load('student.do?editMode=FIRST');

	$('button.dialog-add').on('click', function(e) {
		e.preventDefault();

		$('#dialog-1').load('edit.do?editMode=ADD&homepage_id=' + $(this).attr('keyValue1') + '&training_idx=' + $(this).attr('keyValue2'), function( response, status, xhr ) {
			$('#dialog-1').dialog('open');
		});
	});
});	 
</script>
<form:form id="adminStudentForm" modelAttribute="student">
	<div class="wrapper wrapper-white">
		<div class="column ban">
			<div class="areaL auto-scroll" style="width:30%;height:500px">
			<span>검색 결과 : ${fn:length(trainingList)}건</span>
				<div class="infodesk">
					<span style="float:left;">대분류 : 
					<form:select path="large_category_idx">
						<form:option class="all" value="0" label="전체" />
						<form:options itemValue="training_code" itemLabel="code_name" items="${trainingLargeCategoryList}"/>
					</form:select></span>
					<span style="float:left;">중분류 : 
					<form:select path="group_idx" cssStyle="width:100px;">
						<form:option class="all" value="0" label="전체" />
						<form:options itemValue="group_idx" itemLabel="group_name" items="${categoryGroupList}"/>
					</form:select></span>
					<span style="float:right;">소분류 : 
					<form:select path="category_idx" >
						<form:option class="all" value="0" label="전체" />
						<c:forEach items="${categoryList}" var="i">
	         				<form:option class="group_${i.group_idx}" value="${i.category_idx}" >${i.category_name}</form:option>
	         			</c:forEach>
					</form:select></span><br/>
				</div>
				
				<div class="table-wrap">
					<table class="type1 center">
						<thead>
						<tr>
							<th width="30">번호</th>
							<th>연수명</th>
							<th width="15%">기능</th>
						</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${fn:length(trainingList) > 0}">
									<c:forEach var="i" varStatus="status" items="${trainingList}">
										<tr class="selectRow">
											<td class="num">${(student.viewPage * student.listPageCount - (student.listPageCount - status.count))}</td>
											<td>${i.training_name}</td>
											<td>
												<button class="btn select-btn training_btn_${i.training_idx}" keyValue1="${i.homepage_id}" keyValue2="${i.training_idx}">선택</button>
												<c:if test="${i.qr_check eq 'Y'}">
													<button class="btn dialog-add" keyValue1="${i.homepage_id}" keyValue2="${i.training_idx}">QR생성</button>
												</c:if>
											</td>
										</tr>
									</c:forEach>							
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="3">데이터가 존재하지 않습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table> 
				</div>
			</div>
			
			<div id="studentLayer" class="areaR" style="float:left; width:68%;">
			</div>
		</div>
	</div>
</form:form>

<div id="dialog-1" class="dialog-common" title="QR코드 생성"></div>
<div id="dialog-2" class="dialog-common" title="QR코드"></div>
