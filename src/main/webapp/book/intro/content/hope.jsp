<%@ page language="java" pageEncoding="utf-8" %>

<div style="padding:0 0 10px">
	<a id="req-btn" class="btn btn5">신청</a>
</div>
<div class="book-list">
	<% for(int i=1; i<=3; i++){ %>
	<div class="row">
		<!--
		<p class="admin"><input type="checkbox"></p>
		<div class="thumb">
			<a href=""><img src="/resources/book/search/img/113.jpg" alt=""></a>
		</div>
		-->
		<div class="box">
			<div class="item">
				<div class="bif">
					<div class="top">
						<div class="b-title">
							<div class="box"><a href="" class="name">고구려, 김진영 역사소설</a></div>
						</div>
						<div class="control">
							<a href="" class="btn">취소</a>
							<a href="" class="btn">삭제</a>
						</div>
					</div>
					<p class="info"><em>저자 : 김진명</em> <span>/</span> <em>출판사 : 새움</em> <span>/</span> <em>출판년도 : 2016</em></p>
				</div>
				<div class="bci">
					<table summary="신청정보">
						<tbody>
							<tr>
								<th>신청일</th>
								<td>2016-06-23 17:33:26</td>
							</tr>
							<tr>
								<th>처리결과</th>
								<td>선정대상</td>
							</tr>
							<tr>
								<th>비고사항</th>
								<td>ㅁㄴㅇㄻㄴㅇㄻㄴㅇㄹ</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<% } %>
</div>

<form id="reqHopeForm" action="save.do" method="post">
	<input id="editMode" name="editMode" type="hidden" value="ADD"/>
	<table class="edit">
		<tbody><tr>
			<th>제목</th>
			<td><input id="title" name="title" style="width:90%" class="text" type="text" value=""/></td>
		</tr>
		<tr>
			<th>저자</th>
			<td><input id="author" name="author" class="text" type="text" value=""/></td>
		</tr>
		<tr>
			<th>출판사</th>
			<td><input id="publer" name="publer" class="text" type="text" value=""/></td>
		</tr>
		<tr>
			<th>연도</th>
			<td><input id="publer_year" name="publer_year" class="text" type="text" value=""/></td>
		</tr>
		<tr>
			<th>ISBN</th>
			<td><input id="isbn" name="isbn" class="text" type="text" value=""/></td>
		</tr>
		<tr>
			<th>판차</th>
			<td><input id="editon" name="editon" class="text" type="text" value=""/></td>
		</tr>
		<tr>
			<th>비고</th>
			<td><input id="user_remark" name="user_remark" style="width:90%" class="text" type="text" value=""/></td>
		</tr>
	</tbody></table>
</form>

<div class="kbtn txt-center">
	<a href="" class="btn btn5"><span>저장</span></a>
</div>