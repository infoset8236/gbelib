<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:choose>
<c:when test="${homepage.context_path eq 'app'}">
<!-- app 시작 -->
<link rel="stylesheet" type="text/css" href="/resources/book/search/css/defaultApp.css"/>

<script src="/resources/cms/js/vk/vk_popup.js?vk_skin=flat_gray&vk_layout=ZW Shona"></script>

<script type="text/javascript">
var authorViewPage = 1;
var authorTotalCnt = '${fn:escapeXml(result.totalCnt)}';
var publisherViewPage = 1;
var publisherTotalCnt = '${fn:escapeXml(result.totalCnt)}';
var formCodeViewPage = 1;
var formCodeTotalCnt = '${fn:escapeXml(result.totalCnt)}';
var yearViewPage = 1;
var yearTotalCnt = '${fn:escapeXml(result.totalCnt)}';

$(function() {
	var ua = window.navigator.userAgent;
	var msie = ua.indexOf("MSIE ");

	if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./))  // If Internet Explorer, return version number
	{
// 	    alert(parseInt(ua.substring(msie + 5, ua.indexOf(".", msie))));
	}
	else  // If another browser, return 0
	{
		$('div#printMsg').hide();
		$('div#btn_print_div').hide();
	}


	$('#do-search').on('click', function(e) {
		if ($('#librarySearch input#search_text').val() == '') {
			alert('검색어를 입력해주세요');
			$('#librarySearch input#search_text').focus();
			return false;
		}
		if (!$('input#sub_search1').is(':checked')) {
			$('form#librarySearch input#allBookListStr').val('');
		}
		$('input#search_type2').val($('select#search_type option:selected').val());
		$('#librarySearch').submit();
		//doGetLoad('search.do', serializeCustom($('#librarySearch')));
	});

// 	$('a.doSearchType').on('click', function(e) {
// 		$('#viewPage').val(1);
// 		$('#search_type').val($(this).attr('keyValue'));
// 		loadIndex();
// 		e.preventDefault();
// 	});

	$('a.doSearchYear').on('click', function(e) {
		$('#search_type2').val($(this).attr('keyValue1'));
		$('#search_year').val($(this).attr('keyValue2'));
		loadIndex();
		e.preventDefault();
	});


	$('a.doSearchFormCode').on('click', function(e) {
		$('#search_form_code').val($(this).attr('keyValue2'));
		$('#facet_num').val($(this).attr('keyValue3'));
		loadIndex();
		e.preventDefault();
	});

	$('a.doSearchWriter').on('click', function(e) {
		$('#search_type2').val($(this).attr('keyValue1'));
		$('#search_athor').val($(this).attr('keyValue2'));
		loadIndex();
		e.preventDefault();
	});

	$('a.doSearchPublisher').on('click', function(e) {
		$('#search_type2').val($(this).attr('keyValue1'));
		$('#search_publisher').val($(this).attr('keyValue2'));
		loadIndex();
		e.preventDefault();
	});

