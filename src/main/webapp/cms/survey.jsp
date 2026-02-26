<%@ page contentType="text/html;charset=utf-8" %>

<div class="wrapper wrapper-white survey">

<div class="brdTop_01">
	<h1 style="padding:0 0 10px">설문항 작성</h1>
</div>
<div class="guide">
	<ul class="list">
		<li><em>[문항작성]</em>에서 문항유형을 선택하면, 해당 설문항을 작성할 수 있습니다.</li>
		<li>문항의 순서를 조정하려면, 순서의 <em>[화살표]</em>를 이용하십시오.</li>
	</ul>
	<div class="inBox">
		<span class="tit"><img src="/resources/cms/survey/img/tit_01.gif" alt="문항작성"></span>
		<div class="list QType">
			<a href="#" class="btn btn1">단일선택형</a>
			<a href="#" class="btn btn1">복수선택형</a>
			<a href="#" class="btn btn1">매트릭스형</a>
			<a href="#" class="btn btn1">서술형</a>
		</div>
		<span class="tit under clrB"><img src="/resources/cms/survey/img/tit_02.gif" alt="부가기능"></span>
		<div class="list AType">
			<a href="#" class="btn btn2">주석문</a>
			<a href="#" class="btn btn2">이미지</a>
		</div>
	</div>
</div>
<form id="quest" action="save.do" method="POST" onsubmit="return false;">
<div class="boardList mysurvey auto-scroll">
	<table class="center" summary="설문항 내용 기입 및 순서 조절과 수정, 삭제를 할 수 있습니다.">
		<caption>설문항 작성 목록</caption>
		<colgroup>
			<col width="50"/>
			<col width="*"/>
			<col width="50"/>
			<col width="60"/>
			<col width="60"/>
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>문항내용</th>
				<th>순서</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th>4</th>
				<td class="left">
					<p class="current_type">서술형문항 (선택)</p>
					<input id="answer_list3.short_answer" name="answer_list[3].short_answer" type="text" value="" size="65">
					<p class="hspace10"></p>
				</td>
				<td class="move">
					<span><a href="#" keyvalue="4" quest_idx_fr="1"><img src="/resources/cms/survey/img/btn_up.gif" alt="위로 이동"></a></span>				
				</td>
				<td><a href="#" keyvalue="4" class="questModify"><img src="/resources/cms/survey/img/btn_edit.gif" alt="수정"></a></td>
				<td><a href="#" keyvalue="4" class="questDelete"><img src="/resources/cms/survey/img/btn_del.gif" alt="삭제"></a></td>
			</tr>
			<tr>
				<th>1</th>
				<td class="left">
					<p class="current_type">복수선택형 문항</p>
					<ul class="answer_list">
					
						<li>
							<input id="questIdx_0_1" name="answer_list[0].quest_idx_list" type="checkbox" value="3"><input type="hidden" name="_answer_list[0].quest_idx_list" value="on">
							<label for="questIdx_0_1">보기1
								
							</label>
						</li>
					
						<li>
							<input id="questIdx_0_2" name="answer_list[0].quest_idx_list" type="checkbox" value="3"><input type="hidden" name="_answer_list[0].quest_idx_list" value="on">
							<label for="questIdx_0_2">보기2
								
							</label>
						</li>
					
						<li>
							<input id="questIdx_0_3" name="answer_list[0].quest_idx_list" type="checkbox" value="3"><input type="hidden" name="_answer_list[0].quest_idx_list" value="on">
							<label for="questIdx_0_3">보기3
								
							</label>
						</li>
					
						<li>
							<input id="questIdx_0_4" name="answer_list[0].quest_idx_list" type="checkbox" value="3"><input type="hidden" name="_answer_list[0].quest_idx_list" value="on">
							<label for="questIdx_0_4">보기4
								
							</label>
						</li>
					
						<li>
							<input id="questIdx_0_5" name="answer_list[0].quest_idx_list" type="checkbox" value="3"><input type="hidden" name="_answer_list[0].quest_idx_list" value="on">
							<label for="questIdx_0_5">보기5
								
							</label>
						</li>
					
					
						<li>
							<input id="questIdx_0_99" name="answer_list[0].quest_idx_list" type="checkbox" value="99"><input type="hidden" name="_answer_list[0].quest_idx_list" value="on">
							<label for="questIdx_0_99">기타</label>
							<input id="answer_list0.short_answer" name="answer_list[0].short_answer" type="text" value="" size="25" maxlength="20">
						</li>
					
					</ul>
				</td>
				<td class="move">
					
					<span><a href="#" keyvalue="2" quest_idx_fr="5"><img src="/resources/cms/survey/img/btn_up.gif" alt="위로 이동"></a></span>
					
					
					<span><a href="#" keyvalue="2" quest_idx_fr="3"><img src="/resources/cms/survey/img/btn_down.gif" alt="아래로 이동"></a></span>
					
				</td>
				<td><a href="#" keyvalue="2" class="questModify"><img src="/resources/cms/survey/img/btn_edit.gif" alt="수정"></a></td>
				<td><a href="#" keyvalue="2" class="questDelete"><img src="/resources/cms/survey/img/btn_del.gif" alt="삭제"></a></td>
			</tr>
		</tbody>
	</table>
</div>
</form>

</div>