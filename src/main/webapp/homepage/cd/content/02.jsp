<%@ page language="java" pageEncoding="utf-8" %>

<div class="ui-state-highlight">
	<ul class="con2">
		<li>본인이 신청 후 배정 완료 : <a href="#" class="btn btn3">배정완료</a>, 타인이 신청 후 배정 완료 : <a href="#" class="btn btn5">배정완료</a> 로 표시 됩니다.</li>
		<li><a href="#" class="btn btn3">배정완료</a> 해당 버튼으로 신청 취소 가능합니다.</li>
		<li>신청 기간 : 2017-02-07  ~ 2017-02-08 </li>
		<li>사물함 사용 기간 : 2017-02-09 ~ 2017-02-10</li>		
	</ul>
</div>
<br/>
<div class="infodesk">		
	<div class="button">
		무슨버튼?
	</div>
</div>
<div class="locker_wrap">
	<p class="title">배정 방식</p>
	<ul>
		<li>
			<div class="box">
				<div class="box2">
					<p><span>&nbsp;</span></p>
					<div class="info">
						<strong>사물함1</strong>
						<strong>송용주</strong>
						<a href="#" class="btn btn5">배정완료</a>
					</div>
				</div>
			</div>
		</li>
		<% for(int i=2; i<=30; i++){ %>
		<li>
			<div class="box">
				<div class="box2">
					<p><span>&nbsp;</span></p>
					<div class="info">
						<strong>사물함<%=i%></strong>
					</div>
				</div>
			</div>
		</li>
		<% } %>
	</ul>
</div>