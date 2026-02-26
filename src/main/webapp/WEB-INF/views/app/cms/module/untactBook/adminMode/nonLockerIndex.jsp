<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8"/>
<meta id="_csrf" name="_csrf" th:content=""/>
<meta id="_csrf_header" name="_csrf_header" th:content=""/>
<title>WBuilder - 더블유빌더</title>
<!--[if IE]>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<![endif]-->
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=10"/>
<link rel="icon" type="image/x-icon" href="/favicon.ico"/>
<link rel="stylesheet" type="text/css" href="https://www.gbelib.kr/resources/common/css/default.css"/>
<link rel="stylesheet" type="text/css" href="https://www.gbelib.kr/resources/common/css/fontawesome.min.css"/>
<link rel="stylesheet" type="text/css" href="https://www.gbelib.kr/resources/common/css/jquery-ui-1.12.0.min.css"/>
<link rel="stylesheet" type="text/css" href="https://www.gbelib.kr/resources/common/css/select2.min.css"/>
<link rel="stylesheet" type="text/css" href="https://www.gbelib.kr/resources/cms/survey/css/container.css"/>

<script type="text/javascript" src="https://www.gbelib.kr/resources/common/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://www.gbelib.kr/resources/common/js/jquery-ui-1.12.0.min.js"></script>
<script type="text/javascript" src="https://www.gbelib.kr/resources/common/js/jquery-ui-1.12.0-datepicker.min.js"></script>
<script type="text/javascript" src="https://www.gbelib.kr/resources/common/js/common.js"></script>
<script type="text/javascript" src="https://www.gbelib.kr/resources/cms/js/design.js"></script>

<script type="text/javascript">
$(function() {
	//검색버튼
	$('button#search_btn').on('click', function(e) {
		e.preventDefault();
		$('#viewPage').val(1);
		doGetLoad('index.do', $('form#untactBookReservation').serialize());
	});
	
	$('input#start_date').datepicker({
		dateFormat:'yy-mm-dd',
		maxDate: $('input#end_date').val(), 
		onClose: function(selectedDate){
			$('input#end_date').datepicker('option', 'minDate', selectedDate);
		}
	}).datepicker('setDate', '${untactBookReservation.start_date}');
	$('input#end_date').datepicker({
		dateFormat:'yy-mm-dd',
		minDate: $('input#start_date').val(), 
		onClose: function(selectedDate){
			$('input#start_date').datepicker('option', 'maxDate', selectedDate);
		}
	}).datepicker('setDate', '${untactBookReservation.end_date}');
	
	//엑셀저장
	$('a#excelDownload').on('click', function(e) {
		$('#untactBookReservation').attr('action', 'excelDownload.do').submit();
		$('#untactBookReservation').attr('action', 'index.do');
		e.preventDefault();
	});
});

//체크박스 전체선택
function checkAll($this) { 
	$('input:checkbox[name=request_number_arr]').prop('checked', $this.is(':checked'));
}

//진행상황 변경 버튼
function reservationStepChange(member_id, member_name, reservation_step, request_number, vLoca, vUserId, vAccNo, book_name, locker_number, locker_password, member_phone, $this) {
	
	var start_date = document.getElementById('start_date').value;
	var end_date = document.getElementById('end_date').value;
	
	var ajaxData = {
		'member_id' : member_id,
		'member_name' : member_name,
		'reservation_step' : reservation_step,
		'request_number' : request_number,
		'vLoca' : vLoca,
		'vUserId' : vUserId,
		'vAccNo' : vAccNo,
		'book_name' : book_name,
		'locker_number' : locker_number,
		'locker_password' : locker_password,
		'member_phone' : member_phone
	};
	
	if(confirm(reservation_step + ' 하시겠습니까?')) {
		$.ajax({
			type: "POST",
			url: 'modifyReservationStep.do?start_date=' + start_date + '&end_date='+end_date,
			data: ajaxData,
			success: function(response) {
				if(response.valid) {
					alert(reservation_step + ' 되었습니다.'); 
					location.reload();
				} else {
					alert(response.message);
				}
				location.reload();
			},
			error : function() {
				alert(reservation_step + ' 에 실패했습니다.\n\n관리자에게 문의해 주세요.');
			}
		});
	}
}

