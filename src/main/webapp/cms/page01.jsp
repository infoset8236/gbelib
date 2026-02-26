<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/resources/board/css/default.css"/>

<!-- 기본 테이블 -->

<script type="text/javascript">
$(function(){
	//댓글
	$('.bbs-comment-textarea').on('click',function(){
		$(this).children().focus();
	});
	$('.bbs-comment-textarea textarea').on('focus focusin',function(){
		$(this).parent().addClass('current');
		$(this).parents().find('.checkbox').show();
	});
	$('.bbs-comment-textarea textarea').on('blur focusout',function(){
		$(this).parent().removeClass('current');
	});

	//댓글 수정/삭제 버튼
	$('.dropdown .btn-init').on('click',function(){
		$(this).parent().find('.dropdown-menu').toggle();
		return false;
	});
});
</script>

<div class="wrapper wrapper-white">

<div class="page-subtitle">
	<h4>기본 테이블</h4>
	<p>파일명 : <code>page01.jsp</code></p>
</div>

<div class="infodesk">
	<select class="selectmenu-search" style="width:160px">
		<option disabled="disabled">홈페이지 선택</option>
		<option selected="selected">전체</option>
		<option>글로벌교육센터</option>
		<option>금오공대</option>
		<option>대구광역시교육청</option>
		<option>원자력환경공단</option>
	</select>
	<select class="selectmenu" style="width:80px">
		<option disabled="disabled">처리상태</option>
		<option selected="selected">전체</option>
		<option>대기</option>
		<option>접수</option>
		<option>완료</option>
	</select>
	<span class="bbs-result">총 게시물 : <b>3</b>건</span>
	<div class="button btn-group inline">
		<select class="selectmenu" style="width:110px">
			<option disabled="disabled" selected="selected">10개씩 보기</option>
			<option>20개씩 보기</option>
			<option>30개씩 보기</option>
			<option>40개씩 보기</option>
			<option>50개씩 보기</option>
		</select>
	</div>
</div>

<div class="auto-scroll">
	<table class="bbs center">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>처리상태</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>복구</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="num">678</td>
				<td class="left"><a href="">찾아가는 원어민 프로그램 신청 화면 변경</a></td>
				<td class="process wait"><i class="fa"></i><span>대기</span></td>
				<td>글로벌교육센터</td>
				<td class="num">2016/08/31 09:31</td>
				<td><a href="" class="btn">복구</a></td>
			</tr>
			<tr>
				<td class="num">677</td>
				<td class="left"><a href="">찾아가는 원어민 프로그램 신청 화면 변경</a></td>
				<td class="process wait"><i class="fa"></i><span>대기</span></td>
				<td>글로벌교육센터</td>
				<td class="num">2016/08/31 08:31</td>
				<td><a href="" class="btn">복구</a></td>
			</tr>
			<tr>
				<td class="num">676</td>
				<td class="left"><a href="">찾아가는 원어민 프로그램 신청 화면 변경</a></td>
				<td class="process finish"><i class="fa"></i><span>완료</span></td>
				<td>글로벌교육센터</td>
				<td class="num">2016/08/30 11:01</td>
				<td><a href="" class="btn">복구</a></td>
			</tr>
			<tr>
				<td class="num">676</td>
				<td class="left"><a href="">찾아가는 원어민 프로그램 신청 화면 변경</a></td>
				<td class="process accept"><i class="fa"></i><span>접수</span></td>
				<td>글로벌교육센터</td>
				<td class="num">2016/08/30 11:01</td>
				<td><a href="" class="btn">복구</a></td>
			</tr>
		</tbody>
	</table>
</div>

<br/>

<div class="table-wrap">
	<div class="msg">&nbsp;</div>
	<table class="bbs center">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>처리상태</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>복구</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="num">678</td>
				<td class="left"><a href="">찾아가는 원어민 프로그램 신청 화면 변경</a></td>
				<td class="process wait"><i class="fa"></i><span>대기</span></td>
				<td>글로벌교육센터</td>
				<td class="num">2016/08/31 09:31</td>
				<td><a href="" class="btn">복구</a></td>
			</tr>
			<tr>
				<td class="num">677</td>
				<td class="left"><a href="">찾아가는 원어민 프로그램 신청 화면 변경</a></td>
				<td class="process wait"><i class="fa"></i><span>대기</span></td>
				<td>글로벌교육센터</td>
				<td class="num">2016/08/31 08:31</td>
				<td><a href="" class="btn">복구</a></td>
			</tr>
			<tr>
				<td class="num">676</td>
				<td class="left"><a href="">찾아가는 원어민 프로그램 신청 화면 변경</a></td>
				<td class="process finish"><i class="fa"></i><span>완료</span></td>
				<td>글로벌교육센터</td>
				<td class="num">2016/08/30 11:01</td>
				<td><a href="" class="btn">복구</a></td>
			</tr>
			<tr>
				<td class="num">676</td>
				<td class="left"><a href="">찾아가는 원어민 프로그램 신청 화면 변경</a></td>
				<td class="process accept"><i class="fa"></i><span>접수</span></td>
				<td>글로벌교육센터</td>
				<td class="num">2016/08/30 11:01</td>
				<td><a href="" class="btn">복구</a></td>
			</tr>
		</tbody>
	</table>
