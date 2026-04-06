<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tag" uri="/WEB-INF/config/tld/cmsTag.tld" %>
<script type="text/javascript">
$(function(){
	
	var change_mode = '${teach.change_mode}';
	
	if (change_mode == 'table') {
		$('#table_mode').show();
		$('#list_mode').hide();
	} else {
		$('#list_mode').show();
		$('#table_mode').hide();
	}			
	
	
	$('a.detail-btn').on('click', function(e) {
		$('#teach #group_idx').val($(this).attr('keyValue1'));
		$('#teach #category_idx').val($(this).attr('keyValue2'));
		$('#teach #teach_idx').val($(this).attr('keyValue3'));
		$('#teach #large_category_idx').val($(this).attr('keyValue4'));
		doGetLoad('/${homepage.context_path}/module/teach/detail.do', serializeCustom($('form#teach')));
		e.preventDefault();
	});
	
	$('a.add').on('click', function(e) {
		var $this = $(this);
		doGetLoad('/${homepage.context_path}/module/teach/student/edit.do', 
				'editMode=ADD&homepage_id='+$this.attr('keyValue1')+'&group_idx='+$this.attr('keyValue2')+'&category_idx='+$this.attr('keyValue3')
				+'&teach_idx='+$this.attr('keyValue4')+'&large_category_idx='+$this.attr('keyValue5')+ '&black_yn='+$this.attr('keyValue6') + '&apply_status='+ $this.attr('apply_status')+'&menu_idx='+$('input#menu_idx').val()+'&searchCate1='+'${param.searchCate1}');
		
		e.preventDefault();
	});
	
	$('a.cancel').on('click', function(e) {
		e.preventDefault();
		
		if (confirm("취소하시면 해당강의에 재신청이 불가합니다.\n프로그램 신청을 취소하시겠습니까?")) {
			$('input#homepage_id').val($(this).attr('keyValue1'));
			$('input#category_idx').val($(this).attr('keyValue2'));
			$('input#teach_idx').val($(this).attr('keyValue3'));
			$('input#editMode').val('CANCEL');
			
			doAjaxPost($('form#teach'));
		}
	});
	
	$('a.teachBook-btn').on('click', function(e) {
		e.preventDefault();
		var $this = $(this);
		doGetLoad('/${homepage.context_path}/module/teachBook/index.do','menu_idx='+$('#menu_idx').val()+'&homepage_id='+$this.attr('keyValue1')+'&group_idx='+$this.attr('keyValue2')+'&category_idx='+$this.attr('keyValue3')+'&teach_idx='+$this.attr('keyValue4')+'&large_category_idx='+$this.attr('keyValue5'));
	});
	
	$('select#category_idx').change(function() {
		
		doGetLoad('/${homepage.context_path}/module/teach/index.do','menu_idx='+$('#menu_idx').val()+'&group_idx='+$('#group_idx').val()+'&category_idx='+$('#category_idx').val()+'&large_category_idx='+$('#large_category_idx').val());
	});
	
	$('div.tabmenu a').on('click', function(e) {
		e.preventDefault();
		var url = 'index.do';
		$('input#category_idx').attr('value', $(this).attr('keyValue'));
		var $form = $('form#teach');
		var formData = serializeCustom($form);
		doGetLoad(url, formData);
	});
	
	$('a#search-btn').on('click', function(e) {
		//$('#newBookListForm').submit();
// 		$('input#viewPage').val(1);
		var value = null;
		var checkedCount = $('input:checkbox[name=teach_day]:checked').length;
		var valueList = new Array(checkedCount);
		var num = 0;
		console.log("checkedCount : "+ checkedCount);
		for(var i = 0 ; i < 7; i++){
			if($('#teach_day'+(i + 1)).prop("checked")){				
				valueList[num] = $('#teach_day'+(i + 1)).val();
				num++;	
			}
		}		
		$('#teach_day_arr').val(valueList);
		doGetLoad('index.do', serializeCustom($('#search_teach')));
	});
	
	$('select#sortField').on('change', function() {
		var value = null;
		var checkedCount = $('input:checkbox[name=teach_day]:checked').length;
		var valueList = new Array(checkedCount);
		var num = 0;
		console.log("checkedCount : "+ checkedCount);
		for(var i = 0 ; i < 7; i++){
			if($('#teach_day'+(i + 1)).prop("checked")){				
				valueList[num] = $('#teach_day'+(i + 1)).val();
				num++;	
			}
		}	
		$('#teach_day_arr').val(valueList);
		doGetLoad('index.do', serializeCustom($('#search_teach')));
	});
	
	$('select#sortType').on('change', function() {
		var value = null;
		var checkedCount = $('input:checkbox[name=teach_day]:checked').length;
		var valueList = new Array(checkedCount);
		var num = 0;
		console.log("checkedCount : "+ checkedCount);
		for(var i = 0 ; i < 7; i++){
			if($('#teach_day'+(i + 1)).prop("checked")){				
				valueList[num] = $('#teach_day'+(i + 1)).val();
				num++;	
			}
		}		
		$('#teach_day_arr').val(valueList);
		doGetLoad('index.do', serializeCustom($('#search_teach')));
	});
	
	$('select#group_idx').on('change', function() {
		var value = null;
		var checkedCount = $('input:checkbox[name=teach_day]:checked').length;
		var valueList = new Array(checkedCount);
		var num = 0;
		console.log("checkedCount : "+ checkedCount);
		for(var i = 0 ; i < 7; i++){
			if($('#teach_day'+(i + 1)).prop("checked")){				
				valueList[num] = $('#teach_day'+(i + 1)).val();
				num++;	
			}
		}		
		$('#teach_day_arr').val(valueList);
		doGetLoad('index.do', serializeCustom($('#search_teach')));
	});
	$('select#category_idx').on('change', function() {
		var value = null;
		var checkedCount = $('input:checkbox[name=teach_day]:checked').length;
		var valueList = new Array(checkedCount);
		var num = 0;
		console.log("checkedCount : "+ checkedCount);
		for(var i = 0 ; i < 7; i++){
			if($('#teach_day'+(i + 1)).prop("checked")){				
				valueList[num] = $('#teach_day'+(i + 1)).val();
				num++;	
			}
		}	
		$('#teach_day_arr').val(valueList);
		doGetLoad('index.do', serializeCustom($('#search_teach')));
	});
	$('select#teach_status').on('change', function() {
		var value = null;
		var checkedCount = $('input:checkbox[name=teach_day]:checked').length;
		var valueList = new Array(checkedCount);
		var num = 0;
		console.log("checkedCount : "+ checkedCount);
		for(var i = 0 ; i < 7; i++){
			if($('#teach_day'+(i + 1)).prop("checked")){				
				valueList[num] = $('#teach_day'+(i + 1)).val();
				num++;	
			}
		}			
		$('#teach_day_arr').val(valueList);
		doGetLoad('index.do', serializeCustom($('#search_teach')));
	});	
	$('input[name=change_mode]').on('change', function() {
		
		var value = $(this).val();
		
		if (value == 'table') {
			$('#table_mode').show();
			$('#list_mode').hide();
		} else {
			$('#list_mode').show();
			$('#table_mode').hide();
		}
	});
});
</script>

