<%@ page contentType="text/html;charset=utf-8" %>

<!-- 버튼 모음 -->

<script type="text/javascript">
$(function(){
	//상단 탭메뉴
	$('.container-tabs li:first').addClass('active');
	$('.container-tab:first').show();
	$('.container-tab').each(function(i){
		var i = i+1;
		$(this).attr('id','container_tab_'+i);
	});
	$('.container-tabs a').each(function(i){
		var i = i+1;
		$(this).on('click',function(){
			$('.container-tabs li').removeClass('active');
			$(this).parent().addClass('active');
			$('.container-tab').hide();
			$('#container_tab_'+i).show();
			return false;
		});
	});
	
	//도움말 툴팁
	$( ".help" ).tooltip({
		content: "도움말 툴팁"
	});

	//검색 자동완성
	var availableTags = [
	  "홈페이지이름",
	  "웨일소프트",
	  "대구글로벌교육센터",
	  "도서관홈페이지",
	  "검색홈페이지",
	  "네이버"
	];
	$('#search-tags').autocomplete({
	  source: availableTags
	});

	//탭메뉴
	$('#tabs').tabs();
	
	//아코디언
	$('#accordion').accordion({
		icons: false,
		animate: {
	        duration: 100
	    }
	});
	/* 아코디언 자동 높이 조절 대체 코드 여기부터 */
	$('.ui-accordion-content-active').css({
		'display':'block',
		'height':'100%'
	});
	$('.ui-accordion-content').css('height','100%');
	/* 아코디언 자동 높이 조절 대체 코드 여기까지 */

	//모달창
	$('.dialog-common').dialog({ //모달창 기본 스크립트 선언
		autoOpen: false,
		resizable: false,
		modal: true, 
	    open: function(){
	        $('.ui-widget-overlay').addClass('custom-overlay');
	    },
	    close: function(){
	        $('.ui-widget-overlay').removeClass('custom-overlay');
	    },
		buttons: [
			{
				text: "저장",
				"class": 'btn btn1',
				click: function(){
					$(this).dialog('destroy');
				}
			},{
				text: "취소",
				"class": 'btn',
				click: function(){
					$(this).dialog('destroy');
				}
			}
		]
	});
	$("#dialog-exam1").dialog({ //개별 모달창 띄울 시 선택자 선언 및 크기 값 설정
		width: 700,
		height: 600
	});
	$("#dialog-exam2").dialog({ //개별 모달창 띄울 시 선택자 선언 및 크기 값 설정
		width: 1000,
		height: 800
	});
	$("#dialog-exam3").dialog({ //개별 모달창 띄울 시 선택자 선언 및 크기 값 설정
		width: 700,
		height: 600
	});
	
	//모달창 링크 버튼
	$('#dialog-link1').on('click',function(event){
		$('#dialog-exam1').dialog('open').load('pageDailog.jsp',function(data){
			//alert();
		});
		event.preventDefault();
	});
	$('#dialog-link2').on('click',function(event){
		$('#dialog-exam2').dialog('open').load('pageDailog2.jsp',function(data){
			//alert();
		});
		event.preventDefault();
	});
	$('#dialog-link3').on('click',function(event){
		$('#dialog-exam3').dialog('open').load('pageDailog3.jsp',function(data){
			//alert();
		});
		event.preventDefault();
	});
	
	//달력
	$('.ui-calendar').each(function(){
		var a = $(this).attr('id');
		if(a == null){
			$(this).datepicker({
				//기본달력
			});
		}
	});
});
</script>

<div class="wrapper wrapper-white">
	<div class="page-subtitle">
		<h4>컨텐츠 제목 : h4</h4>
		<p>클래스명 : <code>class="page-subtitle"</code></p>
	</div>
	<div style="line-height:180%">컨텐츠 div : <code>&lt;div class="wrapper wrapper-white"&gt; 내용  &lt;/div&gt;</code><br/>
	컨텐츠 흰색배경 없는 div : <code>&lt;div class="wrapper"&gt; 내용  &lt;/div&gt;</code></div>
</div>

