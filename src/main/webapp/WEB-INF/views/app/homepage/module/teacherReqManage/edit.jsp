<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%--
<script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>
--%>
<script src="/resources/cms/js/malsup.jquery.form.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(function () {
	$('#full_adder').val($('#teacher_zipcode').val() + " " + $('#teacher_address').val());

	$('#save-btn').on('click', function() {
		jQuery.ajaxSettings.traditional = true;

		if ((isEmpty($('#t_edu00').val()) && isEmpty($('#t_edu01').val())) &&
			(isEmpty($('#t_edu10').val()) && isEmpty($('#t_edu11').val())&& isEmpty($('#t_edu12').val()) && $("#t_edu13").is(":checked") == false) &&
			(isEmpty($('#t_edu20').val()) && isEmpty($('#t_edu21').val()) && isEmpty($('#t_edu22').val()) && $("#t_edu23").is(":checked") == false) &&
			(isEmpty($('#t_edu30').val()) && isEmpty($('#t_edu31').val()))) {

			alert("고등학교, 대학교, 대학원, 기타 중 하나는 필수로 입력하여야 합니다.");

			//의문
			$('#t_edu00').focus();
			$('.education').css('border', 'solid 3px red');
			$('.education').on('change', function() {
				$(this).css('border', 'solid 1px #e5e8eb');
				$(this).css('border-right', 'none');
			});
			return;
		}


		if ($('#t_edu00').val() != "" || $('#t_edu01').val() != "") {
			if ($('#t_edu00').val() == "" && $('#t_edu01').val() != "") {
				alert("고등학교 -> 학교명을 입력해주세요.");
				$('#t_edu00').focus();
				$('#t_edu00').css('border-color', 'red');
    			$('#t_edu00').on('change', function() {
    				$(this).css('border-color', '');
    			});
				return;
			}

			if ($('#t_edu00').val() != "" && $('#t_edu01').val() == "")  {
				alert("고등학교 -> 수료(졸업)일을 입력해주세요.");
				$('#t_edu01').focus();
				$('#t_edu01').css('border-color', 'red');
    			$('#t_edu01').on('change', function() {
    				$(this).css('border-color', '');
    			});
				return;
			}

			if ($('#t_edu01').val() != "") {
				if ($('#t_edu01').val().length < 6) {
					alert("고등학교 -> 수료(졸업)일 날짜 형식이 잘못되었습니다. ex) YYYYMM");
					$('#t_edu01').focus();
					$('#t_edu01').css('border-color', 'red');
	    			$('#t_edu01').on('change', function() {
	    				$(this).css('border-color', '');
	    			});
					return;
				}
			}
		}

		if ($('#t_edu10').val() != "" || $('#t_edu11').val() != "" || $('#t_edu12').val() != "" || $("#t_edu13").is(":checked") != false) {

			if ($('#t_edu10').val() == ""){
				alert("대학교 -> 학교명을 입력해주세요.");
				$('#t_edu10').focus();
				$('#t_edu10').css('border-color', 'red');
    			$('#t_edu10').on('change', function() {
    				$(this).css('border-color', '');
    			});
				return;
			}

			if ($('#t_edu11').val() == "" ){
				alert("대학교 -> 수료(졸업)일을 입력해주세요.");
				$('#t_edu11').focus();
				$('#t_edu11').css('border-color', 'red');
    			$('#t_edu11').on('change', function() {
    				$(this).css('border-color', '');
    			});
				return;
			}

			if ($('#t_edu12').val() == "" ) {
				alert("대학교 -> 학과를 입력해주세요.");
				$('#t_edu12').focus();
				$('#t_edu12').css('border-color', 'red');
    			$('#t_edu12').on('change', function() {
    				$(this).css('border-color', '');
    			});
				return;
			}

			if ($("#t_edu13").is(":checked") == false && $("#t_edu14").is(":checked") == false && $("#t_edu15").is(":checked") == false) {
				alert("대학교 -> 학적사항을 입력해주세요.");
				$('#t_edu13').focus();
				$('.t_edu1').css('border', 'solid 3px red');
    			$('.t_edu1').on('change', function() {
    				$(this).css('border', 'solid 1px #e5e8eb');
    				$(this).css('border-right', 'none');
    			});

				return;
			}

			if ($('#t_edu11').val() != "") {
				if ($('#t_edu11').val().length < 6) {
					alert("대학교-> 수료(졸업)일 날짜 형식이 잘못되었습니다. ex) YYYYMM");
					$('#t_edu11').focus();
					$('#t_edu11').css('border-color', 'red');
	    			$('#t_edu11').on('change', function() {
	    				$(this).css('border-color', '');
	    			});
					return;
				}
			}

		}

		if ($('#t_edu20').val() != "" || $('#t_edu21').val() != "" || $('#t_edu22').val() != "" || $("#t_edu23").is(":checked") != false) {
			if ($('#t_edu20').val() == ""){
				alert("대학원 -> 학교명을 입력해주세요.");
				$('#t_edu20').focus();
				$('#t_edu20').css('border-color', 'red');
    			$('#t_edu20').on('change', function() {
    				$(this).css('border-color', '');
    			});
				return;
			}

			if ($('#t_edu21').val() == "" ){
				alert("대학원 -> 수료(졸업)일을 입력해주세요.");
				$('#t_edu21').focus();
				$('#t_edu21').css('border-color', 'red');
    			$('#t_edu21').on('change', function() {
    				$(this).css('border-color', '');
    			});
				return;
			}

			if ($('#t_edu22').val() == "" ) {
				alert("대학원 -> 학과를 입력해주세요.");
				$('#t_edu22').focus();
				$('#t_edu22').css('border-color', 'red');
    			$('#t_edu22').on('change', function() {
    				$(this).css('border-color', '');
    			});
				return;
			}

			if ($("#t_edu23").is(":checked") == false && $("#t_edu24").is(":checked") == false && $("#t_edu25").is(":checked") == false) {
				alert("대학원 -> 학적사항을 입력해주세요.");
				$('#t_edu23').focus();
				$('.t_edu2').css('border', 'solid 3px red');
    			$('.t_edu2').on('change', function() {
    				$(this).css('border', 'solid 1px #e5e8eb');
    				$(this).css('border-right', 'none');
    			});
				return;
			}

			if ($('#t_edu21').val() != "") {
				if ($('#t_edu21').val().length < 6) {
					alert("대학원 -> 수료(졸업)일 날짜 형식이 잘못되었습니다. ex) YYYYMM");
					$('#t_edu21').focus();
					$('#t_edu21').css('border-color', 'red');
	    			$('#t_edu21').on('change', function() {
	    				$(this).css('border-color', '');
	    			});
					return;
				}
			}
		}

		if ($('#t_edu30').val() != "" || $('#t_edu31').val() != "") {
			if ($('#t_edu30').val() == "" && $('#t_edu31').val() != "") {
				alert("기타 -> 학교명을 입력해주세요.");
				$('#t_edu30').focus();
				$('#t_edu30').css('border-color', 'red');
    			$('#t_edu30').on('change', function() {
    				$(this).css('border-color', '');
    			});
				return;
			}

			if ($('#t_edu30').val() != "" && $('#t_edu31').val() == "")  {
				alert("기타 -> 수료(졸업)일을 입력해주세요.");
				$('#t_edu31').focus();
				$('#t_edu31').css('border-color', 'red');
    			$('#t_edu31').on('change', function() {
    				$(this).css('border-color', '');
    			});
				return;
			}

			if ($('#t_edu31').val() != "") {
				if ($('#t_edu31').val().length < 6) {
					alert("기타 -> 수료(졸업)일 날짜 형식이 잘못되었습니다. ex) YYYYMM");
					$('#t_edu31').focus();
					$('#t_edu31').css('border-color', 'red');
	    			$('#t_edu31').on('change', function() {
	    				$(this).css('border-color', '');
	    			});
					return;
				}
			}
		}

		// 자격 면허 수상

		if ($('#t_cer00').val() != "" ||  $('#t_cer01').val() != "" || $('#t_cer02').val() != "") {
			if ($('#t_cer00').val() == "") {
				alert("자격·면허·수상 첫번째 취득년월일을 입력해주세요.");
				$('#t_cer00').focus();
				$('#t_cer00').css('border-color', 'red');
    			$('#t_cer00').on('change', function() {
    				$(this).css('border-color', '');
    			});
    			return;
			}

			if ($('#t_cer01').val() == "") {
				alert("자격·면허·수상 첫번째 내역을 입력해주세요.");
				$('#t_cer01').focus();
				$('#t_cer01').css('border-color', 'red');
    			$('#t_cer01').on('change', function() {
    				$(this).css('border-color', '');
    			});
    			return;
			}

			if ($('#t_cer02').val() == "") {
				alert("자격·면허·수상 첫번째 시행처를 입력해주세요.");
				$('#t_cer02').focus();
				$('#t_cer02').css('border-color', 'red');
    			$('#t_cer02').on('change', function() {
    				$(this).css('border-color', '');
    			});
    			return;
			}
		}
		if ($('#t_cer10').val() != "" ||  $('#t_cer11').val() != "" || $('#t_cer12').val() != "") {
			if ($('#t_cer10').val() == "") {
				alert("자격·면허·수상 두번째 취득년월일을 입력해주세요.");
				$('#t_cer10').focus();
				$('#t_cer10').css('border-color', 'red');
    			$('#t_cer10').on('change', function() {
    				$(this).css('border-color', '');
    			});
    			return;
			}

			if ($('#t_cer11').val() == "") {
				alert("자격·면허·수상 두번째 내역을 입력해주세요.");
				$('#t_cer11').focus();
				$('#t_cer11').css('border-color', 'red');
    			$('#t_cer11').on('change', function() {
    				$(this).css('border-color', '');
    			});
    			return;
			}

			if ($('#t_cer12').val() == "") {
				alert("자격·면허·수상 두번째 시행처를 입력해주세요.");
				$('#t_cer12').focus();
				$('#t_cer12').css('border-color', 'red');
    			$('#t_cer12').on('change', function() {
    				$(this).css('border-color', '');
    			});
    			return;
			}

		}
		if ($('#t_cer20').val() != "" ||  $('#t_cer21').val() != "" || $('#t_cer22').val() != "") {
			if ($('#t_cer20').val() == "") {
				alert("자격·면허·수상 세번째 취득년월일을 입력해주세요.");
				$('#t_cer20').focus();
				$('#t_cer20').css('border-color', 'red');
    			$('#t_cer20').on('change', function() {
    				$(this).css('border-color', '');
    			});
    			return;
			}

			if ($('#t_cer21').val() == "") {
				alert("자격·면허·수상 세번째 내역을 입력해주세요.");
				$('#t_cer21').focus();
				$('#t_cer21').css('border-color', 'red');
    			$('#t_cer21').on('change', function() {
    				$(this).css('border-color', '');
    			});
    			return;
			}

			if ($('#t_cer22').val() == "") {
				alert("자격·면허·수상 세번째 시행처를 입력해주세요.");
				$('#t_cer22').focus();
				$('#t_cer22').css('border-color', 'red');
    			$('#t_cer22').on('change', function() {
    				$(this).css('border-color', '');
    			});
    			return;
			}
		}
		if ($('#t_cer30').val() != "" ||  $('#t_cer31').val() != "" || $('#t_cer32').val() != "") {
			if ($('#t_cer30').val() == "") {
				alert("자격·면허·수상 네번째 취득년월일을 입력해주세요.");
				$('#t_cer30').focus();
				$('#t_cer30').css('border-color', 'red');
    			$('#t_cer30').on('change', function() {
    				$(this).css('border-color', '');
    			});
    			return;
			}

			if ($('#t_cer31').val() == "") {
				alert("자격·면허·수상 네번째 내역을 입력해주세요.");
				$('#t_cer31').focus();
				$('#t_cer31').css('border-color', 'red');
    			$('#t_cer31').on('change', function() {
    				$(this).css('border-color', '');
    			});
    			return;
			}

			if ($('#t_cer32').val() == "") {
				alert("자격·면허·수상 네번째 시행처를 입력해주세요.");
				$('#t_cer32').focus();
				$('#t_cer32').css('border-color', 'red');
    			$('#t_cer32').on('change', function() {
    				$(this).css('border-color', '');
    			});
    			return;
			}
		}

		// 강의 계획
		if ($('#t_exp00').val() != "" ||  $('#t_exp01').val() != "" || $('#t_exp02').val() != "" || $('#t_exp03').val() != "" || $('#t_exp04').val() != "") {
			if ($('#t_exp00').val() == "") {
				alert("강의경력 첫번째 근무기간 시작날짜를 입력해주세요.");
				$('#t_exp00').focus();
				$('#t_exp00').css('border-color', 'red');
    			$('#t_exp00').on('change', function() {
    				$(this).css('border-color', '');
    			});
    			return;
			}

			if ($('#t_exp01').val() == "") {
				alert("강의경력 첫번째 근무기간 종료날짜를 입력해주세요.");
				$('#t_exp01').focus();
				$('#t_exp01').css('border-color', 'red');
    			$('#t_exp01').on('change', function() {
    				$(this).css('border-color', '');
    			});
    			return;
			}

			if ($('#t_exp02').val() == "") {
				alert("강의경력 첫번째 근무처를 입력해주세요.");
				$('#t_exp02').focus();
				$('#t_exp02').css('border-color', 'red');
    			$('#t_exp02').on('change', function() {
    				$(this).css('border-color', '');
    			});
    			return;
			}

			if ($('#t_exp03').val() == "") {
				alert("강의경력 첫번째 직위를 입력해주세요.");
				$('#t_exp03').focus();
				$('#t_exp03').css('border-color', 'red');
    			$('#t_exp03').on('change', function() {
    				$(this).css('border-color', '');
    			});
    			return;
			}

			if ($('#t_exp04').val() == "") {
				alert("강의경력 첫번째 주요업무를 입력해주세요.");
				$('#t_exp04').focus();
				$('#t_exp04').css('border-color', 'red');
    			$('#t_exp04').on('change', function() {
    				$(this).css('border-color', '');
    			});
    			return;
			}

			if ($('#t_exp00').val() != "") {
				if ($('#t_exp00').val().length < 6) {
					alert("강의경력 첫번째 근무기간 시작날짜 형식이 잘못되었습니다. ex) YYYYMM");
					$('#t_exp00').focus();
					$('#t_exp00').css('border-color', 'red');
	    			$('#t_exp00').on('change', function() {
	    				$(this).css('border-color', '');
	    			});
					return;
				}
			}

			if ($('#t_exp01').val() != "") {
				if ($('#t_exp01').val().length < 6) {
					alert("강의경력 첫번째 근무기간 종료날짜 형식이 잘못되었습니다. ex) YYYYMM");
					$('#t_exp01').focus();
					$('#t_exp01').css('border-color', 'red');
	    			$('#t_exp01').on('change', function() {
	    				$(this).css('border-color', '');
	    			});
					return;
				}
			}
		}

		if ($('#t_exp10').val() != "" ||  $('#t_exp11').val() != "" || $('#t_exp12').val() != "" || $('#t_exp13').val() != "" || $('#t_exp14').val() != "") {
			if ($('#t_exp10').val() == "") {
				alert("강의경력 두번째 근무기간 시작날짜를 입력해주세요.");
				$('#t_exp10').focus();
				$('#t_exp10').css('border-color', 'red');
    			$('#t_exp10').on('change', function() {
    				$(this).css('border-color', '');
    			});
    			return;
			}

			if ($('#t_exp11').val() == "") {
				alert("강의경력 두번째 근무기간 종료날짜를 입력해주세요.");
				$('#t_exp11').focus();
				$('#t_exp11').css('border-color', 'red');
    			$('#t_exp11').on('change', function() {
    				$(this).css('border-color', '');
    			});
    			return;
			}

			if ($('#t_exp12').val() == "") {
				alert("강의경력 두번째 근무처를 입력해주세요.");
				$('#t_exp12').focus();
				$('#t_exp12').css('border-color', 'red');
    			$('#t_exp12').on('change', function() {
    				$(this).css('border-color', '');
    			});
    			return;
			}

			if ($('#t_exp13').val() == "") {
				alert("강의경력 두번째 직위를 입력해주세요.");
				$('#t_exp13').focus();
				$('#t_exp13').css('border-color', 'red');
    			$('#t_exp13').on('change', function() {
    				$(this).css('border-color', '');
    			});
    			return;
			}

			if ($('#t_exp14').val() == "") {
				alert("강의경력 두번째 주요업무를 입력해주세요.");
				$('#t_exp14').focus();
				$('#t_exp14').css('border-color', 'red');
    			$('#t_exp14').on('change', function() {
    				$(this).css('border-color', '');
    			});
    			return;
			}

			if ($('#t_exp10').val() != "") {
				if ($('#t_exp10').val().length < 6) {
					alert("강의경력 두번째 근무기간 시작날짜 형식이 잘못되었습니다. ex) YYYYMM");
					$('#t_exp10').focus();
					$('#t_exp10').css('border-color', 'red');
	    			$('#t_exp10').on('change', function() {
	    				$(this).css('border-color', '');
	    			});
					return;
				}
			}

			if ($('#t_exp11').val() != "") {
				if ($('#t_exp11').val().length < 6) {
					alert("강의경력 두번째 근무기간 종료날짜 형식이 잘못되었습니다. ex) YYYYMM");
					$('#t_exp11').focus();
					$('#t_exp11').css('border-color', 'red');
	    			$('#t_exp11').on('change', function() {
	    				$(this).css('border-color', '');
	    			});
					return;
				}
			}

		}


		if ($('#t_exp20').val() != "" ||  $('#t_exp21').val() != "" || $('#t_exp22').val() != "" || $('#t_exp23').val() != "" || $('#t_exp24').val() != "") {
			if ($('#t_exp20').val() == "") {
				alert("강의경력 세번재 근무기간 시작날짜를 입력해주세요.");
				$('#t_exp20').focus();
				$('#t_exp20').css('border-color', 'red');
    			$('#t_exp20').on('change', function() {
    				$(this).css('border-color', '');
    			});
    			return;
			}

			if ($('#t_exp21').val() == "") {
				alert("강의경력 세번째 근무기간 종료날짜를 입력해주세요.");
				$('#t_exp21').focus();
				$('#t_exp21').css('border-color', 'red');
    			$('#t_exp21').on('change', function() {
    				$(this).css('border-color', '');
    			});
    			return;
			}

			if ($('#t_exp22').val() == "") {
				alert("강의경력 세번째 근무처를 입력해주세요.");
				$('#t_exp22').focus();
				$('#t_exp22').css('border-color', 'red');
    			$('#t_exp22').on('change', function() {
    				$(this).css('border-color', '');
    			});
    			return;
			}

			if ($('#t_exp23').val() == "") {
				alert("강의경력 세번째 직위를 입력해주세요.");
				$('#t_exp23').focus();
				$('#t_exp23').css('border-color', 'red');
    			$('#t_exp23').on('change', function() {
    				$(this).css('border-color', '');
    			});
    			return;
			}

			if ($('#t_exp24').val() == "") {
				alert("강의경력 세번째 주요업무를 입력해주세요.");
				$('#t_exp24').focus();
				$('#t_exp24').css('border-color', 'red');
    			$('#t_exp24').on('change', function() {
    				$(this).css('border-color', '');
    			});
    			return;
			}

			if ($('#t_exp20').val() != "") {
				if ($('#t_exp20').val().length < 6) {
					alert("강의경력 세번째 근무기간 시작날짜 형식이 잘못되었습니다. ex) YYYYMM");
					$('#t_exp20').focus();
					$('#t_exp20').css('border-color', 'red');
	    			$('#t_exp20').on('change', function() {
	    				$(this).css('border-color', '');
	    			});
					return;
				}
			}

			if ($('#t_exp21').val() != "") {
				if ($('#t_exp21').val().length < 6) {
					alert("강의경력 세번째 근무기간 종료날짜 형식이 잘못되었습니다. ex) YYYYMM");
					$('#t_exp21').focus();
					$('#t_exp21').css('border-color', 'red');
	    			$('#t_exp21').on('change', function() {
	    				$(this).css('border-color', '');
	    			});
					return;
				}
			}
		}


		if ($('#t_exp30').val() != "" ||  $('#t_exp31').val() != "" || $('#t_exp32').val() != "" || $('#t_exp33').val() != "" || $('#t_exp34').val() != "") {
			if ($('#t_exp30').val() == "") {
				alert("강의경력 네번째 근무기간 시작날짜를 입력해주세요.");
				$('#t_exp30').focus();
				$('#t_exp30').css('border-color', 'red');
    			$('#t_exp30').on('change', function() {
    				$(this).css('border-color', '');
    			});
    			return;
			}

			if ($('#t_exp31').val() == "") {
				alert("강의경력 네번째 근무기간 종료날짜를 입력해주세요.");
				$('#t_exp31').focus();
				$('#t_exp31').css('border-color', 'red');
    			$('#t_exp31').on('change', function() {
    				$(this).css('border-color', '');
    			});
    			return;
			}

			if ($('#t_exp32').val() == "") {
				alert("강의경력 네번째 근무처를 입력해주세요.");
				$('#t_exp32').focus();
				$('#t_exp32').css('border-color', 'red');
    			$('#t_exp32').on('change', function() {
    				$(this).css('border-color', '');
    			});
    			return;
			}

			if ($('#t_exp33').val() == "") {
				alert("강의경력 네번째 직위를 입력해주세요.");
				$('#t_exp33').focus();
				$('#t_exp33').css('border-color', 'red');
    			$('#t_exp33').on('change', function() {
    				$(this).css('border-color', '');
    			});
    			return;
			}

			if ($('#t_exp34').val() == "") {
				alert("강의경력 네번재 주요업무를 입력해주세요.");
				$('#t_exp34').focus();
				$('#t_exp34').css('border-color', 'red');
    			$('#t_exp34').on('change', function() {
    				$(this).css('border-color', '');
    			});
    			return;
			}

			if ($('#t_exp30').val() != "") {
				if ($('#t_exp30').val().length < 6) {
					alert("강의경력 네번째 근무기간 시작날짜 형식이 잘못되었습니다. ex) YYYYMM");
					$('#t_exp30').focus();
					$('#t_exp30').css('border-color', 'red');
	    			$('#t_exp30').on('change', function() {
	    				$(this).css('border-color', '');
	    			});
					return;
				}
			}

			if ($('#t_exp31').val() != "") {
				if ($('#t_exp31').val().length < 6) {
					alert("강의경력 네번째 근무기간 종료날짜 형식이 잘못되었습니다. ex) YYYYMM");
					$('#t_exp31').focus();
					$('#t_exp31').css('border-color', 'red');
	    			$('#t_exp31').on('change', function() {
	    				$(this).css('border-color', '');
	    			});
					return;
				}
			}
		}

		$('input[type=file]').each(function(i) {
			if($(this).val() == '') {
				$(this).remove();
			}
		});

		$('#teacher_education').val(inputs2json('t_edu'));
		$('#teacher_experience').val(inputs2json('t_exp'));
		$('#teacher_certifications').val(inputs2json('t_cer'));

		var option = {
			type: 'POST',
			url: 'save.do',
			success: function (response) {
				if (response.valid) {
					if (response.message != null && response.message.replace(/\s/g, '').length != 0) {
						alert(response.message);
					}
					if (response.reload) {
						location.reload();
					}
					if (response.targetOpener) {
						window.open(response.url, '', 'width=500,height=510');
						return false;
					}
					if (response.url != null && response.url.replace(/\s/g, '').length != 0) {
						doGetLoad(response.url, response.data);
					}
				} else {
					if (response.message != null && response.message.replace(/\s/g, '').length != 0) {
						alert(response.message);
					} else {
						if (response.result != null && response.result.length > 0) {
							for (var i = 0; i < response.result.length; i++) {
								alert(response.result[i].code);
								$('#' + response.result[i].field).focus();
								$('#' + response.result[i].field).css('border-color', 'red');
								$('#' + response.result[i].field).on('change', function () {
									$(this).css('border-color', '');
								});
								break;
							}
						}
					}

					if (response.url != null && response.url.replace(/\s/g, '').length != 0) {
						if (ajaxBody != null && ajaxBody.replace(/\s/g, '').length != 0) {
							doAjaxLoad(ajaxBody, response.url, response.data);
						} else {
							doGetLoad(response.url, response.data);
						}
					}
				}
			},
			error: function (jqXHR, textStatus, errorThrown) {
				alert('[' + textStatus + ']관리자에게 문의하세요. : ' + errorThrown);
			},
			complete: function (response) {   // 정상이든 비정상인든 실행이 완료될 경우 실행될 함수

				if ($('#open_file1').length == 0) {
					$('.fileTd').append('<input type="file" id="open_file1" name="open_file" class="text" title="파일선택" />');
					return;
				}

			}

		}

		$('#teacherForm').ajaxSubmit(option);
	});
	
	$('#back-btn').on('click', function() {
		history.back();
	});
	
	$('#cell_phone1').keypress(function (event) { if (event.which && (event.which <= 47 || event.which >= 58) && event.which != 8) { event.preventDefault(); } });
	
	$('input.ui-calendar').each(function(i) {
		if($(this).data('datepicker') == null) {
			$(this).datepicker({
					yearRange: 'c-80:c',
					maxDate:0 });
		}
	});
	
	<c:if test="${teacher.editMode eq 'MODIFY' }">
	json2inputs('#teacher_education', '학력을 불러오는 도중에 오류가 발생했습니다.');
	json2inputs('#teacher_experience', '경력사항을 불러오는 도중에 오류가 발생했습니다.');
	json2inputs('#teacher_certifications', '자격 및 면허를 불러오는 도중에 오류가 발생했습니다.');

	try {
		var json_teacher_open_files = JSON.parse($('#teacher_open_files').val());
		for(var i=0; i < json_teacher_open_files.length; ++i) {
			var file = json_teacher_open_files[i];
			$('#td_teacher_open_files').append('<a href="/cms/module/teacherReqManage/download2/${teacher.homepage_id}/${teacher.teacher_idx}/' + file.file_hash + '.do"><i class="fa fa-floppy-o"></i> ' + file.file_name + '.' + file.file_extension + '</a><br>');
		}
	} catch(e) {

	}
	</c:if>
	
});

