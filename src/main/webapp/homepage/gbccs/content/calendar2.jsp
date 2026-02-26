<%@ page language="java" pageEncoding="utf-8"%>

<div id="calendar">

	<div class="calendar_box">
		<div class="fL">
			<div class="cal-func">
				<div class="date-view">
					<b class="date">2016-12</b>
					<a id="before-btn" href="#prev" class="btn prev"><i class="fa fa-angle-left"></i><span class="blind">이전달</span></a>
					<a id="next-btn" href="#next" class="btn next"><i class="fa fa-angle-right"></i><span class="blind">다음달</span></a>
			
					<!-- <select class="selectmenu" style="width:80px">
						<option>2016년</option>
						<option>2015년</option>
					</select>
					<select class="selectmenu" style="width:65px">
						<option>12월</option>
						<option>11월</option>
					</select>
					<button class="btn">이동</button> -->
				</div>
				<div class="date-type">
					<span class="type-r"><i></i><em>휴관일</em></span>
					<span class="type-e"><i></i><em>행사일정</em></span>
					<span class="type-m"><i></i><em>영화상영</em></span>
				</div>
			</div>
			<table class="cal-tbl">
				<thead>
					<tr>
						<th class="sun">일</th>
						<th>월</th>
						<th>화</th>
						<th>수</th>
						<th>목</th>
						<th>금</th>
						<th class="sat">토</th>
					</tr>
				</thead>
				<tbody>
					<tr class="noData">
						<td class="sun"><div>&nbsp;</div></td>
						<td><div>&nbsp;</div></td>
						<td><div>&nbsp;</div></td>
						<td><div>&nbsp;</div></td>
						<td><div>1</div></td>
						<td><div>2</div></td>
						<td class="sat"><div>3</div></td>
					</tr>
		
					<tr>
						<td class="sun"><div>4</div></td>
						<td>
							<div>5</div>
							<ul>
								<li title="휴관일">
									<span class="type-r"><i></i><em>휴관일</em></span>
								</li>
							</ul>
						</td>
						<td>
							<div>6</div>
							<ul>
								<li title="걸스카우트 선서식">
									<a href=""><span class="type-e"><i></i><em>걸스카우트</em></span></a>
								</li>
							</ul>
						</td>
						<td><div>7</div></td>
						<td><div>8</div></td>
						<td class="today"><div>9</div></td>
						<td class="sat"><div>10</div></td>
					</tr>
					<tr>
						<td class="sun"><div>11</div></td>
						<td><div>12</div></td>
						<td>
							<div>13</div>
							<ul>
								<li title="걸스카우트 선서식">
									<a href=""><span class="type-e"><i></i><em>걸스카우트</em></span></a>
								</li>
							</ul>
						</td>
						<td><div>14</div></td>
						<td><div>15</div></td>
						<td><div>16</div></td>
						<td class="sat"><div>17</div></td>
					</tr>
					<tr>
						<td class="sun"><div>18</div></td>
						<td><div>19</div></td>
						<td><div>20</div></td>
						<td><div>21</div></td>
						<td><div>22</div></td>
						<td>
							<div>23</div>
							<ul>
								<li title="걸스카우트 선서식">
									<a href=""><span class="type-e"><i></i><em>걸스카우트</em></span></a>
								</li>
							</ul>
						</td>
						<td class="sat"><div>24</div></td>
					</tr>
				</tbody>
			</table>
		</div>

		<div class="fR">
			<h4>금주 주요 행사</h4>
			<table class="center" summary="금주 주요 행사에 해당하는 목록">
				<caption>금주 주요 행사</caption>
				<colgroup>
					<col style="width:70px"/>
					<col/>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">날짜</th>
						<th scope="col">행사명</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>02.20</td>
						<td class="left"><a href="">걸스카우트 선서식</a></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	<hr class="line"/>
	<h4>월간 주요 행사</h4>
	<table class="center" summary="월간 주요 행사에 해당하는 목록">
		<caption>월간 주요 행사</caption>
		<colgroup>
			<col />
			<col style="width:28%" />
			<col />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">날짜</th>
				<th scope="col">행사명</th>
				<th scope="col">주요내용</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td scope="row">2016-06-01</td>
				<td><a href="/pages/commSchedule.do?mode=schduleDetail&amp;menuCode=0303010000&amp;viewGubun=month&amp;year=2016&amp;month=6&amp;scheduleGubun=03&amp;sIdx=2293">걸스카우트 선서식</a></td>
				<td class="left">
				<ul>
					<li>
					<p>주최 : 흥해초등학교</p>
					</li>
					<li>
					<p>행사명 : 걸스카우트 선서식</p>
					</li>
					<li>
					<p>장소 : 다목적홀</p>
					</li>
					<li>
					<p>일자 : 2016.6.1.(수)</p>
					</li>
					<li>
					<p>시간 : 14:00~18:00</p>
					</li>
				</ul>
				</td>
			</tr>
			<tr>
				<td scope="row">2016-06-14</td>
				<td><a href="/pages/commSchedule.do?mode=schduleDetail&amp;menuCode=0303010000&amp;viewGubun=month&amp;year=2016&amp;month=6&amp;scheduleGubun=03&amp;sIdx=2295">찾아가는 계약실무연수</a></td>
				<td class="left">
				<ul>
					<li>
					<p>주최 : 경상북도교육연수원</p>
					</li>
					<li>
					<p>행사명 : 찾아가는 계약실무 연수</p>
					</li>
					<li>
					<p>장소 : 다목적홀</p>
					</li>
					<li>
					<p>일자 : 2016.6.14.(화) ~ 6.15.(목)</p>
					</li>
					<li>
					<p>시간 : 09:00~18:00</p>
					</li>
				</ul>
				</td>
			</tr>
			<tr>
				<td scope="row">2016-06-17</td>
				<td><a href="/pages/commSchedule.do?mode=schduleDetail&amp;menuCode=0303010000&amp;viewGubun=month&amp;year=2016&amp;month=6&amp;scheduleGubun=03&amp;sIdx=2296">제7회 경북중등학생 실용음악제 제1차 예선</a></td>
				<td class="left">
				<ul>
					<li>
					<p>주최 : 경북학생문화회관</p>
					</li>
					<li>
					<p>행사명 : 제7회 경북중등학생 실용음악제 제1차 예선</p>
					</li>
					<li>
					<p>장소 : 다목적홀</p>
					</li>
					<li>
					<p>일자 : 2016.6.17.(금) ~ 6.18.(토)</p>
					</li>
					<li>
					<p>시간 : 09:00~18:00</p>
					</li>
				</ul>
				</td>
			</tr>
		</tbody>
	</table>

	<br/><br/><br/>

	<div class="calendar-view">

		<h2>이달의 행사 자세히 보기</h2>
		<p class="txt-box"><i class="fa fa-calendar"></i> 2015년 12월 12일</p>
		<ul>
			<li><label>행사명 :</label> <span class="type-e"><i></i><em>금호글사항주부독서회 12월모임</em></span></li>
			<li><label>기 간 :</label> <span>2015년 12월 12일</span></li>
			<li><label>내 용 :</label>
				<div class="cont">토론도서: (박완서 산문집) 호미, 박완서</div>
			</li>
		</ul>
	
	</div>

</div>

<div class="button bbs-btn center">
	<a href="" class="btn"><i class="fa fa-reorder"></i><span>목록으로</span></a>
</div>

<script type="text/javascript">
$(function(){
	function cwFunc(){
		var cw = ($('#calendar table.cal-tbl td').width())-8;
		$('#calendar table.cal-tbl td ul').css({'width':cw+'px'}).show();
	}
	cwFunc();
	
	$(window).resize(function(){
		cwFunc();
	});
});
</script>