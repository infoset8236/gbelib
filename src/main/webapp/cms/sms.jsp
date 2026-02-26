<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
.sms_area{overflow:hidden}
.MD_sms{background:url('/resources/cms/smsSend/img/mobile.gif') no-repeat}
.MD_sms .title{font-weight:800;height:60px;text-align:center}
.MD_sms .title p{padding-top:15px;font-size:120%}
.MD_sms .title .color1{color:#038606}
.MD_sms .title .color2{color:#003fa1}
.MD_sms .mobile{padding:0 8px;height:438px}
.MD_sms .mobile textarea{position:relative;resize:none;background:#3162aa url('/resources/cms/smsSend/img/sms_txtbox_bg.gif') no-repeat 0 0;border:none;width:169px;height:212px;color:#fff;padding:8px;overflow-y:auto;border:1px solid #00236f}
.MD_sms .mobile .mobile_bot .info_byte{float:right;margin-right:20px}
.MD_sms .mobile .mobile_bot .info_byte strong{color:#87ace7}
</style>

<script type="text/javascript">
var isMMS = true;
$(function(){	
	$('textarea#send_msg').on('keyup', function(e) {
		calculateBytes($(this).val());
	});
	
	
	$('a.dialog-add').on('click', function(e) {
		e.preventDefault();
		
		if($('#homepage_id').val() == "") {
			alert('홈페이지를 선택해주세요.');
			return false;
		}
		
		$('input#yearmonth').val($(this).attr('keyValue'));
		var formData = 'edit.do?' + serializeParameter(['manage_idx', 'homepage_id', 'editMode', 'yearmonth']);
		$('#dialog-1').load(formData, function( response, status, xhr ) {
			$('#dialog-1').dialog({
				width: 600,
				height: 300
			});	
			$('#dialog-1').dialog('open');
		});
	});
	
	
	$('a.dialog-modify').on('click', function(e) {
		e.preventDefault();
		$('input#yearmonth').val($(this).attr('keyValue'));
		$('input#editMode').val('MODIFY');
		var formData = 'edit.do?' + serializeParameter(['manage_idx', 'homepage_id', 'editMode', 'yearmonth']);
		$('#dialog-1').load(formData, function( response, status, xhr ) {
			$('#dialog-1').dialog({
				width: 600,
				height: 300
			});
			$('#dialog-1').dialog('open');
		});
	});
	
	$('select#homepage_id').on('change', function(e) {
		e.preventDefault();
		if($(this).val() != '') {
			$('#manage_idx').val('');
			$('#yearmonth').val('');
			$('#smsSend').submit();
		}
	});
	
	$('div.tab1 a').on('click', function(e) {
		e.preventDefault();
		$('div.tab1 li').each(function() {
			$(this).removeClass('active');
		});
		$(this).parent('li').addClass('active');
		$('table#table1').hide();
		$('table#table2').hide();
		$('table#' + $(this).attr('keyValue')).show();
	});
});

function calculateBytes(str) {
	var length = getLength(str);
	$('strong#currBytes').text(length);
	
	if (isMMS) {
		if (length < 91) {
// 			type = mmsPoint;
		} else if (length > 4000) {
			str = cutByte(str);
			alert('4000바이트를 초과할 수 없습니다.');
			$('strong#currBytes').text( getLength(str));
			$('textarea#send_msg').val(str);
			return false;
		} else {
// 			type = mmsPoint;
		}
	} else {
		if (length < 91) {
			isMMS = false;
			$('span#maxBytes').text('90');
		} else {
 			$('span#maxBytes').text('90');
 			str = cutByte90(str);
 			alert('90바이트를 초과할 수 없습니다.');
			$('strong#currBytes').text( getLength(str));
			$('textarea#send_msg').val(str);
		}
	}
}

var cutByte90 = function(str) {
	var l = 0;
	for (var i=0; i<str.length; i++) {
       l += (str.charCodeAt(i) > 128) ? 2 : 1;
       if (l > 90) {
    	   return str.substring(0,i);
       }
	}
	return str;
};

var cutByte = function(str) {
	var l = 0;
	for (var i=0; i<str.length; i++) {
       l += (str.charCodeAt(i) > 128) ? 2 : 1;
       if (l > 4000) {
    	   return str.substring(0,i);
       }
	}
	return str;
};

function getLength(s, b, i, c) {
	for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?2:c>>7?2:1);
	return b;
}
</script>

<div class="wrapper wrapper-white">
	
<form id="smsSend" action="save.do" method="post" onsubmit="return false;">
<input id="editMode" name="editMode" type="hidden" value="ADD">
<textarea id="real_msg" name="send_msg" style="display: none;" wrap="hard"></textarea>
	<div class="search">
		<fieldset>
			<label class="blind">검색</label>				
			<select id="homepage_id" name="homepage_id" style="width:300px" class="selectmenu-search">
				<option value="">홈페이지를 선택하세요.</option>
				<option value="h1">대표홈페이지</option><option value="h2">경상북도립구미도서관</option><option value="h3">경상북도립안동도서관</option><option value="h4">경상북도립안동도서관 용상분관</option><option value="h5">경상북도립안동도서관 풍산분관</option><option value="h6">경상북도립상주도서관</option><option value="h7">경상북도립상주도서관 화령분관</option><option value="h8">영일공공도서관</option><option value="h9">외동공공도서관</option><option value="h10">영주공공도서관</option><option value="h11">영주공공도서관 풍기분관</option><option value="h12">영천금호도서관</option><option value="h13">점촌공공도서관</option><option value="h14">삼국유사군위도서관</option><option value="h15">의성공공도서관</option><option value="h16">청송공공도서관</option><option value="h17">영양공공도서관</option><option value="h18">영덕공공도서관</option><option value="h19">청도공공도서관</option><option value="h20">고령공공도서관</option><option value="h21">성주공공도서관</option><option value="h22">칠곡공공도서관</option><option value="h23">예천공공도서관</option><option value="h24">봉화공공도서관</option><option value="h25">울진공공도서관</option><option value="h26">울릉공공도서관</option><option value="h27">경상북도교육정보센터 도서관</option><option value="h28">경상북도교육정보센터</option><option value="h29">점촌공공도서관 가은분관</option><option value="h30">전자도서관</option>
			</select> 
		</fieldset>
	</div>
	<div class="search">
		<fieldset>
				모듈1 : 
				<label class="blind">모듈</label>
				<select>
					<option>aasdfasdfasdafd</option>
					<option>aasdfasdfasdafd</option>
					<option>aasdfasdfasdafd</option>
					<option>aasdfasdfasdafd</option>
					<option>aasdfasdfasdafd</option>
				</select>
				모듈2 : 
				<label class="blind">모듈</label>
				<select>
					<option>aasdfasdfasdafd</option>
					<option>aasdfasdfasdafd</option>
					<option>aasdfasdfasdafd</option>
					<option>aasdfasdfasdafd</option>
					<option>aasdfasdfasdafd</option>
				</select>
				모듈3 : 
				<label class="blind">모듈</label>
				<select>
					<option>aasdfasdfasdafd</option>
					<option>aasdfasdfasdafd</option>
					<option>aasdfasdfasdafd</option>
					<option>aasdfasdfasdafd</option>
					<option>aasdfasdfasdafd</option>
				</select>
		</fieldset>
	</div>

	<div class="sms_area">
		<!-- 문자 전송 -->
		<div class="MD_sms" style="width: 220px; float: left;">
			<!-- 휴대폰 -->
			<div class="mobile">
				<div class="title">
					<p>
						<span class="color1">문자</span>
						<span class="color2">메시지</span>
					</p>
				</div>
				<textarea id="send_msg" class="off" wrap="hard">여기에 메시지를 입력하세요.</textarea> 
				<div class="mobile_bot">
					<!-- 특수문자 -->
					
					<!--// 특수문자 -->
					<span class="info_byte"><strong id="currBytes">0</strong> / <span id="maxBytes">4000</span> byte</span>
					<p style="margin-top: -20px; display: none;" id="reserve">
						<span>예약 : <input type="text" id="rsvt" name="rsvt_ymd" readonly="readonly"/></span>
					</p>
					<ul class="sendBtns">
						<li><a href="#" id="justSend" class="btn btn2">즉시전송</a></li>
					</ul>
				</div>
			</div>
			<!--// 휴대폰 -->
			
			<!-- 전송목록 및 주소록 -->
			<!--// 전송목록 및 주소록 -->
		</div>
		<!--// 문자 전송 -->
		<div style="float:left;width:380px">
			<div class="tabmenu tab1" style="padding:0px;">
				<ul>
					<li class="active"><a href="#" keyValue="table1">신청자</a></li>
					<li class=""><a href="#" keyValue="table2">대기자</a></li>
				</ul>
			</div>

			<div class="table-wrap">
				<div class="table-scroll">
					<table id="table1" class="type1 center">
						<thead>
							<tr>
								<th style="width:22px">
									<input type="checkbox" id="checkAll1"/>
								</th>
								<th>이름</th>
								<th>전화번호</th>
								<th>기타</th>
							</tr>
						</thead>
						<tbody style="height:360px">
							<% for(int i=1;i<77;i++){ %>
							<tr>
								<td style="width:22px"><input type="checkbox" id="c1" /></td>
								<td><label for="c1">홍길동1</label></td>
								<td>010-1234-1</td>
								<td>테스트1</td>
							</tr>
							<% } %>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</form>
		
</div>