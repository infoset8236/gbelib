<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="homepageTag"	uri="/WEB-INF/config/tld/homepageTag.tld"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" type="text/css" href="/resources/book/search/css/default.css"/>
<link rel="stylesheet" type="text/css" href="/resources/book/css/serial.css">
<style>
.serial-wrap .search-results .row .item a.name{font-weight:800;font-size:140%;display:inline-block;zoom:1;*display:inline;padding: 0px 0;}
.serial-wrap ul.con2{padding: 0px 0 2px;}
.bif b {color:#ffa651;}
</style>
<script type="text/javascript">
$(function() {
	
	$('div#loadingkakao').css('display','none');
	
	$('#save-btn').on('click', function(e) {
		
		if ($('input#price').val() != '') {
			var price = $('input#price').val();
			if (!parseInt(price)) {
				alert('가격은 숫자만 입력가능합니다.');
				$('input#price').focus();
				return false;
			}
		}
		
		if ( doAjaxPost($('#reqHopeForm')) ) {
			doGetLoad('index.do');
		}
		e.preventDefault();
	});
	
	$('button#do-search').on('click', function(e) {
		$('div#loadingkakao').css('display','block');
		e.preventDefault();
		$('#viewPage').val(1);
		var value =	$('form#reqHopeForm input#title').val() + "^^^"	
		+ $('form#reqHopeForm input#author').val() + "^^^"
		+ $('form#reqHopeForm input#publer').val() + "^^^"
		+ $('form#reqHopeForm input#publer_year').val() + "^^^"
		+ $('form#reqHopeForm input#isbn').val() + "^^^"
		+ $('form#reqHopeForm input#price').val();
		
		$('form#searchForm input#bookValue').val(value);
		doAjaxLoad('div#loadingkakao', 'kakaoDto.do', serializeCustom($('form#searchForm')));
	});
	
	$('input#search_text_kakao').on('keyup', function(e) {
		if (e.keyCode == '13') {
			$('button#do-search').click();
		}
	});
	
//	doAjaxLoad('div#searchBox', 'search.do');
	
	if($('#title').val() == null || $('#title').val() == '' ){
		$('.edit').hide();
		$('.txt-center').hide();
	}
	
	$(document).on("keyup", "input:text[numberOnly]", function() {
		$(this).val($(this).val().replace(/[^0-9]/gi, ""));
	});
});
</script>
<style>
.search_info {
background: url(/resources/common/img/contents/h3Bg.gif) no-repeat 0 10px;
    font-size: 125%;
    color: #373737;
    padding: 8px 0;
    padding-left: 20px;
    letter-spacing: -1px;
    font-weight: bold;
    font-size: 130%;
    line-height: 130%;
}
</style>

<form:form modelAttribute="librarySearch" id="searchForm" action="kakaoDto.do" onsubmit="return false;">
<form:hidden path="editMode" value="AJAX"/>
<form:hidden path="menu_idx"/>
<form:hidden path="isbn"/>
<form:hidden path="viewPage"/>
<form:hidden path="bookValue"/>
	<div class="search-form" style="padding-bottom: 20px;">
		<h3 class="search_info">신청도서를 검색후 선택하여 주세요.</h3>
		<div class="box">
			<div class="b1">
				<select name="search_type" id="search_type" style="width: 10%; padding-left: 12px; margin-left: -10px;">
					<option value="title" ${librarySearch.search_type eq 'title' or librarySearch.search_type eq '' ? "selected='selected'" : ''}>제목</option>
					<option value="isbn" ${librarySearch.search_type eq 'isbn' ? "selected='selected'" : ''}>ISBN</option>
					<option value="person" ${librarySearch.search_type eq 'person' ? "selected='selected'" : ''}>저자</option>
				</select>
				<form:input path="search_text" id="search_text_kakao" type="text" class="text" placeholder="검색어를 입력하세요." cssStyle="display: inline-table; margin-top: -4px; ime-mode:active;" title="검색어를 입력하세요." />
			</div>
			<div class="b2">
				<button id="do-search"><i class="fa fa-search"></i><span class="blind">검색</span></button>
			</div>
		</div>
	</div>
</form:form>

<div id="loadingkakao" style="text-align: center; none; padding-top: 105px;">
</div>
<div id="searchBox2">
<c:choose>
	<c:when test="${errorCode eq 1}">
		<div class="search_result nodata">${errorMessage }</div>
	</c:when>
	<c:otherwise>	
		<c:if test="${fn:length(kakaoResult) < 1 and not empty librarySearch.search_text}">
			<div class="search_result nodata">검색된 도서가 없습니다.</div>
		</c:if>
		<c:if test="${fn:length(kakaoResult) > 0 and not empty librarySearch.search_text}">
			<p class="search_result">
				<span class="red fb">"${librarySearch.search_text}"</span>에 대한 <span class="fb"><fmt:formatNumber value="${paging.totalDataCount}" pattern="#,###"/> </span>개의
				검색 결과입니다.
			</p>
		</c:if>
		<c:if test="${not empty librarySearch.search_text}">
			<div class="serial-wrap">
				<div class="smain">
					<div class="box">
						<div class="search-results">
							<c:forEach items="${kakaoResult}" var="i" varStatus="status">
							<div class="row">
								<div class="thumb">
									<c:choose>
										<c:when test="${empty i.thumbnail}">
											<img src="/resources/common/img/noimg-gall.png" alt="${i.title}" alt="${i.title}">
										</c:when>
										<c:otherwise>
											<img src="${i.thumbnail}" alt="${i.title}" title="${i.title}">
										</c:otherwise>
									</c:choose>
								</div>
								<div class="box">
									<div class="item">
										<div class="bif">
											<a href="#" class="name" target="_blank" style="cursor: default;" onclick="return false;" alt="${i.title}" title="${i.title}">${fn:substring(i.title, 0, 30)}<c:if test="${fn:length(i.title) > 30}">...</c:if></a>
											<ul class="con2">
												<c:set var="authors1" value="${fn:replace(i.authors, '[', '')}"></c:set>
												<c:set var="authors1" value="${fn:replace(authors1, ']', '')}"></c:set>												
												<c:set var="authors1" value="${fn:replace(authors1, '\\\"', '')}"></c:set>
												<li>저자 : ${fn:substring(authors1, 0, 20)}<c:if test="${fn:length(authors1) > 20}">...</c:if></li>
												<li>출판사 : ${fn:substring(i.publisher, 0, 20)}<c:if test="${fn:length(i.publisher) > 20}">...</c:if></li>
												<li>출판일 : ${fn:substring(i.datetime,0,10)}</li>
												<li>ISBN : ${fn:split(i.isbn,' ')[1] eq null or fn:split(i.isbn,' ')[1] eq '' ? fn:split(i.isbn,' ')[0] : fn:split(i.isbn,' ')[1]}</li>
												<li>가격 : ${i.price}</li>												
												<c:choose>
													<c:when test="${i.already}">
												<li class="button">
													<span class="no" style="color: red;">소장도서(신청불가)</span>
												</li>
													</c:when>
													<c:when test="${i.hopeDupl}">
													<li class="button">
														<span class="no" style="color: red;">신청도서(신청불가)</span>
													</li>
													</c:when>
													<c:otherwise>
												<li class="button" style="background: none;">
													<a class="btn btn1 request" index="${status.index}" href="#" title="선택하기">선택하기</a>
													<c:set var="title" value="${fn:replace(i.title, '<b>', '')}"></c:set>
													<c:set var="title" value="${fn:replace(title, '</b>', '')}"></c:set>
													<c:set var="authors" value="${fn:replace(i.authors, '<b>', '')}"></c:set>
													<c:set var="authors" value="${fn:replace(authors, '</b>', '')}"></c:set>
													<c:set var="authors" value="${fn:replace(authors, '\\\"', '')}"></c:set>
													<c:set var="authors" value="${fn:replace(authors, '[', '')}"></c:set>
													<c:set var="authors" value="${fn:replace(authors, ']', '')}"></c:set>													
													<c:set var="publisher" value="${fn:replace(i.publisher, '<b>', '')}"></c:set>
													<c:set var="publisher" value="${fn:replace(publisher, '</b>', '')}"></c:set>
													<c:set var="isbn" value="${fn:replace(i.isbn, '<b>', '')}"></c:set>
													<c:set var="isbn" value="${fn:replace(isbn, '</b>', '')}"></c:set>
													<span data="${title}//${authors}//${publisher}//${fn:substring(i.datetime,0,4)}//${fn:split(i.isbn,' ')[1] eq null or fn:split(i.isbn,' ')[1] eq '' ? fn:split(i.isbn,' ')[0] : fn:split(i.isbn,' ')[1]}//${i.price}"></span>
												</li>
													</c:otherwise>
												</c:choose>
											</ul>
										</div>
									</div>
								</div>
							</div>
							</c:forEach>
						</div>
					
						<div id="board_paging" class="dataTables_paginate" style="padding-bottom: 25px;">
						<c:if test="${paging.firstPageNum > 0}">
							<a href="" class="paginate_button previous" keyValue="${paging.firstPageNum}">처음</a>
						</c:if>
						<c:if test="${paging.prevPageNum > 0}">
							<a href="" class="paginate_button previous" keyValue="${paging.prevPageNum}">이전</a>
						</c:if>	
							<span>
						<c:forEach var="i" varStatus="status" begin="${paging.startPageNum}" end="${paging.endPageNum}">
						<c:choose>
						<c:when test="${i eq paging.viewPage}">	
							<a href="" class="paginate_button current" keyValue="${i}">${i}</a>
						</c:when>
						<c:otherwise>
							<a href="" class="paginate_button" keyValue="${i}">${i}</a>
						</c:otherwise>
						</c:choose>
						</c:forEach>
						<c:if test="${paging.nextPageNum > 0 and paging.nextPageNum < 100}">
							<a href="" class="paginate_button next" keyValue="${paging.nextPageNum}">다음</a>
						</c:if>
						<c:if test="${paging.totalPageCount ne paging.lastPageNum}">
							<a href="" class="paginate_button next" keyValue="${100}">맨끝</a>
						</c:if>
							</span>
						</div>
					</div>
				</div>
			</div>
		</c:if>
	</c:otherwise>
</c:choose>
</div>

<img id="refImg" src="/resources/common/img/noimg-gall.png" alt="refImg" style="display: none;">

<form:form id="reqHopeForm" modelAttribute="librarySearch" action="save.do" method="post">
	<form:hidden path="editMode" value="ADD"/>
	<form:hidden path="vLoca" value="${homepage.homepage_code}"/>
	<table class="edit">
		<tbody>
			<tr>
				<th>제목 <em><font color="red">(*)</font></em></th>
				<td><form:input path="title" style="width:90%" class="text" type="text" readonly="true"/></td>
			</tr>
			<tr>
				<th>저자 <em><font color="red">(*)</font></em></th>
				<td><form:input path="author" style="width:90%" class="text" type="text" readonly="true"/></td>
			</tr>
			<tr>
				<th>출판사 <em><font color="red">(*)</font></em></th>
				<td><form:input path="publer" style="width:90%" class="text" type="text" readonly="true"/></td>
			</tr>
			<tr>
				<th>연도 <em><font color="red">(*)</font></em></th>
				<td><form:input path="publer_year" style="width:10%" class="text" type="text" numberOnly="true" maxlength="4" readonly="true"/></td>
			</tr>
			<tr>
				<th>ISBN</th>
				<td><form:input path="isbn" style="width:40%" class="text" type="text" maxlength="24" readonly="true"/></td>
			</tr>
			<tr>
				<th>판차</th>
				<td><form:input path="editon" class="text" type="text"/></td>
			</tr>
			<tr>
				<th>비고</th>
				<td><form:input path="user_remark" style="width:90%" class="text" type="text"/></td>
			</tr>
			<tr>
				<th>가격 <em><font color="red">(*)</font></em></th>
				<td><form:input path="price" style="width:20%" class="text" type="text" maxlength="10" numberOnly="true" readonly="true"/></td>
			</tr>
		</tbody>
	</table>
</form:form>

<div class="kbtn txt-center">
	<a id="save-btn" href="" class="btn btn5"><span>신청하기</span></a>
</div>

<script>
	$(function() {
		$('div.images li').on('hover', function() {
			var no = $(this).attr('item_no');
			$('.item-list .item').hide();
			$('.item-list .item-' + no).show();
			$('.item-list .images li').css('border-clor', '#fff');
			$(this).css('border-color', '#ddd');
		}).css({
			'border-clor' : '#fff',
			'float' : 'left'
		});
		$('.item-list .images li').eq(0).mouseover();

		$('div#board_paging a').on('click', function(e) {
			e.preventDefault();
			$('input#viewPage').val($(this).attr('keyValue'));
			console.log($(this).attr('keyValue'));
			$('#editMode').val("AJAX");
			var value =	$('form#reqHopeForm input#title').val() + "^^^"	
			+ $('form#reqHopeForm input#author').val() + "^^^"
			+ $('form#reqHopeForm input#publer').val() + "^^^"
			+ $('form#reqHopeForm input#publer_year').val() + "^^^"
			+ $('form#reqHopeForm input#isbn').val() + "^^^"
			+ $('form#reqHopeForm input#price').val();
			
			$('form#searchForm input#bookValue').val(value);
			doAjaxLoad('div#searchBox2', 'kakaoDto.do', $('form#searchForm').serialize());
		});

		$('a.request').on('click', function(e) {
			e.preventDefault();
			var data = $(this).next('span').attr('data').split('//');		
			console.log(data);
			$('form#reqHopeForm input#menu_idx').val('${librarySearch.menu_idx}');
			$('form#reqHopeForm input#title').val(data[0]);
			$('form#reqHopeForm input#author').val(data[1]);
			if(data[1] == null || data[1] == ''){
				$('form#reqHopeForm input#author').prop('readonly','');
			}else{
				$('form#reqHopeForm input#author').prop('readonly','true');
			}
			$('form#reqHopeForm input#publer').val(data[2]);
			if(data[2] == null || data[2] == ''){
				$('form#reqHopeForm input#publer').prop('readonly','');
			}else{
				$('form#reqHopeForm input#publer').prop('readonly','true');
			}
			$('form#reqHopeForm input#publer_year').val(data[3]);
			if(data[3] == null || data[3] == ''){
				$('form#reqHopeForm input#publer_year').prop('readonly','');
			}else{
				$('form#reqHopeForm input#publer_year').prop('readonly','true');
			}
			$('form#reqHopeForm input#isbn').val(data[4]);
			$('form#reqHopeForm input#price').val(data[5]);
			if(data[5] == null || data[5] == ''){
				$('form#reqHopeForm input#price').prop('readonly','');
			}else{
				$('form#reqHopeForm input#price').prop('readonly','true');
			}
			$('input#user_remark').focus();
			$('.edit').show();
			$('.txt-center').show();
		});
		
		$(window).resize(function() {
			$('.search-results img').height($('img#refImg').width() * 0.6);
		}).trigger('resize');
	});
</script>