<style>
	#libraryList{text-align:left;padding-top:15px;}
	#libraryList p{margin-bottom:10px;font-weight:500;font-size:15px;}
	#libraryList b{font-weight:600;margin-right:8px;margin-left:15px;font-size:15px;display:inline-block;min-width:90px;}
	#libraryList label{font-weight:500;font-size:15px;}
	#libraryList .selectmenu{min-width:150px;font-size:15px;font-weight:500;}

	.srch_day_box{text-align:left;margin:15px 0;}

	.mobileBr{display:none;}

	@media all and (max-width:768px){
		#libraryList p{font-size:13px;}
		#libraryList b{font-size:13px;}
		#libraryList label{font-size:13px;}
		#libraryList .selectmenu{font-size:13px;}

		.mobileBr{display:block;}
	}

	@media all and (max-width:500px){
		#libraryList b{margin-right:5px;min-width:70px;}

		.mgl-500{margin-left:93px;margin-top:5px;}
	}

	@media all and (max-width:450px){
		.srch_day_box{text-align:center;width:100%;}
		.srch_day_box b{display:none !important;}

		#search-btn{position:relative;display:block;text-align:center;margin-top:10px;}
	}
</style>
<form:form modelAttribute="teach" action="/${homepage.context_path}/module/teach/student/save.do" method="POST">
	<form:hidden path="group_idx"/>
	<form:hidden path="teach_idx"/>
	<form:hidden path="menu_idx"/>
	<form:hidden path="category_idx"/>
	<form:hidden path="large_category_idx"/>
	<input type="hidden" name="searchCate1" value="${param.searchCate1}">
