<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 통계 -->

<script type="text/javascript">
$(function(){
	//달력(통계 기간 선택 오류 방지)
	$('input#dateStart').datepicker({
		maxDate: $('input#dateEnd').val(), 
		onClose: function(selectedDate){
			$('input#dateEnd').datepicker('option', 'minDate', selectedDate);
		}
	});
	$('input#dateEnd').datepicker({
		minDate: $('input#dateStart').val(), 
		onClose: function(selectedDate){
			$('input#dateStart').datepicker('option', 'maxDate', selectedDate);
		}
	});

	//그래프 관련 (x축 값의 개수에 맞게 width값 자동 계산, 마우스 오버 시 addClass)
	$('.graph').each(function(){
		var gN = $(this).children('li').length;
		var gW = 100/gN;
		$(this).children('li').each(function(e){
			$(this).css('width',gW+'%');
			$(this).on('mouseover',function(){
				$(this).addClass('on');
			});
			$(this).on('mouseleave',function(){
				$(this).removeClass('on');
			});
		});

		//가장 큰 수 addClass most
		var gaugeH = $(this).find('.gauge').map(function(){
			return $(this).height();
		}).get(),
		maxH = Math.max.apply(null, gaugeH);
		$(this).addClass('a'+maxH);
		$(this).find('.gauge').each(function(){
			var thisH = $(this).height();
			if(thisH == maxH){
				$(this).addClass('most');
			}
		});
	});
});
</script>

<div class="wrapper wrapper-white">

<div class="page-subtitle">
	<h4>통계</h4>
	<p>파일명 : <code>page04.jsp</code></p>
</div>

<div class="search">
	<form>
		<fieldset>
			<label class="blind">검색</label>
			<select class="selectmenu-search" style="width:200px">
				<option disabled selected="selected">홈페이지 분류 선택</option>
				<option>분류 전체</option>
				<option>선택 옵션 값 1</option>
				<option>선택 옵션 값 2</option>
				<option>선택 옵션 값 3</option>
				<option>선택 옵션 값 4</option>
				<option>선택 옵션 값 5</option>
			</select>
			
			<input type="text" id="dateStart" style="width:100px" class="text ui-calendar"/>
			<span style="font-size:12px">~</span>
			<input type="text" id="dateEnd" style="width:100px" class="text ui-calendar"/>
			<button><i class="fa fa-search"></i><span>검색</span></button>
			<a href="#" download class="btn btn2"><i class="fa fa-file-excel-o"></i><span>엑셀저장</span></a>
		</fieldset>
	</form>
</div>

<!-- 그래프 아이디어 : 송용주 -->
<!-- wts 보여주면서 java에서 수치 계산하는 거 있다고 해서 wts 메인화면 그래프 참고하여  제작 -->

<!-- 그래프1 여기부터 -->
<div class="graphArea">
	<ul class="num">
		<li>5100</li>
		<li>4250</li>
		<li>3400</li>
		<li>2550</li>
		<li>1700</li>
		<li>850</li>
		<li>0</li>
	</ul>
	<div class="graphWrap">
		<ul class="graph">
			<li>
				<div class="chart-info">
					<div class="barWrap">
						<div class="gauge" style="height:90%;">
							<div class="gauge_ly"><p><em>90</em> 명</p></div>
						</div>
					</div>
					<p class="txt">1시</p>
				</div>
			</li>
			<li>
				<div class="chart-info">
					<div class="barWrap">
						<div class="gauge" style="height:50%;">
							<div class="gauge_ly"><p><em>50</em> 명</p></div>
						</div>
					</div>
					<p class="txt">2시</p>
				</div>
			</li>
			<% for(int p=3; p<11; p++){ %>
			<li>
				<div class="chart-info">
					<div class="barWrap">
						<div class="gauge" style="height:0%;">
							<div class="gauge_ly"><p><em>0</em> 명</p></div>
						</div>
					</div>
					<p class="txt"><%= p %>시</p>
				</div>
			</li>
			<% } %>
			<li>
				<div class="chart-info">
					<div class="barWrap">
						<div class="gauge" style="height:15%;">
							<div class="gauge_ly"><p><em>15</em> 명</p></div>
						</div>
					</div>
					<p class="txt">11시</p>
				</div>
			</li>
			<% for(int o=12; o<25; o++){ %>
			<li>
				<div class="chart-info">
					<div class="barWrap">
						<div class="gauge" style="height:0%;">
							<div class="gauge_ly"><p><em>0</em> 명</p></div>
						</div>
					</div>
					<p class="txt"><%= o %>시</p>
				</div>
			</li>
			<% } %>
		</ul>
	</div>
