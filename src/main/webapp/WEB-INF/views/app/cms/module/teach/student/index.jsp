<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
$(function(){
	$('button.select-btn').on('click', function(e) {
		$('tr.selectRow').css('background', 'white');
		$(this).parent().parent().css('background', '#b4e0fa');
		$('#studentLayer').load('student.do?homepage_id='+$(this).attr('keyValue1')+'&group_idx=' + $(this).attr('keyValue2')+ '&category_idx=' + $(this).attr('keyValue3')+'&teach_idx=' + $(this).attr('keyValue4')+'&large_category_idx=' + $(this).attr('keyValue5'));
		e.preventDefault();
	});
	
	$('select#homepage_id_1').on('change', function(e) {
		if($(this).val() != '') {
			$('input#homepage_id_1').val($(this).val());
			$('#adminStudentForm').submit();
		}
		
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

	$('select#search_year').on('change', function() {
		doGetLoad('index.do', $('#adminStudentForm').serialize());
	});
	
	$('#studentLayer').load('student.do?editMode=FIRST');

	$('button#teachSearch_btn').on('click', function(e) {
		// $('#viewPage_ajax').val(1);
		var value = $('#teachSearch_btn').val();
		doGetLoad('index.do', $('#adminStudentForm').serialize());
		e.preventDefault();
	});

	$('a#teachExcelDownload').on('click', function (e) {
		//배열선언
		let teachIdxArray = [];
		let expressionBeforeLength = document.getElementsByClassName('last').length
		for (let i = 0; i < expressionBeforeLength; i++) {
			let regExpressionBefore  = document.getElementsByClassName('last')[i].innerHTML
			let firstOrder = regExpressionBefore.search('keyvalue4=')
			let lastOrder = regExpressionBefore.search('keyvalue5');
			let subString = regExpressionBefore.substring(firstOrder,lastOrder);
			let regTeachIdx = regExp(subString);
			let teachIdx = regTeachIdx.replace('keyvalue4','').trim();
			teachIdxArray.push(teachIdx);
		}
		$('#totalTeachIdxArray').val(teachIdxArray);

		excelDownLogPop();
	});

	$(document).on("excelDownLogSaved", function() {
		$('#adminStudentForm').attr('action', 'totalTeachExcelDownload.do').submit();
	});

});
function regExp(str){
	let reg = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi
	if(reg.test(str)){
		return str.replace(reg, "");
	} else {
		return str;
	}
}
</script>

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy" var="currentYear"/>

<form:form id="adminStudentForm" modelAttribute="student">
	<form:hidden path="totalTeachIdxArray"/>
	<form:hidden path="homepage_id"/>
	<div class="wrapper wrapper-white">
		<div class="column ban" style="display: flex;">
			<div class="areaL auto-scroll" style="height:500px">
			<span>검색 결과 : ${fn:length(teachList)}건</span>
				<div class="infodesk" style="overflow:hidden;">
                    <div style="display: flex; margin-bottom: 10px;">
                        <span style="float:left;">강좌연도 :
						<form:select path="search_year" cssClass="selectmenu">
							<form:option value="">전체</form:option>

							<c:forEach var="y" begin="${currentYear - 5}" end="${currentYear + 5}">
								<form:option value="${y}">${y}</form:option>
							</c:forEach>

						</form:select>
					</span></div>
				<div class="infodesk" style="overflow:hidden; display: flex; gap: 4px;">
					<span style="float:left;">대분류 :
					<form:select path="large_category_idx" cssClass="selectmenu">
						<form:option class="all" value="0" label="전체" />
						<form:options itemValue="teach_code" itemLabel="code_name" items="${teachLargeCategoryList}"/>
					</form:select></span>&nbsp;
					<span style="float:left;">중분류 : 
					<form:select path="group_idx" cssClass="selectmenu" cssStyle="width:100px;">
						<form:option class="all" value="0" label="전체" />
						<form:options itemValue="group_idx" itemLabel="group_name" items="${categoryGroupList}"/>
					</form:select></span>&nbsp;
					<span style="float:left;">소분류 : 
					<form:select path="category_idx" cssClass="selectmenu">
						<form:option class="all" value="0" label="전체" />
						<c:forEach items="${categoryList}" var="i">
	         				<form:option class="group_${i.group_idx}" value="${i.category_idx}" >${i.category_name}</form:option>
	         			</c:forEach>
					</form:select></span><br/>
				</div>

				<div class="" style="width:98%;border:1px solid #eaeaea;border-radius:3px;padding:10px;box-sizing:border-box;overflow:hidden;margin-bottom:5px;text-align:center;">
					<span>강좌명검색 : <form:input path="search_text" cssClass="text" cssStyle="width:180px;"/></span>
					<button id="teachSearch_btn" class="btn btn1"><i class="fa fa-search"></i><span>검색</span></button>
					<a href="#" id="teachExcelDownload" class="btn btn2"><i class="fa fa-file-excel-o"></i><span>엑셀저장</span></a>
				</div>

				<div class="table-wrap">
					<table class="type1 center">
						<thead>
						<tr>
							<th width="30">번호</th>
							<th>강좌명</th>
							<th width="15%">선택</th>
						</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${fn:length(teachList) > 0}">
									<c:forEach var="i" varStatus="status" items="${teachList}">
										<tr class="selectRow">
											<td class="num">${(student.viewPage * student.listPageCount - (student.listPageCount - status.count))}</td>
											<td>${i.teach_name}</td>
											<td><button class="btn teach_btn_${i.group_idx}${i.category_idx}${i.teach_idx} select-btn" keyValue1="${i.homepage_id}" keyValue2="${i.group_idx}" keyValue3="${i.category_idx}" keyValue4="${i.teach_idx}" keyValue5="${i.large_category_idx}">선택</button></td>
										</tr>
									</c:forEach>							
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="5">데이터가 존재하지 않습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table> 
				</div>

			</div>
			</div>

			<div id="studentLayer" class="areaR" style="float:left; width:65%;">

			</div>
		</div>
	</div>
</form:form>

	