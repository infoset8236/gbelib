<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 코드 관리 -->

<%
int leftSize = 400; //왼쪽 컨텐츠 사이즈
int leftSizeInput = leftSize-125; //왼쪽 컨텐츠 검색 input 사이즈
%>

<div class="wrapper wrapper-white">

<div class="page-subtitle">
	<h4>코드 관리</h4>
	<p>파일명 : <code>page03.jsp</code></p>
</div>

<div class="group-menu code-config">
	<div class="tree-area" style="width:<%=leftSize%>px">
		<div class="search">
			<form>
				<fieldset>
					<label class="blind">검색</label>
					<input type="text" class="text" style="width:<%=leftSizeInput%>px"/>
					<button><i class="fa fa-search"></i><span>검색</span></button>
				</fieldset>
			</form>
		</div>
		<div class="tree-box" style="height:537px">
			<div class="tree-menu" id="tree1">
				<%@ include file="tree.jsp"%>
			</div>
		</div>
		<div class="table-wrap">
			<table class="border-all">
				<colgroup>
					<col/>
					<col/>
					<col/>
					<col/>
					<col/>
					<col/>
				</colgroup>
				<thead>
					<tr>
						<th colspan="2">분류 상세정보</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>분류명</th>
						<td><input type="text" class="text"/></td>
					</tr>
					<tr>
						<th>분류코드</th>
						<td><input type="text" style="width:60px" class="text"/> <span>_CG</span></td>
					</tr>
				</tbody>
			</table>
			<div class="button">
				<a href="" class="btn btn5"><i class="fa fa-plus"></i><span>추가</span></a>
				<a href="" class="btn"><i class="fa fa-minus"></i><span>삭제</span></a>
			</div>
		</div>
	</div>
	<div class="set-area" style="margin-right:-<%=leftSize%>px">
		<div style="margin-right:<%=leftSize%>px">
		<div class="infodesk">
			검색 결과 : 3건
			<div class="button">
				<a href="" class="btn btn5"><i class="fa fa-plus"></i><span>추가</span></a>
				<a href="" class="btn"><i class="fa fa-minus"></i><span>삭제</span></a>
			</div>
		</div>
		<div class="table-wrap">

			<div class="table-scroll">
				<table class="type1 center">
					<thead>
						<tr>
							<th style="width:22px">
								<input type="checkbox"/>
							</th>
							<th>코드</th>
							<th>코드명</th>
							<th>정렬순서</th>
							<th>비고 문자</th>
							<th>사용여부</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>데이터가 존재하지 않습니다.</td>
						</tr>
						<!--
						<% for(int i=1;i<77;i++){ %>
						<tr>
							<td style="width:22px"><input type="checkbox"/></td>
							<td>LANG-001</td>
							<td>최고관리자</td>
							<td>1</td>
							<td class="left">MSIE 6.0</td>
							<td>Y</td>
						</tr>
						<% } %>
						-->
					</tbody>
				</table>
			</div>
		</div>
		<div class="alert">
			<ul>
				<li>여러개 나오는 설명 문구를 출력합니다.</li>
				<li>목록을 선택하시면 상세정보를 볼 수 있습니다.</li>
			</ul>
		</div>
		</div>
	</div>
</div>

</div>