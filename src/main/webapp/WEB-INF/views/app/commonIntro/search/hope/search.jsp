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
	.search-form .box{padding:25px;}
	.search-form .box .b1 select{border:none;font-size:15px;font-weight:500;width:15%;}

	.serial-wrap .search-results .row .item a.name{font-weight:800;font-size:130%;display:inline-block;zoom:1;*display:inline;padding: 0px 0;width: 90%;white-space: nowrap;}
	.serial-wrap ul.con2{padding: 0px 0 2px;}

	.bif b {color:#ffa651;}

	@media all and (max-width:768px){
		.search-form .box .b1 select{width:30%;}
		.search-form .box .b1 input::placeholder{color:transparent;}
	}
</style>

<script>
$(document).ready(function() {
	$('div#loadingkakao').css('display','none');
	
	$('button#do-search').on('click', function(e) {
		$('div#loadingkakao').css('display','block');
		e.preventDefault();
		$('#viewPage').val(1);		
		doAjaxLoad('div#loadingkakao', 'kakaoDto.do', serializeCustom($('form#searchForm')));
	});	

	$('input#search_text_naver').on('keyup', function(e) {
		if (e.keyCode == '13') {
			$('button#do-search').click();
		}
	});
});
</script>

<c:if test="${homepage.context_path eq 'app'}">
<div style="padding:10px 10px 60px 10px;box-sizing:border-box;">
</c:if>
<h3>신청도서를 검색후 선택하여 주세요.</h3>
<div id="searchBox">
<img id="refImg" src="/resources/common/img/noimg-gall.png" alt="refImg" style="display: none;">
<b>찾으시는 도서가 없으신가요? </b><a href="req.do?menu_idx=${param.menu_idx}" class="btn btn5">희망도서 신청하기</a>
<form:form modelAttribute="librarySearch" id="searchForm" action="kakaoDto.do" onsubmit="return false;">
<form:hidden path="editMode" value="NOAJAX"/>
<form:hidden path="menu_idx"/>
<form:hidden path="isbn"/>
<form:hidden path="viewPage"/>
	<div class="search-form" style="padding-bottom: 20px;">
		<div class="box">
			<div class="b1">
				<select name="search_type" id="search_type" style="padding-left: 12px; margin-left: -10px;">
					<option value="title" ${librarySearch.search_type eq 'title' or librarySearch.search_type eq '' ? "selected='selected'" : ''}>제목</option>
					<option value="isbn" ${librarySearch.search_type eq 'isbn' ? "selected='selected'" : ''}>ISBN</option>
					<option value="person" ${librarySearch.search_type eq 'person' ? "selected='selected'" : ''}>저자</option>
				</select>
				<form:input path="search_text" id="search_text_naver" type="text" class="text" placeholder="검색어를 입력하세요." cssStyle="display: inline-table; margin-top: -4px; ime-mode:active;" title="검색어를 입력하세요." />
			</div>
			<div class="b2">
				<button id="do-search" title="검색"><i class="fa fa-search"></i><span class="blind">검색</span></button>
			</div>
		</div>
	</div>
</form:form>
<div id="loadingkakao" style="text-align: center; none; padding-top: 105px;">
	
</div>
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
									<c:when test="${empty i.thumbnail }">
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
											<a href="${i.url}" class="name" target="_blank" alt="${i.title}" title="${i.title},새창열림">${fn:substring(i.title, 0, 40)}<c:if test="${fn:length(i.title) > 40}">...</c:if></a>
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
													<c:when test="${(i.status_name eq '이용가능' or i.status_name eq '정리중') and homepage.context_path eq 'bh'}">
														<li class="button">
															<span class="no" style="color: red;">소장도서(신청불가) - ${i.status_name}</span>
														</li>
													</c:when>
													<c:when test="${i.status_name ne null and homepage.context_path ne 'bh'}">
														<li class="button">
															<span class="no" style="color: red;">소장도서(신청불가) - ${i.status_name}</span>
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
															<span data="${title}//${authors}//${publisher}//${fn:substring(i.datetime,0,4)}//${fn:split(i.isbn,' ')[1] eq null or fn:split(i.isbn,' ')[1] eq '' ? fn:split(i.isbn,' ')[0] : fn:split(i.isbn,' ')[1]}//${i.price}">
																${i.status_name}
															</span>
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
							<a href="" class="paginate_button previous" keyValue="${paging.firstPageNum}" title="처음" >처음</a>
						</c:if>
						<c:if test="${paging.prevPageNum > 0}">
							<a href="" class="paginate_button previous" keyValue="${paging.prevPageNum}" title="이전" >이전</a>
						</c:if>
							<span>
						<c:forEach var="i" varStatus="status" begin="${paging.startPageNum}" end="${paging.endPageNum}">
						<c:choose>
						<c:when test="${i eq paging.viewPage}">
							<a href="" class="paginate_button current" keyValue="${i}" title="${i}페이지,현재페이지" >${i}</a>
						</c:when>
						<c:otherwise>
							<a href="" class="paginate_button" keyValue="${i}" title="${i}페이지">${i}</a>
						</c:otherwise>
						</c:choose>
						</c:forEach>
						<c:if test="${paging.nextPageNum > 0 and paging.nextPageNum < 100}">
							<a href="" class="paginate_button next" keyValue="${paging.nextPageNum}" title="다음" >다음</a>
						</c:if>
						<c:if test="${paging.totalPageCount ne paging.lastPageNum}">
							<a href="" class="paginate_button next" keyValue="${paging.totalPageCount}" title="맨끝" >맨끝</a>
						</c:if>
							</span>
						</div>
					</div>
				</div>
			</div>
		</c:if>
	</c:otherwise>
</c:choose>
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
			$('#editMode').val("SEARCHAJAX");
			doAjaxLoad('div#loadingkakao', 'kakaoDto.do', $('form#searchForm').serialize());
		});

		$('a.request').on('click', function(e) {
			e.preventDefault();
			var data = $(this).next('span').attr('data').split('//');
			$('form#reqHopeForm input#menu_idx').val('${librarySearch.menu_idx}');
			$('form#reqHopeForm input#title').val(data[0]);
			$('form#reqHopeForm input#author').val(data[1]);
			$('form#reqHopeForm input#publer').val(data[2]);
			$('form#reqHopeForm input#publer_year').val(data[3]);
			$('form#reqHopeForm input#isbn').val(data[4]);
			$('form#reqHopeForm input#price').val(data[5]);
			$('form#reqHopeForm').submit();
		});
		$(window).resize(function() {
			$('.search-results img').height($('img#refImg').width() * 0.6);
		}).trigger('resize');
	});
</script>
</div>
<c:if test="${homepage.context_path eq 'app'}">
</div>
</c:if>
<form:form id="reqHopeForm" modelAttribute="librarySearch" action="req.do" method="get">
	<form:hidden path="menu_idx"/>
	<form:hidden path="title"/>
	<form:hidden path="author"/>
	<form:hidden path="publer"/>
	<form:hidden path="publer_year"/>
	<form:hidden path="isbn"/>
	<form:hidden path="price"/>
</form:form>