function isEmpty(value){ 
	if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){ 
		return true 
	}else{ 
		return false 
	} 
};

function inputs2json(prefix) {
	var assoc = {};
	$('input[id^="'+prefix+'"]').each(function(i) {
		var id = $(this).attr('id');
		var val = $(this).val();
		if(id != 'prefix') {
			var type = $(this).prop('type');
			if(type == 'checkbox' || type == 'radio') {
				if($(this).prop('checked') == true) {
					assoc[id] = val;
				}
			} else {
				assoc[id] = val;
			}
		}

	});

	return JSON.stringify(assoc);
}

function json2inputs(selector, msg) {
	var json = $(selector).val();

	if(!!json) {
		var assoc = '';
		try {
			assoc = JSON.parse(json);
		} catch(e) {
			alert(msg);
			return;
		}
		for (var id in assoc) {
			var input = $('#'+id);
			input.val(assoc[id]);
			if(assoc[id] != '' && (input.prop('type') == 'checkbox' || input.prop('type') == 'radio')) {
				input.prop('checked', true);
			}
		}
	}
}

function onlyNumber(event){
    event = event || window.event;
    var keyID = (event.which) ? event.which : event.keyCode;
    if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 9 || keyID == 46 || keyID == 37 || keyID == 39 ) 
        return;
    else
        return false;
}
 