<!--
	<c:choose>
		<c:when test="${teach.group_idx > 0 and fn:length(categoryList) > 0}">
			<div class="tabmenu tab1">
				<ul>
					<li class="${teach.category_idx eq 0 ? 'active':''}"><a href="" keyValue=""style="font-size: 13px;">전체</a></li>
					<c:forEach items="${categoryList}" var="i" varStatus="status">
						<c:if test="${teach.group_idx eq i.group_idx}">
					<li class="${teach.category_idx eq i.category_idx ? 'active':''}"><a href="" keyValue="${i.category_idx}" style="font-size: 13px;">${i.category_name}</a></li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</c:when>
		<c:otherwise>
			<form:hidden path="category_idx"/>
		</c:otherwise>
	</c:choose>
-->	
	
</form:form>

<form:form modelAttribute="teach" id="search_teach" action="index.do" method="GET">
	<form:hidden path="menu_idx"/>
	<form:hidden path="searchCate1"/>
	<form:hidden path="teach_day_arr"/>
	<div id="libraryList" class="bbs-notice" style="margin-top:10px;margin-bottom:20px;" >
		<p>
			<b>보기</b><form:radiobutton path="change_mode" value="list" label="리스트형"/>&nbsp;&nbsp;
				  <form:radiobutton path="change_mode" value="table" label="테이블형"/>
			<p class="mobileBr"></p>
			<b>재정렬</b> <form:select path="sortField" cssClass="selectmenu l_title_option">
				<form:option value="1">강좌/행사명</form:option>
				<form:option value="2">접수기간</form:option>
				<form:option value="3">강좌일</form:option>
			</form:select>
			<form:select path="sortType" cssClass="selectmenu l_title_option mgl-500">
				<form:option value="ASC">오름차순</form:option>
				<form:option value="DESC">내림차순</form:option>
			</form:select>
		</p>
		
		<p>
			<b>접수상태</b> <form:select path="teach_status" cssClass="selectmenu l_title_option">						
				<option value="" <c:if test="${teach.teach_status eq null or teach.teach_status eq ''}">selected="selected"</c:if>>전체 보기</option>
				<form:option value="0" >수강신청</form:option>
				<form:option value="1" >대기자 신청</form:option>
				<form:option value="2" >신청완료</form:option>
				<form:option value="3" >대기자 신청완료</form:option>
				<form:option value="5" >정원마감</form:option>			
				<form:option value="4" >접수마감</form:option>
				<form:option value="6" >신청대기</form:option>											
			</form:select>
			<p class="mobileBr"></p>		
			<b>중분류</b> <form:select path="group_idx" cssClass="selectmenu l_title_option">						
				<option value="" <c:if test="${teach.group_idx eq null or teach.group_idx eq ''}">selected="selected"</c:if>>전체 보기</option>			
				<c:forEach var="j" items="${categoryGroupList}">							
					<option value="${j.group_idx }" <c:if test="${teach.group_idx eq j.group_idx}">selected="selected"</c:if>>${j.group_name }</option>
				</c:forEach>			
			</form:select>
			<p class="mobileBr"></p>		
			<b>소분류</b> <form:select path="category_idx" cssClass="selectmenu l_title_option">						
				<option value="" <c:if test="${teach.category_idx eq null or teach.category_idx eq ''}">selected="selected"</c:if>>전체 보기</option>			
				<c:forEach var="j" items="${categoryList}">							
					<option value="${j.category_idx }" <c:if test="${teach.category_idx eq j.category_idx}">selected="selected"</c:if>>${j.category_name }</option>
				</c:forEach>			
			</form:select>
		</p>
		
		<p>
			<b>강좌/행사명</b> <form:input path="search_teach_name" style="width:50%;height:30px;"/>
			<a href="#" id="search-btn" class="btn btn1">검색<i class="fas fa-search"></i></a>
		</p>

		<div class="srch_day_box">
			<b>요일</b>
			<c:set var="same" value="0"/>						
			<c:forEach varStatus="statusOut" begin="1" end="7">					
					<c:forEach varStatus="statusIn" var="i" items="${teach.teach_day_arr }">					
						<c:if test="${statusOut.index eq i }">
							<c:set var="same" value="1"/>
						</c:if>
					</c:forEach>
						<input type="checkbox" id="teach_day${statusOut.index }" name="teach_day" value="${statusOut.index }" <c:if test="${same eq '1' }">checked</c:if> style="width: 13px;">
						<label for="teach_day${statusOut.index }" style="background:none;padding-right:5px;">
							<c:choose>
								<c:when test="${statusOut.index eq '1' }">
									일
								</c:when>
								<c:when test="${statusOut.index eq '2' }">
									월
								</c:when>
								<c:when test="${statusOut.index eq '3' }">
									화
								</c:when>
								<c:when test="${statusOut.index eq '4' }">
									수
								</c:when>
								<c:when test="${statusOut.index eq '5' }">
									목
								</c:when>
								<c:when test="${statusOut.index eq '6' }">
									금
								</c:when>
								<c:when test="${statusOut.index eq '7' }">
									토
								</c:when>
							</c:choose>
						</label>					
					<c:set var="same" value="0"/>
			</c:forEach>						
		</div>
	</div>
	
