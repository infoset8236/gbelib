<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src = "https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$(function() {
	$('.findPostCode').on('click', function(e){
		var zipcodeInput 	= $(this).attr('keyValue1');
		var addressInput 	= $(this).attr('keyValue2');
		var focusInput 		= $(this).attr('keyValue3');
		daum.postcode.load(function(){
			new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var fullAddr = ''; // 최종 주소 변수
		                var extraAddr = ''; // 조합형 주소 변수

		                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    fullAddr = data.roadAddress;

		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    fullAddr = data.jibunAddress;
		                }

		                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
		                if(data.userSelectedType === 'R'){
		                	// 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                	if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                	// 건물명이 있고, 공동주택일 경우 추가한다.
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
		                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
		                }
		                $(zipcodeInput).val(data.zonecode);
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                $(addressInput).val(fullAddr);
		                // 커서를 상세주소 필드로 이동한다.
		                $(focusInput).focus();
		                
		            }
		        }).open();
			});
	    });


	if('${apply.applicant_tel}' == '') {
	} else {
		var applicant_tel = '${apply.applicant_tel}'.split('-');
		$('#applicant_tel_1').val(applicant_tel[0]);
		$('#applicant_tel_2').val(applicant_tel[1]);
		$('#applicant_tel_3').val(applicant_tel[2]);
	}

	$('#save-btn').on('click', function() {
		$('#applicant_tel').val($('#applicant_tel_1').val()+'-'+$('#applicant_tel_2').val()+'-'+$('#applicant_tel_3').val());
		$('#agency_tel').val($('#agency_tel_1').val()+'-'+$('#agency_tel_2').val()+'-'+$('#agency_tel_3').val());
		$.ajax({
			url : '/${homepage.context_path}/module/excursions/save.do',
			async : false,
			data : serializeObject($('#excursionsEdit')),
			method : 'POST',
			dataType : 'json',
			success : function(data) {
				if(data.valid) {
	                 if(data.message != null && data.message.replace(/\s/g,'').length!=0) {
	                	 alert(data.message);
	                 }
    				if(data.targetOpener) {
    					window.open(data.url, '', 'width=500,height=510');
    					return false;
    				}
					if($('#pageType').val() == 'ajax') {
						$('#tabCon2').load('module/excursions/index.do?pageType=ajax&menu_idx='+ $('#menu_idx').val());
					} else {
						doGetLoad('/${homepage.context_path}/module/excursions/index.do', '&menu_idx=' + $('#menu_idx').val() + '&pageType=' + $('#pageType').val());
					}
				} else {
	   				if(data.targetOpener) {
						window.open(data.url, '', 'width=500,height=510');
						return false;
					}

					if (data.message != null && data.message.replace(/\s/g, '').length != 0) {
						alert(data.message);
					} else {
						for (var i = 0; i < data.result.length; i++) {
							alert(data.result[i].code);
							$('#' + data.result[i].field).focus();
							break;
						}
					}
				}
			}
		});
	});

	$('#cancel-btn').on('click', function() {
		var url = '/${homepage.context_path}/module/excursions/index.do';
		var formData = serializeParameter(['menu_idx', 'date_type']);
		doGetLoad(url, formData);
	});

	// 연락처 필드 숫자만 입력 가능
	$(document).on("keyup", "input:text[numberOnly]", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});

});
</script>

<c:forEach items="${termsList}" var="terms">
	${terms.contents }
</c:forEach>

<form:form modelAttribute="apply" id="excursionsEdit" action="/${homepage.context_path}/module/excursions/save.do" method="post" onsubmit="return false;">
<div style="text-align: right"><b>이용약관 및 개인정보의 수집·이용 동의 여부</b>(<span style="color: red; font-weight: bold;">*</span>)
	<form:select path="self_info_yn" cssClass="selectmenu" cssStyle="width : 70px" title="동의여부 선택">
		<form:option value="Y" label="동의"/>
		<form:option value="N" label="미동의"/>
	</form:select>