// 	$('a.doSearchPform').on('click', function(e) {
// 		$('#search_type').val($(this).attr('keyValue1'));
// 		$('#search_form_code').val($(this).attr('keyValue2'));
// 		loadIndex();
// 		e.preventDefault();
// 	});

	<%-- 저자 더 보기 --%>
	$('a.moreAuthor').on('click', function(e) {
		e.preventDefault();
		$.ajax({
			url:'table2.do',
			data:'allBookListStr='+$('input#allBookListStr').val() + '&viewPage=' + (authorViewPage+1),
			type:'post',
			success:function(html) {
				$('a.moreAuthor').parent('p').prev('ul').append(html);
				authorViewPage++;
				if ((authorViewPage*5) > authorTotalCnt) {
					$('a.moreAuthor').hide();
				}
			}
		});
	});
	<%-- 출판사 더 보기 --%>
	$('a.morePublisher').on('click', function(e) {
		e.preventDefault();
		$.ajax({
			url:'table3.do',
			data:'allBookListStr='+$('input#allBookListStr').val() + '&viewPage=' + (publisherViewPage+1),
			type:'post',
			success:function(html) {
				$('a.morePublisher').parent('p').prev('ul').append(html);
				publisherViewPage++;
				if ((publisherViewPage*5) > publisherTotalCnt) {
					$('a.morePublisher').hide();
				}
			}
		});
	});

	<%-- 유형 더 보기 --%>
	$('a.moreFormcode').on('click', function(e) {
		e.preventDefault();
		$.ajax({
			url:'table5.do',
			data:'allBookListStr='+$('input#allBookListStr').val() + '&viewPage=' + (formcodeViewPage+1),
			type:'post',
			success:function(html) {
				$('a.moreFormcode').parent('p').prev('ul').append(html);
				formcodeViewPage++;
				if ((formcodeViewPage*5) > formcodeTotalCnt) {
					$('a.moreFormcode').hide();
				}
			}
		});
	});

	<%-- 연도 더 보기 --%>
	$('a.moreYear').on('click', function(e) {
		e.preventDefault();
		$.ajax({
			url:'table4.do',
			data:'allBookListStr='+$('input#allBookListStr').val() + '&viewPage=' + (yearViewPage+1),
			type:'post',
			success:function(html) {
				$('a.moreYear').parent('p').prev('ul').append(html);
				yearViewPage++;
				if ((yearViewPage*5) > yearTotalCnt) {
					$('a.moreYear').hide();
				}
			}
		});
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

	$('#checkAllBook').change(function(e) {
		$('input.checkBook').prop('checked', $(this).prop('checked'));
	});

	$('li.li-group a.bi').on('click', function() {
		$(this).parent('li').toggleClass('active');
	});

	$('a#addMyLib').on('click', function(e) {
		e.preventDefault();
		var len = $('input.checkBook:checked').length;
		if (len < 1) {
			alert('선택된 도서가 없습니다.');
			return false;
		}

		var checkList = $('#librarySearch input[name="print_param"]:checked').clone();
		console.log(checkList);
		$('#storageReqForm').append(checkList);
		$('#storageReqForm input').attr('name', 'strList');
		window.open("/${homepage.context_path}/module/myStorage/viewStorage.do?"+serializeCustom($('form#storageReqForm')), "", "width=350, height=350");
		//내 보관함 이동.
	});

	// No 'Access-Control-Allow-Origin' header is present on the requested resource. Origin 'http://localhost:81' is therefore not allowed access.
	// API 서버에서 추가 작업이 필요함.
	/* function AutoFill(){
		$.ajax({
	        type:'GET',
	        url:'${fn:escapeXml(liboneApiUrl)}',
	        data:'cmd=GETAUTOFILL&searchKeyword=어린',
	        success:function(response){
	            console.log(response);
	        },
	        error:function(e){
	            alert(e.responseText);
	        }
	    });
	} */

	$('#librarySearch #search_text').on('keyup',function(e){
		 switch (e.keyCode) {
         case 8:  // Backspace
         case 9:  // Tab
         case 13: // Enter
         case 37: // Left
         case 38: // Up
         case 39: // Right
         case 40: // Down
         break;

         default:
        	 $.ajax({
     	        type:'GET',
     	        async:true,
     	        url:'autoFill.do',
     	        data:'searchKeyword='+encodeURIComponent($(this).val()),
     	        success:function(response){
     	        	var autofillArr = response.autofillArr;
     	        	var autoFillStr = [];
     	        	$.each(autofillArr, function(i, v) {
     	        		autoFillStr.push('<a class="autoText">' + v.word + '</a>');
     	        	});
     	            $('#autoFill').html(autoFillStr.join(','));
     	            $('a.autoText').on('click', function(e) {
     	            	e.preventDefault();
     	            	$('#librarySearch #search_text').val($(this).text());
     	            	$('#librarySearch #do-search').click();
     	            });
     	        },
     	        error:function(e){
     	        }
     	    });
     	}
	});
	$('a.showSlide').on('click', function(e) {
		e.preventDefault();
		var bci = $(this).parents('div.bif').next('div.bci');
		var toggleState = $(bci).is(':hidden');
		if (toggleState) {
			$(bci).load('index_detail.do?vLoca='+$(this).attr('vLoca')+'&vCtrl='+$(this).attr('vCtrl'), function() {
				$(bci).slideToggle();
			});
		} else {
			$(bci).slideToggle();
		}
	});

	$('a.goDetail').on('click', function(e) {
		e.preventDefault();
		$('input#vLoca').val($(this).attr('vLoca'));
		$('input#vCtrl').val($(this).attr('vCtrl'));
		$('input#vImg').val($(this).attr('vImg'));
		$('input#isbn').val($(this).attr('isbn'));
		$('input#tid').val($(this).attr('tid'));
		var formData = serializeParameter(['vLoca', 'vCtrl', 'vImg', 'isbn', 'tid', 'menu_idx']);
		doGetLoad('detail.do', formData);
// 		$('form#detailForm').submit();
	});

	if ($('input#viewPage').val() != '1') {
		jQuery.ajaxSettings.traditional = true;
		var param = serializeObject($('#librarySearch'));
		var param2 = serializeObject($('#searchTableForm'));
		loadIndex('table');
	}

	function loadIndex() {
		jQuery.ajaxSettings.traditional = true;
		$('input#viewPage').val('1');
		var isSubSearch = $('input#sub_search1').is(':checked');
		$('input#sub_search1').prop('checked', false);
		var param = serializeObject($('#librarySearch'));
		var param2 = serializeObject($('#searchTableForm'));
		$('div#search-results').load('table.do', $.extend(true, param, param2));
		if (isSubSearch) {
			$('input#sub_search1').prop('checked', true);
		}
		$('body').scrollTop(0);
	}

	$('div#search-results img').on('error', function() {
		var $this = $(this);
		$this.attr('src', '/resources/common/img/noImg.gif');
		$this.parent().addClass('noImg');
	});

	$('a#excelDownload').on('click', function(e) {
		e.preventDefault();
		var checkedLength = $('form#librarySearch input[name=print_param]:checked').length;
		if (checkedLength < 1) {
			alert('선택된 도서가 없습니다.');
			return false;
		}
		var clone = $('form#librarySearch input[name=print_param]:checked').clone();
		var clone2 = $('form#librarySearch input[name=libraryCodes]:checked').clone();
		$('form#excelForm').append(clone);
		$('form#excelForm').append(clone2);
		$('form#excelForm input#excel_viewPage').val($('form#librarySearch input#viewPage').val());
		$('form#excelForm input#excel_search_text').val($('form#librarySearch input#search_text').val());
		$('form#excelForm input#excel_search_type2').val($('form#librarySearch input#search_type2').val());
		$('form#excelForm').attr('action', 'excelDownload.do');
		$('form#excelForm').submit();
		$('form#excelForm input[name=print_param]').remove();
		$('form#excelForm input[name=libraryCodes]').remove();

	});

	$('a#csvDownload').on('click', function(e) {
		e.preventDefault();
		var checkedLength = $('form#librarySearch input[name=print_param]:checked').length;
		if (checkedLength < 1) {
			alert('선택된 도서가 없습니다.');
			return false;
		}
		var clone = $('form#librarySearch input[name=print_param]:checked').clone();
		var clone2 = $('form#librarySearch input[name=libraryCodes]:checked').clone();
		$('form#excelForm').append(clone);
		$('form#excelForm').append(clone2);
		$('form#excelForm input#excel_viewPage').val($('form#librarySearch input#viewPage').val());
		$('form#excelForm input#excel_search_text').val($('form#librarySearch input#search_text').val());
		$('form#excelForm input#excel_search_type2').val($('form#librarySearch input#search_type2').val());
		$('form#excelForm').attr('action', 'csvDownload.do');
		$('form#excelForm').submit();
		$('form#excelForm input[name=print_param]').remove();
		$('form#excelForm input[name=libraryCodes]').remove();

	});

	$('div#hotTrend').load('hotTrend.do');
	<c:if test="${empty librarySearch.search_text}">
	$('div#cms_paging').hide();
	//$('div#search-results').load('bestBook.do');
	</c:if>


	$('a#ageLoanBestBtn').on('click', function(e) {
		e.preventDefault();
// 		$('div#ageLoanBest').load('ageLoanBest.do', function( response, status, xhr ) {
// 			$('div#ageLoanBest').dialog();
// 		});
		$('div#ageLoanBest').html(
			'<div style="text-align: center; padding-top: 100px;">'+
			'<img id="loading_img" alt="loading" src="/resources/common/img/viewLoading.gif" />'+
			'<br/><br/>'+
			'대출 순위 불러오는 중'+
			'</div>'
		);
		$('div#ageLoanBest').load('ageLoanBest.do');
		$('div#ageLoanBest').dialog({
			width:1100,
			height:500,
			resizable: true,
	 		modal: true
		});
	});

	if ('${fn:escapeXml(param.search_type)}'=='') {
		$('select#search_type').val('L_TITLEAUTHOR');
	}

	$('a#sort-btn').on('click', function(e) {
		$('#do-search').click();
	});

});
$(document).on("keyup", "input:text[numberOnly]", function() {
	$(this).val($(this).val().replace(/[^0-9]/gi, ""));
});
</script>

<style>
@media (max-width:570px){
	.resve-req, .close-req{padding:5px;border:none;}
	.resve-req i, .close-req  i{display:none;}
}
</style>

<form:form modelAttribute="librarySearch" id="excelForm" action="excelDownload.do" method="post" style="display: none;">
<form:hidden id="excel_search_type2"       path="search_type2" htmlEscape="true"/>
<form:hidden id="excel_search_type"       path="search_type" htmlEscape="true"/>
<form:hidden id="excel_search_text"       path="search_text" htmlEscape="true"/>
<form:hidden id="excel_search_library"    path="search_library" htmlEscape="true"/>
<form:hidden id="excel_search_form_code"  path="search_form_code" htmlEscape="true"/>
<form:hidden id="excel_search_kdc"        path="search_kdc" htmlEscape="true"/>
<form:hidden id="excel_search_athor"      path="search_athor" htmlEscape="true"/>
<form:hidden id="excel_search_year"      path="search_year" htmlEscape="true"/>
<form:hidden id="excel_search_publisher"  path="search_publisher" htmlEscape="true"/>
<form:hidden id="excel_menu_idx"          path="menu_idx" htmlEscape="true"/>
<form:hidden id="excel_viewPage"          path="viewPage" htmlEscape="true"/>
<form:hidden id="excel_excel_type"        path="excel_type" value="SEARCH" htmlEscape="true"/>
</form:form>
<form id="storageReqForm" style="display: none;">
<input type="hidden" name="_csrf" value="${_csrf.token}">
</form>
<form:form modelAttribute="librarySearch" id="detailForm" action="detail.do" method="get">
	<form:hidden path="menu_idx"/>
	<form:hidden path="vLoca"/>
	<form:hidden path="vCtrl"/>
	<form:hidden path="vImg"/>
	<form:hidden path="isbn"/>
	<form:hidden path="tid"/>
</form:form>

