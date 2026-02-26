<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<div class="copyright">
		<div class="pull-left">
			&copy; 2016 <strong>WBuilder</strong>. All rights reserved.
		</div>
		<div class="pull-right">
			<a href="http://www.gbelib.kr/gbelib/index.do" target="_blank">대표홈페이지 바로가기</a>
		</div>
	</div>

	<div id="dialog-excel-log" class="dialog-common" title="엑셀 다운로드 사유">
		<form id="excelDownLogReasonForm">
			<input type="hidden" name="menu_url" value="${adminMenuInfo.menu_full_path_name}">
			<input type="hidden" name="excel_down_type" value="excel">
			<table class="type2">
				<colgroup>
					<col width="150" />
					<col width="*"/>
				</colgroup>
				<tbody>
					<tr>
						<th>엑셀 다운로드 사유(<span style="color: red; font-weight: bold;">*</span>)</th>
						<td><input type="text" name="excel_down_reason" class="text" style="width:100%" id="excel_down_reason"/></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>

	<div id="dialog-csv-log" class="dialog-common" title="CSV 다운로드 사유">
		<form id="csvDownLogReasonForm">
			<input type="hidden" name="menu_url" value="${adminMenuInfo.menu_full_path_name}">
			<input type="hidden" name="excel_down_type" value="csv">
			<table class="type2">
				<colgroup>
					<col width="150" />
					<col width="*"/>
				</colgroup>
				<tbody>
					<tr>
						<th>CSV 다운로드 사유(<span style="color: red; font-weight: bold;">*</span>)</th>
						<td><input type="text" name="excel_down_reason" class="text" style="width:100%" id="csv_down_reason"/></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>

	<div id="dialog-file-log" class="dialog-common" title="파일 다운로드 사유">
		<form id="fileDownLogReasonForm">
			<input type="hidden" name="menu_url" value="${adminMenuInfo.menu_full_path_name}">
			<input type="hidden" name="excel_down_type" value="file">
			<table class="type2">
				<colgroup>
					<col width="150" />
					<col width="*"/>
				</colgroup>
			<tbody>
				<tr>
					<th>파일 다운로드 사유(<span style="color: red; font-weight: bold;">*</span>)</th>
					<td><input type="text" name="excel_down_reason" class="text" style="width:100%" id="file_down_reason"/></td>
				</tr>
			</tbody>
			</table>
		</form>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function(){
	//테이블 공통 (tr,th,td 처음과 끝 요소 클래스명 부여)
	$('table tr:first-child').addClass('first');
	$('table tr').each(function(){
		$(this).children('th:first-child,td:first-child').addClass('first');
		$(this).children('th:last-child,td:last-child').addClass('last');
	});

	//달력
	
	//셀렉트 메뉴
	$('.selectmenu-search').select2({
		//셀렉트 메뉴에 검색 기능 사용
	});
	$('.selectmenu').select2({
		//셀렉트 메뉴에 검색 기능 사용 안함
		minimumResultsForSearch: Infinity
	});

	//type1 테이블에서 체크박스 체크 시 highlight
	$('table.type1 tbody tr').each(function(){
		$(this).on('click',function(){
			if($(this).find('input[type="checkbox"]').is(':checked')){
				$(this).addClass('highlight');
			}else{
				$(this).removeClass('highlight');
			}
		});
	});
	
	//메뉴 유형 선택 시 추가 옵션 (cont2.jsp)
	$('.menuType').each(function(i){
		var i = i+1;
		$(this).attr('id','menuType'+i);
	});
	$('.menuTypeBox .radio input').each(function(i){
		var i = i+1;
		$(this).on('click',function(){
			$('.menuType').hide();
			$('#menuType'+i).show();
		});
		if($(this).prop('checked')){
			$('.menuType').hide();
			$('#menuType'+i).show();
		}
	});
});
</script>

</body>
</html>