</div>
<!-- 그래프1 여기까지 -->

<div style="clear:both">&nbsp;</div>
<br/>

<!-- 그래프2 여기부터 -->
<div class="graphArea">
	<ul class="num">
		<li>5100</li>
		<li>4250</li>
		<li>3400</li>
		<li>2550</li>
		<li>1700</li>
		<li>850</li>
		<li>0</li>
	</ul>
	<div class="graphWrap">
		<ul class="graph">
			<li>
				<div class="chart-info">
					<div class="barWrap">
						<div class="gauge gauge1" style="height:60%;">
							<div class="gauge_ly"><p><em>60</em> 명</p></div>
						</div>
						<div class="gauge gauge2" style="height:40%;">
							<div class="gauge_ly"><p><em>40</em> 명</p></div>
						</div>
					</div>
					<p class="txt">1시</p>
				</div>
			</li>
			<li>
				<div class="chart-info">
					<div class="barWrap">
						<div class="gauge gauge1" style="height:80%;">
							<div class="gauge_ly"><p><em>80</em> 명</p></div>
						</div>
						<div class="gauge gauge2" style="height:20%;">
							<div class="gauge_ly"><p><em>20</em> 명</p></div>
						</div>
					</div>
					<p class="txt">2시</p>
				</div>
			</li>
			<% for(int p=3; p<11; p++){ %>
			<li>
				<div class="chart-info">
					<div class="barWrap">
						<div class="gauge gauge1" style="height:0%;">
							<div class="gauge_ly"><p><em>0</em> 명</p></div>
						</div>
						<div class="gauge gauge2" style="height:3%;">
							<div class="gauge_ly"><p><em>3</em> 명</p></div>
						</div>
					</div>
					<p class="txt"><%= p %>시</p>
				</div>
			</li>
			<% } %>
			<li>
				<div class="chart-info">
					<div class="barWrap">
						<div class="gauge gauge1" style="height:15%;">
							<div class="gauge_ly"><p><em>15</em> 명</p></div>
						</div>
						<div class="gauge gauge2" style="height:3%;">
							<div class="gauge_ly"><p><em>3</em> 명</p></div>
						</div>
					</div>
					<p class="txt">11시</p>
				</div>
			</li>
			<% for(int o=12; o<25; o++){ %>
			<li>
				<div class="chart-info">
					<div class="barWrap">
						<div class="gauge gauge1" style="height:1%;">
							<div class="gauge_ly"><p><em>1</em> 명</p></div>
						</div>
						<div class="gauge gauge2" style="height:3%;">
							<div class="gauge_ly"><p><em>3</em> 명</p></div>
						</div>
					</div>
					<p class="txt"><%= o %>시</p>
				</div>
			</li>
			<% } %>
		</ul>
	</div>
	<ul class="graphLegend">
		<li><i style="background:#343434">값1</i><span>접속자 수</span></li>
		<li><i style="background:#78ac39">값2</i><span>로그인 수</span></li>
	</ul>
</div>
<!-- 그래프2 여기까지 -->

<br/>

<!-- 자료 테이블 여기부터 -->
<table class="chartData">
	<thead>
		<tr>
			<th width="200">시간</th>
			<th colspan="2">접속자 수</th>
			<th colspan="2">로그인 수</th>
		</tr>
	</thead>
	<tbody>
		<% for(int j=1;j<24;j++){ %>
		<tr<% if(j%2==0){ %> class="even"<% } %>>
			<td class="left">2016-08-30 <%=String.format("%02d", j)%>:00~<%=String.format("%02d", j+1)%>:00</td>
			<td style="width:250px" class="ratioBar"><p style="width:100%"></p></td>
			<td style="width:150px" class="ratio left">1234 <em>(15%)</em></td>
			<td style="width:250px" class="ratioBar"><p style="width:80%"></p></td>
			<td style="width:150px" class="ratio left">4321 <em>(10%)</em></td>
		</tr>
		<% } %>
	</tbody>
	<tfoot>
		<tr>
			<th>합계</th>
			<td colspan="2">1234 <em>(100%)</em></td>
			<td colspan="2">4321 <em>(100%)</em></td>
		</tr>
	</tfoot>
</table>
<!-- 자료 테이블 여기까지 -->

</div>