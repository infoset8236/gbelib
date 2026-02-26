<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">
	<head>
      <meta charset="UTF-8" />
      <meta content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" name="viewport" />
      <meta content="ie=edge" http-equiv="X-UA-Compatible" />
      <link href="/resources/ict/kioskHorizon/css/reset.css" rel="stylesheet" type="text/css" />
      <link href="/resources/ict/kioskHorizon/css/type_a/course_registration.css" rel="stylesheet" type="text/css" />
      <link href="/resources/ict/kioskHorizon/css/type_a/common.css" rel="stylesheet" type="text/css" />
      <script src="/resources/ict/kioskHorizon/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
      <script src="/resources/ict/kioskHorizon/js/type_a/common.js" type="text/javascript"></script>
      <script src="/resources/ict/kioskHorizon/js/type_a/course_registration.js" type="text/javascript"></script>
      <title>강좌신청</title>
	</head>
	<body>

	<script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript">
		$(function() {
			$(document).ready(function () {
				$('#popup').hide();

				$('.close').on('click', function () {
					$('#popup').fadeOut();
				});

				$(window).on('click', function (e) {
					if ($(e.target).is('.popup_overlay')) {
						$('#popup').fadeOut();
					}
				});
			});
	$(document).ready(function () {
		$('input#self_yn1').on('click', function () {
			var value = $(this).is(':checked') ? 'Y' : 'N';

			if (value === 'Y') {
				var selectedGender = $('#applicant_sex').val(); 
				$('input[name="student_sex"]').each(function () {
					if ($(this).val() === selectedGender) {
						$(this).prop('checked', true); 
						$(this).next('label').addClass('active');
					}
					$(this).prop('disabled', true); 
					$(this).next('label').css('pointer-events', 'none'); 
				});

				
				$('#student_name').val($('#applicant_name').val()).prop('readonly', true);
				$('#student_birth').val($('#applicant_birth').val());
				$('#student_zipcode').val($('#applicant_zipcode').val()).prop('readonly', true);
				$('#student_address').val($('#applicant_address').val()).prop('readonly', true);
				$('#student_address_detail').val($('#applicant_address_detail').val()).prop('readonly', true);
				$('#student_birth').datepicker('disable');
			} else {
				
				$('input[name="student_sex"]').each(function () {
					$(this).prop('checked', false); 
					$(this).prop('disabled', false); 
					$(this).next('label').removeClass('active'); 
					$(this).next('label').css('pointer-events', 'auto'); 
				});

				
				$('#student_name').val('').prop('readonly', false);
				$('#student_birth').val('');
				$('#student_zipcode').val('').prop('readonly', false);
				$('#student_address').val('').prop('readonly', false);
				$('#student_address_detail').val('').prop('readonly', false);
				$('#student_birth').datepicker('enable');
			}
		});
	});

			$('input[name=sex1]').on('change', function() {
				$('#applicant_sex').val($(this).val());
			});

			$('.submit').on('click', function() {
				var $form = {};
				$form = $.extend(true, $form, $('#studentForm'));
				$form.find('input[name=applicant_sex]').prop('disabled', false);
				$form.find('input[name=student_sex]').prop('disabled', false);
				$form.find ("#applicant_birth").prop('disabled', false);
				$form.find ("#student_birth").prop('disabled', false);

				if ($("#student_birth").length > 0) {
					var selectedYear = $form.find ("#student_birth").val().split('-')[0];
					var currentYear = new Date().getUTCFullYear();
					$form.find('input#student_old').val((currentYear - selectedYear) + 1);
				} else {
					var selectedYear = $form.find ("#applicant_birth").val().split('-')[0];
					var currentYear = new Date().getUTCFullYear();
					$form.find('input#student_old').val((currentYear - selectedYear) + 1);
				}

				if ( $form.find ("#applicant_birth").val() == '--' ) {
					document.getElementById("popup_message").innerText = '신청자 생년월일이 입력되지 않았습니다. 회원정보 수정후 신청 해주세요.';
					$('#popup').fadeIn();
					return false;
				}

				if ( $form.find ("#student_birth").val() == '' ) {
					document.getElementById("popup_message").innerText = '수강생 생년월일이 입력되지 않았습니다.';
					$('#popup').fadeIn();
					return false;
				}

				if ( $form.find ("#student_birth").val() > 10) {
					document.getElementById("popup_message").innerText = '수강생 생년월일을 yyyy-mm-dd 형식으로 입력하여주세요.';
					$('#popup').fadeIn();
					return false;
				}

				if ( $form.find('#self_info_yn').val() != 'Y' ) {
					document.getElementById("popup_message").innerText = '이용약관 및 개인정보의 수집·이용 동의 하여야 신청이 가능합니다.';
					$('#popup').fadeIn();
					return false;
				}

				var cellPhone1 = $form.find('#applicant_cell_phone_1').val();
				if ( cellPhone1 == '' ) {
					document.getElementById("popup_message").innerText = '휴대전화번호를 입력해주세요.';
					$('#popup').fadeIn();
					return false;
				}
				var cellPhone2 = $form.find('#applicant_cell_phone_2').val();
				if ( cellPhone2 == '' ) {
					document.getElementById("popup_message").innerText = '휴대전화번호를 입력해주세요.';
					$('#popup').fadeIn();
					return false;
				}
				var cellPhone3 = $form.find('#applicant_cell_phone_3').val();
				if ( cellPhone3 == '' ) {
					document.getElementById("popup_message").innerText = '휴대전화번호를 입력해주세요.';
					$('#popup').fadeIn();
					return false;
				}

				<c:if test="${teach.school_info_yn eq 'Y'}">
				var schoolName = $form.find('#student_school').val();
				if ( schoolName == '' ) {
					document.getElementById("popup_message").innerText = '학교명을 입력해주세요.';
					$('#popup').fadeIn();
					return false;
				}
				</c:if>
				<c:if test="${teach.school_grade_yn eq 'Y'}">
				var schoolHak = $form.find('#student_hack option:selected').val();
				if ( schoolHak == '0' ) {
					document.getElementById("popup_message").innerText = '학년을 선택해주세요.';
					$('#popup').fadeIn();
					return false;
				}
				</c:if>

				$form.find('#applicant_cell_phone').val(cellPhone1+'-'+cellPhone2+'-'+cellPhone3);

				<c:if test="${teach.family_yn eq 'Y'}">
				cellPhone1 = $form.find('#family_cell_phone_1').val();
				if ( cellPhone1 == '' ) {
					document.getElementById("popup_message").innerText = '보호자 연락처를 입력해주세요.';
					$('#popup').fadeIn();
					return false;
				}
				cellPhone2 = $form.find('#family_cell_phone_2').val();
				if ( cellPhone2 == '' ) {
					document.getElementById("popup_message").innerText = '보호자 연락처를 입력해주세요.';
					$('#popup').fadeIn();
					return false;
				}
				cellPhone3 = $form.find('#family_cell_phone_3').val();
				if ( cellPhone3 == '' ) {
					document.getElementById("popup_message").innerText = '보호자 연락처를 입력해주세요.';
					$('#popup').fadeIn();
					return false;
				}

				$form.find('#family_cell_phone').val(cellPhone1+'-'+cellPhone2+'-'+cellPhone3);
				</c:if>

				if (doAjaxPost($form)) {
					doGetLoad('/${homepage.context_path}/ict/kiosk/horizon/teach.do');
				}
			});

			$('.findPostCode').on('click', function(e){
				e.preventDefault();
				var zipcodeInput 	= $(this).attr('keyValue1');
				var addressInput 	= $(this).attr('keyValue2');
				var focusInput 		= $(this).attr('keyValue3');
				daum.postcode.load(function() {
					new daum.Postcode({
						oncomplete: function(data) {
							var fullAddr = '';
							var extraAddr = '';

							if (data.userSelectedType === 'R') {
								fullAddr = data.roadAddress;
							} else {
								fullAddr = data.jibunAddress;
							}

							if(data.userSelectedType === 'R'){
								if(data.bname !== ''){
									extraAddr += data.bname;
								}
								if(data.buildingName !== ''){
									extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
								}
								fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
							}

							$(zipcodeInput).val(data.zonecode);
							$(addressInput).val(fullAddr);
							$(focusInput).focus();
						}
					}).open();
				});
			});

			$('button#back-btn').on('click', function() {
				history.back();
			});

			$('input#applicant_birth').datepicker({
				yearRange: 'c-70:c',
				maxDate:0,
				onClose: function(selectedDate){
					$('input#applicant_zipcode').focus();
				}
			});

			$("#applicant_birth").datepicker('disable');

		});
		$(document).on("keyup", "input:text[numberOnly]", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});
	</script>

