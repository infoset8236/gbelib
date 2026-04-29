<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://t1.kakaocdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(function(){
	$('button.select-btn').on('click', function(e) {
		$('tr.selectRow').css('background', 'white');
		$(this).parent().parent().css('background', '#b4e0fa');
		$('#studentLayer').load('student.do?homepage_id='+$(this).attr('keyValue1')+'&group_idx=' + $(this).attr('keyValue2')+ '&category_idx=' + $(this).attr('keyValue3')+'&training_idx=' + $(this).attr('keyValue4')+'&large_category_idx=' + $(this).attr('keyValue5'));
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
	
});	 
</script>

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy" var="currentYear"/>

<form:form id="adminStudentForm" modelAttribute="student">
	<div class="wrapper wrapper-white">
		<div class="column ban">
			<div class="areaL auto-scroll" style="width:30%;height:500px;margin-right: 10px;">
			<span>검색 결과 : ${fn:length(trainingList)}건</span>
				<div class="infodesk" style="display: flex; flex-wrap: wrap; gap: 5px;">
					<span style="float:left;">강좌연도 :
						<form:select path="search_year" cssClass="selectmenu">
							<form:option value="">전체</form:option>

							<c:forEach var="y" begin="${currentYear - 5}" end="${currentYear + 5}">
								<form:option value="${y}">${y}</form:option>
							</c:forEach>

						</form:select>
					</span>
					<span style="float:left;">대분류 : 
					<form:select path="large_category_idx" cssClass="selectmenu">
						<form:option class="all" value="0" label="전체" />
						<form:options itemValue="training_code" itemLabel="code_name" items="${trainingLargeCategoryList}"/>
					</form:select></span>
					<span style="float:left;">중분류 : 
					<form:select path="group_idx" cssClass="selectmenu" cssStyle="width:100px;">
						<form:option class="all" value="0" label="전체" />
						<form:options itemValue="group_idx" itemLabel="group_name" items="${categoryGroupList}"/>
					</form:select></span>
					<span style="float:right;">소분류 : 
					<form:select path="category_idx" cssClass="selectmenu" >
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
							<th width="15%">선택</th>
						</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${fn:length(trainingList) > 0}">
									<c:forEach var="i" varStatus="status" items="${trainingList}">
										<tr class="selectRow">
											<td class="num">${(student.viewPage * student.listPageCount - (student.listPageCount - status.count))}</td>
											<td>${i.training_name}</td>
											<td><button class="btn training_btn_${i.group_idx}${i.category_idx}${i.training_idx} select-btn" keyValue1="${i.homepage_id}" keyValue2="${i.group_idx}" keyValue3="${i.category_idx}" keyValue4="${i.training_idx}" keyValue5="${i.large_category_idx}">선택</button></td>
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
			
			<div id="studentLayer" class="areaR" style="float:left; width:68%;">
			</div>
		</div>
	</div>
</form:form>

	