<form:form modelAttribute="librarySearch" action="index.do" method="get">
	<form:hidden path="allBookListStr" value="${fn:escapeXml(result.allBookListStr)}"/>
	<form:hidden path="search_type2"/>
	<form:hidden path="search_library"/>
	<form:hidden path="search_form_code"/>
	<form:hidden path="search_kdc"/>
	<form:hidden path="search_year"/>
	<form:hidden path="search_athor"/>
	<form:hidden path="search_publisher"/>
	<form:hidden path="facet_num"/>
	<form:hidden path="menu_idx"/>
	<form:hidden path="viewPage"/>
	<form:hidden path="excel_type"/>
	<div class="search-wrap">
		<div class="search-form">
			<div class="search-area">
				<a id="toggleLibList"><span class="orange"><img src="/resources/homepage/app/img/search_lib.png" alt="도서관선택"><Br/>도서관선택</span></a>
			</div>

			<div class="box">
				<div class="" style="overflow:hidden;background:#fff;border-radius:2px">
					<div class="box1" style="width:120px;">
						<select id="search_type" name="search_type" class="select-box" style="padding:4px 0px 5px 2px;width:100%;padding-left:12px;border:0px;" title="검색분류선택">
							<option value="L_TITLEAUTHOR" <c:if test="${librarySearch.search_type eq 'L_TITLEAUTHOR'}">selected="selected"</c:if>>서명or저자</option>
							<option value="L_TITLE" <c:if test="${librarySearch.search_type eq 'L_TITLE'}">selected="selected"</c:if>>서명[전방일치]</option>
							<option value="L_AUTHOR" <c:if test="${librarySearch.search_type eq 'L_AUTHOR'}">selected="selected"</c:if>>저자[전방일치]</option>
							<option value="L_PUBLISHER" <c:if test="${librarySearch.search_type eq 'L_PUBLISHER'}">selected="selected"</c:if>>출판사[완전일치]</option>
							<option value="INDEXSEARCH" <c:if test="${librarySearch.search_type eq 'INDEXSEARCH'}">selected="selected"</c:if>>목차[부분일치]</option>
							<option value="L_ISBN" <c:if test="${librarySearch.search_type eq 'L_ISBN'}">selected="selected"</c:if>>ISBN</option>
							<option value="L_KEYWORD" <c:if test="${librarySearch.search_type eq 'L_KEYWORD'}">selected="selected"</c:if>>주제어</option>
						</select>
					</div>

					<div class="b1">
						<form:input htmlEscape="true" path="search_text" type="text" class="text2" title="검색어를 입력하세요" placeholder="검색어를 입력하세요." onfocus="PopupVirtualKeyboard.attachInput(this)" cssStyle="ime-mode:active;"/>
					</div>
					<div class="b2">
						<button id="do-search"><img src="/resources/common/img/search-btn.png" alt="검색"><span class="blind">검색</span></button>
					</div>
				</div>
			</div>
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
									<form:checkbox id="lib_${i.lib_manage_code}" searched="true" path="libraryCodes" label="${fn:escapeXml(i.lib_name)}" value="${fn:escapeXml(i.lib_manage_code)}" checked="checked" class="libraryCodes" title="선택"/>
								</c:when>
								<c:when test="${fn:indexOf(librarySearch.libraryCodes, i.lib_manage_code)!= -1 or fn:indexOf(librarySearch.libraryCodes, 'ALL') != -1}">
									<form:checkbox id="lib_${fn:escapeXml(i.lib_manage_code)}" searched="true" path="libraryCodes" label="${fn:escapeXml(i.lib_name)}" value="${fn:escapeXml(i.lib_manage_code)}" checked="checked" class="libraryCodes" title="선택"/>
								</c:when>
								<c:otherwise>
									<form:checkbox id="lib_${fn:escapeXml(i.lib_manage_code)}" path="libraryCodes" label="${fn:escapeXml(i.lib_name)}" value="${fn:escapeXml(i.lib_manage_code)}" class="libraryCodes" title="선택"/>
								</c:otherwise>
							</c:choose>
						</li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="search-info" >
			<c:if test="${result.code eq '0000'}">
				검색결과 '<b class="og"><i>${fn:escapeXml(librarySearch.search_text)}</i></b>'에 대한 <b>${fn:escapeXml(librarySearch.viewPage)}</b>/${fn:escapeXml(result.totalPage)}페이지, 총 <b>${fn:escapeXml(result.totalCnt)}</b>건
			</c:if>
		</div>
		<c:set var="showSmain" value="${(librarySearch.search_text ne null and librarySearch.search_text ne '') or (librarySearch.search_text eq null and librarySearch.search_type eq 'DETAIL')}"></c:set>

		<c:if test="${fn:length(result.dsResult) < 1 and showSmain}">
		<p style="text-align: center;">
			<b>찾으시는 자료가 없습니다. </b>
		</p>
		</c:if>

		<div class="smain">
			<div class="box" style="min-height: 500px;">
				<div id="search-results" class="search-results">
					<c:forEach items="${result.dsResult}" var="i">
						<div class="row">
							<p class="admin"><input name="print_param" id="print_param${status.count }" type="checkbox" class="checkBook" value="${fn:escapeXml(i.LIMT06)}_${fn:escapeXml(i.CTRL)}_ _${fn:escapeXml(i.IMAGE_URL)}"/></p>
							<div class="thumb">
								<c:choose>
									<c:when test="${IMAGE_URL eq '' or fn:contains(i.IMAGE_URL, 'noimg')}">
										<a href="#" vLoca="${fn:escapeXml(i.LIMT06)}" vCtrl="${fn:escapeXml(i.CTRL)}" vImg="${fn:escapeXml(i.IMAGE_URL)}" isbn="${fn:escapeXml(i.DISP08)}" tid="${fn:escapeXml(i.tid)}" class="goDetail noImg">
											<img src="/resources/common/img/noImg.gif" alt="noImage" onError="src='/resources/common/img/noImg.gif';"/>
										</a>
									</c:when>
									<c:otherwise>
										<a href="#" vLoca="${fn:escapeXml(i.LIMT06)}" vCtrl="${fn:escapeXml(i.CTRL)}" vImg="${fn:escapeXml(i.IMAGE_URL)}" isbn="${fn:escapeXml(i.DISP08)}" tid="${fn:escapeXml(i.tid)}" class="goDetail">
											<img src="${fn:escapeXml(i.IMAGE_URL)}" alt="${fn:escapeXml(i.DISP02)}" onError="src='/resources/common/img/noImg.gif';"/>
										</a>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="box">
								<div class="item">
									<div class="bif">
										<c:set var="lib_name"/>
										<c:forEach var="j" varStatus="status" items="${libraryList.data}">
										<c:if test="${j.lib_manage_code eq i.LIMT06}"><c:set var="lib_name" value="${j.lib_name}" /></c:if>
										</c:forEach>
										<c:set var="replaceStr" value="<span style='color:#ffa651'>${fn:escapeXml(librarySearch.search_text)}</span>"/>
										<a href="#" vLoca="${fn:escapeXml(i.LIMT06)}" vCtrl="${fn:escapeXml(i.CTRL)}" vImg="${fn:escapeXml(i.IMAGE_URL)}" isbn="${fn:escapeXml(i.DISP08)}" tid="${fn:escapeXml(i.tid)}" class="name goDetail">${fn:replace(fn:escapeXml(i.DISP01), fn:escapeXml(librarySearch.search_text), replaceStr)}</a>
										<span class="txt">
											<span class="tit">저자: </span>
												<c:set var="DISP02" value="${fn:replace(fn:escapeXml(i.DISP02), fn:escapeXml(librarySearch.search_text), replaceStr)}"></c:set>
												<c:set var="DISP02" value="${fn:replace(DISP02, '[32703m', '')}"></c:set>
												<c:set var="DISP02" value="${fn:replace(DISP02, '[32723m', '')}"></c:set>
												${DISP02}
											</span><span class="bar">|
										</span>
										<span class="txt"><span class="tit">발행처: </span>${fn:replace(fn:escapeXml(i.DISP03), fn:escapeXml(librarySearch.search_text), replaceStr)}</span><span class="bar">|</span>
										<span class="txt"><span class="tit">발행연도: </span>${fn:escapeXml(i.DISP06)}</span><span class="bar">|</span>
										<span class="txt"><span class="tit">자료이용하는 곳: </span>${lib_name}</span><span class="bar">|</span>
										<span class="txt"><span class="tit">청구기호: </span>${fn:escapeXml(i.DISP04)} ${fn:escapeXml(i.callno)}</span>
										<div class="stat">
											<a href="#" class="showSlide" vLoca="${fn:escapeXml(i.LIMT06)}" vCtrl="${fn:escapeXml(i.CTRL)}"><span>이용가능여부</span><i class="fa fa-angle-down" aria-hidden="true"></i></a>
											<c:if test="${not empty i.marc_url}">
											<a href="${i.marc_url}" class="btn" target="_blank" style="margin-left: 10px;"><span>전자책 바로보기</span></a>
											</c:if>
										</div>
									</div>
									<div class="bci" style="display: none;">
										<!-- ajax_area -->
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
					<jsp:include page="/WEB-INF/views/app/cms/common/paging_search.jsp" flush="false" />
				</div>
			</div>
		</div>
	</div>