</div>
<br/>
<form:hidden path="editMode"/>
<form:hidden path="homepage_id"/>
<form:hidden path="apply_idx"/>
<form:hidden path="excursions_idx" value="${apply.excursions_idx }"/>
<form:hidden path="start_date" value="${apply.start_date}"/>
<form:hidden path="menu_idx"/>
<form:hidden path="apply_id"/>
<form:hidden path="pageType"/>
<form:hidden path="date_type"/>
<div style="text-align: right">
	(<span style="color: red; font-weight: bold;">*</span>) 필수 항목 입니다.
</div>

<table class="type1">
	<colgroup>
		<col width="140"/>
		<col width="*"/>
	</colgroup>
	<tbody>
		<tr>
			<th>신청자 성명</th>
			<td>
				<form:hidden path="applicant_name" value="${member.member_name}"/>
				${member.member_name}

			</td>
		</tr>
		<tr>
			<th>신청자 전화번호(<span style="color: red; font-weight: bold;">*</span>)</th>
			<td>
				${member.cell_phone1}-${member.cell_phone2}-${member.cell_phone3}
				<form:hidden path="applicant_tel"/>
				<form:input type="hidden" path="applicant_tel_1" cssStyle="width:40px;" cssClass="text" maxlength="3" numberonly="true" value="${member.cell_phone1 }" title="전화번호 앞번호 입력"/>
				<form:input type="hidden" path="applicant_tel_2" cssStyle="width:40px;" cssClass="text" maxlength="4" numberonly="true" value="${member.cell_phone2 }" title="전화번호 중간번호 입력"/>
				<form:input type="hidden" path="applicant_tel_3" cssStyle="width:40px;" cssClass="text" maxlength="4" numberonly="true" value="${member.cell_phone3 }" title="전화번호 뒷번호 입력"/>
			</td>
		</tr>
		<tr>
			<th>신청자 이메일</th>
			<td> 
				<form:input path="applicant_email" class="text" cssStyle="width:200px" title="이메일 입력"/>
			</td>
		</tr>
		<tr>
			<th>기관명(<span style="color: red; font-weight: bold;">*</span>)</th>
			<td>
				<form:input path="agency_name" class="text" cssStyle="width:250px" maxlength="20" title="기관명 입력 "/>
			</td>
		</tr>
		<tr>
			<th>기관 전화번호(<span style="color: red; font-weight: bold;">*</span>)</th>
			<td>
				<form:hidden path="agency_tel"/>
				<form:input path="agency_tel_1" cssStyle="width:40px;" cssClass="text" maxlength="4" numberonly="true" title="기관 전화번호 앞번호 입력 "/> -
				<form:input path="agency_tel_2" cssStyle="width:40px;" cssClass="text" maxlength="4" numberonly="true" title="기관 전화번호 중간번호 입력 "/> -
				<form:input path="agency_tel_3" cssStyle="width:40px;" cssClass="text" maxlength="4" numberonly="true" title="기관 전화번호 뒷번호 입력 "/>
			</td>
		</tr>
		<tr>
			<th>기관 주소</th>
			<td>
				<form:input path="agency_address" class="text" cssStyle="width:250px" title="기관 주소 입력"/><button class="btn btn2 findPostCode" keyValue1="#applicant_zipcode" keyValue2="#agency_address" keyValue3="#age" title="새창열림">주소 찾기</button>
			</td>
		</tr>
		<tr>
			<th>연령대(<span style="color: red; font-weight: bold;">*</span>)</th>
			<td>
				<form:input path="age" class="text" cssStyle="width:50px" title="연령대 입력 "/>
			</td>
		</tr>
		<tr>
			<th>방문인원(<span style="color: red; font-weight: bold;">*</span>)</th>
			<td><form:input path="personnel" class="text" cssStyle="width:50px" maxlength="3" numberOnly="true" title="방문인원 입력 "/> *숫자만 입력가능합니다.</td>
		</tr>
		<tr>
			<th>비고</th>
			<td><form:input path="remarks" class="text" cssStyle="width:80%" title="비고 입력 "/> </td>
		</tr>
	</tbody>
</table>
</form:form>
<br/>
<div class="txt-right">
	<button id="save-btn" class="btn btn2">신청하기</button>
	<button id="cancel-btn" class="btn btn5">취소</button>
</div>
