<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tag" uri="/WEB-INF/config/tld/customTag.tld" %>
<script src="${getContextPath}/resources/cms/js/malsup.jquery.form.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(function() {
	//input change (메뉴명 입력 시 메뉴 경로에 자동으로 출력 됨)
	$.event.special.inputchange = {
	    setup: function(){
	        var self = this, val;
	        $.data(this, 'timer', window.setInterval(function(){
	            val = self.value;
	            if($.data(self, 'cache') != val){
	                $.data(self, 'cache', val);
	                $(self).trigger('inputchange');
	            }
	        }, 20));
	    },
	    teardown: function(){
	        window.clearInterval($.data(this,'timer'));
	    }, 
	    add: function(){
	        $.data(this, 'cache', this.value);
	    }
	};
	var txt = $('input.menuName').val();
	$('span.menuName').text(txt);
	$('input.menuName').on('inputchange',function(){
		var txt = $(this).val();
		$('span.menuName').text(txt);
	});
	
	$('input#print_seq').spinner({
		min: 0,
		max: 2500,
		step: 1,
		start: 1000
	});
	
	//메뉴 유형 선택 시 추가 옵션 (cont2.jsp)
	$('.menuType').each(function(i){
		var i = i+1;
		$(this).attr('id','menuType'+i);
	});
	$('.menuTypeBox .radio input').each(function(i){
		var i = i+1;
		$(this).on('click',function(){
			$('.menuType').hide();
			$('#menuType'+i).show();
		});
		if($(this).prop('checked')){
			$('.menuType').hide();
			$('#menuType'+i).show();
		}
	});
	$('.selectmenu').select2({
		//셀렉트 메뉴에 검색 기능 사용 안함
		minimumResultsForSearch: Infinity
	});
	
	//HTML 등록/수정 dialog
	$('a#modal_HTML, a#module-html').on('click', function(event) {
		$('#dialog_HTML').load('edit_html.do?homepage_id=' + $('input#homepage_id_1').val() + '&menu_idx=${menu.menu_idx}', function( response, status, xhr ) {
			$('div#dialog_HTML').dialog('open');
		});
		
		$('.injected').remove();
		
		event.preventDefault();
	});
	
	//게시판 등록/수정 dialog
	$('a#modal_BOARD').on('click', function(event) {
		$('#dialog_BOARD').load('edit_board.do?homepage_id=' + $('input#homepage_id_1').val() + '&menu_idx=${menu.menu_idx}&rowCount=1000', function( response, status, xhr ) {
			$('div#dialog_BOARD').dialog('open');
		});
		
		event.preventDefault();
	});
	
	//게시판 등록/수정 dialog
	$('a#modal_MODULE').on('click', function(event) {
		$('#dialog_MODULE').load('edit_module.do?homepage_id=' + $('input#homepage_id_1').val() + '&menu_idx=${menu.menu_idx}&module_type=SITE', function( response, status, xhr ) {
			$('div#dialog_MODULE').dialog('open');
		});
		
		event.preventDefault();
	});
	
	$('a#save').on('click', function(e) {
		if(confirm('저장 하시겠습니까?')) {
			jQuery.ajaxSettings.traditional = true;
			if ( $('[name="menu_type"]:checked').val() == 'PROGRAM' ) {
				$('#menu_url_param').val($('#moduleLinkParam').val());
			}
			else if ( $('[name="menu_type"]:checked').val() == 'LINK' ) {
				$('#link_url').val($('#input_link').val());
			}
			else if ( $('[name="menu_type"]:checked').val() == 'LINK_OUTER' ) {
				$('#link_url').val($('#input_link_outer').val());
			}
			
			/* if ( $('#check_0').prop('checked') ) {
				$('#content_title_yn').val('Y');
			}
			else {
				$('#content_title_yn').val('N');
			} */
			
			var option = {
				url : "/cms/menu/save.do",
				type : "POST",
				data : $("#menuEdit").serialize(),
				success: function(response) {
					 if(response.valid) {
		                 if(response.message != null && response.message.replace(/\s/g,'').length!=0) {
							alert(response.message);
							doGetLoad('/cms/menu/index.do', 'homepage_id='+$('#menuEdit #homepage_id').val());
		                 }
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
			};
			$("#menuEdit").ajaxSubmit(option);
		}
		
		e.preventDefault();
	});
	
	//담당자 선택 창 띄우기
    $('a.select-manager-btn1').on('click', function(e) {
		e.preventDefault();
		$('div#dialog_manager1').load('managerView.do?managerNum=1&homepage_id=' + $('input#homepage_id_1').val(), function( response, status, xhr ) {
			$('div#dialog_manager1').dialog('open');
		});
	});
	
	$('a.select-manager-btn2').on('click', function(e) {
		e.preventDefault();
		$('div#dialog_manager2').load('managerView.do?managerNum=2&homepage_id=' + $('input#homepage_id_1').val(), function( response, status, xhr ) {
			$('div#dialog_manager2').dialog('open');
		});
	});
	
	$('a.select-manager-btn3').on('click', function(e) {
		e.preventDefault();
		$('div#dialog_manager3').load('managerView.do?managerNum=3&homepage_id=' + $('input#homepage_id_1').val(), function( response, status, xhr ) {
			$('div#dialog_manager3').dialog('open');
		});
	});
	
	$('a.select-manager-btn4').on('click', function(e) {
		e.preventDefault();
		$('div#dialog_manager4').load('managerView.do?managerNum=4&homepage_id=' + $('input#homepage_id_1').val(), function( response, status, xhr ) {
			$('div#dialog_manager4').dialog('open');
		});
	});
	
	$('a.select-manager-btn5').on('click', function(e) {
		e.preventDefault();
		$('div#dialog_manager5').load('managerView.do?managerNum=5&homepage_id=' + $('input#homepage_id_1').val(), function( response, status, xhr ) {
			$('div#dialog_manager5').dialog('open');
		});
	});
	
	$('a.preview-btn').on('click', function(e) {
		//e.preventDefault();
		if ( $('[name="menu_type"]:checked').val() == 'HTML' ) {
			window.open("/${homepage.context_path}/html.do?menu_idx=${menu.menu_idx}");	
		}
		else if ( $('[name="menu_type"]:checked').val() == 'BOARD' ) {
			window.open("/${homepage.context_path}/board/index.do?menu_idx=${menu.menu_idx}&manage_idx=${boardManage.manage_idx}");
		}
		else if ( $('[name="menu_type"]:checked').val() == 'PROGRAM' ) {
			window.open("/${homepage.context_path}${moduleManage.link_url}");
		}
		else if ( $('[name="menu_type"]:checked').val() == 'LINK' ) {
			window.open("${menu.link_url}");
		}
		else if ( $('[name="menu_type"]:checked').val() == 'LINK_OUTER' ) {
			window.open("${menu.link_url}");
		}
	});
	
	for(var i = 1; i < 6 ; i++){		
		var manager = $('#manager_dept'+i).val();
		if(i == 1 && manager == null || manager == ''){ //첫번째 담당자 값이 없으면
			$('#manager_delete'+i).hide(); // 삭제버튼 숨기기
		}
		if(i > 1){ //두번째 담당자 부터						
			if(manager == null || manager == ''){ //값이 없으면
				$('#group'+i).hide(); //행 숨기기
				$('#group'+(i-1)).attr('class','group last'); //다음 값이 없으면 이전 박스의 border-bottom 값 주기위해(박스 아래 라인 색깔 주기)
			}else{ //값이 있으면
				for(var j = i -1 ; j > 0 ; j--){ 
					if($('#manager_add'+ j).show()){ //마지막 이전 행의 삭제 버튼이 노출되어 있으면 숨기기
						$('#manager_add'+ j).hide(); 
					}
					if($('#group'+j).hide()){ //ex)3번째 값만 있으면 1번, 2번 값은 빈칸으로 노출되게
						$('#group'+j).show();
					}
					$('#group'+ j).attr('class','group'); //마지막 행이 아니면 border-bottom 색 지정 없애기
				}
							
			}
		}
		if(i == 5){
			$('#manager_add'+ i).hide(); // 마지막 행은 추가버튼 숨기기	
		}
	}
});