//취소버튼
function cancelSettingEdit(member_id, member_name, request_number, seqNo) {
	if(confirm(member_name + '(' + member_id + ')님의 신청을 취소하시겠습니까?')) {

		var ajaxData = {
			'member_id' : member_id,
			'member_name' : member_name,
			'request_number' : request_number,
			'seqNo' : seqNo
		};
	
		$.ajax({
			url: 'cancelSettingEdit.do',
			method: 'GET',
			data : ajaxData,
			success: function(html) { 
					modal_layer_add('dialog_layer');
					$('#dialog_layer').html(html);
					
					$('#dialog_layer').dialog({ //모달창 기본 스크립트 선언
						resizable: false,
						modal: true,
						title: '신청 취소',
						open: function(){
							$('.ui-widget-overlay').addClass('custom-overlay');
						},
						close: function(){
						},
						buttons: [
							{
								text : '저장',
								'class' : 'btn btn1',
								click : function() {
									cancelSettingSave();
								}
							},
							{
								text: "취소",
								"class": 'btn btn_round btn_gray',
								click: function() {
									$(this).dialog('close');
								}
							}
						]
					});

					$("#dialog_layer").dialog({ //개별 모달창 띄울 시 선택자 선언 및 크기 값 설정
						width: 600,
						height: 300
					});
			},error: function(html) {
			}
		});
	}
}

//패널티버튼
function blackListSettingEdit(member_id, member_name, request_number) {
	if(confirm(member_name + '(' + member_id + ')님에 패널티를 부여하시겠습니까?')) {

		var ajaxData = {
			'member_id' : member_id,
			'member_name' : member_name,
			'request_number' : request_number
		};
	
		$.ajax({
			url: 'blackListSettingEdit.do',
			method: 'GET',
			data : ajaxData,
			success: function(html) { 
				if(html == 'penaltyFalse') {
					alert(member_name + '(' + member_id + ')님은 이미 페널티가 부여되었습니다.\n\n패널티 부여는 한 아이디당 하루에 한번만 가능합니다.');
				} else {
					modal_layer_add('dialog_layer');
					$('#dialog_layer').html(html);
					
					$('#dialog_layer').dialog({ //모달창 기본 스크립트 선언
						resizable: false,
						modal: true,
						title: '패널티 부여',
						open: function(){
							$('.ui-widget-overlay').addClass('custom-overlay');
						},
						close: function(){
						},
						buttons: [
							{
								text : '패널티부여',
								'class' : 'btn btn1',
								click : function() {
									blackListSettingSave();
								}
							},
							{
								text: "취소",
								"class": 'btn btn_round btn_gray',
								click: function() {
									$(this).dialog('close');
								}
							}
						]
					});

					$("#dialog_layer").dialog({ //개별 모달창 띄울 시 선택자 선언 및 크기 값 설정
						width: 600,
						height: 250
					});
				}
			},error: function(html) {
			}
		});
		
	}
	
}

//회원정보상세보기
function untactBookMemberDetail(member_id, member_name, request_number) {

	var ajaxData = {
		'member_id' : member_id,
		'member_name' : member_name,
		'request_number' : request_number
	};

	$.ajax({
		url: 'untactBookMemberDetail.do',
		method: 'GET',
		data : ajaxData,
		success: function(html) { 
				modal_layer_add('dialog_layer');
				$('#dialog_layer').html(html);
				
				$('#dialog_layer').dialog({ //모달창 기본 스크립트 선언
					resizable: false,
					modal: true,
					title: '비대면 도서대출 회원 기본 정보',
					open: function(){
						$('.ui-widget-overlay').addClass('custom-overlay');
					},
					close: function(){
					},
					buttons: [
						{
							text: "닫기",
							"class": 'btn btn_round btn_gray',
							click: function() {
								$(this).dialog('close');
							}
						}
					]
				});

				$("#dialog_layer").dialog({ //개별 모달창 띄울 시 선택자 선언 및 크기 값 설정
					width: 1000,
					height: 200
				});
		},error: function(html) {
		}
	});
}

