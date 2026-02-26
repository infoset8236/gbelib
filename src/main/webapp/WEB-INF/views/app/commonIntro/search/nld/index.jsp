<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<style>
.bci table thead th {font-size:13px;}
.bci table tbody td {font-size:13px;}
</style>
<link rel="stylesheet" type="text/css" href="/resources/book/search/css/default.css"/>

<script src="/resources/cms/js/vk/vk_popup.js?vk_skin=flat_gray&vk_layout=ZW Shona"></script>
<script type="text/javascript">
$(function() {
	$('#do-search').on('click', function(e) {
		if ($('#librarySearch input#search').val() == '') {
			alert('검색어를 입력해주세요');
			$('#librarySearch input#search').focus();
			return false;
		}
		$('input#viewPage').val('1');
		document.getElementById('searchForm').submit();
	});
	
	$('div#board_paging a').on('click', function(e) {
		e.preventDefault();
		$('#viewPage').attr('value', parseInt($(this).attr('keyValue')));
		document.getElementById('searchForm').submit();
	});

	$('#vk-popup').on('click', function(e) {
		PopupVirtualKeyboard.toggle('search','vk');
	});
	//키보드로 조작 할 수 있도록
	$('#vk-popup').on('keydown', function(e) {
			$('html, body').animate({scrollTop: 0 }, 'fast');  //spacebar 바로 인해 내려간 화면을 다시 올려줌
		if (e.keyCode == 32) {  //space bar keyCode
			PopupVirtualKeyboard.toggle('search','vk');
		}
	});

	$('a#sort-btn').on('click', function(e) {
		$('#do-search').click();
	});
	
});

$(document).on("keyup", "input:text[numberOnly]", function() {
	$(this).val($(this).val().replace(/[^0-9]/gi, ""));
});
</script>

