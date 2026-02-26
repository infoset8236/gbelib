<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!doctype html>
<html lang="ko">
	<head>
		<meta charset="utf-8" />
		<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
		<title>강좌신청</title>
		<meta content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=1" name="viewport" />
		<link href="/resources/ict/kioskVertical/css/font.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/kioskVertical/css/reset.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/kioskVertical/css/type_b/course_registration.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/kioskVertical/css/type_b/common.css" rel="stylesheet" type="text/css " />
		<link href="/resources/ict/common/css/modal.css" rel="stylesheet" type="text/css" />
		<script src="/resources/ict/common/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
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

			//	$('input#self_yn1').on('click', function() {
			//		var value = $(this).is(':checked') ? 'Y' : 'N';
			//		if ( value === 'Y' ) {
			//			$('#student_name').val($('#applicant_name').val());
			//			$('#student_name').prop('readonly', true);
			//			$('#student_birth').val($('#applicant_birth').val());
			//			$("#student_birth").datepicker('disable');
			//			$('input[name=student_sex].'+$('#applicant_sex').val()).prop('checked', true);
			//			$('input[name=student_sex]').prop('disabled', true);
			//			/* $('#student_sex').val($('#applicant_sex').val()); */
			//			$('#student_zipcode').val($('#applicant_zipcode').val());
			//			$('#student_zipcode').prop('readonly', true);
			//			$('#student_address').val($('#applicant_address').val());
			//			$('#student_address').prop('readonly', true);
			//			$('#student_address_detail').val($('#applicant_address_detail').val());
			//			$('#student_address_detail').prop('readonly', true);
			//		}
			//		else {
			//			$('#student_name').val('');
			//			$('#student_name').prop('readonly', false);
			//			$('#student_birth').val('');
			//			$("#student_birth").datepicker('enable');
			//			$('input[name=student_sex]').prop('disabled', false);
			//			$('input[name=student_sex]').prop('readonly', false);
			//			$('#student_zipcode').val('');
			//			$('#student_zipcode').prop('readonly', false);
			//			$('#student_address').val('');
			//			$('#student_address').prop('readonly', false);
			//			$('#student_address_detail').val('');
			//			$('#student_address_detail').prop('readonly', false);
			//		}
			//	});

				$('input[name=sex1]').on('change', function() {
					$('#applicant_sex').val($(this).val());
				});

				$('.confirm_apply').on('click', function() {
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
						doGetLoad('/${homepage.context_path}/ict/kiosk/vertical/teach.do');
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
        <div class="culture-wrap info" id="culture_wrap_apply">
            <div class="header">
                <p>Course REGISTRATION</p>
                <h1>강좌신청</h1>
            </div>
            <div class="contents">
                <div class="apply_wrap">
                 <c:forEach items="${termsList}" var="terms"> ${terms.contents } </c:forEach>
                    <div class="apply_info"><h3>신청자정보</h3></div>
                    <div class="app_line"></div>
                    <div class="apply_wrap_detail overflow-y">
                        <div class="apply_name">
                            <div class="name_label label_tag">성명</div>
                            <div class="name_input input_01">${memberInfo.USER_NAME}</div>
                            <form:hidden path="applicant_name" value="${memberInfo.USER_NAME}" readonly="true" />
                        </div>
                        <div class="apply_gender">
                            <div class="gender_label label_tag">성별</div>
                            <div class="app_choice_gender">
                                <c:choose>
                                    <c:when test="${memberInfo.SEX eq '0001'}">
                                        <div class="button gender_m active" style="pointer-events: none;">남</div>
                                        <div class="button gender_f" style="pointer-events: none;">여</div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="button gender_m" style="pointer-events: none;">남</div>
                                        <div class="button gender_f active" style="pointer-events: none;">여</div>
                                    </c:otherwise>
                                </c:choose>
                                <form:hidden path="applicant_sex" value="${memberInfo.SEX eq '0001'? 'M' : 'F'}" class="text" maxlength="6" readonly="true" />
                            </div>
                        </div>
                        <div class="apply_birth">
                            <div class="birth_label label_tag">생년월일</div>
                            <div class="birth_box">
                                <c:set value="${fn:substring(memberInfo.BIRTHD,0,4)}" var="birth1"></c:set>
                                <c:set value="${fn:substring(memberInfo.BIRTHD,4,6)}" var="birth2"></c:set>
                                <c:set value="${fn:substring(memberInfo.BIRTHD,6,8)}" var="birth3"></c:set>
                                <c:set value="${birth1}-${birth2}-${birth3}" var="birth"></c:set>
                                <div class="name_input input_01">${birth}</div>
                                <form:hidden path="applicant_birth" value="${birth}" class="text ui-calendar" readonly="true" title="생년월일" />
                            </div>
                        </div>
                        <div class="apply_phone">
                            <div class="phone_label label_tag">휴대전화번호</div>
                            <div class="birth_box">
                                <div class="phone_input input_03">${member.cell_phone1}</div>
                                <div class="line_m"></div>
                                <div class="phone_input input_03">${member.cell_phone2}</div>
                                <div class="line_m"></div>
                                <div class="phone_input input_03">${member.cell_phone3}</div>
                                <form:hidden path="applicant_cell_phone" />
                                <input type="hidden" id="applicant_cell_phone_1" class="text" maxlength="3" numberonly="true" value="${member.cell_phone1}" />
                                <input type="hidden" id="applicant_cell_phone_2" class="text" maxlength="4" numberonly="true" value="${member.cell_phone2}" />
                                <input type="hidden" id="applicant_cell_phone_3" class="text" maxlength="4" numberonly="true" value="${member.cell_phone3}" />
                            </div>
                        </div>

                        <div class="apply_address">
                            <div class="name_label label_tag">우편번호</div>
                            <div class="address_input input_04">
                                ${memberInfo.ZIP_CODE}
                                <form:hidden path="applicant_zipcode" value="${memberInfo.ZIP_CODE}" readonly="true" />
                            </div>
                        </div>
                        <div class="apply_address">
                            <div class="name_label label_tag">주소</div>
                            <div class="address_input input_05">${memberInfo.ADDRS}
                                <form:hidden path="applicant_address" value="${memberInfo.ADDRS}" readonly="true" />
                            </div>
                        </div>

                        <c:if test="${teach.agent_yn ne 'Y'}">
                            <c:if test="${teach.family_yn eq 'Y'}">
                                <div class="apply_name">
                                    <div class="name_label label_tag">보호자 관계</div>
                                    <form:input path="family_relation" cssClass="text name_input input_01" title="보호자 관계" />
                                </div>
                                <div class="apply_name">
                                    <div class="name_label label_tag">보호자 이름</div>
                                    <form:input path="family_name" cssClass="text name_input input_01" title="보호자 이름" />
                                </div>
                                <div class="apply_name">
                                    <div class="name_label label_tag">보호자 연락처</div>
                                    <div class="birth_box">
                                        <form:hidden path="family_cell_phone" cssClass="text" />
                                        <input id="family_cell_phone_1" class="text phone_input input_03" maxlength="3" numberonly="true" title="보호자 연락처 앞자리" />
                                        <div class="line_m"></div>
                                        <input id="family_cell_phone_2" class="text phone_input input_03" maxlength="4" numberonly="true" title="보호자 연락처 중간자리" />
                                        <div class="line_m"></div>
                                        <input id="family_cell_phone_3" class="text phone_input input_03" maxlength="4" numberonly="true" title="보호자 연락처 뒷자리" />
                                    </div>
                                    <div class="ui-state-highlight">
                                        <em>* ex) 010-1234-5678</em>
                                    </div>
                                </div>
                                <div class="apply_name">
                                    <div class="name_label label_tag">보호자 동의여부</div>
                                    <div class="pic_radio">
                                        <fieldset>
                                            <label class="radio_bx" for="agree03">
                                                <form:radiobutton path="family_confirm_yn" value="Y" cssStyle="vertical-align: middle;" title="동의" id="agree03" />
                                                <span class="on"></span>
                                                <p>동의</p>
                                            </label>
                                            <label class="radio_bx" for="agree04">
                                                <form:radiobutton path="family_confirm_yn" value="N" cssStyle="vertical-align: middle;" title="미동의" id="agree04" />
                                                <span class="on"></span>
                                                <p>미동의</p>
                                            </label>
                                        </fieldset>
                                    </div>
                                </div>
                                <div class="apply_name">
                                    <div class="name_label label_tag">비고</div>
                                    <form:input path="family_desc" cssClass="text name_input input_01" title="비고 창" />
                                </div>
                            </c:if>

                            <c:if test="${teach.family_count_yn eq 'Y'}">
                                <div class="apply_name">
                                    <div class="name_label label_tag">가족 인원 수</div>
                                    <form:input path="student_family_count" cssClass="text name_input input_01" numberOnly="true" title="가족인원수" />
                                </div>
                            </c:if>
                            <c:if test="${teach.school_info_yn eq 'Y'}">
                                <div class="apply_name">
                                    <div class="name_label label_tag">학교</div>
                                    <form:input path="student_school" cssClass="text name_input input_01" title="학교 입력" />
                                </div>
                            </c:if>
                            <c:if test="${teach.school_grade_yn eq 'Y'}">
                                <div class="apply_name">
                                    <div class="name_label label_tag">학년</div>
                                    <form:select path="student_hack" cssClass="selectmenu select_grade " title="학년 선택">
                                        <form:option value="0" label="--선택--"></form:option>
                                        <form:options items="${hakList}" itemValue="code_id" itemLabel="code_name" />
                                    </form:select>
                                </div>
                            </c:if>
                            <c:if test="${teach.remark_yn eq 'Y'}">
                                <div class="apply_name">
                                    <div class="name_label label_tag">비고</div>
                                    <form:input path="student_remark" cssClass="text" title="비고 창" />
                                </div>
                            </c:if>
                            <c:if test="${teach.neis_location_yn eq 'Y'}">
                                <div class="apply_name">
                                    <div class="name_label label_tag">지역(나이스)</div>
                                    <form:select path="student_location_code" cssClass="selectmenu select_address input_01" title="지역선택">
                                        <form:options items="${traingLocationList}" itemValue="code_id" itemLabel="code_name" />
                                    </form:select>
                                </div>
                            </c:if>
                            <c:if test="${teach.neis_cd_yn eq 'Y'}">
                                <div class="apply_name">
                                    <div class="name_label label_tag">개인번호(나이스)</div>
                                    <form:input path="student_neis_cd" cssClass="text name_input input_01" maxlength="10" title="개인번호입력" />
                                </div>
                            </c:if>
                            <c:if test="${teach.neis_training_num_yn eq 'Y'}">
                                <div class="apply_name">
                                    <div class="name_label label_tag">연수지명번호(나이스)</div>
                                    <form:input path="student_training_num" cssClass="textname_input input_01" maxlength="30" title="연수지명번호" />
                                </div>
                            </c:if>
                            <c:if test="${teach.organization_yn eq 'Y'}">
                                <div class="apply_name">
                                    <div class="name_label label_tag">기관</div>
                                    <form:input path="student_organization" cssClass="textname_input input_01" maxlength="40" title="기관" />
                                </div>
                            </c:if>
                            <c:if test="${teach.rank_yn eq 'Y'}">
                                <div class="apply_name">
                                    <div class="name_label label_tag">직급</div>
                                    <form:input path="student_rank" cssClass="text name_input input_01" maxlength="20" title="직급" />
                                </div>
                            </c:if>
                            <c:if test="${teach.course_taken_yn eq 'Y'}">
                                <div class="apply_sms">
                                    <div class="sms_label label_tag">
                                        <p>연수수강여부</p>

                                        <fieldset>
                                            <label class="radio_bx" for="agree01">
                                                <form:radiobutton path="student_course_taken_yn" value="Y" cssStyle="vertical-align: middle;" title="이수" id="agree01" />
                                                <span class="on"></span>
                                                <p>이수</p>
                                            </label>
                                            <label class="radio_bx" for="agree02">
                                                <form:radiobutton path="student_course_taken_yn" value="N" cssStyle="vertical-align: middle;" title="미이수" id="agree02" />
                                                <span class="on"></span>
                                                <p>미이수</p>
                                            </label>
                                        </fieldset>
                                    </div>
                                </div>
                            </c:if>
                        </c:if>

                        <div class="apply_name">
                            <div class="name_label label_tag">수강생 - 나이</div>
                            <input id="student_old" name="student_old" class="text name_input input_01" maxlength="3" numberOnly="true" title="수강생 나이" />
                        </div>

                        <div class="ui-state-error">* 신청자정보 변경 시 My Library > 회원정보 수정에서 수정후 신청하시기 바랍니다.</div>
                    </div>
                </div>

                <div class="apply_wrap">
				
                            <div class="apply_info"><h3>수강생정보</h3><div class="custom-checkbox"><input type="checkbox" name="self_yn" value="Y" id="self_yn1" />
                            <label for="self_yn1"></label><p>수강생 동일여부</p></div>
                         </div>
                            <div class="app_line"></div>
                    <div class="apply_wrap_detail overflow-y">
                        <c:if test="${teach.agent_yn eq 'Y'}">
                            <div class="apply_name">
                                <div class="name_label label_tag">성명</div>
                                <form:input path="student_name" cssClass="text name_input input_01" title="수강생 성명" />
                            </div>
							 <div class="apply_name">
                                <div class="name_label label_tag">성별</div>

                                <div class="app_choice_gender">
                                    <form:radiobutton id="ss1" path="student_sex" cssClass="custom-radio" value="M" checked="checked"/>
                                    <label for="ss1" class="button gender_m custom-radio-label">남</label>

                                    <form:radiobutton id="ss2" path="student_sex" cssClass="custom-radio" value="F" />
                                    <label for="ss2" class="button gender_f custom-radio-label">여</label>
                                </div>

                                <!--<form:radiobutton id="ss1" path="student_sex" cssClass="M " value="M" label="남" cssStyle="vertical-align: middle;" title="성별 남자" checked="checked"/>
							<form:radiobutton id="ss2" path="student_sex" cssClass="F" value="F" label="여" cssStyle="vertical-align: middle;" title="성별 여자"/>-->
                            </div>
                            <div class="apply_name">
                                <div class="name_label label_tag">생년월일</div>
                                <form:input path="student_birth" cssClass="text  name_input input_01" maxlength="10" title="생년월일 입력" placeholder="yyyy-mm-dd로 입력" />
                            </div>
                           
                            <c:if test="${teach.adress_yn eq 'Y'}">
                                <div class="apply_address">
                                    <div class="name_label label_tag">주소</div>
                                    <div class="address_box">
                                        <form:input path="student_zipcode" cssClass="text address_input input_04" title="우편번호" /><button class="btn btn2 findPostCode zipcord" keyValue1="#student_zipcode" keyValue2="#student_address" keyValue3="#student_address" title="새창열림">
                                            우편번호 찾기
                                        </button>
                                    </div>
                                    <form:input path="student_address" cssClass="text address_input input_05" maxlength="60" title="주소입력" />
                                </div>
                            </c:if>
                            <c:if test="${teach.family_yn eq 'Y'}">
                                <div class="apply_name">
                                    <div class="name_label label_tag">보호자 관계</div>
                                    <form:input path="family_relation" cssClass="text name_input input_01" />
                                </div>
                                <div class="apply_name">
                                    <div class="name_label label_tag">보호자 이름</div>
                                    <form:input path="family_name" cssClass="text name_input input_01" title="보호자 관계" />
                                </div>
                                <div class="apply_name">
                                    <div class="name_label label_tag">보호자 연락처</div>
                                    <div class="birth_box">
                                        <form:hidden path="family_cell_phone" cssClass="text" />
                                        <input id="family_cell_phone_1" class="text phone_input input_03" maxlength="3" numberonly="true" title="연락처 앞자리" class="phone_input input_03" />
                                        <div class="line_m"></div>
                                        <input id="family_cell_phone_2" class="text phone_input input_03" maxlength="4" numberonly="true" title="연락처 뒤자리" class="phone_input input_03" />
                                        <div class="line_m"></div>
                                        <input id="family_cell_phone_3" class="text phone_input input_03" maxlength="4" numberonly="true" title="연락처 끝자리" class="phone_input input_03" />
                                    </div>
                                    <div class="ui-state-highlight">
                                        <em>* ex) 010-1234-5678</em>
                                    </div>
                                </div>

                                <div class="apply_sms">
                                    <div class="sms_label label_tag">
                                        <p>보호자 동의여부</p>

                                        <fieldset>
                                            <label class="radio_bx" for="agree05">
                                                <form:radiobutton path="family_confirm_yn" value="Y" cssStyle="vertical-align: middle;" title="보호자 동의 " id="agree05" />
                                                <span class="on"></span>
                                                <p>동의</p>
                                            </label>
                                            <label class="radio_bx" for="agree06">
                                                <form:radiobutton path="family_confirm_yn" value="N" cssStyle="vertical-align: middle;" title="보호자 미동의" id="agree06" />
                                                <span class="on"></span>
                                                <p>미동의</p>
                                            </label>
                                        </fieldset>
                                    </div>
                                </div>
                                <div class="apply_name">
                                    <div class="name_label label_tag">비고</div>
                                    <form:input path="family_desc" cssClass="text name_input input_01" title="비고창" />
                                </div>
                            </c:if>
                            <c:if test="${teach.family_count_yn eq 'Y'}">
                                <div class="apply_name">
                                    <div class="name_label label_tag">가족 인원 수</div>
                                    <form:input path="student_family_count" cssClass="text name_input input_01" numberOnly="true" title="가족인원수" />
                                </div>
                            </c:if>
                            <c:if test="${teach.school_info_yn eq 'Y'}">
                                <div class="apply_name">
                                    <div class="name_label label_tag">학교</div>
                                    <form:input path="student_school" cssClass="text name_input input_01" title="학교 입력" />
                                </div>
                            </c:if>
                            <c:if test="${teach.school_grade_yn eq 'Y'}">
                                <div class="apply_name">
                                    <div class="name_label label_tag">학년</div>
                                    <form:select path="student_hack" cssClass="selectmenu select_grade name_input input_01" title="학년 선택">
                                        <form:option value="0" label="--선택--"></form:option>
                                        <form:options items="${hakList}" itemValue="code_id" itemLabel="code_name" />
                                    </form:select>
                                </div>
                            </c:if>
                            <c:if test="${teach.remark_yn eq 'Y'}">
                                <div class="apply_name">
                                    <div class="name_label label_tag">비고</div>
                                    <form:input path="student_remark" cssClass="text  name_input input_01" title="비고창" />
                                </div>
                            </c:if>
                            <c:if test="${teach.neis_location_yn eq 'Y'}">
                                <div class="apply_name">
                                    <div class="name_label label_tag">지역(나이스)</div>
                                    <form:select path="student_location_code" cssClass="selectmenu select_address  name_input input_01" title="지역 선택">
                                        <form:options items="${traingLocationList}" itemValue="code_id" itemLabel="code_name" />
                                    </form:select>
                                </div>
                            </c:if>
                            <c:if test="${teach.neis_cd_yn eq 'Y'}">
                                <div class="apply_name">
                                    <div class="name_label label_tag">개인번호(나이스)</div>
                                    <form:input path="student_neis_cd" cssClass="text  name_input input_01" maxlength="10" title="개인번호" />
                                </div>
                            </c:if>
                            <c:if test="${teach.neis_training_num_yn eq 'Y'}">
                                <div class="apply_name">
                                    <div class="name_label label_tag">연수지명번호(나이스)</div>
                                    <form:input path="student_training_num" cssClass="text name_input input_01" maxlength="60" title="연수지명번호" />
                                </div>
                            </c:if>
                            <c:if test="${teach.organization_yn eq 'Y'}">
                                <div class="apply_name">
                                    <div class="name_label label_tag">기관</div>
                                    <form:input path="student_organization" cssClass="text name_input input_01" maxlength="40" title="기관" />
                                </div>
                            </c:if>
                            <c:if test="${teach.rank_yn eq 'Y'}">
                                <div class="apply_name">
                                    <div class="name_label label_tag">직급</div>
                                    <form:input path="student_rank" cssClass="text name_input input_01" maxlength="20" title="직급" />
                                </div>
                            </c:if>
                            <c:if test="${teach.course_taken_yn eq 'Y'}">
                                <div class="apply_sms">
                                    <div class="sms_label label_tag">
                                        <p>연수수강여부</p>

                                        <fieldset>
                                            <label class="radio_bx" for="agree07">
                                                <form:radiobutton path="student_course_taken_yn" value="Y" title="연수수강여부 이수" id="agree07" />
                                                <span class="on"></span>
                                                <p>이수</p>
                                            </label>
                                            <label class="radio_bx" for="agree08">
                                                <form:radiobutton path="student_course_taken_yn" value="N" title="연수수강여부 미이수" id="agree08" />
                                                <span class="on"></span>
                                                <p>미이수</p>
                                            </label>
                                        </fieldset>
                                    </div>
                                </div>
                            </c:if>
                        </c:if>
                    </div>
                </div>
           <div class="apply_sms">
                        <div class="sms_label label_tag top_label">
                            <p>이용약관 및 개인정보의 수집·이용 동의 여부</p>

							<fieldset class="self_info">
							<label class="radio_bx" for="agree09">
							<form:radiobutton path="self_info_yn" value="Y" title="동의" id="agree09" />
								<span class="on"></span>
									<p>동의</p>
							</label>
							<label class="radio_bx" for="agree10">
							<form:radiobutton path="self_info_yn" value="N" title="미동의" id="agree10" />
								<span class="on"></span>
									<p>미동의</p>
							</label>
							</fieldset>								
                        </div>
                    </div>
                <div class="confirm_apply">확인</div>
            </div>
        </div>
    </form:form>

		<div class="popup_overlay" id="popup" style="display: none">
			<div class="popup_wrapper">
				<div class="popup_title">강좌신청</div>
				<div class="popup_content" id="popup_message"></div>
				<div class="close_btn close">확인</div>
			</div>
		</div>

		<jsp:include page="/WEB-INF/views/app/ict/typeB/kiosk/vertical/userNav.jsp" />

		<jsp:include page="/WEB-INF/views/app/ict/typeB/kiosk/vertical/nav.jsp" />
		<script>
			const radioButtons = document.querySelectorAll('.custom-radio');
			const labels = document.querySelectorAll('.custom-radio-label');

			labels.forEach(label => {
				label.addEventListener('click', function () {
					labels.forEach(lbl => lbl.classList.remove('active'));

					this.classList.add('active');

					const associatedRadio = document.getElementById(this.htmlFor);
					if (associatedRadio) {
						associatedRadio.checked = true;
					}
				});
			});
		</script>
	</body>
</html> 