<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet" type="text/css" href="/resources/book/search/css/default.css"/>
<script type="text/javascript">
$(function() {
	$('a#goNotReqHope').on('click',function(e){
		e.preventDefault();
		var comments;
		var libName = $(this).attr('keyValue');
		//console.log(libName);
		if(libName == 'gbccs')
		{
			comments = "2024년부터 희망도서 신청이 가능합니다. (상세내용 공지사항 참고)";
			alert(comments);
		}
		else if(libName == 'geic' || libName == 'sj' || libName == 'ad' || libName == 'gm' || libName == 'gr')
		{
			comments = "2024년 1월부터 다시 희망도서 신청이 가능합니다. (세부내용 공지사항 참고)";
			alert(comments);
		}
		else if(libName == 'yi')
		{
			comments = "희망도서 신청 마감일: 2023. 12. 11.(월)\n마감 이후 신청하신 도서는 2024년 1월에 구입됩니다.";
			alert(comments);
			location.href="/${homepage.context_path}/intro/search/hope/search.do?menu_idx=${menuOne.menu_idx}&editMode=NOAJAX";
		}
		else if(libName == 'adys')
		{
			comments = '11월 1일부터 신청하신 도서는 2024년 1월에 구입 예정입니다.';
			alert(comments);
			location.href="/${homepage.context_path}/intro/search/hope/search.do?menu_idx=${menuOne.menu_idx}&editMode=NOAJAX";
		}
		
		return;
	});
});

</script>

${html.html}

<div class="center" style="padding:10px 0 80px 0">
<%--
	<c:choose>
		<c:when test="${homepage.context_path eq 'gbccs'}">
			<a href="#" id="goNotReqHope" class="btn btn1" title="희망도서 신청하기" keyValue='gbccs'>희망도서 신청하기</a>
		</c:when>
		<c:when test="${homepage.context_path eq 'geic'}">
			<a href="#" id="goNotReqHope" class="btn btn5" title="희망도서 신청하기" keyValue='geic'>희망도서 신청하기</a>
		</c:when>
		<c:when test="${homepage.context_path eq 'sj'}">
			<a href="#" id="goNotReqHope" class="btn btn5" title="희망도서 신청하기" keyValue='sj'>희망도서 신청하기</a>
		</c:when>
		<c:when test="${homepage.context_path eq 'ad'}">
			<a href="#" id="goNotReqHope" class="btn btn5" title="희망도서 신청하기" keyValue='ad'>희망도서 신청하기</a>
		</c:when>
		<c:when test="${homepage.context_path eq 'adys'}">
			<a href="#" id="goNotReqHope" class="btn btn5" title="희망도서 신청하기" keyValue='adys'>희망도서 신청하기</a>
		</c:when>
		<c:when test="${homepage.context_path eq 'gm'}">
			<a href="#" id="goNotReqHope" class="btn btn5" title="희망도서 신청하기" keyValue='gm'>희망도서 신청하기</a>
		</c:when>		
		<c:when test="${homepage.context_path eq 'gr'}">
			<a href="#" id="goNotReqHope" class="btn btn5" title="희망도서 신청하기" keyValue='gr'>희망도서 신청하기</a>
		</c:when>		
		<c:when test="${homepage.context_path eq 'yi'}">
			<a href="#" id="goNotReqHope" class="btn btn5" title="희망도서 신청하기" keyValue='yi'>희망도서 신청하기</a>
		</c:when>		
		<c:otherwise>
			<a href="/${homepage.context_path}/intro/search/hope/search.do?menu_idx=${menuOne.menu_idx}&editMode=NOAJAX" id="goReqHope" class="btn btn1" title="희망도서 신청하기">희망도서 신청하기</a>
		</c:otherwise>
	</c:choose>
--%>
	<a href="/${homepage.context_path}/intro/search/hope/search.do?menu_idx=${menuOne.menu_idx}&editMode=NOAJAX" id="goReqHope" class="btn btn1" title="희망도서 신청하기">희망도서 신청하기</a>
	<a href="/${homepage.context_path}/intro/search/hope/history.do?menu_idx=${hopeHistoryMenuIdx}" id="goReqHopeList" class="btn btn1" title="희망도서신청내역" style="background:#eb0b0b;border:1px solid #b91212;">희망도서신청내역 확인하기</a>
</div>