</form:form>
<c:if test="${fn:length(teachList) <1 }">
	<div class="nodata">
			<i class="fa fa-frown-o"></i>
		<p>등록된 프로그램이 없습니다.</p>
	</div>
</c:if>
<div class="op_wrap">
	<div class="smain">
		<div id="table_mode" style="display:none">
			<table class="bbs center">
				<thead>
					<tr>
						<th width="50">번호</th>
						<th class="important">강좌/행사명</th>
						<th class="important">장소</th>
						<th class="important">접수기간</th>
						<th>강좌일</th>
						<th>접수현황</th>
						<th>신청</th>
					</tr>
				</thead>
				<tbody>
							<c:forEach items="${teachList}" var="i" varStatus="status">
								<tr>
									<td width="50" class="num">${status.count }</td>
									<td >${i.teach_name }</td>
									<td >${i.teach_stage }</td>
									<td >${i.start_join_date}&nbsp;&nbsp;${i.start_join_time}&nbsp;&nbsp;&nbsp;~ &nbsp;&nbsp;&nbsp;${i.end_join_date}&nbsp;&nbsp;${i.end_join_time}</td>
									<td >${i.start_date} <c:if test="${i.start_date ne i.end_date}">~ ${i.end_date}</c:if> (
													<c:forEach var="j" varStatus="status_j" items="${i.teach_day_arr}">
														<c:choose>
															<c:when test="${j eq '1'}">일</c:when>
															<c:when test="${j eq '2'}">월</c:when>
															<c:when test="${j eq '3'}">화</c:when>
															<c:when test="${j eq '4'}">수</c:when>
															<c:when test="${j eq '5'}">목</c:when>
															<c:when test="${j eq '6'}">금</c:when>
															<c:when test="${j eq '7'}">토</c:when>
														</c:choose>
														<c:if test="${!status_j.last}">
															, 
														</c:if>
													</c:forEach>
												) ${i.start_time} ~ ${i.end_time}</td>
									<td class="file"><span><strong>온라인</strong> ${i.teach_join_count} / ${i.teach_limit_count} </span>
						<c:if test="${i.teach_offline_count > 0}"><span>, <strong>오프라인</strong> ${i.teach_off_join_count} / ${i.teach_offline_count}</span></c:if>
						<c:if test="${i.teach_backup_count > 0}"><span>, ( <strong>후보자</strong> ${i.teach_backup_join_count} / ${i.teach_backup_count} )</span></c:if></td>
									<td>
										<c:choose>
				<c:when test="${member.login and (member.loginType eq 'HOMEPAGE') and (i.member_key eq member.seq_no)}">
					<a class="btn btn3 teachBook-btn" keyValue1="${i.homepage_id}" keyValue2="${i.group_idx}" keyValue3="${i.category_idx}" keyValue4="${i.teach_idx}"keyValue5="${i.large_category_idx}" >출석부</a>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${i.teach_status eq '0'}">
							<a href="" class="btn btn1 add" keyValue1="${i.homepage_id}" keyValue2="${i.group_idx}" keyValue3="${i.category_idx}" keyValue4="${i.teach_idx}" keyValue5="${i.large_category_idx}" apply_status="1">
							<i class="fa fa-pencil-square-o"></i><span>수강신청 </span></a>
						</c:when>
						<c:when test="${i.teach_status eq '1'}">
							<a href="" class="btn btn1 add" keyValue1="${i.homepage_id}" keyValue2="${i.group_idx}" keyValue3="${i.category_idx}" keyValue4="${i.teach_idx}" keyValue5="${i.large_category_idx}" apply_status="2">
							<i class="fa fa-pencil-square-o"></i><span>대기자신청</span></a>
						</c:when>
						<c:when test="${i.teach_status eq '2' or i.teach_status eq '10'}">
							<a href="/${homepage.context_path}/module/teach/applyList.do?menu_idx=${myTeachListMenuIdx}" class="btn btn2">
							<i class="fa fa-circle-o"></i><span>신청완료</span></a>
						</c:when>
						<c:when test="${i.teach_status eq '3'}">
							<a href="/${homepage.context_path}/module/teach/applyList.do?menu_idx=${myTeachListMenuIdx}" class="btn btn2">
							<i class="fa fa-circle-o"></i><span>대기자 신청완료</span></a>
						</c:when>
						<c:when test="${i.teach_status eq '9'}">
							<a href="javascript:void(0);" class="btn" style="cursor: default;">
							<i class="fa fa-pencil"></i><span>수강종료</span></a>
						</c:when>
						<c:when test="${i.teach_status eq '4'or i.teach_status eq '44'}">
							<a href="javascript:void(0);" class="btn" style="cursor: default;">
							<span>접수마감</span></a>
						</c:when>
						<c:when test="${i.teach_status eq '5'}">
							<a href="javascript:void(0);" class="btn" style="cursor: default;">
							<i class="fa fa-user"></i><span>정원마감</span></a>
						</c:when>
						<c:when test="${i.teach_status eq '6'}">
							<a href="javascript:void(0);" class="btn btn4" style="cursor: default;">
							<i class="fa fa-clock-o"></i><span>신청대기</span></a>
						</c:when>
					</c:choose>
				</c:otherwise>
			</c:choose>
									</td>
								</tr>
							</c:forEach>	
				</tbody>
			</table>
		</div>

		<style>
			.item .category .detail-btn.btn{float:right; text-align:center; width:85px; font-size: 13px;}

			@media (max-width:768px){
				.item .category .detail-btn.btn{position:relative;display:block;float:unset;font-size:11px;text-align:center;margin:0 auto;}
			}
		</style>
		
		<div id="list_mode" style="display:none">
			<c:forEach items="${teachList}" var="i">
				<div class="item">
					<div class="op_title category">
						<span class="ca ty2">${i.group_name} ${i.category_name}</span>
						<%-- 						<c:if test="${fn:length(i.teach_name) > 20}"> --%>