<form:form id="studentForm" modelAttribute="student" method="post" action="teachSave.do" onsubmit="return false;">
        <form:hidden path="homepage_id" />
        <form:hidden path="large_category_idx" />
        <form:hidden path="group_idx" />
        <form:hidden path="category_idx" />
        <form:hidden path="teach_idx" />
        <form:hidden path="student_idx" />
        <form:hidden path="editMode" />
        <form:hidden path="apply_status" />
        <form:hidden path="member_key" />
    <div class="container">
        <div class="header_wrapper">
            <div class="header_caption caption_gray">COURSE REGISTRATION</div>
            <div class="header_title white">강좌신청</div>
        </div>

        <div class="content">
            <form class="form">
                <div class="form_title">신청자 정보</div>
                <div class="scroll">
                    <div class="form_first">
                        <div class="wrapper">
                            <label class="label" for="name">성명</label>
                            <input class="name" id="name" placeholder="성명을 입력해주세요" />
                        </div>
                        <div class="wrapper">
                            <label class="label">성별</label>
                            <div class="gender_wrapper">
                                <div class="gender gender_active">남</div>
                                <div class="gender">여</div>
                            </div>
                        </div>
                    </div>
                    <div class="form_second">
                        <div class="birth">
                            <label class="label" for="year">생년월일</label>
                            <div class="date_picker">
                                <div class="select_wrapper">
                                    <img alt="" src="/resources/ict/kioskHorizon/img/type_a/course_registration/arrow.svg" />
                                    <select class="birth_select" id="year" name="year">
                                        <option class="option" value=""></option>
                                    </select>
                                </div>
                                <div class="select_wrapper">
                                    <img alt="" src="/resources/ict/kioskHorizon/img/type_a/course_registration/arrow.svg" />
                                    <select class="birth_select" id="month" name="month">
                                        <option class="option" value=""></option>
                                    </select>
                                </div>
                                <div class="select_wrapper">
                                    <img alt="" src="/resources/ict/kioskHorizon/img/type_a/course_registration/arrow.svg" />
                                    <select class="birth_select" id="day" name="day">
                                        <option class="option" value=""></option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="phone">
                            <label class="label" for="phone1">휴대전화번호</label>
                            <div class="phone_input_wrapper">
                                <div class="input_wrapper">
                                    <input class="phone_input" id="phone1" name="" placeholder="010" type="number" />
                                </div>
                                <div class="input_wrapper">
                                    <input class="phone_input" id="phone2" name="" placeholder="0000" type="number" />
                                </div>
                                <div class="input_wrapper">
                                    <input class="phone_input" id="phone3" name="" placeholder="0000" type="number" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form_third">
                        <label class="label">SMS 수신 동의 여부</label>
                        <div class="radio_wrapper">
                            <div class="radio" id="sms_agree">
                                <img alt="" src="/resources/ict/kioskHorizon/img/type_a/course_registration/checked.svg" />
                                <div>동의</div>
                            </div>
                            <div class="radio" id="sms_disagree">
                                <img alt="" src="/resources/ict/kioskHorizon/img/type_a/course_registration/unchecked.svg" />
                                <div>미동의</div>
                            </div>
                        </div>
                    </div>
                    <div class="caption">
                        • 활용목적 : 도서관 강좌 및 각종행사 안내<br />
                        • 미동의 하여도 수강신청에 제한이 없음(단, 미동의할 경우 해당 강좌에 대한 안내를 받을 수 없음)
                    </div>
                    <div class="form_fourth">
                        <label class="label">사진촬영 동의 여부</label>
                        <div class="radio_wrapper">
                            <div class="radio" id="photo_agree">
                                <img alt="" src="/resources/ict/kioskHorizon/img/type_a/course_registration/checked.svg" />
                                <div>동의</div>
                            </div>
                            <div class="radio" id="photo_disagree">
                                <img alt="" src="/resources/ict/kioskHorizon/img/type_a/course_registration/unchecked.svg" />
                                <div>미동의</div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <div class="submit">확인</div>
        </div>

        <jsp:include page="/WEB-INF/views/app/ict/typeA/kiosk/horizon/userNav.jsp"/>

        <jsp:include page="/WEB-INF/views/app/ict/typeA/kiosk/horizon/nav.jsp"/>
    </div>
    </form:form>

	<div class="popup_overlay" id="popup" style="display: none">
		<div class="popup_wrapper">
			<div class="popup_title">강좌신청</div>
			<div class="popup_content" id="popup_message">
			</div>
			<div class="close_btn close">
				확인
			</div>
		</div>
	</div>

	</body>
</html>