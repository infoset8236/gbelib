<%@ page contentType="text/html;charset=utf-8" %>

<script type="text/javascript">
$(function(){
	$('.scroll thead th.edit-btn').append('<p style="width:59px"></p>');
	
	//셀렉트 메뉴
	$('.selectmenu-search').select2({
		//셀렉트 메뉴에 검색 기능 사용
	});
	//검색 자동완성
	var availableTags = [
	  "선택 옵션 값 1",
	  "선택 옵션 값 2",
	  "선택 옵션 값 3",
	  "선택 옵션 값 4",
	  "선택 옵션 값 5"
	];
	$('.tags').autocomplete({
	  source: availableTags
	});
});
</script>

<div class="scroll" style="height:360px">
	<table class="type1 center">
		<thead>
			<tr>
				<th rowspan="2" class="ceGroup">#</th>
				<th colspan="5">공통</th>
				<th colspan="5">글목록</th>
				<th colspan="5">글등록</th>
				<th colspan="2">검색</th>
				<th class="edit-btn"></th>
			</tr>
			<tr>
				<th>컬럼</th>
				<th>컬럼(디폴트)명</th>
				<th>항목명</th>
				<th>컬럼타입</th>
				<th>코드맵핑</th>
				<th>넓이</th>
				<th>최대표시길이</th>
				<th>순서</th>
				<th>사용</th>
				<th>본문링크</th>
				<th>항목넓이</th>
				<th>항목높이</th>
				<th>필수입력</th>
				<th>순서</th>
				<th>답변전용</th>
				<th>순서</th>
				<th>사용</th>
				<th class="edit-btn"></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input name="mtgInput1_0,1" type="checkbox" value="2" /></td>
				<td>TITLE</td>
				<td>게시물제목</td>
				<td>제목</td>
				<td>기본</td>
				<td>선택없음</td>
				<td>0</td>
				<td>27</td>
				<td>1</td>
				<td><input checked="checked" name="mtgInput1_9,1" type="checkbox" value="Y" /></td>
				<td><input checked="checked" name="mtgInput1_10,1" type="checkbox" value="Y" /></td>
				<td>480</td>
				<td>0</td>
				<td><input checked="checked" name="mtgInput1_13,1" type="checkbox" value="Y" /></td>
				<td>0</td>
				<td><input name="mtgInput1_15,1" type="checkbox" value="" /></td>
				<td>1</td>
				<td><input checked="checked" name="mtgInput1_17,1" type="checkbox" value="Y" /></td>
				<td class="edit-btn">
					<div>
						<a href="" class="btn m">수정</a>
						<a href="" class="btn d">삭제</a>
					</div>
				</td>
			</tr>
			<tr>
				<td><input name="mtgInput1_0,2" type="checkbox" value="3" /></td>
				<td>USER_EMAIL</td>
				<td>글쓴이이메일</td>
				<td>이메일</td>
				<td>이메일</td>
				<td>선택없음</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
				<td><input name="mtgInput1_9,2" type="checkbox" value="" /></td>
				<td><input name="mtgInput1_10,2" type="checkbox" value="" /></td>
				<td>0</td>
				<td>0</td>
				<td><input name="mtgInput1_13,2" type="checkbox" value="0" /></td>
				<td>2</td>
				<td><input name="mtgInput1_15,2" type="checkbox" value="" /></td>
				<td>0</td>
				<td><input name="mtgInput1_17,2" type="checkbox" value="" /></td>
				<td class="edit-btn">
					<div>
						<a href="" class="btn m">수정</a>
						<a href="" class="btn d">삭제</a>
					</div>
				</td>
			</tr>
			<tr>
				<td><input name="mtgInput1_0,3" type="checkbox" value="4" /></td>
				<td>USER_NAME</td>
				<td>글쓴이이름</td>
				<td>게시자</td>
				<td>기본</td>
				<td>선택없음</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
				<td><input name="mtgInput1_9,3" type="checkbox" value="" /></td>
				<td><input name="mtgInput1_10,3" type="checkbox" value="" /></td>
				<td>0</td>
				<td>0</td>
				<td><input name="mtgInput1_13,3" type="checkbox" value="0" /></td>
				<td>0</td>
				<td><input name="mtgInput1_15,3" type="checkbox" value="" /></td>
				<td>0</td>
				<td><input name="mtgInput1_17,3" type="checkbox" value="" /></td>
				<td class="edit-btn">
					<div>
						<a href="" class="btn m">수정</a>
						<a href="" class="btn d">삭제</a>
					</div>
				</td>
			</tr>
			<tr>
				<td><input name="mtgInput1_0,4" type="checkbox" value="5" /></td>
				<td>USER_PHONE</td>
				<td>글쓴이전화번호</td>
				<td>전화번호</td>
				<td>전화번호</td>
				<td>선택없음</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
				<td><input name="mtgInput1_9,4" type="checkbox" value="" /></td>
				<td><input name="mtgInput1_10,4" type="checkbox" value="" /></td>
				<td>0</td>
				<td>0</td>
				<td><input name="mtgInput1_13,4" type="checkbox" value="N" /></td>
				<td>3</td>
				<td><input name="mtgInput1_15,4" type="checkbox" value="" /></td>
				<td>0</td>
				<td><input name="mtgInput1_17,4" type="checkbox" value="" /></td>
				<td class="edit-btn">
					<div>
						<a href="" class="btn m">수정</a>
						<a href="" class="btn d">삭제</a>
					</div>
				</td>
			</tr>
			<tr>
				<td><input name="mtgInput1_0,5" type="checkbox" value="6" /></td>
				<td>VIEW_COUNT</td>
				<td>조회수</td>
				<td>조회수</td>
				<td>기본</td>
				<td>선택없음</td>
				<td>50</td>
				<td>0</td>
				<td>3</td>
				<td><input checked="checked" name="mtgInput1_9,5" type="checkbox" value="Y" /></td>
				<td><input name="mtgInput1_10,5" type="checkbox" value="" /></td>
				<td>0</td>
				<td>0</td>
				<td><input name="mtgInput1_13,5" type="checkbox" value="0" /></td>
				<td>0</td>
				<td><input name="mtgInput1_15,5" type="checkbox" value="" /></td>
				<td>0</td>
				<td><input name="mtgInput1_17,5" type="checkbox" value="" /></td>
				<td class="edit-btn">
					<div>
						<a href="" class="btn m">수정</a>
						<a href="" class="btn d">삭제</a>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
