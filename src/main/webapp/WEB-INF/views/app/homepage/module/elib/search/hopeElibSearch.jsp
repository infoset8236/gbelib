<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="homepageTag" uri="/WEB-INF/config/tld/homepageTag.tld" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<% pageContext.setAttribute("crlf", "\n"); %>

<link rel="stylesheet" type="text/css" href="/resources/common/elib/css/default.css"/>

<script type="text/javascript">
  $(function () {
	$('a#do-elibsearch').on('click', function (q) {
	  q.preventDefault();
	  if ($('input#search_text').val() == '') {
		alert('검색어를 입력해주세요');
		$('input#search_text').focus();
		return false;
	  }
	  $('#bookListForm').submit();
	});

	$('a.category-tab-btn').on('click', function (k) {
	  k.preventDefault();
	  $('input#parent_id').val($(this).attr('data-keyValue'));
	  $('#bookListForm').submit();
	});

	$('a.img-select').on('click', function (e) {
	  e.preventDefault();

	  $('a.img-select').removeClass('on');
	  $(this).addClass('on');

	  updateBookInfo($(this).data('book'));
	});


	$('a#reqBtn').on('click', function (e) {
	  e.preventDefault();

	  if ($('input#book_name').val() == '') {
		alert('도서를 선택해주세요');
		$('input#book_name').focus();
		return false;
	  }

	  if(doAjaxPost($('form#bookSaveForm'))) {
		location.reload();
	  }
	});
  });

  function updateBookInfo(bookData) {
	$('.title-txt').text(bookData.book_name);
	$('.author-txt').text(bookData.author_name);
	$('.publisher-txt').text(bookData.book_pubname);
	$('.pubdate-txt').text(bookData.book_pubdt);
	$('.isbn-txt').text(bookData.isbn13);
	$('.book-info-txt').text(bookData.book_info);
	$('.select-img-box').attr("src",bookData.book_image);
	
	var $form = $('form#bookSaveForm');
	$form.find('#book_name').val(bookData.book_name);
	$form.find('#author_name').val(bookData.author_name);
	$form.find('#book_pubname').val(bookData.book_pubname);
	$form.find('#book_pubdt').val(bookData.book_pubdt);
	$form.find('#isbn13').val(bookData.isbn13);
	$form.find('#book_code').val(bookData.book_code);
	$form.find('#book_idx').val(bookData.book_idx);
	$form.find('#cate_name').val(bookData.cate_name);
	$form.find('#comp_name').val(bookData.comp_name);
  }
</script>

<form:form id="bookSaveForm" modelAttribute="hopeElibBook" action="hopeElibsave.do">
	<form:hidden path="menu_idx"/>
	<form:hidden path="editMode" value="ADD"/>
	<form:hidden path="book_name"/>
	<form:hidden path="author_name"/>
	<form:hidden path="book_pubname"/>
	<form:hidden path="book_pubdt"/>
	<form:hidden path="isbn13"/>
	<form:hidden path="book_code"/>
	<form:hidden path="book_idx"/>
	<form:hidden path="cate_name"/>
	<form:hidden path="comp_name"/>
	<form:hidden path="application_status" value="1"/>
</form:form>

${html.html}
<h3>신청시 유의사항 안내</h3>
<div class="txt-box">
	<ul class="con">
		<li>정회원에 한하여 월별 1인당 최대 2권까지 신청하실 수 있습니다.</li>
		<li>일반도서와 달리 출판사에서 개인소비자(B2C)와 기관(B2B)에 납품되는 전자책을 구분하여 운영 중이므로, 모든 희망 전자책를 구입할 수 없는 점 양해 부탁드립니다.</li>
		<li>희망 전자책 구입 후 신청 이용자에게 우선 대출은 되지 않으며, 최대 5명까지 대출 가능합니다.</li>
	</ul>
