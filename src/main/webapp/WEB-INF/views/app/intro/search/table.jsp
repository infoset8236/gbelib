<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript">
$(function() {
	$('div.search-info').html("검색결과 '<b class=\"og\"><i>${librarySearch.search_text}</i></b>'에 대한 <b>${librarySearch.viewPage}</b>/${result.totalPage}페이지, 총 <b>${result.totalCnt}</b>건");
	$('#allBookListStr').val('${librarySearch.allBookListStr}');
	
	$('a.showSlide').on('click', function(e) {
		e.preventDefault();
		var bci = $(this).parents('div.bif').next('div.bci'); 
		var toggleState = $(bci).is(':hidden');
		var keyValue = $(this).attr('keyValue');
		if (toggleState) {
			$(bci).load('index_detail.do?vLoca='+$(this).attr('vLoca')+'&vCtrl='+$(this).attr('vCtrl') + '&value=' + keyValue, function() {
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
		$('form#detailForm').submit();
	});
});

</script>

<form:form id="searchTableForm" modelAttribute="librarySearch" method="GET">
	<c:forEach items="${result.dsResult}" var="i">
		<div class="row">
						<p class="admin"><input name="print_param" type="checkbox" class="checkBook" value="${i.DISP07}_${i.CTRL}"/></p>
			<div class="thumb">
					<c:choose>
						<c:when test="${i.IMAGE_URL eq '' or fn:contains(i.IMAGE_URL, 'noimg')}">
							<a href="#" vLoca="${i.DISP07}" vCtrl="${i.CTRL}" vImg="${i.IMAGE_URL}" class="goDetail noImg">
								<img src="/resources/common/img/noImg.gif" alt="noImage"/>
							</a>
						</c:when>
						<c:otherwise>
							<a href="#" vLoca="${i.DISP07}" vCtrl="${i.CTRL}" vImg="${i.IMAGE_URL}" class="goDetail">
								<img src="${i.IMAGE_URL}" alt="${i.title}"/>
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
						<span class="txt"><span class="tit">저자: </span>${fn:replace(fn:escapeXml(i.DISP02), fn:escapeXml(librarySearch.search_text), replaceStr)}</span><span class="bar">|</span>
						<span class="txt"><span class="tit">발행처: </span>${fn:replace(fn:escapeXml(i.DISP03), fn:escapeXml(librarySearch.search_text), replaceStr)}</span><span class="bar">|</span>
						<span class="txt"><span class="tit">발행연도: </span>${fn:escapeXml(i.DISP06)}</span><span class="bar">|</span>
						<span class="txt"><span class="tit">자료이용하는 곳: </span>${lib_name}</span><span class="bar">|</span>
						<span class="txt"><span class="tit">청구기호: </span>${fn:escapeXml(i.DISP04)} ${fn:escapeXml(i.callno)}</span>
						<div class="stat">
							<a href="#" class="showSlide" vLoca="${fn:escapeXml(i.LIMT06)}" vCtrl="${fn:escapeXml(i.CTRL)}" keyValue="${fn:escapeXml(i.LIMT06)}_${fn:escapeXml(i.CTRL)}_${fn:escapeXml(i.tid)}_${fn:escapeXml(i.IMAGE_URL)}"><span>이용가능여부</span><i class="fa fa-angle-down" aria-hidden="true"></i></a>
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
	<br/><br/><br/><b>찾으시는 도서가 없으신가요? </b> <a href="hope/req.do" class="btn btn5">희망도서 신청하기</a>
</form:form>