</div>

<br/>

<div class="infodesk">
	검색 결과 : 3건
	<div class="button btn-group inline">
		<a href="" class="btn btn5 left"><i class="fa fa-plus"></i><span>추가</span></a>
		<a href="" class="btn right"><i class="fa fa-minus"></i><span>삭제</span></a>
	</div>
</div>

<div class="table-wrap">
	<table class="type1 center">
		<colgroup>
			<col>
			<col>
			<col>
			<col>
			<col>
			<col>
			<col width="200">
			<col width="180">
		</colgroup>
		<thead>
			<tr>
				<th>홈페이지ID</th>
				<th>홈페이지명</th>
				<th>홈페이지유형</th>
				<th>도메인(domain)</th>
				<th>컨텍스트(contextPath)</th>
				<th>폴더</th>
				<th>임시페이지사용</th>
				<th>기능</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="num">h1</td>
				<td>대구시교육청</td>
				<td>type1</td>
				<td>http://www.dge.go.kr</td>
				<td>dge</td>
				<td>dge</td>
				<td>
					임시페이지사용
				
					<br>
					(10.11 06:30 ~ 10.18 07:20)
				
				</td>
				<td>
					<a href="" class="btn" id="dialog-modify" keyvalue="h1">수정</a>
					<a href="" class="btn" id="delete" keyvalue="h1">삭제</a>
					<a href="" class="btn" id="dialog-tempPage" keyvalue="h1">임시 페이지</a>
				</td>
			</tr>
		
			<tr>
				<td class="num">h2</td>
				<td>매니페스토</td>
				<td>type1</td>
				<td>http://www.dge.go.kr</td>
				<td>manifesto</td>
				<td>manifesto</td>
				<td>
					사용안함
				
				</td>
				<td>
					<a href="" class="btn" id="dialog-modify" keyvalue="h2">수정</a>
					<a href="" class="btn" id="delete" keyvalue="h2">삭제</a>
					<a href="" class="btn" id="dialog-tempPage" keyvalue="h2">임시 페이지</a>
				</td>
			</tr>
		
		</tbody>
	</table>
</div>

<br/><br/>

<div class="table-wrap">
	<div class="msg">&nbsp;</div>

	<table class="type1 center">
		<colgroup>
			<col width="25"/>
			<col width="70"/>
			<col width="*"/>
			<col width="120"/>
			<col width="80"/>
			<col width="160"/>
		</colgroup>
		<thead>
			<tr>
				<th>
					<input type="checkbox" id="list-all"/>
				</th>
				<th>항목1</th>
				<th>항목2</th>
				<th>컨텍스트(contextPath)</th>
				<th>항목4</th>
				<!-- <th data-sort="date">항목4</th> Nov 15, 2011 -->
				<th>항목5</th>
			</tr>
		</thead>
		<tbody>
			<% for(int i=1;i<18;i++){ %>
			<tr>
				<td><input type="checkbox"/></td>
				<td><%=i%></td>
				<td>카페 멤버수가 많을 경우 전체 메일 발송이 다소 지연될 수 있습니다.</td>
				<td>글로벌교육센터</td>
				<td>
					<select class="select">
						<option disabled selected="selected">신청중</option>
						<option>신청취소</option>
						<option>신청완료</option>
						<option>수강포기</option>
						<option>수강완료</option>
					</select>
				</td>
				<td>
					<a href="" class="btn">수정</a>
					<a href="" class="btn">삭제</a>
					<a href="" class="btn">이동</a>
				</td>
			</tr>
			<% } %>
			<tr>
				<td><input type="checkbox"/></td>
				<td>9</td>
				<td>asdf a</td>
				<td>asdf f</td>
				<td>bfa</td>
				<td>asdf 1</td>
			</tr>
		</tbody>
	</table>
</div>
<div class="alert">
	테이블 하단에 설명 문구를 출력합니다.
</div>

<div class="dataTables_paginate">
	<a class="paginate_button previous disabled">이전</a>
	<span>
		<a class="paginate_button current">1</a>
		<a class="paginate_button">2</a>
	</span>
	<a class="paginate_button next">다음</a>
</div>

</div>