<form:form modelAttribute="librarySearch" id="searchForm" action="index.do" method="POST" onsubmit="return false;">
	<form:hidden path="menu_idx"/>
	<form:hidden path="viewPage"/>
	<div class="search-wrap">
		<div class="search-form">
			<div class="box">
			<div class="box1" style="width: 20%;">
				<select id="kind" name="kind" class="selectmenu" style="width:100%;font-size:105%;padding-left:12px;border:0px;">
				    <option value="0" <c:if test="${librarySearch.kind eq '0'}">selected="selected"</c:if>>통합검색</option>
				    <option value="1" <c:if test="${librarySearch.kind eq '1'}">selected="selected"</c:if>>제목</option>
				    <option value="2" <c:if test="${librarySearch.kind eq '2'}">selected="selected"</c:if>>저자</option>
				    <option value="3" <c:if test="${librarySearch.kind eq '3'}">selected="selected"</c:if>>출판사</option>
				</select>
			</div>
				<span><img src="/resources/book/search/img/line.jpg" style="padding-top: 5px;"></span>
				<div class="b1">
					<c:choose>
						<c:when test="${librarySearch.kind eq '1'}">
							<form:input htmlEscape="true" path="search_title" type="text" class="text2" title="제목을 입력하세요" placeholder="제목을 입력하세요." onfocus="PopupVirtualKeyboard.attachInput(this)" cssStyle="ime-mode:active;"/>
						</c:when>
						<c:when test="${librarySearch.kind eq '2'}">
							<form:input htmlEscape="true" path="search_athor" type="text" class="text2" title="저자를 입력하세요" placeholder="저자를 입력하세요." onfocus="PopupVirtualKeyboard.attachInput(this)" cssStyle="ime-mode:active;"/>
						</c:when>
						<c:when test="${librarySearch.kind eq '3'}">
							<form:input htmlEscape="true" path="search_publisher" type="text" class="text2" title="출판사를 입력하세요" placeholder="출판사를 입력하세요." onfocus="PopupVirtualKeyboard.attachInput(this)" cssStyle="ime-mode:active;"/>
						</c:when>
						<c:otherwise>
							<form:input htmlEscape="true" path="search" type="text" class="text2" title="검색어를 입력하세요" placeholder="검색어를 입력하세요." onfocus="PopupVirtualKeyboard.attachInput(this)" cssStyle="ime-mode:active;"/>
						</c:otherwise>
					</c:choose>
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
				<span class="notice">국립장애인도서관에서 소장하고 있는 시각, 청각, 발달장애인용 대체자료 약 6만 여건의 대체자료를 검색할 수 있습니다. 원문이용은 저작권법에 따라 국립장애인도서관 회원 로그인(장애인 인증) 이후 이용 가능합니다.</span>
				<p style="height:auto">
					<a id="vk-popup" class="btn" title="새창열림" style="line-height:140%" tabindex="0">
					  <i class="fa fa-keyboard-o" style="font-size:19px;color:#777"></i><span>외국어입력기</span>
					</a>
				</p>
			</div>
		</div>
		<div class="search-info" >
			<c:if test="${bookList.totalCount > 0}">
				검색결과 '<b class="og">총 <b>${fn:escapeXml(bookList.totalCount)}</b>건
			</c:if>
		</div>
		<c:if test="${fn:length(bookList.list) < 1}">
		<p style="text-align: center;">
			<b>찾으시는 자료가 없습니다. </b>
		</p>
		</c:if>
		<div class="smain">
			<div class="box" style="min-height: 500px;">
				<div class="ws-toolbar"<c:if test="${fn:length(bookList.list) <= 0}">style="display: none;"</c:if>>

					<div class="control">
						<form:select path="sortType" cssClass="selectmenu l_title_option" cssStyle="width: 90px;">
							<form:option value="asc" label="오름차순"></form:option>
							<form:option value="desc" label="내림차순"></form:option>
						</form:select>
						<form:select path="rowCount" cssClass="selectmenu" cssStyle="width:70px;">
							<form:option value="10" label="10건"></form:option>
							<form:option value="20" label="20건"></form:option>
							<form:option value="30" label="30건"></form:option>
							<form:option value="40" label="40건"></form:option>
							<form:option value="50" label="50건"></form:option>
						</form:select>
					</div>
				</div>
				<div id="search-results" class="search-results">
					<c:forEach items="${bookList.list}" var="i" varStatus="status">
						<div class="row">
							<div class="thumb">
								<img src="${fn:escapeXml(i.IMAGE_URL)}" alt="${fn:escapeXml(i.title)}" onError="src='/resources/common/img/noImg.gif';"/>
							</div>
							<div class="box">
								<div class="item">
									<div class="bif">
										<a href="${i.url}" class="name" target="blank">${i.title}</a>
										<span class="txt"><span class="tit">저자: ${i.creator}</span></span><span class="bar">|
										</span>
										<span class="txt"><span class="tit">발행처: </span>${i.publisher}</span><span class="bar">|</span>
										<span class="txt"><span class="tit">발행연도: </span>${i.source_date}</span><span class="bar">|</span>
										<span class="txt"><span class="tit">자료이용하는 곳: </span>${i.creator}</span><span class="bar">|</span>
										<span class="txt"><span class="tit">청구기호: </span>${i.control_no}</span>
										<div class="stat">
										</div>
									</div>
									<div class="bci" style="display: none;">
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
					
					<c:if test="${bookList.totalCount > 0}">
					<div id="board_paging" class="dataTables_paginate">
						<c:if test="${librarySearch.firstPageNum > 0}">
							<a href="" class="paginate_button previous" keyValue="${librarySearch.firstPageNum}">처음</a>
						</c:if>
						<c:if test="${librarySearch.prevPageNum > 0}">
							<a href="" class="paginate_button previous" keyValue="${librarySearch.prevPageNum}">이전</a>
						</c:if>
						<span>
							<c:forEach var="i" varStatus="status" begin="${librarySearch.startPageNum}" end="${librarySearch.endPageNum}">
							<c:choose>
							<c:when test="${i eq librarySearch.viewPage}">
								<a href="" class="paginate_button current" keyValue="${i}" title="${i}페이지">${i}</a>
							</c:when>
							<c:otherwise>
								<a href="" class="paginate_button" keyValue="${i}" title="${i}페이지">${i}</a>
							</c:otherwise>
							</c:choose>
							</c:forEach>
							<c:if test="${librarySearch.nextPageNum > 0}">
								<a href="" class="paginate_button next" keyValue="${librarySearch.nextPageNum}">다음</a>
							</c:if>
							<c:if test="${librarySearch.totalPageCount ne librarySearch.lastPageNum}">
								<a href="" class="paginate_button next" keyValue="${librarySearch.totalPageCount}">맨끝</a>
							</c:if>
						</span>
					</div>
					</c:if>
				</div>
			</div>

		</div>
	</div>
</form:form>
<div id="vk"></div>