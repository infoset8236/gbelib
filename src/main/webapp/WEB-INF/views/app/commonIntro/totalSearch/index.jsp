<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet" type="text/css" href="/resources/book/search/css/default.css"/>
<script src="/resources/cms/js/vk/vk_popup.js?vk_skin=flat_gray&vk_layout=ZW Shona"></script>

<script type="text/javascript">
$(function() {
	var article = $('.faq .article');
	article.addClass('hide');
	article.find('.a').slideUp(100);

	$('.faq .article .trigger').click(function(e){
		e.preventDefault();
		var myArticle = $(this).parents('.article:first');
		if(myArticle.hasClass('hide')){
			article.addClass('hide').removeClass('show');
			article.find('.a').slideUp(100);
			myArticle.removeClass('hide').addClass('show');
			myArticle.find('.a').slideDown(100);
		} else {
			myArticle.removeClass('show').addClass('hide');
			myArticle.find('.a').slideUp(100);
		}
	});

	$('.faq .hgroup .trigger').click(function(e){
		e.preventDefault();
		var hidden = $('.faq .article.hide').length;
		if(hidden > 0){
			article.removeClass('hide').addClass('show');
			article.find('.a').slideDown(100);
		} else {
			article.removeClass('show').addClass('hide');
			article.find('.a').slideUp(100);
		}
	});

	$('#do-search').on('click', function(e) {
		if($('#totalSearch input#total_search_type').val() == 'TOTAL' ) {
			if ($('#totalSearch input#search_text').val() == '') {
				alert('검색어를 입력해주세요');
				$('#totalSearch input#search_text').focus();
				return false;
			}
		} else {
			if ( $('#totalSearch input#searchKeyword1').val() != '' || $('#totalSearch input#searchKeyword2').val() != '' || $('#totalSearch input#searchKeyword3').val() != '' || $('#totalSearch input#searchKeyword4').val() != '') {
			}
			else {
				alert('검색어를 입력해주세요');
				$('#totalSearch input#search_text').focus();
				return false;
			}
		}
		$('#search_detail_yn').val('N');
		
		$('#totalSearch #book_more_count').val(1);
		$('#totalSearch #notice_more_count').val(1);
		$('#totalSearch #teach_more_count').val(1);
		$('#totalSearch #total_search_type').val('TOTAL')
		$('#totalSearch').submit();
		//doGetLoad('search.do', serializeCustom($('#librarySearch')));
	});

	/* $('a#toggleDetailSearch').on('click', function(e) {
		e.preventDefault();
		$('.bgArea').addClass('bgGray');
		if ( $(this).attr('keyValue') == 'hide' ) {
			$('#totalSearch input#total_search_type').val('DETAIL');
			$(this).attr('keyValue', 'show');
			$('div#detailSearchArea').show();
		}
		else {
			$('#totalSearch input#total_search_type').val('TOTAL');
			$(this).attr('keyValue', 'hide');
			$('div#detailSearchArea').hide();
		}

	}); */

	$('a#toggleDetailSearch').on('click', function(e) {
		e.preventDefault();
		$('#search_text').val('');
		$('#searchKeyword4').val('');
		$('#kdcSearch').val('');
		$('.bgArea').addClass('bgGray');
		$('#header').css('z-index','1');
		$('#totalSearch input#total_search_type').val('DETAIL');
		$(this).attr('keyValue', 'show');
		$('div#detailSearchArea').show();
		$('a#subjectSearch').focus();
		});

	$('a#closeSearch').on('click', function(e) {
		e.preventDefault();
		$('.bgArea').removeClass('bgGray');
		$('#header').css('z-index','3');
		$('#totalSearch input#total_search_type').val('TOTAL');
		$(this).attr('keyValue', 'hide');
		$('div#detailSearchArea').hide();
		$('a#toggleDetailSearch').focus();
	});


	//키보드로 제어할 수 있도록
	$('a#toggleDetailSearch').on('keydown', function(e) {
		if(e.keyCode==31 || e.keyCode == 13){
			e.preventDefault();
			if ( $(this).attr('keyValue') == 'hide' ) {
				$('#totalSearch input#total_search_type').val('DETAIL');
				$('.bgArea').addClass('bgGray');
				$(this).attr('keyValue', 'show');
				$('div#detailSearchArea').show();
				$('select#searchType1').focus();
			}
			else {
				$('#totalSearch input#total_search_type').val('TOTAL');
				$('.bgArea').removeClass('bgGray');
				$(this).attr('keyValue', 'hide');
				$('div#detailSearchArea').hide();
				$('div.detailSubject a:first').focus();
			}
		}
	});




// 	$('a.goDetail').on('click', function(e) {
// 		e.preventDefault();
// 		$('input#vLoca').val($(this).attr('vLoca'));
// 		$('input#vCtrl').val($(this).attr('vCtrl'));
// 		$('input#vImg').val($(this).attr('vImg'));
// 		$('input#isbn').val($(this).attr('isbn'));
// 		$('input#tid').val($(this).attr('tid'));
// 		var formData = serializeParameter(['vLoca', 'vCtrl', 'vImg', 'isbn', 'tid', 'menu_idx_detail']);
// 		doGetLoad('/${homepage.context_path }/intro/search/detail.do', formData);
// // 		$('form#detailForm').submit();
// 	});

// 	$('a.detail-btn').on('click', function(e) {
// 		$('#teach #homepage_id').val($(this).attr('keyValue'));
// 		$('#teach #group_idx').val($(this).attr('keyValue1'));
// 		$('#teach #category_idx').val($(this).attr('keyValue2'));
// 		$('#teach #teach_idx').val($(this).attr('keyValue3'));
// 		$('#teach #large_category_idx').val($(this).attr('keyValue4'));

// // 		window.open('/${homepage.context_path}/module/teach/detail.do?'+serializeCustom($('form#teach')));
// 		doGetLoad('/${homepage.context_path}/module/teach/detail.do', serializeCustom($('form#teach')));
// 		e.preventDefault();
// 	});

// 	$('a.showSlide').on('click', function(e) {
// 		e.preventDefault();
// 		var bci = $(this).parents('div.bif').next('div.bci');
// 		var toggleState = $(bci).is(':hidden');
// 		if (toggleState) {
// 			$(bci).load('/${homepage.context_path}/intro/search/index_detail.do?vLoca='+$(this).attr('vLoca')+'&vCtrl='+$(this).attr('vCtrl'), function() {
// 				$(bci).slideToggle();
// 			});
// 		} else {
// 			$(bci).slideToggle();
// 		}
// 	});

	$('input#start_date').datepicker({
		maxDate: $('input#end_date').val(),
		onClose: function(selectedDate){
			$('input#end_date').datepicker('option', 'minDate', selectedDate);
		}
	}).datepicker("setDate", new Date());

	$('input#end_date').datepicker({
		minDate: $('input#start_date').val(),
		onClose: function(selectedDate){
			$('input#start_date').datepicker('option', 'maxDate', selectedDate);
		}
	}).datepicker("setDate", new Date());

	$('a.more-btn').on('click', function(e) {
		e.preventDefault();
		var $this = $(this);
		var moreType = $(this).attr('keyValue');

		if ( moreType == 'BOOK' ) {
			$('#totalSearch #book_more_count').val(parseInt($('#totalSearch #book_more_count').val()) + 1);
			$.get('more.do?more_type=BOOK&'+serializeCustom($('#totalSearch')), function(data) {
				console.log($(data))
				$('div#search-results').append($(data));
				moreResultCount(3, moreType, $this);
				$('a.showSlide').off();
				bindingEvents();
			});
		}
		else if ( moreType == 'NOTICE' ) {
			$('#totalSearch #notice_more_count').val(parseInt($('#totalSearch #notice_more_count').val()) + 1);
			$.get('more.do?more_type=NOTICE&'+serializeCustom($('#totalSearch')), function(data) {
				$('tbody.notice-results').append($(data));
				moreResultCount(5, moreType, $this);
				$('a.showSlide').off();
				bindingEvents();
			});
		}
		else if ( moreType == 'TEACH' ) {
			$('#totalSearch #teach_more_count').val(parseInt($('#totalSearch #teach_more_count').val()) + 1);
			$.get('more.do?more_type=TEACH&'+serializeCustom($('#totalSearch')), function(data) {
				$('div.teach-results').append($(data));
				moreResultCount(5, moreType, $this);
				$('a.showSlide').off();
				bindingEvents();
			});
		}

	});
	bindingEvents();
	function bindingEvents() {
		$('a.goDetail').on('click', function(e) {
			e.preventDefault();
			$('input#vLoca').val($(this).attr('vLoca'));
			$('input#vCtrl').val($(this).attr('vCtrl'));
			$('input#vImg').val($(this).attr('vImg'));
			$('input#isbn').val($(this).attr('isbn'));
			$('input#tid').val($(this).attr('tid'));
			var formData = serializeParameter(['vLoca', 'vCtrl', 'vImg', 'isbn', 'tid', 'menu_idx']);
			window.open('/${homepage.context_path }/intro/search/detail.do?'+formData);
//	 		$('form#detailForm').submit();
		});

		$('a.detail-btn').on('click', function(e) {
			$('#teach #homepage_id').val($(this).attr('keyValue'));
			$('#teach #group_idx').val($(this).attr('keyValue1'));
			$('#teach #category_idx').val($(this).attr('keyValue2'));
			$('#teach #teach_idx').val($(this).attr('keyValue3'));
			$('#teach #large_category_idx').val($(this).attr('keyValue4'));

//	 		window.open('/${homepage.context_path}/module/teach/detail.do?'+serializeCustom($('form#teach')));
			doGetLoad('/${homepage.context_path}/module/teach/detail.do', serializeCustom($('form#teach')));
			e.preventDefault();
		});

		$('a.showSlide').on('click', function(e) {
			e.preventDefault();
			var bci = $(this).parents('div.bif').next('div.bci');
			var toggleState = $(bci).is(':hidden');
			if (toggleState) {
				$(bci).load('/${homepage.context_path}/intro/search/index_detail.do?vLoca='+$(this).attr('vLoca')+'&vCtrl='+$(this).attr('vCtrl'), function() {
					$(bci).slideToggle();
				});
			} else {
				$(bci).slideToggle();
			}
		});
	}

	$('a.add').on('click', function(e) {
		var $this = $(this);
		doGetLoad('/${homepage.context_path}/module/teach/student/edit.do',
				'editMode=ADD&homepage_id='+$this.attr('keyValue1')+'&group_idx='+$this.attr('keyValue2')+'&category_idx='+$this.attr('keyValue3')
				+'&teach_idx='+$this.attr('keyValue4')+'&large_category_idx='+$this.attr('keyValue5')+ '&apply_status='+ $this.attr('apply_status')+'&menu_idx='+$('input#menu_idx').val());

		e.preventDefault();
	});

	$('#vk-popup').on('click', function(e) {
		PopupVirtualKeyboard.toggle('search_text','vk');
	});
	
	
	//키보드로 조작 할 수 있도록
	$('#vk-popup').on('keydown', function(e) {
			$('html, body').animate({scrollTop: 0 }, 'fast');  //spacebar 바로 인해 내려간 화면을 다시 올려줌
		if (e.keyCode == 32) {  //space bar keyCode
			PopupVirtualKeyboard.toggle('search_text','vk');
		}
	});

	$('div.detailSubject > ul.box1 > li > a').on('click',function(e){
		if($(this).hasClass('select')){
			$(this).removeClass('select');
		}else{
			
		$('.default').removeClass('select')
		$('div.detailSubject > ul.box1 > li > a').removeClass('open');
		$(this).addClass('select');
		$('.nonSelect').show();
		$('.box2').hide();
		$('.box3').hide();
		$(this).next().show();
		
		}
	});

	$('div.detailSubject > ul.box1 > li > ul.box2 > li > a').on('click',function(e){
		if($(this).hasClass('select')){
			$('div.detailSubject > ul.box1 > li > ul.box2 > li > a').removeClass('select');
			
		}else{
			$(this).addClass('select');
			$(this).parents('ul').prev().addClass('open');
			$('div.detailSubject > ul.box1 > li > ul.box2 > li > a').removeClass('open');
			$('.nonSelect').hide();
			$('.box3').hide();
			$(this).next().show();
		}
	});

	$('div.detailSubject > ul.box1 > li > ul.box2 > li > ul.box3 > li > a').on('click',function(e){
		if($(this).hasClass('select')){
			$('div.detailSubject > ul.box1 > li > ul.box2 > li > ul.box3 > li > a').removeClass('select');
		}else{
			$(this).addClass('select');
			$(this).parents('ul').prev().addClass('open');
		}
		
	});


	<%-- 상세검색 --%>
	$('div#detailSearchArea a#detailDoSearch').on('click', function(e){

		/* if ( $('input#searchKeyword1').val()  == '' && $('input#searchKeyword2').val()  == '' && $('input#searchKeyword3').val() == '' && $('input#searchKeyword4').val() == '') {
			alert('검색어를 입력해주세요');
			$('input#searchKeyword1').focus();
			return false;
		} */
		
		$('#search_detail_yn').val('Y');

		$('#totalSearch #book_more_count').val(1);
		$('#totalSearch #notice_more_count').val(1);
		$('#totalSearch #teach_more_count').val(1);
		$('#totalSearch').submit();

	});

	$('div#detailSearchArea').hide();
	
	<%-- 주제별 검색 --%>
	$(' div.detailSubject ul li ul li ul li a').on('click', function(e){
		$('input#kdcSearch').val($(this).attr('data-kdc'));
		$('#totalSearch input#total_search_type').val('SUBJECT');
		$('#searchKeyword4').val($(this).text());
		$('#search_text').val('');
		$('#totalSearch').submit();
	});

	<%-- 도서, 공지, 강좌 카운터 클릭시 포커스 --%>
	$('.resultFocus').on('click', function(e) {
		e.preventDefault();

		var thisClass = $(this).attr('class');
		var offset;

		if(thisClass == 'resultFocus book') {
			offset = $('#bookScroll').offset();
		} else if(thisClass == 'resultFocus notice') {
			offset = $('#noticeScroll').offset();
		} else if(thisClass == 'resultFocus teach') {
			offset = $('#teachScroll').offset();
		}
		$('html, body').animate({scrollTop : offset.top}, 100);

	});

	$('#toggleLibList').on('click', function(e) {
		$('div#libraryList').slideToggle(function() {
			if (!$('div#libraryList').is(':visible')) {
				$('div#libraryList input:checkbox').prop('checked', false);
				$('div#libraryList input:checkbox[searched=true]').prop('checked', true);
			}
		});
	});

	$('#toggleLibList').on('keydown', function(e) {
		if (e.keyCode == 32) { //space bar keyCode
			$('div#libraryList').slideToggle(function() {
				if (!$('div#libraryList').is(':visible')) {
					$('div#libraryList input:checkbox').prop('checked', false);
					$('div#libraryList input:checkbox[searched=true]').prop('checked', true);
				}
			});
			$('html, body').animate({scrollTop: 0 }, 'fast'); //spacebar 바로 인해 내려간 화면을 다시 올려줌
		}
	});
	$('#checkAll').change(function(e) {
		$('div#libraryList input:checkbox').prop('checked', $(this).prop('checked'));
	});
});

