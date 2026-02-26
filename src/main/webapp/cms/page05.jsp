<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 영역 분할 1:1 -->

<div class="wrapper wrapper-white">

<div class="page-subtitle">
	<h4>코드 관리</h4>
	<p>파일명 : <code>page03.jsp</code></p>
</div>

<div class="column ban">
	<div class="areaL">
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
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="areaR">
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
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

</div>