</form:form>
<div id="vk"></div>
<!-- //app 끝 -->
</c:when>
<c:otherwise>
<style>
.bci table thead th {font-size:13px;}
.bci table tbody td {font-size:13px;}
</style>
<link rel="stylesheet" type="text/css" href="/resources/book/search/css/default.css"/>

<script src="/resources/cms/js/vk/vk_popup.js?vk_skin=flat_gray&vk_layout=ZW Shona"></script>
<script type="text/javascript">
var authorViewPage = 1;
var authorTotalCnt = '${fn:escapeXml(result.totalCnt)}';
var publisherViewPage = 1;
var publisherTotalCnt = '${fn:escapeXml(result.totalCnt)}';
var formCodeViewPage = 1;
var formCodeTotalCnt = '${fn:escapeXml(result.totalCnt)}';
var yearViewPage = 1;
var yearTotalCnt = '${fn:escapeXml(result.totalCnt)}';

$(function() {
	var ua = window.navigator.userAgent;
	var msie = ua.indexOf("MSIE ");

	if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./))  // If Internet Explorer, return version number
	{
// 	    alert(parseInt(ua.substring(msie + 5, ua.indexOf(".", msie))));
	}
	else  // If another browser, return 0
	{
		$('div#printMsg').hide();
		$('div#btn_print_div').hide();
	}

	$('#do-search').on('click', function(e) {
		if ($('#librarySearch input#search_text').val() == '') {
			alert('검색어를 입력해주세요');
			$('#librarySearch input#search_text').focus();
			return false;
		}
		if (!$('input#sub_search1').is(':checked')) {
			$('form#librarySearch input#allBookListStr').val('');
		}
		$('input#search_type2').val($('select#search_type option:selected').val());
		$('#librarySearch').submit();
		//doGetLoad('search.do', serializeCustom($('#librarySearch')));
	});

// 	$('a.doSearchType').on('click', function(e) {
// 		$('#viewPage').val(1);
// 		$('#search_type').val($(this).attr('keyValue'));
// 		loadIndex();
// 		e.preventDefault();
// 	});

	$('a.doSearchYear').on('click', function(e) {
		$('#search_type2').val($(this).attr('keyValue1'));
		$('#search_year').val($(this).attr('keyValue2'));
		loadIndex();
		e.preventDefault();
	});

	$('a.doSearchFormCode').on('click', function(e) {
		$('#search_form_code').val($(this).attr('keyValue2'));
		$('#facet_num').val($(this).attr('keyValue3'));
		loadIndex();
		e.preventDefault();
	});

	$('a.doSearchWriter').on('click', function(e) {
		$('#search_type2').val($(this).attr('keyValue1'));
		$('#search_athor').val($(this).attr('keyValue2'));
		loadIndex();
		e.preventDefault();
	});

	$('a.doSearchPublisher').on('click', function(e) {
		$('#search_type2').val($(this).attr('keyValue1'));
		$('#search_publisher').val($(this).attr('keyValue2'));
		loadIndex();
		e.preventDefault();
	});