//추가 버튼 클릭 시 마지막 행만 border-bottom 색 주기
function managerAdd(a) {
	if(a == 1){
		$('#group2').show();
		$('#group1').attr('class','group');
		$('#group2').attr('class','group last');
		$('#manager_add1').hide();		
	}else if(a == 2){
		$('#group3').show();
		$('#group2').attr('class','group');
		$('#group3').attr('class','group last');
		$('#manager_add2').hide();
	}else if(a == 3){
		$('#group4').show();
		$('#group3').attr('class','group');
		$('#group4').attr('class','group last');
		$('#manager_add3').hide();
	}else if(a == 4){
		$('#group5').show();
		$('#group4').attr('class','group');
		$('#group5').attr('class','group last');
		$('#manager_add4').hide();
	}		
}

function delete_manager(a) {					
	$('#managerNum').val(a);
	var formData = serializeParameter(['manager_dept1', 'manager_name1', 'manager_phone1',
		'manager_dept2', 'manager_name2', 'manager_phone2',
		'manager_dept3', 'manager_name3', 'manager_phone3',
		'manager_dept4', 'manager_name4', 'manager_phone4',
		'manager_dept5', 'manager_name5', 'manager_phone5','menu_idx', 'homepage_id', 'managerNum']);		
	if(confirm('삭제 하시겠습니까?')) {
		$.ajax({
			url : 'delete_manager.do',
			async : true ,
			method : 'POST',
			data: formData,
			success : function(data) {
				alert(data.message);
				location.reload();
			}
		});
	}	
}	
</script>
<div id="editDisable" class="disableBox">
	<%-- disable 상태로 변경 --%>
	<c:if test="${menu.editMode eq 'FIRST'}">
	<div class="mask"></div>
	</c:if>
	<div class="set-info">
		<strong>메뉴 상세정보</strong>
	</div>
	<form:form id="menuEdit" modelAttribute="menu" action="save.do" method="post" onsubmit="return false;" enctype="multipart/form-data">
	<form:hidden path="homepage_id" />
	<form:hidden path="menu_idx" />
	<form:hidden path="manage_idx" />
	<form:hidden path="parent_menu_idx" />
	<form:hidden path="group_idx" />
	<form:hidden path="editMode" />
	<form:hidden path="link_url"/>
	<form:hidden path="menu_url_param"/>
	<form:hidden path="managerNum"/>
	<table class="type3">
		<colgroup>
			<col width="120"/>
			<col width="*"/>
		</colgroup>
		<tbody>
			<tr>
				<th>메뉴 경로</th>
				<td>
				<c:choose>
					<c:when test="${menu.parent_menu_idx eq 0}">
					최상위 > <span class="menuName"></span>
					</c:when>
					<c:otherwise>
					최상위 > ${parentMenu.menu_full_path_name} > <span class="menuName"></span>
					</c:otherwise>
				</c:choose>
				</td>
				<th>독립메뉴여부</th>
				<td>
					<form:radiobutton path="solo_yn" value="N" label="NO"/>
					<form:radiobutton path="solo_yn" value="Y" label="YES"/>
				</td>
			</tr>
			<tr>
				<th>메뉴 ID</th>
				<td colspan="3">
					<c:choose>
					<c:when test="${menu.editMode eq 'MODIFY'}">${menu.menu_idx}</c:when>
					<c:otherwise>
					<p class="info">자동으로 메뉴 ID가 등록됩니다. </p>
					</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr class="group first">
				<th>메뉴명</th>
				<td colspan="3"><form:input path="menu_name" cssClass="text menuName" cssStyle="font-size:14px;font-weight:800;" maxlength=""/></td>
			</tr>
			<tr>
				<th>메뉴명 표시</th>
				<td colspan="3">
					<div class="checkbox">
						<form:checkbox path="content_title_yn" value="Y" label="사용함"/>
						<p class="info">체크 해제 시 홈페이지에서 콘텐츠 상단의 메뉴명이 출력되지 않습니다.</p>
					</div>
				</td>
			</tr>
			<c:if test="${menu.parent_menu_idx eq 0 }">
			<tr>
				<th>메뉴 이미지</th>
				<td>
					<input type="file" name="menu_img_file" /> <br/>
				</td>
			</tr>
			<tr>
				<th>현재 이미지</th>
				<td colspan="3">
					<c:if test="${menu.menu_img ne null and menu.menu_img ne '' }">
						<img alt="${menu.menu_img}" src="/data/menu/${menu.homepage_id}/${menu.menu_img}">
					</c:if>
				</td>
			</tr>
			</c:if>
			<tr class="group">
				<th>메뉴 노출</th>
				<td colspan="3">
					<form:select path="view_yn" cssClass="selectmenu">
						<form:option value="Y">YES</form:option>
						<form:option value="N">NO</form:option>
					</form:select>
					<p class="info">NO 선택 시 홈페이지 메뉴 목록에서 출력되지 않습니다.(URL로 직접 접근은 가능합니다.)</p>
				</td>
			</tr>
			<tr class="group">
				<th>메뉴 노출(모바일)</th>
				<td colspan="3">
					<form:select path="mobile_view_yn" cssClass="selectmenu">
						<form:option value="Y">YES</form:option>
						<form:option value="N">NO</form:option>
					</form:select>
					<p class="info">NO 선택 시 홈페이지(모바일) 메뉴 목록에서 출력되지 않습니다.(URL로 직접 접근은 가능합니다.)</p>
				</td>
			</tr>
			<tr class="group last">
				<th>사용 여부</th>
				<td colspan="3">
					<form:select path="use_yn" cssClass="selectmenu">
						<form:option value="Y">YES</form:option>
						<form:option value="N">NO</form:option>
					</form:select>
					<p class="info">NO 선택 시 메뉴에 접근이 불가능합니다.</p>
				</td>
			</tr>
			<tr>
				<th>출력 순서</th>
				<td colspan="3">
					<form:input path="print_seq" cssStyle="width:30px;" cssClass="text spinner"/>
				</td>
			</tr>
			<tr>
				<th>메뉴 유형</th>
				<td colspan="3">
					<div class="form-group menuTypeBox">
						<div class="radio">
							<form:radiobutton id="menu_type_NONE" path="menu_type" value="NONE"/>
							<label for="menu_type_NONE">기능 없음</label>
						</div>
						<div class="radio">
							<form:radiobutton id="menu_type_HTML" path="menu_type" value="HTML"/>
							<label for="menu_type_HTML" class="html">HTML</label>
						</div>
						<div class="radio">
							<form:radiobutton id="menu_type_BOARD" path="menu_type" value="BOARD"/>
							<label for="menu_type_BOARD" class="bbs">게시판</label>
						</div>
						<div class="radio">
							<form:radiobutton id="menu_type_PROGRAM" path="menu_type" value="PROGRAM"/>
							<label for="menu_type_PROGRAM" class="module">프로그램 모듈 선택</label>
						</div>
						<div class="radio">
							<form:radiobutton id="menu_type_LINK" path="menu_type" value="LINK"/>
							<label for="menu_type_LINK" class="link">내부 링크</label>
						</div>
						<div class="radio">
							<form:radiobutton id="menu_type_LINK_OUTER" path="menu_type" value="LINK_OUTER"/>
							<label for="menu_type_LINK_OUTER" class="link">외부 링크</label>
						</div>
						<div class="menuType none">
							&nbsp;
						</div>
						<div class="menuType html">
						<c:choose>
						<c:when test="${menu.editMode eq 'MODIFY'}">
							<a href="" class="btn btn1" id="modal_HTML">HTML 등록/수정</a>
							<div id="dialog_HTML" class="dialog-common" title="HTML 등록/수정">
							</div>
						</c:when>
						<c:otherwise>
							<em>* 메뉴를 먼저 등록 후 HTML 편집이 가능합니다.</em>
						</c:otherwise>
						</c:choose>
							
						</div>
						<div class="menuType bbs">
							<a href="" class="btn btn1" id="modal_BOARD">게시판 종류 선택</a>
							<div id="dialog_BOARD" class="dialog-common" title="게시판 선택">
							</div>
							<table>
								<tr>
									<th>게시판번호</th>
									<td id="edit_manageIdx">${boardManage.manage_idx}</td>
								</tr>
								<tr>
									<th>게시판명</th>
									<td id="edit_boardName">${boardManage.board_name}</td>
								</tr>
								<tr>
									<th>게시판 유형</th>
									<td id="edit_boardType">${boardManage.board_type}</td>
								</tr>
							</table>
						</div>
						<div class="menuType module">
							<a href="" class="btn btn1" id="modal_MODULE">모듈 선택</a>
							<div id="dialog_MODULE" class="dialog-common" title="게시판 선택"></div>
							<table>
								<tr>
									<th>모듈번호</th>
									<td id="edit_moduleIdx">${moduleMngt.module_idx}</td>
								</tr>
								<tr>
									<th>모듈명</th>
									<td id="edit_moduleName">${moduleMngt.module_name}</td>
								</tr>
								<tr>
									<th>모듈링크</th>
									<td id="edit_moduleLink">${moduleMngt.link_url}</td>
								</tr>
								<tr>
									<th>링크변수</th>
									<td id="edit_moduleLinkParam"><input id="moduleLinkParam" type="text" class="text" value="${menu.menu_url_param}"></td>
								</tr>
								<tr class="moduleHtml" style="${moduleManage.module_idx eq 25?'':'display:none'}">
									<th>HTML</th>
									<td>
										<a href="" class="btn btn1" id="module-html">HTML 등록/수정</a>
									</td>
								</tr>
							</table>
						</div>
						<div class="menuType link1">
							<!-- <a href="" class="btn btn1">내부 링크 선택</a> -->
							<table>
								<tr>
									<th>URL</th>
									<td><input id="input_link" type="text" class="text" value="${menu.menu_type eq 'LINK'? menu.link_url : ''}"/></td>
								</tr>
								<!-- <tr>
									<th>파라미터</th>
									<td><input type="text" class="text"/></td>
								</tr>
								<tr>
									<th>타겟</th>
									<td>
										<div class="checkbox">
											<input type="checkbox" id="link1-target" checked="checked"/>
											<label for="link1-target">새창 열림</label>
											<p class="info">체크 해제 시 현재창에서 이동합니다.</p>
										</div>
									</td> -->
							</table>
						</div>
						<div class="menuType link2">
							<p class="info">링크 URL주소를 입력합니다. 외부 링크는 새창으로 열립니다.</p>
							<table>
								<tr>
									<th>URL</th>
									<td><input id="input_link_outer" type="text" class="text" value="${menu.menu_type eq 'LINK_OUTER'? menu.link_url : ''}"/></td>
								</tr>