<div class="container-tabbed">
	<ul class="container-tabs">
		<li><a href="">버튼 모음</a></li>
	</ul>
	<div class="container-tab">
		<div class="wrapper wrapper-white">
			<div class="page-subtitle">
				<h4>버튼 모음</h4>
				<p>파일명 : <code>pageButton.jsp</code></p>
			</div>
			
			<div class="checkbox notice">
				<input type="hidden" name="_notice_yn" value="on"/>
				<input id="check_0" name="notice_yn" type="checkbox" value="Y"/>
				<label for="check_0">공지 사용여부</label>
				<em class="info">체크 시 목록 상단에 표시됩니다.</em>
			</div>

			<div class="search">
				<form>
					<fieldset>
						<label class="blind">검색</label>
						<select class="selectmenu"><!-- 셀렉트 메뉴를 한 페이지에 1개만 사용 시 width값 설정 필요 없음 -->
							<option disabled selected="selected">홈페이지 분류 선택</option>
							<option>분류 전체</option>
							<option>선택 옵션 값 1</option>
							<option>선택 옵션 값 2</option>
							<option>선택 옵션 값 3</option>
							<option>선택 옵션 값 4</option>
							<option>선택 옵션 값 5</option>
						</select>
						<input type="text" class="text" id="search-tags"/>
						<button><i class="fa fa-search"></i><span>검색</span></button>
						<a href="" class="btn btn2"><i class="fa fa-file-excel-o"></i><span>엑셀저장</span></a>
					</fieldset>
				</form>
			</div>
			
			<button class="btn">&lt;button&gt;버튼&lt;/button&gt;</button>
			
			<br/><br/>
			
			<div class="btn-group inline">
				<a href="" class="btn left">btn left</a>
				<a href="" class="btn center">btn center</a>
				<a href="" class="btn right">btn right</a>
			</div>
			<a href="" class="btn">btn</a>
			<a href="" class="btn btn1">btn btn1</a>
			<a href="" class="btn btn2">btn btn2</a>
			<a href="" class="btn btn3">btn btn3</a>
			<a href="" class="btn btn4">btn btn4</a>
			<a href="" class="btn btn5">btn btn5</a>
			<br/><br/>
			<div class="button">
				<a href="" class="btn btn5"><i class="fa fa-plus"></i><span>추가</span></a>
				<a href="" class="btn"><i class="fa fa-minus"></i><span>삭제</span></a>
				<a href="" class="btn btn1"><i class="fa fa-pencil"></i><span>글쓰기</span></a>
				<a href="" class="btn btn1"><i class="fa fa-search"></i><span>검색</span></a>
				<a href="" class="btn btn2"><i class="fa fa-file-excel-o"></i><span>엑셀 다운로드</span></a>
			</div>
			<br/><br/>
			<input type="text" class="text ui-calendar"/>
			<select class="selectmenu" style="width:50px">
				<option disabled selected="selected">시</option>
				<% for(int i=0;i<12;i++){ %>
				<option><%=i%></option>
				<% } %>
			</select>
			<select class="selectmenu" style="width:50px">
				<option disabled selected="selected">분</option>
				<% for(int i=0;i<60;i++){ %>
				<option><%=i%></option>
				<% } %>
			</select>
			<input type="text" class="text" placeholder="내용을 입력하세요."/>
			
			<br/><br/>
			
			<h3>아코디언</h3>
			<div id="accordion">
				<h3><i class="fa"></i><span>신규 중분류 코드 추가</span></h3>
				<div>중분류 ID</div>
				<h3><i class="fa"></i><span>기관 코드 관리</span></h3>
				<div>
					그룹ID<br/>
					그룹명<br/>
					상위 대분류
				</div>
				<h3><i class="fa"></i><span>담당자 권한 관리</span></h3>
				<div>
					<label for="accordion-radio1">반월당</label> <input type="checkbox" id="accordion-radio1"/>
				</div>
			</div>
			
			<br/><br/>
			
			<h3>탭메뉴</h3>
			<div id="tabs">
				<ul>
					<li><a href="#tabs-1">일반 설문조사</a></li>
					<li><a href="#tabs-2">만족도 조사</a></li>
				</ul>
				<div id="tabs-1">
					일반 설문조사 양식
				</div>
				<div id="tabs-2">
					만족도 조사 양식
				</div>
			</div>
			
			<br/><br/>
			
			<h3>모달창 (dialog)</h3>
			<p>
				<button id="dialog-link1" class="btn">입력 테이블</button>
				<button id="dialog-link2" class="btn">게시판 필드 설정</button>
				<button id="dialog-link3" class="btn">메뉴별 그룹관리</button>
			</p>
			
			<div id="dialog-exam1" class="dialog-common" title="모달창 1 - pageDailog1.jsp"></div>
			<div id="dialog-exam2" class="dialog-common" title="모달창 2 - pageDailog2.jsp"></div>
			<div id="dialog-exam3" class="dialog-common" title="모달창 3 - pageDailog3.jsp"></div>
			
			<div class="dataTables_paginate">
				<a class="paginate_button previous disabled">이전</a>
				<span>
					<a class="paginate_button current">1</a>
					<a class="paginate_button">2</a>
				</span>
				<a class="paginate_button next">다음</a>
			</div>
		</div>
	</div>
</div>