<%@ page language="java" pageEncoding="utf-8" %>

<div class="tabmenu on tab1">
	<ul>
		<li class="active"><a href="#tabCon1">어린이 프로그램</a></li>
		<li><a href="#tabCon2">청소년 프로그램</a></li>
		<li><a href="#tabCon3">성인 프로그램</a></li>
		<li><a href="#tabCon4">어르신 프로그램</a></li>
		<li><a href="#tabCon5">부모&amp;가족 프로그램</a></li>
	</ul>
</div>

<div class="tabCon active" id="tabCon1">
	<% for(int i=1; i<=3; i++){ %>
	<div class="auto-scroll">
		<table summary="[어린이] 인물로 배우는 한국사 프로그램 신청 안내">
			<colgroup>
				<col style="width:60%" />
				<col />
			</colgroup>
			<thead>
				<tr>
					<th>강좌명 : [어린이] 인물로 배우는 한국사</th>
					<th class="center">
						<a href="" class="btn btn1 add" keyvalue1="h8" keyvalue2="1" keyvalue3="6" apply_status="2">
							<i class="fa fa-pencil-square-o"></i><span>대기자신청</span>
						</a>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>강좌일 : 2016-12-13 ~ 2016-12-29 ( 화 , 수 , 목 )/ 10:00 ~ 12:00</td>
					<td>장소 : 강의장소</td>
				</tr>
				<tr>
					<td>강좌설명 : 한국사를 인물로 배웁니다.</td>
					<td>강사명 : 강사1</td>
				</tr>
				<tr>
					<td>모집대상 : 강의대상</td>
					<td>모집인원 : 10명 (&nbsp;대기자 : 5명&nbsp;)</td>
				</tr>
				<tr>
					<td>접수기간 : 2016-12-05 00:00 ~ 2016-12-31 00:00</td>
					<td>접수현황 : <font style="color:red;">10 / 10</font> &nbsp;(&nbsp;대기자 : <font>0 / 5</font> &nbsp;)</td>
				</tr>
			</tbody>
		</table>
	</div>
	<br/>
	<% } %>
</div>

<div class="tabCon" id="tabCon2">
	청소년 프로그램
</div>

<div class="tabCon" id="tabCon3">
	성인 프로그램
</div>

<div class="tabCon" id="tabCon4">
	어르신 프로그램
</div>

<div class="tabCon" id="tabCon5">
	부모&amp;가족 프로그램
</div>