// 	$('a.doSearchPform').on('click', function(e) {
// 		$('#search_type').val($(this).attr('keyValue1'));
// 		$('#search_form_code').val($(this).attr('keyValue2'));
// 		loadIndex();
// 		e.preventDefault();
// 	});

	<%-- 저자 더 보기 --%>
	$('a.moreAuthor').on('click', function(e) {
		e.preventDefault();
		$.ajax({
			url:'table2.do',
			data:'allBookListStr='+$('input#allBookListStr').val() + '&viewPage=' + (authorViewPage+1),
			type:'post',
			success:function(html) {
				$('a.moreAuthor').parent('p').prev('ul').append(html);
				authorViewPage++;
				if ((authorViewPage*5) > authorTotalCnt) {
					$('a.moreAuthor').hide();
				}
			}
		});
	});
	<%-- 출판사 더 보기 --%>
	$('a.morePublisher').on('click', function(e) {
		e.preventDefault();
		$.ajax({
			url:'table3.do',
			data:'allBookListStr='+$('input#allBookListStr').val() + '&viewPage=' + (publisherViewPage+1),
			type:'post',
			success:function(html) {
				$('a.morePublisher').parent('p').prev('ul').append(html);
				publisherViewPage++;
				if ((publisherViewPage*5) > publisherTotalCnt) {
					$('a.morePublisher').hide();
				}
			}
		});
	});

	<%-- 유형 더 보기 --%>
	$('a.moreFormcode').on('click', function(e) {
		e.preventDefault();
		$.ajax({
			url:'table5.do',
			data:'allBookListStr='+$('input#allBookListStr').val() + '&viewPage=' + (formcodeViewPage+1),
			type:'post',
			success:function(html) {
				$('a.moreFormcode').parent('p').prev('ul').append(html);
				formcodeViewPage++;
				if ((formcodeViewPage*5) > formcodeTotalCnt) {
					$('a.moreFormcode').hide();
				}
			}
		});
	});

	<%-- 연도 더 보기 --%>
	$('a.moreYear').on('click', function(e) {
		e.preventDefault();
		$.ajax({
			url:'table4.do',
			data:'allBookListStr='+$('input#allBookListStr').val() + '&viewPage=' + (yearViewPage+1),
			type:'post',
			success:function(html) {
				$('a.moreYear').parent('p').prev('ul').append(html);
				yearViewPage++;
				if ((yearViewPage*5) > yearTotalCnt) {
					$('a.moreYear').hide();
				}
			}
		});
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

	$('#checkAllBook').change(function(e) {
		$('input.checkBook').prop('checked', $(this).prop('checked'));
	});

	$('li.li-group a.bi').on('click', function() {
		$(this).parent('li').toggleClass('active');
	});


	$('a#addMyLib').on('click', function(e) {
		e.preventDefault();
		var len = $('input.checkBook:checked').length;
		if (len < 1) {
			alert('선택된 도서가 없습니다.');
			return false;
		}
		<c:if test="${!sessionScope.member.login}">
		alert('로그인 후 이용가능합니다.');
		</c:if>
		<c:if test="${sessionScope.member.login}">
		var book_arr = [];
		var checkList = $('#librarySearch input[name="print_param"]:checked')
		for (const x of checkList) {
			var checkListValue = x.value;
			book_arr.push(checkListValue.replaceAll(",", "^^^"));
		}
		$('#strList').val(book_arr);

		doAjaxPost($('form#basket'));
		</c:if>
	});

$('a#addMyLibOne').on('click', function(e) {
	e.preventDefault();
	<c:if test="${!sessionScope.member.login}">
	alert('로그인 후 이용가능합니다.');
	</c:if>
	<c:if test="${sessionScope.member.login}">
	var bookValue = $(this).attr('value').replaceAll(",", "^^^");
	$('#strList').val(bookValue);
	doAjaxPost($('form#basket'));
	</c:if>
});

	$('a.showSlide').on('click', function(e) {
		e.preventDefault();
		var bci = $(this).parents('div.bif').next('div.bci');
		var toggleState = $(bci).is(':hidden');
		if (toggleState) {
			$(bci).load('index_detail.do?vLoca='+$(this).attr('vLoca')+'&vCtrl='+$(this).attr('vCtrl'), function() {
				$(bci).slideToggle();
			});
		} else {
			$(bci).slideToggle();
		}
	});

	$('a.goDetail').on('click', function(e) {
		e.preventDefault();
		$('input#vLoca').val($(this).attr('vLoca'));
		$('input#vCtrl').val($(this).attr('vCtrl'));
		$('input#vImg').val($(this).attr('vImg'));
		$('input#isbn').val($(this).attr('isbn'));
		$('input#tid').val($(this).attr('tid'));
		var formData = serializeParameter(['vLoca', 'vCtrl', 'vImg', 'isbn', 'tid', 'menu_idx']);
		doGetLoad('detail.do', formData);
// 		$('form#detailForm').submit();
	});

	if ($('input#viewPage').val() != '1') {
		jQuery.ajaxSettings.traditional = true;
		var param = serializeObject($('#librarySearch'));
		var param2 = serializeObject($('#searchTableForm'));
		loadIndex('table');
	}

	function loadIndex() {
		jQuery.ajaxSettings.traditional = true;
		$('input#viewPage').val('1');
		var isSubSearch = $('input#sub_search1').is(':checked');
		$('input#sub_search1').prop('checked', false);
		var param = serializeObject($('#librarySearch'));
		var param2 = serializeObject($('#searchTableForm'));
		$('div#search-results').load('table.do', $.extend(true, param, param2));
		if (isSubSearch) {
			$('input#sub_search1').prop('checked', true);
		}
		$('body').scrollTop(0);
	}

	$('div#search-results img').on('error', function() {
		var $this = $(this);
		$this.attr('src', '/resources/common/img/noImg.gif');
		$this.parent().addClass('noImg');
	});

	$('a#excelDownload').on('click', function(e) {
		e.preventDefault();
		var checkedLength = $('form#librarySearch input[name=print_param]:checked').length;
		if (checkedLength < 1) {
			alert('선택된 도서가 없습니다.');
			return false;
		}
		var clone = $('form#librarySearch input[name=print_param]:checked').clone();
		var clone2 = $('form#librarySearch input[name=libraryCodes]:checked').clone();
		$('form#excelForm').append(clone);
		$('form#excelForm').append(clone2);
		$('form#excelForm input#excel_viewPage').val($('form#librarySearch input#viewPage').val());
		$('form#excelForm input#excel_search_text').val($('form#librarySearch input#search_text').val());
		$('form#excelForm input#excel_search_type2').val($('form#librarySearch input#search_type2').val());
		$('form#excelForm').attr('action', 'excelDownload.do');
		$('form#excelForm').submit();
		$('form#excelForm input[name=print_param]').remove();
		$('form#excelForm input[name=libraryCodes]').remove();

	});

	$('a#csvDownload').on('click', function(e) {
		e.preventDefault();
		var checkedLength = $('form#librarySearch input[name=print_param]:checked').length;
		if (checkedLength < 1) {
			alert('선택된 도서가 없습니다.');
			return false;
		}
		var clone = $('form#librarySearch input[name=print_param]:checked').clone();
		var clone2 = $('form#librarySearch input[name=libraryCodes]:checked').clone();
		$('form#excelForm').append(clone);
		$('form#excelForm').append(clone2);
		$('form#excelForm input#excel_viewPage').val($('form#librarySearch input#viewPage').val());
		$('form#excelForm input#excel_search_text').val($('form#librarySearch input#search_text').val());
		$('form#excelForm input#excel_search_type2').val($('form#librarySearch input#search_type2').val());
		$('form#excelForm').attr('action', 'csvDownload.do');
		$('form#excelForm').submit();
		$('form#excelForm input[name=print_param]').remove();
		$('form#excelForm input[name=libraryCodes]').remove();

	});

	$('div#hotTrend').load('hotTrend.do');
	<c:if test="${empty librarySearch.search_text and librarySearch.search_type ne 'DETAIL'}">
	$('div#cms_paging').hide();
	$('div#search-results').load('bestBook.do');
	</c:if>


	$('a#ageLoanBestBtn').on('click', function(e) {
		e.preventDefault();
// 		$('div#ageLoanBest').load('ageLoanBest.do', function( response, status, xhr ) {
// 			$('div#ageLoanBest').dialog();
// 		});
		$('div#ageLoanBest').html(
			'<div style="text-align: center; padding-top: 100px;">'+
			'<img id="loading_img" alt="loading" src="/resources/common/img/viewLoading.gif" />'+
			'<br/><br/>'+
			'대출 순위 불러오는 중'+
			'</div>'
		);
		$('div#ageLoanBest').load('ageLoanBest.do');
		$('div#ageLoanBest').dialog({
			width:1100,
			height:500,
			resizable: true,
	 		modal: true
		});
	});

	$('a#sort-btn').on('click', function(e) {
		$('#do-search').click();
	});

	if ('${fn:escapeXml(param.search_type)}'=='') {
		$('select#search_type').val('L_TITLEAUTHOR');
	}
	$('a#toggleDetailSearch').on('click', function(e) {
		e.preventDefault();
		$('#search_text').val('');
		$('#searchKeyword4').val('');
		$('#kdcSearch').val('');
		$('.bgArea').addClass('bgGray');
		$('#header').css('z-index','1');
		$(this).attr('keyValue', 'show');
		$('div#detailSearchArea').show();
		$('a#subjectSearch').focus();
	});

	$('a#closeSearch').on('click', function(e) {
		e.preventDefault();
		$('.bgArea').removeClass('bgGray');
		$('#header').css('z-index','3');
		$(this).attr('keyValue', 'hide');
		$('div#detailSearchArea').hide();
		$('a#toggleDetailSearch').focus();
	});

	$('div#detailSearchArea a#detailDoSearch').on('click', function(e){

		$('#search_detail_yn').val('Y');

		$('#librarySearch #book_more_count').val(1);
		$('#librarySearch #notice_more_count').val(1);
		$('#librarySearch #teach_more_count').val(1);
		$('#librarySearch #search_type2').val("DETAIL");
		$('#librarySearch').submit();

	});
});
$(document).on("keyup", "input:text[numberOnly]", function() {
	$(this).val($(this).val().replace(/[^0-9]/gi, ""));
});
</script>
<form id="basket" name="librarySearch" action="/${homepage.context_path}/module/bookBasket/save.do" method="post" onsubmit="return false;">
<input type="hidden" name="editMode" value="ADD"/>
<input type="hidden" id="strList" name="strList">
<input type="hidden" name="homepage_id">
</form>

<form:form modelAttribute="librarySearch" id="excelForm" action="excelDownload.do" method="post" style="display: none;">
<form:hidden id="excel_search_type2"       path="search_type2" htmlEscape="true"/>
<form:hidden id="excel_search_type"       path="search_type" htmlEscape="true"/>
<form:hidden id="excel_search_text"       path="search_text" htmlEscape="true"/>
<form:hidden id="excel_search_library"    path="search_library" htmlEscape="true"/>
<form:hidden id="excel_search_form_code"  path="search_form_code" htmlEscape="true"/>
<form:hidden id="excel_search_kdc"        path="search_kdc" htmlEscape="true"/>
<form:hidden id="excel_search_athor"      path="search_athor" htmlEscape="true"/>
<form:hidden id="excel_search_year"      path="search_year" htmlEscape="true"/>
<form:hidden id="excel_search_publisher"  path="search_publisher" htmlEscape="true"/>
<form:hidden id="excel_menu_idx"          path="menu_idx" htmlEscape="true"/>
<form:hidden id="excel_viewPage"          path="viewPage" htmlEscape="true"/>
<form:hidden id="excel_excel_type"        path="excel_type" value="SEARCH" htmlEscape="true"/>
</form:form>
<form id="storageReqForm" style="display: none;">
<input type="hidden" name="_csrf" value="${_csrf.token}">
</form>
<form:form modelAttribute="librarySearch" id="detailForm" action="detail.do" method="get">
	<form:hidden path="menu_idx" htmlEscape="true"/>
	<form:hidden path="vLoca" htmlEscape="true"/>
	<form:hidden path="vCtrl" htmlEscape="true"/>
	<form:hidden path="vImg" htmlEscape="true"/>
	<form:hidden path="isbn" htmlEscape="true"/>
	<form:hidden path="tid" htmlEscape="true"/>
