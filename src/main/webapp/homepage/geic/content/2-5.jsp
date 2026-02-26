<%@ page language="java" pageEncoding="utf-8" %>

<div class="txt-box">
	독서진흥사업을 통하여 지역주민들의 독서의욕 고취 및 책 읽는 사회분위기를 조성하고, 지역사회에 도서관문화 창출의 기회를 도모하고자 합니다.
</div>

<br/>

<h3>독서퀴즈</h3>
<ul class="con">
	<li>기간 : 매월 실시</li>
	<li>장소 : 어린이자료실(2층)</li>
	<li>내용 : 초등학교 저학년(1~3학년), 고학년(4~6학년) 각각의 도서를 선정하여 책 내용 중에서 2문제 출제</li>
	<li>시상 : 문화상품권(정답자 중 추첨으로 4명)</li>
	<li>문의 : 어린이자료실 (☎ 261-8856)</li>
	<li>응모자격 : 초등학생(도서관 홈페이지에 가입한 회원)</li>
</ul>

<br/>

<div class="tabmenu on tab1">
	<ul>
		<li class="active"><a href="#tabCon1">저학년(1~3학년)</a></li>
		<li><a href="#tabCon2">고학년(4~6학년)</a></li>
	</ul>
</div>

<div class="tabCon active" id="tabCon1">
	<div class="quiz_wrapper">											
		<div class="quiz">														
			<h2>2016년12월 독서퀴즈
				<div class="quiz_month">
					<a href=""><i class="fa fa-caret-left"></i><span class="blind">이전달</span></a> 
					<b><span>2016.</span><em>12</em></b>
					<a href=""><i class="fa fa-caret-right"></i><span class="blind">다음달</span></a> 
				</div>		
			</h2>
			<div class="quiz_list">
				<div class="pic"><p><img src="./wdQuiz/upload/Thum_20161201033816758945.JPG" height="154" width="140" alt="여자친구 사귀고 싶어요"/></p></div>
				<div class="data_info">
					<h3>여자친구 사귀고 싶어요</h3>
					<ul>
						<li>
							<span class="item"> 지은이</span>
							<span class="value"><span>하신하</span></span>
						 </li>
						
						 <li>
							<span class="item"> 출판사</span>
							<span class="value"><span>시공주니어</span></span>
						 </li>
						 
						  <li>
							<span class="item"> 청구기호</span>
							<span class="value"><span>아813.8-하58ㅇ</span></span>
						 </li>
						  
						  <li>
							<span class="item"> 줄거리</span>
							<span class="value"><span>사랑에 울고 웃는 모든 아홉 살, 그 아홉 살들 때문에 고민이 한창인 엄마 아빠를 위한 동화 『여자 친구 사귀고 싶어요』. 저자 하신하는 동네 초등학생들의 '연애 상담'을 해 왔다. 이 동화는 그 경험을 바탕으로 초등학교 어린이의 이성 교제를 실감나게 그린 것으로, 고백을 고민하는 어린이, 이성 친구를 사귀고 있는 어린이는 물론 그런 자녀 때문에 고민 중인 부모님들에게 도움을 준다.요즘 초등학생들에게 이성 친구가 있는 것은 흔한 일이지만 이는 즐겁고도 어려운 일이다. 이 책의 주인공인 정우 역시 처음 사귄 여자 친구 때문에 고민하고, 울고, 웃는 남자아이다. 정우는 또래 친구들과 엄마, 아빠의 모습을 지켜보며 ‘처음 사귄 이성 친구’라는 새로운 관계를 나름대로 이해해 가는데….</span></span>
						 </li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<br/>

	<form>
		<div class="poll_item">
			<div class="poll_tit">
				1. 주인공 정우가 '슬기'라는 아이와 사기게 됩니다. 슬기는 머리카락이 길고 분홍색 옷을 자주 입어서 어떤 별명을 가지고 있는데요, 슬기의 별명은 무엇인가요?
			</div>
			<div class="txt-box t1"><!-- 주관식은 t1 / 객관식은 t2 -->
				<label>주관식</label>
				<input type="text" class="text"/>
			</div>
		</div>
		<div class="poll_item">
			<div class="poll_tit">
				2. 주인공 정우가 화해의 악수를 청하려다가 넘어져서 이 친구와 뽀뽀를 하게 되었습니다. 별명이 '핵주먹'인 이 친구의 이름은 무엇인가요?
			</div>
			<div class="txt-box t2">
				<ul>
					<li>
						<input type="radio" name="WD_Answer2" id="WD_Answer2-1" value="1"/>
						<label for="WD_Answer2-1">1. 은지 </label>
					</li>
					<li>
						<input type="radio" name="WD_Answer2" id="WD_Answer2-2" value="2"/>
						<label for="WD_Answer2-2">2. 예은 </label>
					</li>	
					<li>
						<input type="radio" name="WD_Answer2" id="WD_Answer2-3" value="3"/>
						<label for="WD_Answer2-3">3. 정은 </label>
					</li>
					<li>
						<input type="radio" name="WD_Answer2" id="WD_Answer2-4" value="4"/>
						<label for="WD_Answer2-4">4. 정아 </label>
					</li>
       			 </ul>
			</div>
		</div>

		<table class="nohead quiz-info-table">
			<tbody>
				<tr>
					<th>이름</th>
					<td>
						<input id="WD_Name" type="type" name="WD_Name" value="" size="14" class="text"/>
						<span class="info">(퀴즈응모는 한사람당 한번씩만 가능합니다)</span>
					</td>
				</tr>
				<tr>
					<th>학교</th>
					<td><input class="text"/></td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<div class="Addr_search">
							<button class="btn" onclick="wjAddrSearchLayer(1)">우편번호찾기</button>
							<input type="text" size="4" id="wd_post1" title="우편번호 앞자리" name="wd_post1" maxlength="3" class="text" value=""/>
							-
							<input type="text" size="4" id="wd_post2" title="우편번호 뒷자리" name="wd_post2" maxlength="3" class="text" value=""/>
							<div>
								<input type="text" id="wd_addr" title="주소" name="wd_addr" class="text addr3" value=""/>
							</div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</form>

	<br/>

	<div class="btn-area center">
		<a href="" class="btn">확인</a>
		<a href="" class="btn">취소</a>
	</div>
</div>

<div class="tabCon" id="tabCon2">
	2
</div>