function removeChar(event) {
    event = event || window.event;
    var keyID = (event.which) ? event.which : event.keyCode;
    if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
        return;
    else
        event.target.value = event.target.value.replace(/[^0-9]/g, "");
}

document.addEventListener("DOMContentLoaded", function () {

    const allAgree = document.getElementById("allAgree");
    const form = document.getElementById("agreeForm");


    // 전체동의 클릭
    allAgree.addEventListener("change", function () {

        if (this.checked) {

            document.querySelectorAll('.agreeChk input[value="yes"]').forEach(el => {
                el.checked = true;
            });

        } else {

            document.querySelectorAll('.agreeChk input[value="no"]').forEach(el => {
                el.checked = true;
            });

        }

    });


    // 개별 선택 변경 시 전체동의 자동 체크
    document.querySelectorAll('.agreeChk input').forEach(el => {

        el.addEventListener("change", function () {

            const total = document.querySelectorAll('.agreeChk').length;
            const agreed = document.querySelectorAll('.agreeChk input[value="yes"]:checked').length;

            allAgree.checked = (total === agreed);

        });

    });


    // 제출 시 필수 체크
    form.addEventListener("submit", function (e) {

        const requiredList = document.querySelectorAll('.requiredAgree');

        let isAgree = true;

        requiredList.forEach(el => {

            const name = el.name;
            const checked = document.querySelector(`input[name="${name}"]:checked`).value;

            if (checked !== "yes") {
                isAgree = false;
            }

        });

        if (!isAgree) {

            alert("필수 개인정보 수집 및 이용에 모두 동의해야 합니다.");
            e.preventDefault();

        }

    });

});