</form:form>

<form:form modelAttribute="librarySearch" action="index.do" method="get">
	<form:hidden path="allBookListStr" value="${result.allBookListStr}"/>
	<form:hidden path="search_type2" htmlEscape="true"/>
	<form:hidden path="search_library" htmlEscape="true"/>
	<form:hidden path="search_form_code" htmlEscape="true"/>
	<form:hidden path="search_kdc" htmlEscape="true"/>
	<form:hidden path="search_year" htmlEscape="true"/>
	<form:hidden path="search_athor" htmlEscape="true"/>
	<form:hidden path="search_publisher" htmlEscape="true"/>
	<form:hidden path="facet_num" htmlEscape="true"/>
	<form:hidden path="menu_idx" htmlEscape="true"/>
	<form:hidden path="viewPage" htmlEscape="true"/>
	<form:hidden path="excel_type" htmlEscape="true"/>
	<form:hidden path="book_more_count" htmlEscape="true"/>
	<form:hidden path="notice_more_count" htmlEscape="true"/>
	<form:hidden path="teach_more_count" htmlEscape="true"/>
	<div class="search-wrap">
		<c:if test="${librarySearch.search_text ne null and librarySearch.search_text ne ''}">
		</c:if>
		<div class="search-area" style="display: flex; justify-content: flex-end;">
			<a id="toggleLibList"><span class="orange"><i class="fa fa-building" aria-hidden="true"></i>타도서관 검색</span></a>
			<a href="#" id="toggleDetailSearch" class="btn btn1" title="상세검색" tabindex="0" style="border-radius: 20px;float: right;" keyValue="${totalSearch.search_type eq 'DETAIL' ? 'show' : 'hide'}"><i class="fa fa-search"></i> 상세 검색</a>
		</div>
		<div class="search-form">
		<!--
				<form:select path="search_type" cssStyle="width:100%;margin-top:2px;font-size:105%;padding-left:3px;" cssClass="selectmenu" >
					<c:forEach items="${searchCategory.data}" var="i" varStatus="status">
					<c:if test="${i.type ne 'SEARCH' }">
					<form:option value="${fn:escapeXml(i.type)}" label="${fn:escapeXml(i.name)}"></form:option>
					</c:if>
					</c:forEach>
				</form:select>
				<%-- <form:select path="search_type" cssStyle="width:100%;" cssClass="selectmenu">
					<form:option value="SEARCH" label="전체"></form:option>
					<form:option value="L_TITLE" label="서명"></form:option>
					<form:option value="L_AUTHOR" label="저자"></form:option>
					<form:option value="L_PUBLISHER" label="출판사"></form:option>
					<form:option value="L_KEYWORD" label="키워드"></form:option>
					<form:option value="L_ISBN" label="ISBN"></form:option>
					<form:option value="INDEXSEARCH" label="목차"></form:option>
				</form:select> --%>
			</div>
			-->
			<div class="box">

			<div class="box1" style="width: 20%;">
				<select id="search_type" name="search_type" class="selectmenu" style="width:100%;font-size:105%;padding-left:12px;border:0px;">
				    <option value="L_TITLEAUTHOR" <c:if test="${librarySearch.search_type eq 'L_TITLEAUTHOR'}">selected="selected"</c:if>>서명or저자</option>
				    <option value="L_TITLE" <c:if test="${librarySearch.search_type eq 'L_TITLE'}">selected="selected"</c:if>>서명[전방일치]</option>
				    <option value="L_AUTHOR" <c:if test="${librarySearch.search_type eq 'L_AUTHOR'}">selected="selected"</c:if>>저자[전방일치]</option>
				    <option value="L_PUBLISHER" <c:if test="${librarySearch.search_type eq 'L_PUBLISHER'}">selected="selected"</c:if>>출판사[완전일치]</option>
				    <option value="INDEXSEARCH" <c:if test="${librarySearch.search_type eq 'INDEXSEARCH'}">selected="selected"</c:if>>목차[부분일치]</option>
					<option value="L_ISBN" <c:if test="${librarySearch.search_type eq 'L_ISBN'}">selected="selected"</c:if>>ISBN</option>
					<option value="L_KEYWORD" <c:if test="${librarySearch.search_type eq 'L_KEYWORD'}">selected="selected"</c:if>>주제어</option>
				</select>
<%--
				<form:select path="search_type" cssStyle="width:100%;font-size:105%;padding-left:12px;border:0px;" cssClass="selectmenu" >
					<c:forEach items="${searchCategory.data}" var="i" varStatus="status">
					<c:if test="${i.type ne 'SEARCH' }">
					<form:option value="${fn:escapeXml(i.type)}" label="${fn:escapeXml(i.name)}"></form:option>
					</c:if>
					</c:forEach>
				</form:select>
--%>
			</div>
				<span><img src="/resources/book/search/img/line.jpg" style="padding-top: 5px;"></span>
				<div class="b1">
					<form:input htmlEscape="true" path="search_text" type="text" class="text2" title="검색어를 입력하세요" placeholder="검색어를 입력하세요." onfocus="PopupVirtualKeyboard.attachInput(this)" cssStyle="ime-mode:active;"/>
				</div>
				<div class="b2">
					<button id="do-search"><i class="fa fa-search"></i><span class="blind">검색</span></button>
				</div>
			</div>
			<br/>
			<div id="autoFill">
			</div>

			<div class="search-bot">
				<span style="color: red; float: left;">*</span>
				<span class="notice">경상북도교육청 공공도서관에서 소장하고 있는 국내외 자료를 통합검색할 수 있습니다. 검색 대상 항목은 도서, 전자자료, 연속간행물, 멀티미디어자료, 장애인자료, 기타 등이 있습니다.</span>
				<p style="height:auto">
					<a id="vk-popup" class="btn" title="새창열림" style="line-height:140%" tabindex="0">
					  <i class="fa fa-keyboard-o" style="font-size:19px;color:#777"></i><span>외국어입력기</span>
					</a>
					<!-- <a id="toggleLibList" class="btn" style="line-height:140%" tabindex="0">
					  <i class="fa fa-leanpub" style="font-size:19px;color:#777"></i><span>타도서관검색</span>
					</a> -->