<!-- 								<tr>
									<th>파라미터</th>
									<td><input type="text" class="text"/></td>
								</tr> -->
							</table>
						</div>
					</div>
				</td>
			</tr>
			<tr style="display: none;">
				<th>메뉴 권한</th>
				<td colspan="3">
					<div class="permissionBox">
						<a href="" class="btn btn1" id="authGroup">권한그룹 설정</a>
					</div>
				</td>
			</tr>
			<tr class="group first">
				<th>담당자 표시</th>
				<td colspan="3">
					<form:select path="manage_view_yn" cssClass="selectmenu">
						<form:option value="Y" label="YES" />
						<form:option value="N" label="NO" />
					</form:select>
				</td>
			</tr>
			<c:forEach  begin="0" end="4" varStatus="status">				
					<tr id="group${status.count }" class="group last">
						<th>담당자 정보</th>
						<td colspan="3">
						<label>부서 : <form:input path="manager_dept${status.count}" maxlength="20" size="20" cssclass="text" readonly="true"/></label>
						<label>이름 : <form:input path="manager_name${status.count}" maxlength="10" size="10" cssclass="text" readonly="true"/></label>
						<label>전화번호 : <form:input path="manager_phone${status.count}" maxlength="13" size="13" cssclass="text" readonly="true"/></label>
						<form:hidden path="manager_idx"/>
						<a class="btn btn4 select-manager-btn${status.count}">담당자선택</a>
						<div id="dialog_manager${status.count}" class="dialog-common" title="담당자 선택"></div>
						<a href="javascript:void(0)" class="btn btn1" id="manager_delete${status.count}" onclick="delete_manager('${status.count}');"><span>삭제</span></a>
						<a href="javascript:void(0)" class="btn btn5" id="manager_add${status.count}" onclick="managerAdd('${status.count}');"><span>담당자추가</span></a>
					</tr>	
			</c:forEach>	
		</tbody>
	</table>
	</form:form>
	<c:if test="${menu.editMode eq 'MODIFY'}">
	<div class="button">
		<div class="left">
			<a href="#" class="btn btn3 preview-btn"><i class="fa fa-eye"></i><span>미리보기</span></a>
		</div>
		<div class="right">
			마지막 수정일 : <fmt:formatDate value="${menu.mod_date}" pattern="yyyy-MM-dd"/>
		</div>
	</div>
	</c:if>
	
	<br/><br/>
	
	<!-- 메뉴 트리 클릭하기 전에 보여줄 영역 여기부터 -->
	<div class="set-info">
		<strong>메뉴 설정 안내</strong>
		<ul>
			<li>메뉴별 상세설정 변경은 메뉴명을 클릭하여 오른쪽 화면에서 변경할 수 있습니다.</li>
			<li><span style="color:#2e9901;!important">메뉴를 편집한 후에 저장하기 버튼을 클릭해야 변경된 내용이 반영됩니다.</span></li>
			<li><span style="color:#2e9901;!important">홈페이지 속도를 위해 메뉴정보는 캐시로 관리되며 실제 반영까지 10분정도 소요될 수 있습니다.</span></li>
		</ul>
	</div>
	
		<div class="txt-center">
	<c:if test="${authC or authU}">
			<a href="" class="btn">취소</a>
	</c:if>
	<c:if test="${authC or authU}">
			<a href="" class="btn btn1" id="save">저장하기</a>
	</c:if>
		</div>
	<!-- 메뉴 트리 클릭하기 전에 보여줄 영역 여기까지 -->
	
	
</div>