//전체 대출 버튼
function receiptReservationStep() {
	var start_date = document.getElementById('start_date').value;
	var end_date = document.getElementById('end_date').value;
	
	if($('input:checkbox[name=request_number_arr]:checked').length < 1) {
		alert('대출할 아이디를 선택해 주세요.');
	} else {
		if(confirm('대출 하시겠습니까?')) {
			$.ajax({
				type: "POST",
				url: 'modifyReservationStepAll.do?start_date=' + start_date + '&end_date='+end_date,
				data: $('input[name=request_number_arr]').serialize(),
				success: function(response) {
					if(response.valid) {
						alert('대출 되었습니다.');
						location.reload();
					} else {
						alert(response.message);
					}
					location.reload();
				},
				error : function() {
					alert('대출에 실패했습니다.\n관리자에게 문의해 주세요.');
				}
			});
		} 
	}
}

//비밀번호 랜덤생성 버튼
function randomPassword(passwordCount, nonPasswordCount) {
	var start_date = document.getElementById('start_date').value;
	var end_date = document.getElementById('end_date').value;
	
	if(confirm('비밀번호를 생성하시겠습니까?')) {
		var ajaxData = {
				'passwordCount' : passwordCount,
				'nonPasswordCount' : nonPasswordCount
		};
		
		$.ajax({
			type: "POST",
			url: 'randomPassword.do?start_date=' + start_date + '&end_date='+end_date,
			success: function(html) {
				if(html == 'nonPasswordCheck') {
					alert('비밀번호를 생성할수 없습니다. \n\n사물함 신청내역이 있을 시에 비밀번호 생성이 가능합니다.');
				}else if(html == 'passwordCheck') {
					alert(passwordCount + '개 모두 이미 비밀번호가 생성되었습니다.');
				} else {
				alert('전체 ' + passwordCount + '개 중 \n\n 비밀번호 생성이 안된' + nonPasswordCount + '개 비밀번호가 생성되었습니다.');
				location.reload();
				}
			},error: function(html) {
			}
		});
	}
}
</script>

<!--[if IE 7]>
<link rel="stylesheet" type="text/css" href="/resources/cms/css/fontawesome-ie7.min.css"/>
<![endif]-->
<!--[if lte IE 8]>
<link rel="stylesheet" type="text/css" href="/resources/cms/css/ie-old.css"/>
<![endif]-->
</head>
<body>
	<!--해당 화면만 대구 및 경북에 사용을 위해 스타일을 별도로 빼지 않음-->
<style>
	/*비대변관련 스타일*/
	.wrapper {overflow:hidden;}
	.wrapper.wrapper-white {padding:0;margin:0;}
	.untact-box tbody td {height:45px;line-height:45px;}
	a.btnuntact {border-radius:0;padding:7px 10px;}