<%-- 					<c:if test="${result.totalCnt > 0}"> --%>
<!-- 					<a id="excelDownload" class="btn" style="line-height:140%" tabindex="0"> -->
<!-- 						<i class="fa fa-file-excel-o" style="font-size:19px;color:#777"></i><span>엑셀 저장</span> -->
<!-- 					</a> -->
<!-- 					<a id="csvDownload" class="btn" style="line-height:140%" tabindex="0"> -->
<!-- 						<i class="fa fa-file-excel-o" style="font-size:19px;color:#777"></i><span>CSV 저장</span> -->
<!-- 					</a> -->
<%-- 					</c:if> --%>
				</p>
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
						<form:option value="4" label="주제어"/>
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
						<form:option value="4" label="주제어"/>
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
						<form:option value="4" label="주제어"/>
					</form:select>
					<form:input path="searchKeyword3" class="text smalltxt" placeholder="검색어3"/><label for="searchKeyword3" class="blind">검색어3</label>
					<form:select path="logicFunction3" class="selectmenu" cssStyle="width:80px" title="검색조건선택1">
						<form:option value="AND" label="AND"/>
						<form:option value="OR" label="OR"/>
					</form:select>
				</li>
				<li style="margin-bottom: 10px">
					<form:select path="ilus_searchType4" class="selectmenu" cssStyle="width:100px" title="검색항목선택4">
						<form:option value="1" label="서명"/>
						<form:option value="2" label="저자"/>
						<form:option value="3" label="출판사"/>
						<form:option value="4" label="주제어"/>
					</form:select>
					<form:input path="searchKeyword4" class="text smalltxt" placeholder="검색어4"/><label for="searchKeyword4" class="blind">검색어4</label>
					<form:select path="logicFunction4" class="selectmenu" cssStyle="width:80px" title="검색조건선택4">
						<form:option value="AND" label="AND"/>
						<form:option value="OR" label="OR"/>
					</form:select>
				</li>
			</ul>
			<a href="#" class="searchBtn" id="detailDoSearch">상세 검색<img src="/resources/board/img/arrow.jpg" alt=""/></a>
			<a href="#" id="closeSearch" style="    position: absolute;    top: 10px;    right: 10px;    margin: 0;"><i class="fa fa-times" aria-hidden="true"></i><span class="blind">닫기</span></a>
		</div>
		<br/>
		<div id="libraryList" class="bbs-notice" style="margin-bottom:20px; display: none;" >
			<div>
				<form:checkbox id="checkAll" path="libraryCodes" label="전체" value="ALL" />
			</div>
			<div>
				<ul>
					<c:forEach items="${libraryList.data}" var="i">
						<c:if test="${i.lib_manage_code ne '00347034' && i.lib_manage_code ne '00147004'}">
						<li>
							<c:choose>
								<c:when test="${i.lib_manage_code eq '00000001'}">
									<form:checkbox id="lib_${i.lib_manage_code}" searched="true" path="libraryCodes" label="${fn:escapeXml(i.lib_name)}" value="${fn:escapeXml(i.lib_manage_code)}" checked="checked" title="선택"/>
								</c:when>
								<c:when test="${fn:indexOf(librarySearch.libraryCodes, i.lib_manage_code)!= -1 or fn:indexOf(librarySearch.libraryCodes, 'ALL') != -1}">
									<form:checkbox id="lib_${fn:escapeXml(i.lib_manage_code)}" searched="true" path="libraryCodes" label="${fn:escapeXml(i.lib_name)}" value="${fn:escapeXml(i.lib_manage_code)}" checked="checked" title="선택"/>
								</c:when>
								<c:otherwise>
									<form:checkbox id="lib_${fn:escapeXml(i.lib_manage_code)}" path="libraryCodes" label="${fn:escapeXml(i.lib_name)}" value="${fn:escapeXml(i.lib_manage_code)}" title="선택" />
								</c:otherwise>
							</c:choose>
						</li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</div>
		<c:set var="showSmain" value="${(librarySearch.search_text ne null and librarySearch.search_text ne '') or (librarySearch.search_type eq 'DETAIL')}"></c:set>
		<div class="search-info" >
			<c:if test="${result.code eq '0000'}">
				검색결과 '<b class="og"><i>
				<c:choose>
					<c:when test="${not empty librarySearch.searchKeyword1 and empty librarySearch.search_text}">${fn:escapeXml(librarySearch.searchKeyword1)}</c:when>
					<c:otherwise>${fn:escapeXml(librarySearch.search_text)}</c:otherwise>
				</c:choose>
				</i></b>'에 대한 <b>${fn:escapeXml(librarySearch.viewPage)}</b>/${fn:escapeXml(result.totalPage)}페이지, 총 <b>${fn:escapeXml(result.totalCnt)}</b>건
			</c:if>
		</div>