</script>
<style>
	.Box {padding:20px; overflow: auto;border: 1px solid #ccc;background: #f3f3f3;color: #666; margin: 0 0 10px;}
    .agreeBox{
        display: flex;
        justify-content: space-between;
        margin: 10px 0 30px 0;
    }
    .allAgreeBox{
        text-align: center;
        margin: 30px 0;
        font-size: 18px;
        font-weight: 600;
    }

    .agreeChk input {
        display: none;
    }

    .agreeChk span {
        position: relative;
        padding-left: 26px;
        cursor: pointer;
    }

    .agreeChk span::before {
        content: "";
        position: absolute;
        left: 7px;
        top: 5px;
        width: 10px;
        height: 10px;
        border: 2px solid #666;
        border-radius: 3px;
    }

    .agreeChk span::after{
        content: "";
        position: absolute;
        left: 10px;
        top: 7px;
        width: 6px;
        height: 4px;
        border: 2px solid #fff;
        border-top: none;
        border-right: none;
        transform: rotate(-45deg);
    }

    /* 체크 상태 */
    .agreeChk input:checked + span::before{
        background:#0078ff;
        border-color:#0078ff;
    }

    .agreeChk input:checked + span::after{
        opacity:1;
    }
</style>
<c:forEach items="${termsList}" var="terms">
	${terms.contents }
</c:forEach>

<c:if test="${homepage.context_path eq 'geic'}">
    <h4>개인정보 수집·이용 동의</h4>
    <p class="mB20 mL10">
        본 기관은 강사등록 신청을 위하여 「개인정보보호법」에 따라 귀하의 개인정보를 수집·이용하고자 합니다.<br />
        내용을 자세히 읽으신 후 동의 여부를 결정하여 주십시오.
    </p>
    <h4>1. [필수] 개인정보 수집 및 이용 동의</h4>
    <div class="rsv-info"></div>
    <div class="auto-scroll">
        <table class="tbl-type01" summary="">
            <colgroup>
                <col width="30%" />
            </colgroup>
            <thead>
            <th>구분</th>
            <th>내용</th>
            </thead>
            <tbody>
            <tr>
                <td>수집·이용 목적</td>
                <td>경북지역 평생학습 강사정보의 체계적 관리</td>
            </tr>
            <tr>
                <td>수집 항목</td>
                <td>이름, 생년월일, 휴대전화번호, 학력, 과목구분, 과목명, 강의가능 지역, 강의계획서</td>
            </tr>
            <tr>
                <td>보유·이용 기간</td>
                <td>5년(동의 철회 시 까지)</td>
            </tr>
            <tr>
                <td>동의 거부 권리 및 불이익</td>
                <td>귀하는 개인정보 수집 및 이용에 거부할 권리가 있습니다. 단, 동의를 거부할 경우 강사등록 신청이 제한될 수 있습니다.</td>
            </tr>
            </tbody>
        </table>
        <div class="agreeBox">
            <p>위와 같이 개인정보를 수집·이용하는 것에 동의하십니까?</p>

            <div class="agreeChk">
                <label>
                    <input type="radio" name="agree1" value="yes" class="requiredAgree"> <span>동의함</span>
                </label>
                <label>
                    <input type="radio" name="agree1" value="no" checked> <span>동의하지 않음</span>
                </label>
            </div>
        </div>
    </div>

    <h4>2. [선택] 개인정보 수집 및 이용 동의</h4>
    <div class="rsv-info"></div>
    <div class="auto-scroll">
        <table class="tbl-type01" summary="">
            <colgroup>
                <col width="30%" />
            </colgroup>
            <thead>
            <th>구분</th>
            <th>내용</th>
            </thead>
            <tbody>
            <tr>
                <td>수집·이용 목적</td>
                <td>경북지역 평생학습 강사정보의 체계적 관리</td>
            </tr>
            <tr>
                <td>수집 항목</td>
                <td>이메일, 자격·면허·수상 내역, 강의 경력</td>
            </tr>
            <tr>
                <td>보유·이용 기간</td>
                <td>5년(동의 철회 시 까지)</td>
            </tr>
            <tr>
                <td>동의 거부 권리 및 불이익</td>
                <td>선택 항목 수집에 동의하지 않더라도 강사 등록 신청은 가능합니다. 다만, 자격 및 경력 사항 확인이 불가능하여 선발 심사에서 불이익을 받을 수 있습니다.</td>
            </tr>
            </tbody>
        </table>
        <div class="agreeBox">
            <p>위와 같이 개인정보를 수집·이용하는 것에 동의하십니까?</p>

            <div class="agreeChk">
                <label>
                    <input type="radio" name="agree2" value="yes" class="optionalAgree"> <span>동의함</span>
                </label>
                <label>
                    <input type="radio" name="agree2" value="no" checked> <span>동의하지 않음</span>
                </label>
            </div>
        </div>
    </div>

    <h4>3. [필수] 개인정보 제 3자 제공 동의</h4>
    <div class="rsv-info"></div>
    <div class="auto-scroll">
        <table class="tbl-type01" summary="">
            <colgroup>
                <col width="30%" />
            </colgroup>
            <thead>
            <th>구분</th>
            <th>내용</th>
            </thead>
            <tbody>
            <tr>
                <td>개인정보를 제공받는 자</td>
                <td>경상북도교육청 소속 교직원 및 누리집 이용자</td>
            </tr>
            <tr>
                <td>제공받는 자의 개인정보 이용 목적</td>
                <td>교육프로그램 운영</td>
            </tr>
            <tr>
                <td>제공하는 개인정보 항목</td>
                <td>
                    - 교직원: 이름, 생년월일, 휴대전화번호, 학력, 과목구분, 과목명, 강의가능 지역, 강의계획서 <br />
                    - 누리집 이용자: 이름(비식별), 강의가능지역, 과목구분, 과목명
                </td>
            </tr>
            <tr>
                <td>개인정보 보유 및 이용 기간</td>
                <td>5년(동의 철회 시 까지)</td>
            </tr>
            <tr>
                <td>동의 거부 권리 및 불이익</td>
                <td>귀하는 개인정보 수집 및 이용에 거부할 권리가 있습니다. 단, 동의를 거부할 경우 강사등록 신청이 제한될 수 있습니다.</td>
            </tr>
            </tbody>
        </table>
        <div class="agreeBox">
            <p>위와 같이 개인정보를 수집·이용하는 것에 동의하십니까?</p>
            <div class="agreeChk">
                <div class="agreeChk">
                    <label>
                        <input type="radio" name="agree3" value="yes" class="requiredAgree"> <span>동의함</span>
                    </label>
                    <label>
                        <input type="radio" name="agree3" value="no" checked> <span>동의하지 않음</span>
                    </label>
                </div>
            </div>
        </div>
    </div>


    <h4>4. [선택] 개인정보 제 3자 제공 동의</h4>
    <div class="rsv-info"></div>
    <div class="auto-scroll">
        <table class="tbl-type01" summary="">
            <colgroup>
                <col width="30%" />
            </colgroup>
            <thead>
            <th>구분</th>
            <th>내용</th>
            </thead>
            <tbody>
            <tr>
                <td>개인정보를 제공받는 자</td>
                <td>경상북도교육청 소속 교직원</td>
            </tr>
            <tr>
                <td>제공받는 자의 개인정보 이용 목적</td>
                <td>교육프로그램 운영</td>
            </tr>
            <tr>
                <td>제공하는 개인정보 항목</td>
                <td>5년(동의 철회 시 까지)</td>
            </tr>
            <tr>
                <td>개인정보 보유 및 이용 기간</td>
                <td>5년(동의 철회 시 까지)</td>
            </tr>
            <tr>
                <td>동의 거부 권리 및 불이익/td></td>
                <td>선택 항목 수집에 동의하지 않더라도 강사 등록 신청은 가능합니다. 다만, 자격 및 경력 사항 확인이 불가능하여 선발 심사에서 불이익을 받을 수 있습니다.</td>
            </tr>
            </tbody>
        </table>
        <div class="agreeBox">
            <p>위와 같이 개인정보를 수집·이용하는 것에 동의하십니까?</p>

            <div class="agreeChk">
                <label>
                    <input type="radio" name="agree4" value="yes" class="optionalAgree"> <span>동의함</span>
                </label>
                <label>
                    <input type="radio" name="agree4" value="no" checked> <span>동의하지 않음</span>
                </label>
            </div>
        </div>
    </div>

    <div class="allAgreeBox">
        <label>
            <input type="checkbox" id="allAgree"> 모든 약관에 동의합니다.
        </label>
    </div>


    <h4>개인정보 제3자 제공 동의</h4>
	<div class="Box" style="height:200px" tabindex="0" >
		<h4>▣ 개인정보를 제공받는 자</h4>
		<p class="mB20 mL10">&nbsp; · 경상북도교육청 소속 교직원 및 누리집 이용자</p>
		<h4>▣ 개인정보를 제공받는 자의 개인정보 이용 목적</h4>
		<p class="mB20 mL10">&nbsp; · 교육프로그램 운영</p>
		<h4>▣ 제공하는 개인정보의 항목</h4>
		<p class="mB20 mL10">&nbsp;&nbsp;&nbsp; - 교직원: 이름, 생년월일, 휴대전화번호, 학력, 과목구분, 과목명, 강의가능지역,강의계획서, 이메일, 자격·면허·수상 내역, 강의경력
        </p>
    <p class="mB20 mL10">&nbsp;&nbsp;&nbsp;- 누리집 이용자: 이름(비식별), 강의가능지역, 과목구분, 과목명
    </p>
        <h4>▣ 제공방법</h4>
        <p class="mB20 mL10">&nbsp; · 경상북도교육청정보센터 누리집 내 강사은행 공지</p>
		<h4>▣ 제공받는 자의 보유·이용 기간</h4>
		<p class="mB20 mL10">&nbsp; · 개인정보 보유 및 이용기간 만료 및 누리집 게재 삭제 요청 시 즉시 파기</p>
		<h4>▣ 개인정보 제3자 제공에 대한 동의를 거부할 권리</h4>
		<p class="mB20 mL10">&nbsp; · 개인정보 제3자 제공을 거부할 수 있으며, 미동의 시 강사은행에 강사 등록신청이 제한됩니다.</p>
	</div>
</c:if>

<form:form id="teacherForm" modelAttribute="teacher" method="post" action="save.do" onsubmit="return false;">
	<div style="text-align: right"><b>이용약관 및 개인정보의 수집·이용 동의 여부</b>(<span style="color: red; font-weight: bold;">*</span>)
		<form:select path="self_info_yn" cssClass="selectmenu" cssStyle="width : 70px">
			<form:option value="Y" label="동의"/>
			<form:option value="N" label="미동의" selected="selected"/>
		</form:select>
	</div><br/>
	<form:hidden path="homepage_id"/>
	<form:hidden path="teacher_idx"/>
	<form:hidden path="teacher_id" value="${memberInfo.member_id}"/>
	<form:hidden path="member_key" value="${memberInfo.seq_no}"/>
	<form:hidden path="editMode"/>
	<form:hidden path="teacher_education"/>
	<form:hidden path="teacher_experience"/>
	<form:hidden path="teacher_certifications"/>
	<form:hidden path="teacher_open_files"/>
	<form:hidden path="teacher_zipcode"/>
	<form:hidden path="teacher_address"/>
	<form:hidden path="menu_idx" value="${fn:escapeXml(param.menu_idx)}"/>
	<table class="type2">
		<colgroup>
	       <col width="130" />
	       <col width="*"/>
       	</colgroup>
       	<tbody>
			<tr>
	         	<th>이름(<span style="color: red; font-weight: bold;">*</span>)</th>
	         	<td>
					${memberInfo.member_name }
					<form:hidden path="teacher_name" value="${memberInfo.member_name }" />
         		</td>
        	</tr>
			<tr>
	         	<th>생년월일(<span style="color: red; font-weight: bold;">*</span>)</th>
	         	<td>
					<c:set var="birth_day" value="${fn:substring(memberInfo.birth_day, 0, 4)}-${fn:substring(memberInfo.birth_day, 4, 6)}-${fn:substring(memberInfo.birth_day, 6, 8)}"/>
					${birth_day}
					<form:hidden path="teacher_birth" value="${birth_day}" />
     			</td>
        	</tr>
	        <tr>
				<th>휴대전화번호(<span style="color: red; font-weight: bold;">*</span>)</th>
				<td>
					${memberInfo.cell_phone1}-${memberInfo.cell_phone2}-${memberInfo.cell_phone3}
					<form:hidden path="teacher_cell_phone" class="text" maxlength="13" value="${memberInfo.cell_phone1}-${memberInfo.cell_phone2}-${memberInfo.cell_phone3}"/>
				</td>
			</tr>
        	<tr>
				<th>이메일</th>
				<td>
					${memberInfo.email}
					<form:hidden path="teacher_email" value="${memberInfo.email}"/>
				</td>
			</tr>
        	<tr>
	         	<th>과목구분(<span style="color: red; font-weight: bold;">*</span>)</th>
	         	<td>
	         		<form:select path="subject_cd" cssClass="selectmenu">
	         			<form:option value="" label="없음"></form:option>
	         			<form:options items="${subjectCodeList}" itemLabel="code_name" itemValue="code_id"/>
	         		</form:select>
				</td>
	        </tr>
        	<tr>
	         	<th>과목명(<span style="color: red; font-weight: bold;">*</span>)</th>			
	         	<td><form:input path="teacher_subject_name" class="text" style="width:35%" maxlength="30" title="과목명 입력" /></td>
        	</tr>
			<tr>
	         	<th>강의가능지역(<span style="color: red; font-weight: bold;">*</span>)</th>
	         	<td>
	         		<form:select path="teacher_location_code" cssClass="selectmenu">
	         			<form:option value="" label="없음"></form:option>
	         			<form:options items="${locationCodeList}" itemLabel="code_name" itemValue="code_id"/>
	         		</form:select>
				</td>
	        </tr>
			<tr>
	         	<th>학력(<span style="color: red; font-weight: bold;">*</span>)</th>			
	         	<td>
					<table class="type2 education">
						<colgroup>
							<col width="100" />
							<col width="100" />
							<col width="100" />
							<col width="100" />
							<col width="*"/>
						</colgroup>
						<thead>
							<tr>
								<th></th>
								<th>학교명</th>
								<th>수료(졸업)일</th>
								<th>학과</th>
								<th>학적사항</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>고등학교</td>
								<td><input type="text" id="t_edu00" class="text" maxlength="30"></td>
								<td><input type="text" id="t_edu01" class="text" maxlength="6" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" style="width:70px; background: #fff" placeholder="예) 198102 (연도4자리+월2자리)"></td>
								<td><input type="text" id="t_edu02" class="text" maxlength="30"></td>
								<td>
									<input type="checkbox" id="t_edu03" value="Y"><label for="t_edu03">검정고시</label>
								</td>
							</tr>
							<tr>
								<td>대학교</td>
								<td><input type="text" id="t_edu10" class="text" maxlength="30"></td>
								<td><input type="text" id="t_edu11" class="text" maxlength="6" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" style="width:70px; background: #fff" placeholder="예) 198102 (연도4자리+월2자리)"></td>
								<td><input type="text" id="t_edu12" class="text" maxlength="30"></td>
								<td class="t_edu1">
									<input type="radio" id="t_edu13" name="t_edu13" value="Y"><label for="t_edu13">졸업</label> &nbsp;
									<input type="radio" id="t_edu14" name="t_edu13" value="Y"><label for="t_edu14">졸업예정</label> &nbsp; <br/>
									<input type="radio" id="t_edu15" name="t_edu13" value="Y"><label for="t_edu15">수료</label>
								</td>
							</tr>
							<tr>
								<td>대학원</td>
								<td><input type="text" id="t_edu20" class="text" maxlength="30"></td>
								<td><input type="text" id="t_edu21" class="text" maxlength="6" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" style="width:70px; background: #fff" placeholder="예) 198102 (연도4자리+월2자리)"></td>
								<td><input type="text" id="t_edu22" class="text" maxlength="30"></td>
								<td class="t_edu2">
									<input type="radio" id="t_edu23" name="t_edu23" value="Y"><label for="t_edu23">졸업</label> &nbsp;
									<input type="radio" id="t_edu24" name="t_edu23" value="Y"><label for="t_edu24">졸업예정</label> &nbsp;<br/>
									<input type="radio" id="t_edu25" name="t_edu23" value="Y"><label for="t_edu25">수료</label>
								</td>
							</tr>
							<tr>
								<td>기타</td>
								<td><input type="text" id="t_edu30" class="text" maxlength="30"></td>
								<td><input type="text" id="t_edu31" class="text" maxlength="6" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)"style="width:70px; background: #fff" placeholder="예) 198102 (연도4자리+월2자리)"></td>
								<td><input type="text" id="t_edu32" class="text" maxlength="30"></td>
								<td><input type="text" id="t_edu33" class="text" maxlength="30" style="width:99%;"></td>
							</tr>
						</tbody>
					</table>
					<div class="ui-state-highlight">
						<em>* 고등학교, 대학교, 대학원, 기타 중 하나는 필수로 입력하여야 합니다.</em><br/>
						<em>* 수료(졸업)일 : 예) 198102 (연도4자리+월2자리)</em> <br>
					</div>
	         	</td>
        	</tr>
        	<tr>
	         	<th>자격·면허·수상</th>
	         	<td>
					<table class="type2">
						<colgroup>
							<col width="200" />
							<col width="*" />
							<col width="100" />
						</colgroup>
						<thead>
							<tr>
								<th>취득년월일</th>
								<th>자격·면허·수상 내역</th>
								<th>시행처</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="text" id="t_cer00" class="text ui-calendar" readonly="true"><button class="btn" onclick="$('#t_cer00').val(''); return false;" style="width: 50px;">삭제</button></td>
								<td><input type="text" id="t_cer01" class="text" maxlength="30" style="width:99%;"></td>
								<td><input type="text" id="t_cer02" class="text" maxlength="30"></td>
							</tr>
							<tr>
								<td><input type="text" id="t_cer10" class="text ui-calendar" readonly="true"><button class="btn" onclick="$('#t_cer10').val(''); return false;" style="width: 50px;">삭제</button></td>
								<td><input type="text" id="t_cer11" class="text" maxlength="30" style="width:99%;"></td>
								<td><input type="text" id="t_cer12" class="text" maxlength="30"></td>
							</tr>
							<tr>
								<td><input type="text" id="t_cer20" class="text ui-calendar" readonly="true"><button class="btn" onclick="$('#t_cer20').val(''); return false;" style="width: 50px;">삭제</button></td>
								<td><input type="text" id="t_cer21" class="text" maxlength="30" style="width:99%;"></td>
								<td><input type="text" id="t_cer22" class="text" maxlength="30"></td>
							</tr>
							<tr>
								<td><input type="text" id="t_cer30" class="text ui-calendar" readonly="true"><button class="btn" onclick="$('#t_cer30').val(''); return false;" style="width: 50px;">삭제</button></td>
								<td><input type="text" id="t_cer31" class="text" maxlength="30" style="width:99%;"></td>
								<td><input type="text" id="t_cer32" class="text" maxlength="30"></td>
							</tr>
						</tbody>
					</table>
         			<div class="ui-state-highlight">
						<em>* 연도는 현재 선택한 연도부터 과거 80년까지 나옵니다. </em> <br/>
						<em>&nbsp;&nbsp;현재 선택창에 더 오래된 연도가 없을 시,</em> <br/>
						<em>&nbsp;&nbsp;선택창의 연도 중 가장 오래된 연도를 선택하면 과거 80년이 더 추가됩니다.</em> <br/>
						<em>* 취득년월일을 삭제하려면 '삭제' 버튼을 클릭하세요. </em> <br/>
					</div>
	         	</td>
        	</tr>
			<tr>
	         	<th>강의경력</th>
	         	<td>
					<table class="type2">
						<colgroup>
							<col width="350" />
							<col width="100" />
							<col width="100" />
							<col width="*"/>
						</colgroup>
						<thead>
							<tr>
								<th>근무기간</th>
								<th>근무처</th>
								<th>직위</th>
								<th>주요업무</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="text" id="t_exp00" class="text" maxlength="6" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" style="width:70px; display:inline-block; background: #fff" placeholder="예) 198102 (연도4자리+월2자리)"> ~ <input type="text" id="t_exp01" class="text" maxlength="6" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" style="width:70px; display:inline-block; background: #fff" placeholder="예) 198102 (연도4자리+월2자리)"></td>
								<td><input type="text" id="t_exp02" class="text" maxlength="30"></td>
								<td><input type="text" id="t_exp03" class="text" maxlength="30" style="width: 100px;"></td>
								<td><input type="text" id="t_exp04" class="text" maxlength="30"></td>
							</tr>
							<tr>
								<td><input type="text" id="t_exp10" class="text" maxlength="6" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" style="width:70px; display:inline-block; background: #fff" placeholder="예) 198102 (연도4자리+월2자리)"> ~ <input type="text" id="t_exp11" class="text" maxlength="6" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" style="width:70px; display:inline-block; background: #fff" placeholder="예) 198102 (연도4자리+월2자리)"></td>
								<td><input type="text" id="t_exp12" class="text" maxlength="30"></td>
								<td><input type="text" id="t_exp13" class="text" maxlength="30" style="width: 100px;"></td>
								<td><input type="text" id="t_exp14" class="text" maxlength="30"></td>
							</tr>
							<tr>
								<td><input type="text" id="t_exp20" class="text" maxlength="6" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" style="width:70px; display:inline-block; background: #fff" placeholder="예) 198102 (연도4자리+월2자리)"> ~ <input type="text" id="t_exp21" class="text" maxlength="6" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" style="width:70px; display:inline-block; background: #fff" placeholder="예) 198102 (연도4자리+월2자리)"></td>
								<td><input type="text" id="t_exp22" class="text" maxlength="30"></td>
								<td><input type="text" id="t_exp23" class="text" maxlength="30" style="width: 100px;"></td>
								<td><input type="text" id="t_exp24" class="text" maxlength="30"></td>
							</tr>
							<tr>
								<td><input type="text" id="t_exp30" class="text" maxlength="6" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" style="width:70px; display:inline-block; background: #fff" placeholder="예) 198102 (연도4자리+월2자리)"> ~ <input type="text" id="t_exp31" class="text" maxlength="6" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" style="width:70px; display:inline-block; background: #fff" placeholder="예) 198102 (연도4자리+월2자리)"></td>
								<td><input type="text" id="t_exp32" class="text" maxlength="30"></td>
								<td><input type="text" id="t_exp33" class="text" maxlength="30" style="width: 100px;"></td>
								<td><input type="text" id="t_exp34" class="text" maxlength="30"></td>
							</tr>
						</tbody>
					</table>
					<div class="ui-state-highlight">
						<em>* 근무기간 : 예) 198102 (연도4자리+월2자리)</em> <br>
					</div>
	         	</td>
        	</tr>
			<c:if test="${not empty teacher.teacher_open_files}">
				<tr>
					<th>현재 첨부파일<br/>강의계획서(<span style="color: red; font-weight: bold;">*</span>)</th>
					<td id="td_teacher_open_files"></td>
				</tr>
			</c:if>
			<tr>
				<th>첨부파일<br/>강의계획서(<span style="color: red; font-weight: bold;">*</span>)</th>
				<td class="fileTd">
					<input type="file" id="open_file1" name="open_file" class="text" title="파일선택" />
				</td>
			</tr>
		</tbody>
	</table>
</form:form>
<br/>
<div class="button bbs-btn center">
	<button id="save-btn" class="btn btn5" title="신청하기" >${teacher.editMode eq 'ADD' ? '신청하기' : '저장하기'}</button>
	<button id="back-btn" class="btn" title="뒤로가기"><i class="fa fa-reorder"></i><span>뒤로가기</span></button>
</div>