</style>
<div id="wrap">
	<div id="container">
		<form:form id="untactBookReservation" modelAttribute="untactBookReservation" method="POST" action="index.do">
		<form:hidden id="homepage_id" path="homepage_id"/>
		<div class="wrapper wrapper-white">
			<div class="search txt-center" style="margin-top:25px;">
				<fieldset>
				신청일 : <form:input path="start_date" class="text ui-calendar"/> ~ <form:input path="end_date" class="text ui-calendar"/>
				<button id="searchBtn"><i class="fa fa-search"></i><span>검색</span></button>
				</fieldset>
			</div>	
				<div class="untact-box">
					<div class="ui-state-highlight">
						<em>* 패널티 부여는 비대면 블랙리스트관리에서 확인 하실수 있습니다.</em>
					</div>
					<c:if test="${untactBookSetting.password_yn eq 'Y'}">
						<div style="text-align:right;padding-top:10px;padding-bottom:10px;">
							<a href="javascript:void(0);" class="btn btn1 btnuntact" onclick="randomPassword('${passwordCount}', '${nonPasswordCount}');">비밀번호랜덤생성</a>
						</div>
					</c:if>
					<div class="table-wrap">
						<table class="type1 center">
							<thead>
								<tr>
									<th scope="col"><input type="checkbox" onchange="checkAll($(this));"></th>
									<th scope="col">번호</th>
									<th scope="col">신청자아이디</th>
									<th scope="col">대출번호</th>
									<th scope="col">신청자명</th>
									<th scope="col">신청일</th>
									<th scope="col">도서명</th>
									<c:if test="${untactBookSetting.password_yn eq 'Y'}">
									<th scope="col">비밀번호</th>
									</c:if>
									<th scope="col">관리</th>
									<th scope="col">상태</th>
								</tr>
							</thead>
							<tbody>
							<c:if test="${fn:length(untactBookReservationList) < 1}">
								<tr style="height:100%">
									<td colspan="10" style="background:#f8fafb;">비대면 사물함 신청내역이 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach var="i" varStatus="status" items="${untactBookReservationList}">
								<tr>
									<td>
										<c:if test="${i.reservation_step ne '대출'}">
											<form:checkbox path="request_number_arr" cssClass="request_idx" value="${i.request_number}"/>
										</c:if>
									</td>
									<td>${paging.listRowNum - status.index}</td>
									<td>${i.member_id}</td>
									<td>${i.vUserId}</td>
									<td>${i.member_name}</td>
									<td>${i.request_date}</td>
									<td>${i.book_name}</td>
									<c:if test="${untactBookSetting.password_yn eq 'Y'}">
									<td>
										<c:choose>
											<c:when test="${i.locker_password eq 0}">
											미등록
											</c:when>
											<c:otherwise>
											${i.locker_password}	
											</c:otherwise>
										</c:choose>
									</td>
									</c:if>
									<td>
									<div class="button">
										<a href="javascript:void(0);" id="setBook" class="btn btn1 btnuntact" onclick='reservationStepChange("${i.member_id}", "${i.member_name}", "대출", "${i.request_number}", "${i.vLoca}", "${i.vUserId}","${i.vAccNo}", "${i.book_name}", "${i.locker_number}", "${i.locker_password}", "${i.member_phone}", $(this));' ${i.reservation_step eq '접수'?'':' style="display:none;"'}>대출</a>
										<c:if test="${i.reservation_step ne '대출'}">
											<a href="javascript:void(0);" id="cancelBook" class="btn btnuntact" onclick="cancelSettingEdit('${i.member_id}', '${i.member_name}', '${i.request_number}', '${i.seqNo}');">취소</a>
										</c:if>
										<a href="javascript:void(0);" id="penaltyBook" class="btn btn5 btnuntact" onclick="blackListSettingEdit('${i.member_id}', '${i.member_name}', '${i.request_number}');">패널티부여</a>
										<a href="javascript:void(0);"  class="view-detail btn btn2 btnuntact" onclick="untactBookMemberDetail('${i.member_id}', '${i.member_name}', '${i.request_number}');">회원정보</a>
									</div>
									</td>
									<td>
										<span id="reservationStep">${i.reservation_step}</span>
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
					
					<div style="padding-top:10px;">
						<a href="javascript:void(0);" id="reservationAll" class="btn btn1 btnuntact" onclick="receiptReservationStep();">대출</a>
						<a href="javascript:void(0);" id="excelDownload" class="btn btn2 btnuntact">엑셀저장</a>
					</div>

					<div class="search txt-center" style="margin-top:25px;">
						<fieldset>
							<form:select path="search_type" cssClass="selectmenu">
								<form:option value="member_id">신청자아이디</form:option>
								<form:option value="reg_no">대출번호</form:option>
								<form:option value="member_name">신청자명</form:option>
								<form:option value="book_name">도서명</form:option>
							</form:select>
							<form:input path="search_text" cssClass="text" cssStyle="width:200px;"/>
							<button id="search_btn"><i class="fa fa-search"></i><span>검색</span></button>
						</fieldset>
					</div>
					
				</div>
			</div>
		</form:form>
	</div>
</div>
</body>
</html>	