<%-- 		<c:if test="${librarySearch.search_text ne null and librarySearch.search_text ne ''}"> --%>
		<c:if test="${fn:length(result.dsResult) < 1 and showSmain}">
		<p style="text-align: center;">
			<b>찾으시는 자료가 없습니다. </b>
		</p>
		</c:if>
		<div class="smain">
			<div class="box" style="min-height: 500px;">
				<div class="ws-toolbar"<c:if test="${!showSmain}">style="display: none;"</c:if>>

					<div class="control">
						<a href="#" id="addMyLib" style="padding-right: 4px;"><img src="/resources/book/search/img/btn_my.png" alt="관심도서">관심도서담기....</a>
						<form:select path="sortField" cssClass="selectmenu l_title_option" cssStyle="width: 90px;">
							<form:option value="DISP06" label="발행년도"></form:option>
							<form:option value="DISP01" label="서명"></form:option>
							<form:option value="DISP02" label="저자"></form:option>
							<form:option value="DISP03" label="출판사"></form:option>
						</form:select>
						<form:select path="sortType" cssClass="selectmenu l_title_option" cssStyle="width: 90px;">
							<form:option value="ASC" label="오름차순"></form:option>
							<form:option value="DESC" label="내림차순"></form:option>
						</form:select>
						<form:select path="rowCount" cssClass="selectmenu" cssStyle="width:70px;">
							<form:option value="10" label="10건"></form:option>
							<form:option value="20" label="20건"></form:option>
							<form:option value="30" label="30건"></form:option>
							<form:option value="40" label="40건"></form:option>
							<form:option value="50" label="50건"></form:option>
						</form:select>
						<a id="sort-btn" class="btn l_title_option" title="재정렬" tabindex="0"><i class="fa fa-sort" style="font-size:19px;color:#777"></i><span>&nbsp;재정렬&nbsp;&nbsp;</span></a>
					</div>
				</div>
				<div id="search-results" class="search-results">
					<c:if test="${empty librarySearch.search_text and librarySearch.search_type ne 'DETAIL'}">
					<div id="loadingLoanBest" style="text-align: center; padding-top: 105px;">
						<img id="loading_img" alt="loading" src="/resources/common/img/viewLoading.gif" />
						<br/><br/>
						대출 순위 불러오는 중
					</div>
					</c:if>
					<c:if test="${fn:length(result.dsResult) < 1 and showSmain}">
						<div style="text-align: center; margin-top: 20px;">
					<c:if test="${homepage.context_path eq 'geic'}">
						<a href="https://www.gbelib.kr/geic/intro/search/hope/index.do?menu_idx=213" class="btn btn1">희망도서 신청 바로가기</a>
					</c:if>
						</div>
					</c:if>
					<c:forEach items="${result.dsResult}" var="i" varStatus="status">
						<div class="row">
							<p class="admin"><input name="print_param" id="print_param${status.count }" type="checkbox" class="checkBook" value="${fn:escapeXml(i.LIMT06)}__${fn:escapeXml(i.CTRL)}__ __${fn:escapeXml(i.IMAGE_URL) eq '' ? ' ' : fn:escapeXml(i.IMAGE_URL)}__${fn:escapeXml(i.DISP07)}__${fn:escapeXml(i.DISP04)}__${fn:escapeXml(i.DISP01)}__${fn:escapeXml(i.DISP02)}__${fn:escapeXml(i.DISP03)}__${lib_name}" title="${fn:replace(fn:escapeXml(i.DISP02), fn:escapeXml(librarySearch.search_text), replaceStr)}"/></p>
							<div class="thumb">
								<c:choose>
									<c:when test="${i.IMAGE_URL eq '' or fn:contains(i.IMAGE_URL, 'noimg')}">
										<a href="#" vLoca="${fn:escapeXml(i.LIMT06)}" vCtrl="${fn:escapeXml(i.CTRL)}" vImg="${fn:escapeXml(i.IMAGE_URL)}" isbn="${fn:escapeXml(i.DISP08)}" tid="${fn:escapeXml(i.tid)}" class="goDetail noImg">
											<img src="/resources/common/img/bookNoImg3.png" alt="noImage"/>
											<!--20260206 추가-->
											<span class="noimg-txt">
												<p class="noimg-title">${fn:escapeXml(i.DISP01)}</p>
												<p class="noimg-author"><c:set var="DISP02" value="${fn:replace(fn:escapeXml(i.DISP02), fn:escapeXml(librarySearch.search_text), replaceStr)}"></c:set>
												<c:set var="DISP02" value="${fn:replace(DISP02, '[32703m', '')}"></c:set>
												<c:set var="DISP02" value="${fn:replace(DISP02, '[32723m', '')}"></c:set>
												${DISP02}</p>
												<p class="noimg-publisher">${fn:replace(fn:escapeXml(i.DISP03), fn:escapeXml(librarySearch.search_text), replaceStr)}</p>
											</span>
											
										</a>
									</c:when>
									<c:otherwise>
										<a href="#" vLoca="${fn:escapeXml(i.LIMT06)}" vCtrl="${fn:escapeXml(i.CTRL)}" vImg="${fn:escapeXml(i.IMAGE_URL)}" isbn="${fn:escapeXml(i.DISP08)}" tid="${fn:escapeXml(i.tid)}" class="goDetail">
											<img src="${fn:escapeXml(i.IMAGE_URL)}" alt="${fn:escapeXml(i.DISP01)}"/>
										</a>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="box">
								<div class="item">
									<div class="bif">
										<c:set var="lib_name"/>
										<c:forEach var="j" varStatus="status" items="${libraryList.data}">
										<c:if test="${j.lib_manage_code eq i.LIMT06}"><c:set var="lib_name" value="${j.lib_name}" /></c:if>
										</c:forEach>
										<c:set var="replaceStr" value="<span style='color:#ffa651'>${fn:escapeXml(librarySearch.search_text)}</span>"/>
										<a href="#" vLoca="${fn:escapeXml(i.LIMT06)}" vCtrl="${fn:escapeXml(i.CTRL)}" vImg="${fn:escapeXml(i.IMAGE_URL)}" isbn="${fn:escapeXml(i.DISP08)}" tid="${fn:escapeXml(i.tid)}" class="name goDetail">${fn:replace(fn:escapeXml(i.DISP01), fn:escapeXml(librarySearch.search_text), replaceStr)}</a>
										<span class="txt"><span class="tit">저자: </span>
												<c:set var="DISP02" value="${fn:replace(fn:escapeXml(i.DISP02), fn:escapeXml(librarySearch.search_text), replaceStr)}"></c:set>
												<c:set var="DISP02" value="${fn:replace(DISP02, '[32703m', '')}"></c:set>
												<c:set var="DISP02" value="${fn:replace(DISP02, '[32723m', '')}"></c:set>
												${DISP02}
											</span><span class="bar">|
										</span>
										<span class="txt"><span class="tit">발행처: </span>${fn:replace(fn:escapeXml(i.DISP03), fn:escapeXml(librarySearch.search_text), replaceStr)}</span><span class="bar">|</span>
										<span class="txt"><span class="tit">발행연도: </span>${fn:escapeXml(i.DISP06)}</span><span class="bar">|</span>
										<span class="txt"><span class="tit">자료이용하는 곳: </span>${lib_name}</span><span class="bar">|</span>
										<span class="txt"><span class="tit">청구기호: </span>${fn:escapeXml(i.DISP04)}</span>
										<div class="stat">
											<a href="#" id="addMyLibOne" value="${fn:escapeXml(i.LIMT06)}__${fn:escapeXml(i.CTRL)}__ __${fn:escapeXml(i.IMAGE_URL) eq '' ? ' ' : fn:escapeXml(i.IMAGE_URL)}__${fn:escapeXml(i.DISP07)}__${fn:escapeXml(i.DISP04)}__${fn:escapeXml(i.DISP01)}__${fn:escapeXml(i.DISP02)}__${fn:escapeXml(i.DISP03)}__${lib_name}"><span>관심도서담기</span></a>
											<a href="#" class="showSlide" vLoca="${fn:escapeXml(i.LIMT06)}" vCtrl="${fn:escapeXml(i.CTRL)}"><span>이용가능여부</span><i class="fa fa-angle-down" aria-hidden="true"></i></a>
											<c:if test="${not empty i.marc_url}">
											<a href="${i.marc_url}" class="btn" target="_blank" style="margin-left: 10px;"><span>전자책 바로보기</span></a>
											</c:if>
										</div>
									</div>
									<div class="bci" style="display: none;">
										<!-- ajax_area -->
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
					<jsp:include page="/WEB-INF/views/app/cms/common/paging_search.jsp" flush="false" />
				</div>
			</div>

			<div class="ws-filter" id="ageLoanBestDiv" style="padding-bottom: 20px; display: none;">
				<a id="ageLoanBestBtn" class="btn" style="line-height:140%">
				  <i class="fa fa-keyboard-o" style="font-size:19px;color:#777"></i><span>연령별 대출순위</span>
				</a>
			</div>

			<div class="ws-filter" <c:if test="${fn:length(result.dsResult) < 1 or !showSmain}"> style="display: none;"</c:if>> <%-- <c:if test="${fn:length(zzzz) < 1 or !showSmain}"> style="display: none;"</c:if> --%>
				<span class="search_h4">검색결과 제한</span>
				<ul>
					<li class="li-group active"><a href="" class="bi" onclick="return false;">유형별</a>
						<ul>
							<c:set var="formCnt" value="0"></c:set>
							<c:forEach items="${result.dsFacet_LIMT01}" var="j">

								<c:set var="formCnt" value="${fn:escapeXml(j.CODE_COUNT)}"></c:set>
								<li><a href="javascript:void(0);" class="doSearchFormCode" keyValue2="${fn:escapeXml(j.CODE_VALUE)}" keyValue3="${fn:escapeXml(j.NUM)}"><span>${fn:escapeXml(j.CODE_NAME)}</span><em>(${fn:escapeXml(j.CODE_COUNT)})</em></a></li>
							</c:forEach>
						</ul>
					</li>

					<li class="li-group active"><a href="" class="bi" onclick="return false;">저자별</a>
						<ul>
							<c:set var="authorCnt" value="0"></c:set>
							<c:forEach items="${result.dsFacet_FCDP01}" var="j">
								<c:set var="authorCnt" value="${fn:escapeXml(j.CODE_COUNT)}"></c:set>
								<li><a href="javascript:void(0);" class="doSearchFormCode" keyValue2="${fn:escapeXml(j.CODE_VALUE)}" keyValue3="${fn:escapeXml(j.NUM)}"><span>${fn:escapeXml(j.CODE_NAME)}</span><em>(${fn:escapeXml(j.CODE_COUNT)})</em></a></li>
							</c:forEach>
						</ul>
					</li>

					<li class="li-group active"><a href="" class="bi" onclick="return false;">연도별</a>
						<ul>
							<c:set var="yearCnt" value="0"></c:set>
							<c:forEach items="${result.dsFacet_LIMT21}" var="j">
								<c:set var="formCnt" value="${fn:escapeXml(j.CODE_COUNT)}"></c:set>
								<li><a href="javascript:void(0);" class="doSearchFormCode" keyValue2="${fn:escapeXml(j.CODE_VALUE)}" keyValue3="${fn:escapeXml(j.NUM)}"><span>${fn:escapeXml(j.CODE_NAME)}</span><em>(${fn:escapeXml(j.CODE_COUNT)})</em></a></li>
							</c:forEach>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>
</form:form>
<div id="vk"></div>
<div id="ageLoanBest" class="dialog-common" title="연령별 대출 리스트" style="display: none;">
	<div style="text-align: center; padding-top: 100px;">
	<img id="loading_img" alt="loading" src="/resources/common/img/viewLoading.gif" />
	<br/><br/>
	대출 순위 불러오는 중
	</div>
</div>

</c:otherwise>
</c:choose>