<!-- 						<br/> -->
<%-- 						</c:if> --%>
						<a href="" class="name detail-btn" keyValue1="${i.group_idx}" keyValue2="${i.category_idx}" keyValue3="${i.teach_idx}" keyValue4="${i.large_category_idx}">
							${i.teach_name}
						</a>
						<a href="" class="name detail-btn btn btn6" keyValue1="${i.group_idx}" keyValue2="${i.category_idx}" keyValue3="${i.teach_idx}" keyValue4="${i.large_category_idx}">
							<i class="fa fa-search"></i>상세보기
						</a>
					</div>
					<div class="box">
						<div class="box2">
							<ul class="con2">
								<li class="first"><div><label>접수기간 </label> : ${i.start_join_date}&nbsp;&nbsp;${i.start_join_time}&nbsp;&nbsp;&nbsp;~ &nbsp;&nbsp;&nbsp;${i.end_join_date}&nbsp;&nbsp;${i.end_join_time}</div></li>
								<li><div><label>장소</label> : ${i.teach_stage}</div></li>
								<li><div><label>강좌일</label> : ${i.start_date} <c:if test="${i.start_date ne i.end_date}">~ ${i.end_date}</c:if> (
																<c:forEach var="j" varStatus="status_j" items="${i.teach_day_arr}">
																	<c:choose>
																		<c:when test="${j eq '1'}">일</c:when>
																		<c:when test="${j eq '2'}">월</c:when>
																		<c:when test="${j eq '3'}">화</c:when>
																		<c:when test="${j eq '4'}">수</c:when>
																		<c:when test="${j eq '5'}">목</c:when>
																		<c:when test="${j eq '6'}">금</c:when>
																		<c:when test="${j eq '7'}">토</c:when>
																	</c:choose>
																	<c:if test="${!status_j.last}">
																		, 
																	</c:if>
																</c:forEach>
															) ${i.start_time} ~ ${i.end_time}
								</div></li>
								<li><div><label>강사명</label> : 
									<c:choose>
										<c:when test="${i.teacher_idx eq 0 }">
											${i.typing_teacher_name}
										</c:when>
										<c:otherwise>
											${i.teacher_name}
										</c:otherwise>
									</c:choose>
									</div></li>
								<li><div>
					        		<label>강의계획서</label> : 
						         	<span class="important td1">
						         		<c:if test="${i.real_file_name ne null and i.real_file_name ne '' }">
						         			<a style="color:#00f" href="download/${i.homepage_id}/${i.group_idx}/${i.category_idx}/${i.teach_idx}.do"><i class="fa fa-floppy-o"></i> ${i.plan_file_name}</a>
						         		</c:if>
					         		</span>
						        </div></li>
								
								<%-- <li><div><label>강좌설명</label> : ${i.teach_desc}</div></li> --%>
								<li><div class="status">
									<label>모집인원</label> :
									<span><strong>온라인</strong> ${i.teach_limit_count}명 </span>
									<c:if test="${i.teach_offline_count > 0}"><span>, <strong>오프라인</strong> ${i.teach_offline_count}명</span></c:if>
									<c:if test="${i.teach_backup_count > 0}"><span>, ( <strong>후보자</strong> ${i.teach_backup_count}명 )</span></c:if>
								</div></li>
								<li><div class="status">
									<label>접수현황</label> :
									<span>
										온라인 :
										<span ${i.teach_join_count > 0 and (i.teach_join_count eq i.teach_limit_count)? 'style="color:red;"' : 'style="color:#e55832"'}>${i.teach_join_count}</span> / ${i.teach_limit_count}
									</span>
									<c:if test="${i.teach_offline_count > 0}">
										<span>
											오프라인 :
											<span ${i.teach_off_join_count > 0 and (i.teach_off_join_count eq i.teach_offline_count)? 'style="color:red;"' : 'style="color:#e55832"'}>${i.teach_off_join_count}</span> / ${i.teach_offline_count}
										</span>
									</c:if>
									<c:if test="${i.teach_backup_count > 0}">
										<span>
											(
											후보자 :
											<span ${i.teach_backup_join_count > 0 and (i.teach_backup_join_count eq i.teach_backup_count)? 'style="color:red;"' : 'style="color:#e55832"'}>${i.teach_backup_join_count}</span> / ${i.teach_backup_count}
											)
										</span>
									</c:if>
								</div></li>
								<li><div><label>모집대상</label> : ${i.teach_target}</div></li>
								<li><div><label>준비물 및 재료비</label> : ${i.teach_etc}</div></li>
								<c:if test="${i.cancle_use_yn eq 'Y'}">
								<li><div><label>취소기간</label> : ${i.start_cancle_date}&nbsp;${i.start_cancle_time} ~ ${i.end_cancle_date}&nbsp;${i.end_cancle_time} <c:if test="${i.apply_limit eq 'Y'}">(취소 기간 동안 신청 불가)</c:if></div></li>
								</c:if>
								<c:if test="${i.limit_hak_yn eq 'Y'}">
								<li><div><label>학년제한</label> : ${i.limit_hak_str} ~ ${i.limit_hak2_str}</div></li>
								</c:if>
							</ul>
						</div>
					</div>
					<div class="stat">
						<c:choose>
							<c:when test="${member.login and (member.loginType eq 'HOMEPAGE') and (i.member_key eq member.seq_no)}">
								<a class="btn btn3 teachBook-btn" keyValue1="${i.homepage_id}" keyValue2="${i.group_idx}" keyValue3="${i.category_idx}" keyValue4="${i.teach_idx}"keyValue5="${i.large_category_idx}" >출석부</a>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${i.teach_status eq '0'}">
										<a href="" class="btn btn1 add" keyValue1="${i.homepage_id}" keyValue2="${i.group_idx}" keyValue3="${i.category_idx}" keyValue4="${i.teach_idx}" keyValue5="${i.large_category_idx}" keyValue6="${i.black_yn}" apply_status="1">
										<i class="fa fa-pencil-square-o"></i><span>수강신청</span></a>
									</c:when>
									<c:when test="${i.teach_status eq '1'}">
										<a href="" class="btn btn1 add" keyValue1="${i.homepage_id}" keyValue2="${i.group_idx}" keyValue3="${i.category_idx}" keyValue4="${i.teach_idx}" keyValue5="${i.large_category_idx}" keyValue6="${i.black_yn}" apply_status="2">
										<i class="fa fa-pencil-square-o"></i><span>대기자신청</span></a>
									</c:when>
									<c:when test="${i.teach_status eq '2' or i.teach_status eq '10'}">
										<a href="/${homepage.context_path}/module/teach/applyList.do?menu_idx=${myTeachListMenuIdx}" class="btn btn2">
										<i class="fa fa-circle-o"></i><span>신청완료</span></a>
									</c:when>
									<c:when test="${i.teach_status eq '3'}">
										<a href="/${homepage.context_path}/module/teach/applyList.do?menu_idx=${myTeachListMenuIdx}" class="btn btn2">
										<i class="fa fa-circle-o"></i><span>대기자 신청완료</span></a>
									</c:when>
									<c:when test="${i.teach_status eq '9'}">
										<a href="javascript:void(0);" class="btn" style="cursor: default;">
										<i class="fa fa-pencil"></i><span>수강종료</span></a>
									</c:when>
									<c:when test="${i.teach_status eq '4'or i.teach_status eq '44'}">
										<a href="javascript:void(0);" class="btn" style="cursor: default;">
										<span>접수마감</span></a>
									</c:when>
									<c:when test="${i.teach_status eq '5'}">
										<a href="javascript:void(0);" class="btn" style="cursor: default;">
										<i class="fa fa-user"></i><span>정원마감</span></a>
									</c:when>
									<c:when test="${i.teach_status eq '6'}">
										<a href="javascript:void(0);" class="btn btn4" style="cursor: default;">
										<i class="fa fa-clock-o"></i><span>신청대기</span></a>
									</c:when>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<div id="dialog-1" class="dialog-common" title="수강생 정보">
</div>