</div>

<div class="column-edit">
	<h3>컬럼 설정하기</h3>
	<div style="height:263px">
		<table class="type3 center">
			<tbody>
				<tr>
					<th rowspan="2" class="ceGroup">공통</th>
					<th style="width:17%">컬럼</th>
					<th style="width:17%">컬럼(디폴트)명</th>
					<th style="width:17%">항목명</th>
					<th style="width:17%">컬럼타입</th>
					<th style="width:17%">코드맵핑</th>
				</tr>
				<tr class="gubun">
					<td>
						<select class="selectmenu-search tags">
							<option selected="selected">TITLE</option>
							<option>CONTENT</option>
							<option>PREVIEW_CONTENT</option>
							<option>PREVIEW_IMG</option>
							<option>PREVIEW_IMG_NAME</option>
							<option>USER_NAME</option>
						</select>
					</td>
					<td><input type="text disabled" class="text"/></td>
					<td><input type="text" class="text"/></td>
					<td>
						<select class="selectmenu-search tags">
							<option selected="selected">기본</option>
							<option>이메일</option>
							<option>전화번호</option>
						</select>
					</td>
					<td>
						<div class="checkbox">
							<input type="checkbox" id="check_0" checked="checked"/>
							<label for="check_0">사용함</label>
						</div>
					</td>
				</tr>
				<tr>
					<th rowspan="2" class="ceGroup">글목록</th>
					<th>넓이</th>
					<th>최대표시길이</th>
					<th>순서</th>
					<th>사용</th>
					<th>본문링크</th>
				</tr>
				<tr class="gubun">
					<td><input type="text" class="text"/></td>
					<td><input type="text" class="text"/></td>
					<td><input type="text" class="text"/></td>
					<td>
						<div class="checkbox">
							<input type="checkbox" id="check_0" checked="checked"/>
							<label for="check_0">사용함</label>
						</div>
					</td>
					<td>
						<div class="checkbox">
							<input type="checkbox" id="check_0" checked="checked"/>
							<label for="check_0">사용함</label>
						</div>
					</td>
				</tr>
				<tr>
					<th rowspan="2" class="ceGroup">글등록</th>
					<th>항목넓이</th>
					<th>항목높이</th>
					<th>필수입력</th>
					<th>순서</th>
					<th>답변전용</th>
				</tr>
				<tr class="gubun">
					<td><input type="text" class="text"/></td>
					<td><input type="text" class="text"/></td>
					<td>
						<div class="checkbox">
							<input type="checkbox" id="check_0" checked="checked"/>
							<label for="check_0">사용함</label>
						</div>
					</td>
					<td><input type="text" class="text"/></td>
					<td>
						<div class="checkbox">
							<input type="checkbox" id="check_0" checked="checked"/>
							<label for="check_0">사용함</label>
						</div>
					</td>
				</tr>
				<tr>
					<th rowspan="2" class="ceGroup">검색</th>
					<th>순서</th>
					<th>사용</th>
					<th>&nbsp;</th>
					<th>&nbsp;</th>
					<th>&nbsp;</th>
				</tr>
				<tr class="gubun">
					<td><input type="text" class="text"/></td>
					<td>
						<div class="checkbox">
							<input type="checkbox" id="check_0" checked="checked"/>
							<label for="check_0">사용함</label>
						</div>
					</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>