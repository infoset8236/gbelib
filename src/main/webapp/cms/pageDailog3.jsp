<%@ page contentType="text/html;charset=utf-8" %>

<script type="text/javascript">
var areaH=0;
$(function(){
	$.each($('.column.ban>div'),function(i,e){
		if(areaH < $(e).height()){
			areaH = $(e).height();
		}
	});
	$('.column.ban>div').height(areaH);
});
</script>

<div class="column-edit menu-group">
	<h3 class="center">메뉴명 : 교직원전용메뉴</h3>
	<div class="column ban">
		<div class="areaL">
			<h4>미소속 그룹</h4>
			<select name="" size="21" multiple="multiple">
				<%
				for(int i=1; i<30; i++){
				%>
				<option><%=i%></option>
				<% } %>
			</select>
		</div>
		<div class="areaC">
			<h4>버튼</h4>
			<div class="btn-box txt-center">
				<a href="" class="btn btn1"><span>추가</span><i class="fa fa-arrow-right"></i></a>
				<a href="" class="btn btn5"><i class="fa fa-arrow-left"></i><span>삭제</span></a>
			</div>
		</div>
		<div class="areaR">
			<h4>소속 그룹</h4>
			<select name="" size="21" multiple="multiple">
				<%
				for(int i=1; i<5; i++){
				%>
				<option><%=i%></option>
				<% } %>
			</select>
		</div>
	</div>
</div>