/*
 * +더기보기시 카운트 증가
 */
function moreResultCount(n, moreType, $this) {
	var bookCnt = Number($('#bookCnt').text());
	var noticeCnt = Number($('#noticeCnt').text());
	var teachCnt = Number($('#teachCnt').text());

	var bookTotalCnt = $('#bookTotalCnt').text();
	var noticeTotalCnt = $('#noticeTotalCnt').text();
	var teachTotalCnt = $('#teachTotalCnt').text();

	if ( moreType == 'BOOK' ) {
		if(bookCnt >= bookTotalCnt) {
			$this.css('display', 'none');
		} else {
			$('#bookCnt').html(bookCnt+n);
		}
	} else if ( moreType == 'NOTICE' ) {
		if(noticeCnt >= noticeTotalCnt) {
			$this.css('display', 'none');
		} else {
			$('#noticeCnt').html(noticeCnt+n);
		}
	} else if ( moreType == 'TEACH' ) {
		if(teachCnt >= teachTotalCnt) {
			$this.css('display', 'none');
		} else {
			$('#teachCnt').html(teachCnt+n);
		}
	}

}

</script>
<style>
.faqArea{clear:both;margin:0 auto;border-top:2px solid #3970b8;border-bottom:1px solid #d6d6d6;}
.faq{margin:0;padding:0;list-style:none;}
.faq .q{margin:0;border-top:1px solid #ddd;}
.faq .q a.trigger{display:block;padding:15px;font-weight:bold;color:#333;text-align:left;text-decoration:none !important;font-size:14px;}
.faq .q span{font-size:14px;font-weight:bold;color:#e32c2c;margin-right:5px;}
.faq .hide .q a.trigger{background:none;font-size:14px;}
.faq .q a.trigger:hover{background:#f5fbfd;color:#e32c2c;}
.faq .a{position:relative;margin:0;padding:10px 15px;line-height:1.5;background:#fdfcf5;overflow:hidden;padding-bottom:10px;padding-top:10px;border-top:1px dashed #ddd;}
.faq .a .tit{font-size:14px;font-weight:bold;color:#e32c2c;display:inline-block;width:14px;position:absolute;top:14px;left:15px;}
.faq .a .aContent{margin-left:25px;padding:5px 0;}
.faq .a .aContent p{line-height:20px;}
.faq .a .aContent span, .faq .a .aContent p, .faq .a .aContent strong{font-size:13px !important;}
.faq .goQna{
width:650px;padding:10px 0 10px 35px;margin:10px 0 7px 25px;border:1px dashed #ccc;background:url('/resources/board/img/ico_tip.gif') #fff no-repeat 10px 12px;font-size:13px;font-weight:bold;
-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px;
}
.faq .goQna span{vertical-align:top;margin-right:7px;font-size:13px;}
.faq .q.blue span{color:#2e91ed;}
.faq .q.blue a.trigger:hover,
.faq .q.blue a.trigger:active,
.faq .q.blue a.trigger:focus{color:#2e91ed;}
.faq .a.blue .tit{color:#2e91ed !important;}

#searchResultSpan {float: left;margin-right: 5px;}
#searchResultCount li:not(:last-child) {float: left;margin-right: 1%;}
#searchResultCount li {font-size: 14px;}

@media all and (max-width:1120px){
	#searchResultSpan {float: none;}
}

@media all and (max-width:900px){
	#searchResultCount {margin-bottom: 35px;}
}
/*
@media all and (max-width:570px){
	div.search-form{margin-top: 40px;}
}*/
</style>
<c:set var="replaceStr" value="<span style='color:#f75100;padding:0px;margin:0px;vertical-align: top;'>${totalSearch.search_text}</span>"/>
<c:set var="replaceStr1" value="<span style='color:#f75100;padding:0px;margin:0px;vertical-align: top;'>${totalSearch.searchKeyword1}</span>"/>
<c:set var="replaceStr2" value="<span style='color:#f75100;padding:0px;margin:0px;vertical-align: top;'>${totalSearch.searchKeyword2}</span>"/>
<c:set var="replaceStr3" value="<span style='color:#f75100;padding:0px;margin:0px;vertical-align: top;'>${totalSearch.searchKeyword3}</span>"/>
<c:set var="replaceStr4" value="<span style='color:#f75100;padding:0px;margin:0px;vertical-align: top;'>${totalSearch.searchKeyword4}</span>"/>
<form id="detailForm" action="detail.do" method="get">
	<input type="hidden" id="menu_idx_detail" name="menu_idx" value="${totalSearch.menu_idx }"/>
	<input type="hidden" id="vLoca" name="vLoca"/>
	<input type="hidden" id="vCtrl" name="vCtrl"/>
	<input type="hidden" id="vImg" name="vImg"/>
	<input type="hidden" id="isbn" name="isbn"/>
	<input type="hidden" id="tid" name="tid"/>
	<input type="hidden" name="_csrf" value="${_csrf.token}">
</form>
<form id="teach" action="detail.do" method="post">
	<input type="hidden" id="homepage_id" name="homepage_id" />
	<input type="hidden" id="group_idx" name="group_idx"/>
	<input type="hidden" id="category_idx" name="category_idx"/>
	<input type="hidden" id="teach_idx" name="teach_idx"/>
	<input type="hidden" id="large_category_idx" name="large_category_idx"/>
	<input type="hidden" id="menu_idx_teach" name="menu_idx" value="123"/>
	<input type="hidden" name="_csrf" value="${_csrf.token}">
</form>
<form:form modelAttribute="totalSearch" action="index.do" method="get">
	<form:hidden path="book_more_count"/>
	<form:hidden path="notice_more_count"/>
	<form:hidden path="teach_more_count"/>
	<form:hidden path="total_search_type"/>

	<form:hidden path="menu_idx"/>
	<form:hidden path="search_detail_yn"/>
	
	<div class="search-wrap">
		<c:if test="${result.code eq '0000'}">
			<span id="searchResultSpan">
				검색결과
				<b class="og">
					<c:choose>
					<c:when test="${totalSearch.total_search_type eq 'TOTAL'}">
					<i>"${totalSearch.search_text}"</i>
					</c:when>
					<c:when test="${totalSearch.total_search_type eq 'DETAIL'}">
					<i>"${totalSearch.searchKeyword1}"</i>
					</c:when>
					<c:when test="${totalSearch.total_search_type eq 'SUBJECT'}">
					<i>"${totalSearch.searchKeyword4}"</i>
					</c:when>
					</c:choose>
				</b>
				에 대한
			</span>
			<ul id="searchResultCount">
				<c:if test="${result.totalCnt == '' or result.totalCnt eq null}">
				<c:set value="0" var="result.totalCnt"></c:set>
				</c:if>
				<c:if test="${noticeCount == '' or noticeCount eq null}">
				<c:set value="0" var="noticeCount"></c:set>
				</c:if>
				<c:if test="${teachCount == '' or teachCount eq null}">
				<c:set value="0" var="teachCount"></c:set>
				</c:if>
				<li><a href="#" class="resultFocus book"><b>도서(<span id="bookCnt">${fn:length(result.dsResult)}</span>/<span id="bookTotalCnt">${result.totalCnt}</span>)건</b></a></li>
				<li>|</li>
				<li><a href="#" class="resultFocus notice"><b>공지사항(<span id="noticeCnt">${fn:length(noticeList)}</span>/<span id="noticeTotalCnt">${noticeCount}</span>)건</b></a></li>
				<li>|</li>
				<li><a href="#" class="resultFocus teach"><b>독서/문화 강좌(<span id="teachCnt">${fn:length(teachList)}</span>/<span id="teachTotalCnt">${teachCount}</span>)건</b></a></li>
			</ul>
		</c:if>
		<div class="search-area" style="margin-top:-20px;">
			<a id="toggleLibList">
				<span class="orange"><i class="fa fa-building" aria-hidden="true"></i>타도서관 검색</span>
			</a>
			<a href="#" id="toggleDetailSearch" class="btn btn1" title="상세검색" tabindex="0" style="border-radius:20px;padding:5px 15px;margin-top:-4px;" keyValue="${totalSearch.total_search_type eq 'DETAIL' ? 'show' : 'hide'}">
				<i class="fa fa-search"></i> 상세 검색
			</a>
		</div>
		<div class="search-form" style="margin-bottom:0;">
			<div class="box" style="margin-top: 10px;margin-bottom:0;">
				<div class="box1" style="width: 20%;">
					<select id="search_type" name="search_type" class="selectmenu" style="width:100%;font-size:105%;padding-left:12px;border:0px;">
						<option value="L_TITLEAUTHOR" <c:if test="${totalSearch.search_type eq 'L_TITLEAUTHOR'}">selected="selected"</c:if>>서명or저자</option>
						<option value="L_TITLE" <c:if test="${totalSearch.search_type eq 'L_TITLE'}">selected="selected"</c:if>>서명[전방일치]</option>
						<option value="L_AUTHOR" <c:if test="${totalSearch.search_type eq 'L_AUTHOR'}">selected="selected"</c:if>>저자[전방일치]</option>
						<option value="L_PUBLISHER" <c:if test="${totalSearch.search_type eq 'L_PUBLISHER'}">selected="selected"</c:if>>출판사[완전일치]</option>
						<option value="INDEXSEARCH" <c:if test="${totalSearch.search_type eq 'INDEXSEARCH'}">selected="selected"</c:if>>목차[부분일치]</option>
						<option value="L_ISBN" <c:if test="${totalSearch.search_type eq 'L_ISBN'}">selected="selected"</c:if>>ISBN</option>
					</select>
				</div>
				<div class="b1" style="padding:10px 20px;">
					<label for="search_text" class="blind">검색어를 입력하세요</label>
					<form:input path="search_text" type="text" class="text" placeholder="검색어를 입력하세요." cssStyle="ime-mode:active; width:79%;"/>
				</div>
				<div class="b2">
					<%-- <a id="toggleDetailSearch" class="btn btn1" title="상세검색" tabindex="0" style="position: absolute;top: 0px;left: -91px;padding-top: 11px; padding-bottom:11px; font-size: 19px; line-height:140%;" keyValue="${totalSearch.total_search_type eq 'DETAIL' ? 'show' : 'hide'}">상세 <i class="fa fa-search"></i></a> --%>
					<button id="do-search" title="검색" ><i class="fa fa-search"></i><span class="blind">검색</span></button>
				</div>
			</div>
			<div></div>
			<br/>
			<p style="height:auto">
				<a id="vk-popup" class="btn" title="새창열림" style="line-height:140%" tabindex="0">
				  <i class="fa fa-keyboard-o" style="font-size:19px;color:#777"></i><span>다국어입력기</span>
				</a>
			</p>
		</div>
		<div id="libraryList" class="bbs-notice" style="margin-top:10px;display: none;" >
			<div>
				<form:checkbox id="checkAll" path="libraryCodes" label="전체" value="ALL" />
			</div>
			<div>
				<ul>
					<c:forEach items="${libraryList.data}" var="i">
						<c:if test="${i.lib_manage_code ne '00147004'}">
							<li>
								<c:choose>
									<c:when test="${i.lib_manage_code eq '00000001'}">
										<form:checkbox id="lib_${i.lib_manage_code}" searched="true" path="libraryCodes" label="${fn:escapeXml(i.lib_name)}" value="${fn:escapeXml(i.lib_manage_code)}" title="선택"/>
									</c:when>
									<c:when test="${fn:indexOf(librarySearch.libraryCodes, i.lib_manage_code)!= -1 or fn:indexOf(librarySearch.libraryCodes, 'ALL') != -1}">
										<form:checkbox id="lib_${fn:escapeXml(i.lib_manage_code)}" searched="true" path="libraryCodes" label="${fn:escapeXml(i.lib_name)}" value="${fn:escapeXml(i.lib_manage_code)}" checked="checked" title="선택"/>
									</c:when>
									<c:otherwise>
										<form:checkbox id="lib_${fn:escapeXml(i.lib_manage_code)}" path="libraryCodes" label="${fn:escapeXml(i.lib_name)}" value="${fn:escapeXml(i.lib_manage_code)}" title="선택"/>
									</c:otherwise>
								</c:choose>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="detailSearch" id="detailSearchArea" style="${totalSearch.total_search_type eq 'DETAIL' ? '' : 'display:none;'};top:70px;right:0;">
			<span style="font-size: 25px; font-weight: bold;">상세검색</span>
			
			<ul class="searchList">
				<li style="margin-bottom: 10px">
					<form:select path="ilus_searchType1" class="selectmenu" cssStyle="width:100px" title="검색항목선택1">
						<form:option value="1" label="서명"/>
						<form:option value="2" label="저자"/>
						<form:option value="3" label="출판사"/>
					</form:select>
					<form:input path="searchKeyword1" class="text smalltxt" placeholder="검색어1"/><label for="searchKeyword1" class="blind">검색어1</label>
					<form:select path="logicFunction1" class="selectmenu" cssStyle="width:80px" title="검색조건선택1">
						<form:option value="AND" label="AND"/>
						<form:option value="OR" label="OR"/>
					</form:select>
				</li>
				
				<li style="margin-bottom: 10px">
					<form:select path="ilus_searchType2" class="selectmenu" cssStyle="width:100px" title="검색항목선택2">
						<form:option value="1" label="서명"/>
						<form:option value="2" label="저자"/>
						<form:option value="3" label="출판사"/>
					</form:select>
					<form:input path="searchKeyword2" class="text smalltxt" placeholder="검색어2"/><label for="searchKeyword2" class="blind">검색어2</label>
					<form:select path="logicFunction2" class="selectmenu" cssStyle="width:80px" title="검색조건선택2">
						<form:option value="AND" label="AND"/>
						<form:option value="OR" label="OR"/>
					</form:select>
				</li>
				
				<li style="margin-bottom: 10px">
					<form:select path="ilus_searchType3" class="selectmenu" cssStyle="width:100px" title="검색항목선택3">
						<form:option value="1" label="서명"/>
						<form:option value="2" label="저자"/>
						<form:option value="3" label="출판사"/>
					</form:select>
					<form:input path="searchKeyword3" class="text smalltxt" placeholder="검색어3"/><label for="searchKeyword3" class="blind">검색어3</label>
					<form:select path="logicFunction3" class="selectmenu" cssStyle="width:80px" title="검색조건선택1">
						<form:option value="AND" label="AND"/>
						<form:option value="OR" label="OR"/>
					</form:select>
				</li>
			</ul>
			<a href="#" class="searchBtn" id="detailDoSearch">상세 검색<img src="/resources/board/img/arrow.jpg" alt=""/></a>
			<a href="#" id="closeSearch" style="    position: absolute;    top: 10px;    right: 10px;    margin: 0;"><i class="fa fa-times" aria-hidden="true"></i><span class="blind">닫기</span></a>
		</div>

		<c:set var="showSmain" value="${librarySearch.search_text ne null and librarySearch.search_text ne ''}"></c:set>
		<c:if test="${fn:length(result.dsResult) < 1 and showSmain}">
		<p style="text-align: center;">
			<b>찾으시는 자료가 없습니다. </b>
		</p>
		</c:if>
		<c:set var="hasSearchText" value="${(totalSearch.search_text ne null and totalSearch.search_text ne '') or totalSearch.total_search_type eq 'DETAIL' or totalSearch.total_search_type eq 'SUBJECT'}"></c:set>
		<div class="smain" <c:if test="${!hasSearchText}">style="display:none;"</c:if> >
			<div class="box">
				<h3 id="bookScroll">도서자료&nbsp;<span style="font-size: 14px;font-weight: normal;">[검색결과 ${result.totalCnt}건]</span></h3>
				<div id="search-results" class="search-results" style="border-top:0px;margin-right:0;">
					<c:forEach items="${result.dsResult}" var="i">
						<div class="row">
							<div class="thumb">
								<c:choose>
									<c:when test="${i.IMAGE_URL eq '' or fn:contains(i.IMAGE_URL, 'noimg')}">
										<a href="#"  title="${i.DISP01} 새창열림" vLoca="${fn:escapeXml(i.LIMT06)}" vCtrl="${i.CTRL}" vImg="${fn:escapeXml(i.IMAGE_URL)}" isbn="${i.DISP08}" tid="${i.tid}" class="goDetail noImg">
											<img src="/resources/common/img/noImg.gif" alt="noImage"/>
										</a>
									</c:when>
									<c:otherwise>
										<a href="#" title="${i.DISP01} 새창열림" vLoca="${fn:escapeXml(i.LIMT06)}" vCtrl="${i.CTRL}" vImg="${fn:escapeXml(i.IMAGE_URL)}" isbn="${i.DISP08}" tid="${i.tid}" class="goDetail">
											<img src="${fn:escapeXml(i.IMAGE_URL)}" alt="${fn:escapeXml(i.DISP02)}"/>
										</a>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="box">
								<div class="item">
									<div class="bif">
										<a href="#" title="새창열림" vLoca="${fn:escapeXml(i.LIMT06)}" vCtrl="${fn:escapeXml(i.CTRL)}" vImg="${i.IMAGE_URL}" isbn="${i.DISP08}" tid="${i.tid}" class="name goDetail">
											<c:choose>
												<c:when test="${totalSearch.total_search_type eq 'TOTAL' }">
													${fn:replace(fn:escapeXml(i.DISP01), totalSearch.search_text, replaceStr)}
												</c:when>
												<c:otherwise>
													<c:set var="searchKeyword" value="${fn:escapeXml(i.DISP01)}"/>
													<c:if test="${totalSearch.searchKeyword1 ne '' }">
														<c:set var="searchKeyword" value="${fn:replace(searchKeyword, totalSearch.searchKeyword1, replaceStr1)}"/>
													</c:if>
													<c:if test="${totalSearch.searchKeyword2 ne '' }">
														<c:set var="searchKeyword" value="${fn:replace(searchKeyword, totalSearch.searchKeyword2, replaceStr2)}"/>
													</c:if>
													<c:if test="${totalSearch.searchKeyword3 ne '' }">
														<c:set var="searchKeyword" value="${fn:replace(searchKeyword, totalSearch.searchKeyword3, replaceStr3)}"/>
													</c:if>
													<c:if test="${totalSearch.searchKeyword4 ne '' }">
														<c:set var="searchKeyword" value="${fn:replace(searchKeyword, totalSearch.searchKeyword4, replaceStr4)}"/>
													</c:if>
													${searchKeyword}
												</c:otherwise>
											</c:choose>
										</a>
<!-- 										<p> -->
<%-- 											<c:choose> --%>
<%-- 												<c:when test="${totalSearch.total_search_type eq 'TOTAL' }"> --%>
<%-- 													${fn:replace(i.author, totalSearch.search_text, replaceStr)} --%>
<%-- 												</c:when> --%>
<%-- 												<c:otherwise> --%>
<!-- 													sdfasdf -->
<%-- 													<c:set var="searchKeyword" value="${fn:escapeXml(i.DISP02)}"/> --%>
<%-- 													<c:if test="${totalSearch.searchKeyword1 ne '' }"> --%>
<%-- 														<c:set var="searchKeyword" value="${fn:replace(searchKeyword, totalSearch.searchKeyword1, replaceStr1)}"/> --%>
<%-- 													</c:if> --%>
<%-- 													<c:if test="${totalSearch.searchKeyword2 ne '' }"> --%>
<%-- 														<c:set var="searchKeyword" value="${fn:replace(searchKeyword, totalSearch.searchKeyword2, replaceStr2)}"/> --%>
<%-- 													</c:if> --%>
<%-- 													<c:if test="${totalSearch.searchKeyword3 ne '' }"> --%>
<%-- 														<c:set var="searchKeyword" value="${fn:replace(searchKeyword, totalSearch.searchKeyword3, replaceStr3)}"/> --%>
<%-- 													</c:if> --%>
<%-- 													<c:if test="${totalSearch.searchKeyword4 ne '' }"> --%>
<%-- 														<c:set var="searchKeyword" value="${fn:replace(searchKeyword, totalSearch.searchKeyword4, replaceStr4)}"/> --%>
<%-- 													</c:if> --%>
<%-- 													${searchKeyword} --%>
<%-- 												</c:otherwise> --%>
<%-- 											</c:choose> --%>

<!-- 										</p> -->
										<p>
											<c:choose>
												<c:when test="${totalSearch.total_search_type eq 'TOTAL' }">
													<b style="color:#000;font-weight:600;">저자 :</b> ${fn:replace(fn:escapeXml(i.DISP02), totalSearch.search_text, replaceStr)}<br />
													<b style="color:#000;font-weight:600;">출판사/발행년/소속도서관 :</b> ${fn:escapeXml(i.DISP03)}&nbsp;/ ${fn:escapeXml(i.DISP06)}
												</c:when>
												<c:otherwise>
													<c:set var="searchKeyword" value="${fn:escapeXml(i.DISP02)} ${fn:escapeXml(i.DISP03)}"/>
													<c:if test="${totalSearch.searchKeyword1 ne '' }">
														<c:set var="searchKeyword" value="${fn:replace(searchKeyword, totalSearch.searchKeyword1, replaceStr1)}"/>
													</c:if>
													<c:if test="${totalSearch.searchKeyword2 ne '' }">
														<c:set var="searchKeyword" value="${fn:replace(searchKeyword, totalSearch.searchKeyword2, replaceStr2)}"/>
													</c:if>
													<c:if test="${totalSearch.searchKeyword3 ne '' }">
														<c:set var="searchKeyword" value="${fn:replace(searchKeyword, totalSearch.searchKeyword3, replaceStr3)}"/>
													</c:if>
													<c:if test="${totalSearch.searchKeyword4 ne '' }">
														<c:set var="searchKeyword" value="${fn:replace(searchKeyword, totalSearch.searchKeyword4, replaceStr4)}"/>
													</c:if>
													${searchKeyword}, ${fn:escapeXml(i.DISP06)}
												</c:otherwise>
											</c:choose>
										</p>
										<p>
										<c:forEach var="j" varStatus="status" items="${libraryList.data}">
										<c:if test="${j.lib_manage_code eq i.LIMT06}">${j.lib_name}</c:if>
										</c:forEach>
										</p>
										<div class="stat">
											<a href="#" class="showSlide" vLoca="${fn:escapeXml(i.LIMT06)}" vCtrl="${fn:escapeXml(i.CTRL)}"><span>이용가능여부</span><i class="fa fa-sort-down"></i></a>
											<span>[${fn:escapeXml(i.DISP04)}]</span>
										</div>
									</div>
									<div class="bci" style="display: none;">
										<!-- ajax_area -->
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<br />
				<c:if test="${result.totalCnt > 3 }">
				<div style="text-align: center">
					<a href="" class="btn more-btn" title="도서자료 더보기" keyValue="BOOK"> + 도서자료 더보기</a>
				</div>
				</c:if>
				<br/>
				<h3 id="noticeScroll">공지사항&nbsp;<span style="font-size: 14px;font-weight: normal;">[검색결과 ${noticeCount}건]</span></h3>
				<div>
					<table>
					<caption>공지사항 검색 결과</caption>
						<thead>
							<tr>
								<th class="important">제목</th>
								<th class="important mmm2">작성자</th>
								<th class="mmm1">작성일</th>
								<th class="mmm1">조회수</th>
								<th class="mmm1">파일</th>
							</tr>
						</thead>
						<tbody class="notice-results">
							<c:choose>
								<c:when test="${fn:length(noticeList) > 0}">
									<c:forEach items="${noticeList}" var="j">
										<tr>
											<td class="category important td2">
												<span class="ca ${j.imsi_v_19}">${j.imsi_v_20}</span>
											</td>
											<td class="important left">
												<a target="blank" title="새창열림" href="/${j.imsi_v_19}/board/view.do?menu_idx=${j.imsi_n_2}&board_idx=${j.board_idx}&manage_idx=${j.manage_idx}" gbelib="true" >
													<span>
														<c:choose>
															<c:when test="${totalSearch.total_search_type eq 'TOTAL' }">
																${fn:replace(j.title, totalSearch.search_text, replaceStr)}
															</c:when>
															<c:otherwise>
																<c:set var="searchKeyword" value="${j.title}"/>
																<c:if test="${totalSearch.searchKeyword1 ne '' }">
																	<c:set var="searchKeyword" value="${fn:replace(searchKeyword, totalSearch.searchKeyword1, replaceStr1)}"/>
																</c:if>
																<c:if test="${totalSearch.searchKeyword2 ne '' }">
																	<c:set var="searchKeyword" value="${fn:replace(searchKeyword, totalSearch.searchKeyword2, replaceStr2)}"/>
																</c:if>
																<c:if test="${totalSearch.searchKeyword3 ne '' }">
																	<c:set var="searchKeyword" value="${fn:replace(searchKeyword, totalSearch.searchKeyword3, replaceStr3)}"/>
																</c:if>
																<c:if test="${totalSearch.searchKeyword4 ne '' }">
																	<c:set var="searchKeyword" value="${fn:replace(searchKeyword, totalSearch.searchKeyword4, replaceStr4)}"/>
																</c:if>
																${searchKeyword}
															</c:otherwise>
														</c:choose>

													</span>

													<c:if test="${j.date_gap <= boardManage.new_date_count}"><em class="new">새글</em></c:if>
													<c:if test="${j.comment_count > 0}">
													<span class="comment"><em>댓글</em> <i>${j.comment_count}</i></span>
													</c:if>
												</a>
											</td>
											<td class="num mmm1"><fmt:formatDate value="${j.add_date}" pattern="yyyy.MM.dd" /></td>
											<td class="num mmm1">${j.view_count}</td>
											<td class="file mmm1">
												<c:if test="${j.file_count > 0}">
													<i class="fa fa-floppy-o"></i>
												</c:if>
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="5">데이터가 존재하지 않습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
				<c:if test="${noticeCount > 5}">
				<br/>
				<div style="text-align: center">
					<a href="" class="btn more-btn" title="공지사항 더보기" keyValue="NOTICE"> + 공지사항 더보기</a>
				</div>
				</c:if>
				<br/>

				<div class="blind">
				<h3>자주하는 질문</h3>
				<div class="faqArea">
					<ul  class="faq">
						<c:forEach var="j" varStatus="status" items="${faqList}">
						<li class="article hide">
							<div class="q blue">
								<a class="trigger" href="#"><span>Q.</span> ${fn:replace(j.title, totalSearch.search_text, replaceStr)}</a>
							</div>
							<div class="a">
								<span class="tit">A.</span>
								<div class="aContent">${j.content}</div>
							</div>
						</li>
						</c:forEach>
						<c:if test="${fn:length(faqList) < 1}">
						<li class="article">
							<div class="q">
								<a class="trigger" href="#">데이터가 존재하지 않습니다.</a>
							</div>
						</li>
						</c:if>
					</ul>
				</div>
				<div style="text-align: center">
					<a href="/gbelib/board/index.do?menu_idx=130&manage_idx=522&board_idx=0&rowCount=10&viewPage=1&search_type=title&search_text=${totalSearch.search_text}" title="더보기" class="btn"> + 더보기</a>
				</div>
				</div>

				<br/>
				<h3 id="teachScroll">독서/문화 강좌&nbsp;<span style="font-size: 14px;font-weight: normal;">[검색결과 ${teachCount}건]</span></h3>
				<div class="op_wrap">
					<div class="smain teach-results">
						<c:choose>
							<c:when test="${fn:length(teachList) > 0}">
								<c:forEach items="${teachList}" var="k">
									<div class="item">
										<div class="op_title category">
											<span class="ca ${k.context_path}">${k.homepage_alias}</span><span class="ca ty2">${k.group_name} ${k.category_name}</span>
											<a href="" title="새창열림" class="name detail-btn" keyValue="${k.homepage_id}" keyValue1="${k.group_idx}" keyValue2="${k.category_idx}" keyValue3="${k.teach_idx}" keyValue4="${k.large_category_idx}">
												<c:choose>
													<c:when test="${totalSearch.total_search_type eq 'TOTAL' }">
														${fn:replace(k.teach_name, totalSearch.search_text, replaceStr)}
													</c:when>
													<c:otherwise>
														<c:set var="searchKeyword" value="${k.teach_name}"/>
														<c:if test="${totalSearch.searchKeyword1 ne '' }">
															<c:set var="searchKeyword" value="${fn:replace(searchKeyword, totalSearch.searchKeyword1, replaceStr1)}"/>
														</c:if>
														<c:if test="${totalSearch.searchKeyword2 ne '' }">
															<c:set var="searchKeyword" value="${fn:replace(searchKeyword, totalSearch.searchKeyword2, replaceStr2)}"/>
														</c:if>
														<c:if test="${totalSearch.searchKeyword3 ne '' }">
															<c:set var="searchKeyword" value="${fn:replace(searchKeyword, totalSearch.searchKeyword3, replaceStr3)}"/>
														</c:if>
														<c:if test="${totalSearch.searchKeyword4 ne '' }">
															<c:set var="searchKeyword" value="${fn:replace(searchKeyword, totalSearch.searchKeyword4, replaceStr4)}"/>
														</c:if>
														${searchKeyword}
													</c:otherwise>
												</c:choose>
											</a>
										</div>
										<div class="box">
											<div class="box2">
												<ul class="con2">
													<li class="first"><div><label>접수기간 </label> : ${k.start_join_date} ${k.start_join_time} ~ ${k.end_join_date} ${k.end_join_time}</div></li>
													<li><div><label>장소</label> : ${k.teach_stage}</div></li>
													<li><div><label>강좌일</label> : ${k.start_date} <c:if test="${k.start_date ne k.end_date}">~ ${k.end_date}</c:if> (
																					<c:forEach var="j" varStatus="status_j" items="${k.teach_day_arr}">
																						<c:choose>
																							<c:when test="${j eq '1'}">일</c:when>
																							<c:when test="${j eq '2'}">월</c:when>
																							<c:when test="${j eq '3'}">화</c:when>
																							<c:when test="${j eq '4'}">수</c:when>
																							<c:when test="${j eq '5'}">목</c:when>
																							<c:when test="${j eq '6'}">금</c:when>
																							<c:when test="${j eq '7'}">토</c:when>
																						</c:choose>
																						<c:if test="${!status_j.last}">
																							,
																						</c:if>
																					</c:forEach>
																				) ${k.start_time} ~ ${k.end_time}
													</div></li>
													<li><div><label>강사명</label> : ${k.teacher_name}</div></li>
													<li><div>
										        		<label>강의계획서</label> :
											         	<span class="important td1">
											         		<c:if test="${k.real_file_name ne null and k.real_file_name ne '' }">
											         			<a style="color:#00f" href="download/${k.homepage_id}/${k.group_idx}/${k.category_idx}/${k.teach_idx}.do"><i class="fa fa-floppy-o"></i> ${k.plan_file_name}</a>
											         		</c:if>
										         		</span>
											        </div></li>

													<%-- <li><div><label>강좌설명</label> : ${k.teach_desc}</div></li> --%>
													<li><div class="status">
														<label>모집인원</label> :
														<span><strong>온라인</strong> ${k.teach_limit_count}명 </span>
														<c:if test="${k.teach_offline_count > 0}"><span>, <strong>오프라인</strong> ${k.teach_offline_count}명</span></c:if>
														<c:if test="${k.teach_backup_count > 0}"><span>, (<strong>대기자</strong> ${k.teach_backup_count}명 )</span></c:if>
													</div></li>
													<li><div class="status">
														<label>접수현황</label> :
														<span>
															온라인 :
															<span ${k.teach_join_count > 0 and (k.teach_join_count eq k.teach_limit_count)? 'style="color:red;"' : 'style="color:orange"'}>${k.teach_join_count}</span> / ${k.teach_limit_count}
														</span>
														<c:if test="${k.teach_offline_count > 0}">
															<span>
																오프라인 :
																<span ${k.teach_off_join_count > 0 and (k.teach_off_join_count eq k.teach_offline_count)? 'style="color:red;"' : 'style="color:orange"'}>${k.teach_off_join_count}</span> / ${k.teach_offline_count}
															</span>
														</c:if>
														<c:if test="${k.teach_backup_count > 0}">
															<span>
																(
																대기자 :
																<span ${k.teach_backup_join_count > 0 and (k.teach_backup_join_count eq k.teach_backup_count)? 'style="color:red;"' : 'style="color:orange"'}>${k.teach_backup_join_count}</span> / ${k.teach_backup_count}
																)
															</span>
														</c:if>
													</div></li>
													<li><div><label>모집대상</label> : ${k.teach_target}</div></li>
												</ul>
											</div>
										</div>
										<div class="stat">
											<c:choose>
												<c:when test="${member.login and (member.loginType eq 'HOMEPAGE') and (k.member_key eq member.seq_no)}">
													<a class="btn btn3 teachBook-btn" keyValue1="${k.homepage_id}" keyValue2="${k.group_idx}" keyValue3="${k.category_idx}" keyValue4="${k.teach_idx}" title="출석부" >출석부</a>
												</c:when>
												<c:otherwise>
													<c:choose>
														<c:when test="${k.teach_status eq '0'}">
															<a href="" class="btn btn1 add" keyValue1="${k.homepage_id}" keyValue2="${k.group_idx}" keyValue3="${k.category_idx}" keyValue4="${k.teach_idx}" keyValue5="${k.large_category_idx}" apply_status="1"  title="수강신청" >
															<i class="fa fa-pencil-square-o"></i><span>수강신청 </span></a>
														</c:when>
														<c:when test="${k.teach_status eq '1'}">
															<a href="" class="btn btn1 add" keyValue1="${k.homepage_id}" keyValue2="${k.group_idx}" keyValue3="${k.category_idx}" keyValue4="${k.teach_idx}" keyValue5="${k.large_category_idx}" apply_status="2"  title="대기자신청" >
															<i class="fa fa-pencil-square-o"></i><span>대기자신청</span></a>
														</c:when>
														<c:when test="${k.teach_status eq '2'}">
															<a href="javascript:void(0);" class="btn btn2" style="cursor: default;" title="신청완료" >
															<i class="fa fa-circle-o"></i><span>신청완료</span></a>
														</c:when>
														<c:when test="${k.teach_status eq '3'}">
															<a href="javascript:void(0);" class="btn btn3" style="cursor: default;" title="대기자" >
															<i class="fa fa-sign-in"></i><span>대기자</span></a>
														</c:when>
														<c:when test="${i.teach_status eq '3'}">
															<a href="/${k.homepage_id}/module/teach/applyList.do?menu_idx=${k.menu_idx}" class="btn btn2" title="대기자 신청완료">
															<i class="fa fa-circle-o"></i><span>대기자 신청완료</span></a>
														</c:when>
														<c:when test="${k.teach_status eq '4'}">
															<a href="javascript:void(0);" class="btn" style="cursor: default;" title="접수마감" >
															<span>접수마감</span></a>
														</c:when>
														<c:when test="${k.teach_status eq '5'}">
															<a href="javascript:void(0);" class="btn" style="cursor: default;" title="정원마감" >
															<i class="fa fa-user"></i><span>정원마감</span></a>
														</c:when>
														<c:when test="${k.teach_status eq '6'}">
															<a href="javascript:void(0);" class="btn btn4" style="cursor: default;" title="신청대기" >
															<i class="fa fa-clock-o"></i><span>신청대기</span></a>
														</c:when>
														<%-- <c:when test="${k.teach_status eq '7' }">
															<a href="javascript:void(0);" class="btn btn3" style="cursor: default;">
															<i class="fa fa-times-circle"></i><span>신청불가(취소)</span></a>
														</c:when> --%>
														<c:when test="${k.teach_status eq '9'}">
															<a href="javascript:void(0);" class="btn" style="cursor: default;" title="수강종료" >
															<span>수강종료</span></a>
														</c:when>
													</c:choose>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<div class="nodata">
									<i class="fa fa-frown-o"></i>
									<p>데이터가 존재하지 않습니다.</p>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<c:if test="${teachCount > 5}">
				<div style="text-align: center">
					<a href="" class="btn more-btn" title="강좌 더보기" keyValue="TEACH"> + 강좌 더보기</a>
				</div>
				</c:if>
			</div>
		</div>
	</div>
</form:form>
