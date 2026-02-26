<%@ page language="java" pageEncoding="utf-8" %>

<div class="join-step">
	<p class="blind">회원가입 단계</p>
	<ul>
		<li class="step1"><span>1</span> <em>회원유형확인</em></li>
		<li class="step2"><span>2</span> <em>이용약관동의</em></li>
		<li class="step3 active"><span>3</span> <em>본인확인 및 정보입력</em></li>
	</ul>
</div>

<div class="join-wrap">
	<div class="info">
	* 행정자치부 공공I-PIN센터에서 발급받은 식별ID 및 비밀번호를 이용하여 본인확인을 하는 주민번호 대체수단 서비스 입니다.<br/>
   	 &nbsp; <b>공공I-PIN 신규발급 [<a href="http://www.gpin.go.kr" target="_blank">http://www.gpin.go.kr</a>]</b>
	</div>

	<div class="identi_select">
		<p class="identy_a"><a href="sub.jsp?menu_seq=register2">
			<img src="/resources/common/img/identy1.png" alt="휴대폰 본인인증"/>
			<span>휴대폰 본인인증</span>
		</a></p>
		<p class="identy_b"><a href="sub.jsp?menu_seq=register2">
			<img src="/resources/common/img/identy2.png" alt="공공 I-PIN인증"/>
			<span>공공 I-PIN(아이핀)인증</span>
		</a></p>
		<p class="identy_a success"><a href="sub.jsp?menu_seq=register2">
			<img src="/resources/common/img/identy1-on.png" alt="본인인증완료"/>
			<span><i class="fa fa-check"></i> 본인인증완료</span>
		</a></p>
	</div>

	<table summary="정보입력">
		<colgroup>
			<col/>
			<col/>
		</colgroup>
		<tbody>
			<tr>
				<th>소속 도서관</th>
				<td><select class="selectmenu-search" style="width:70%">
					<option disabled="disabled">도서관 선택</option>
					<option>경상북도립영일공공도서관</option>
				</select></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" class="text"/> <a href="" class="btn">중복확인</a></td>
			</tr>
			<tr>
				<th>생년 월일</th>
				<td><input type="text" class="text"/></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<div class="radio inline">
						<input id="F" name="sex" type="radio" value="F"/>
						<label for="F">여자</label>
					</div>
					&nbsp;
					<div class="radio inline">
						<input id="M" name="sex" type="radio" value="M"/>
						<label for="M">남자</label>
					</div>
				</td>
			</tr>
			<tr>
				<th>전화 번호</th>
				<td>
					<div class="line2">
						<p>
							<label>집</label>
							<select class="selectmenu" style="width:65px">
								<option>010</option>
								<option>011</option>
							</select> - <input type="text" class="text" style="width:22%"/> - <input type="text" class="text" style="width:22%"/>
						</p>
						<p>
							<label>휴대폰</label>
							<select class="selectmenu" style="width:65px">
								<option>010</option>
								<option>011</option>
							</select> - <input type="text" class="text" style="width:22%"/> - <input type="text" class="text" style="width:22%"/>
						</p>
					</div>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<div class="line2">
						<p>
							<input type="text" class="text" style="width:80px"/> <a href="" class="btn">우편번호 찾기</a>
						</p>
						<p>
							<input type="text" class="text" style="width:80%"/>
						</p>
					</div>
				</td>
			</tr>
		</tbody>
	</table>

	<div class="btn-wrap">
		<a href="sub.jsp?menu_seq=register3" id="join-btn" class="btn btn1">동의합니다.</a>
		<a href="sub.jsp?menu_seq=register1" class="btn">동의하지 않습니다.</a>
	</div>
</div>