</div>
<br/>
<form:form id="bookListForm" modelAttribute="hopeElibBook" action="hopeElibSearch.do" method="GET" autocomplete="off">
	<div id="searchBox">
		<form:hidden path="viewPage"/>
		<form:hidden path="menu_idx"/>
		<form:hidden path="parent_id"/>
		<!--
		<div class="search-form">
			<div class="box-1">
				<form:input path="search_text" type="text" class="text-elib" placeholder="검색어를 입력하세요."/>
			</div>
			<div class="box-2">
				<a href="#doElibSearch" id="do-elibsearch"><img src="/resources/common/elib/img/group0.svg" alt=""/></a>
			</div>
		</div>
		-->

		<div class="category-tab">
			<ul>
				<li>
					<a href="#" class="category-tab-btn" data-menu_idx="74" data-menu="CATEGORY" data-field1_name="parent_id" data-keyValue="0">
						<span class="">전체</span>
					</a>
				</li>
				<c:forEach items="${categoryList}" var="i" varStatus="status">
					<li>
						<a href="#" class="category-tab-btn ${hopeElibBook.parent_id == i.cate_id ? 'on' : ''}"
						   data-menu_idx="74"
						   data-menu="CATEGORY"
						   data-field1_name="parent_id"
						   data-keyValue="${i.cate_id}">
								${i.cate_name}
							<span class="">(<fmt:formatNumber value="${i.cnt}" pattern="#,###"/>)</span>
						</a>
					</li>
				</c:forEach>
			</ul>
		</div>

		<div class="search-result-count">
			<span>전체</span> <span><fmt:formatNumber value="${hopeBookListCnt}" pattern="#,###"/></span>개 결과입니다.
		</div>
		<div class="search-wrap">
			<c:if test="${fn:length(hopeBookList) < 1}">
				<tr>
					<td colspan="8">데이터가 존재하지 않습니다.</td>
				</tr>
			</c:if>
			<div class="search-results">
				<ul>
					<c:forEach items="${hopeBookList}" var="i" varStatus="status">
						<li class="thumb">
							<c:set var="book_info" value="${i.book_info}" />
							<c:set var="book_info" value="${fn:replace(book_info, '‘', '')}" />
							<c:set var="book_info" value="${fn:replace(book_info, '’', '')}" />
							<c:set var="book_info" value="${fn:replace(book_info, '“', '')}" />
							<c:set var="book_info" value="${fn:replace(book_info, '”', '')}" />
							<c:set var="book_info" value="${fn:replace(book_info, '…', '...')}" />
							<c:set var="book_info" value="${fn:replace(book_info, '…', '...')}" />
							<c:set var="book_info" value="${fn:replace(book_info, '《', '')}" />
							<c:set var="book_info" value="${fn:replace(book_info, '》', '')}" />
							<c:set var="book_info" value="${fn:replace(book_info, crlf, '&nbsp;')}"></c:set>
							<a href="#" class="img-select"
								data-book='{
											"book_name": "${i.book_name}",
											"author_name": "${i.author_name}",
											"book_pubname": "${i.book_pubname}",
											"book_pubdt": "${i.book_pubdt}",
											"isbn13": "${i.isbn13}",
											"book_code": "${i.book_code}",
											"book_idx": "${i.book_idx}",
											"cate_name": "${i.cate_name}",
											"comp_name": "${i.comp_name}",
											"book_image": "${i.book_image}",
											"book_info":"${book_info}"
											}'>
								<img src="${i.book_image}" alt="${i.book_name}" title="${i.book_name}" class="refImg" onError="this.src='/resources/homepage/elib/img/noImg.gif'">
							</a>
						</li>
					</c:forEach>

				</ul>
			</div>

			<jsp:include page="/WEB-INF/views/app/cms/common/paging.jsp" flush="false">
				<jsp:param name="formId" value="#bookListForm"/>
				<jsp:param name="pagingUrl" value="hopeElibSearch.do"/>
			</jsp:include>

		</div>
		<br/>
		<div class="req-hopebook-info">
			<div class="req-hopebook-box">
				<div class="inline icon-box">
					<img class="select-img-box" src="/resources/homepage/elib/img/noImg.gif" onError="this.src='/resources/homepage/elib/img/noImg.gif'"/>
				</div>

				<div class="inline req-info-box">
					<div class="title title-txt">도서를 선택해주세요</div>
					<div class="line"></div>
					<div class="req-etc-info">
						<span class="req-etc-info-title">저자</span>
						<span class="author-txt"></span><br/>
						<span class="req-etc-info-title">출판사</span>
						<span class="publisher-txt"></span> · <span class="req-etc-info-title">출판년월일</span>
						<span class="pubdate-txt"></span> · <span class="req-etc-info-title">ISBN</span>
						<span class="isbn-txt"></span>
					</div>
					<div>
						<span class="book-info-txt"></span>
					</div>
				</div>

				<div class="inline btn-box">
					<a href="#" class="req-btn" id="reqBtn">신청하기</a>
					<a href="/${homepage.context_path}/module/elib/search/hopeApplicationList.do?menu_idx=${menuOne.menu_idx}&editMode=NOAJAX" class="req-list" id="reqList">신청내역</a>
				</div>
			</div>
		</div>
	</div>
</form:form>