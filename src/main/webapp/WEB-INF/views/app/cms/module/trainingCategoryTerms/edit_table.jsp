<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="/resources/cms/js/malsup.jquery.form.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(function() {
	$('#trainingCategoryTerms a.add').on('click', function(e) {		
		if(doAjaxPost($('#trainingCategoryTerms'))) {				
			$("div#editTable").load("edit_table.do?idx_param=${trainingCategoryTerms.idx_param}&index_no=${trainingCategoryTerms.index_no}");
		}	
	});	
	
	$('#trainingCategoryTerms a.delete').on('click', function(e) {
		$('#terms_idx').val($(this).attr('keyValue'));
		$('#trainingCategoryTerms').attr('action','delete.do');
		if(doAjaxPost($('#trainingCategoryTerms'))) {
			$('#trainingCategoryTerms').attr('action','save.do');
			$("div#editTable").load("edit_table.do?idx_param=${trainingCategoryTerms.idx_param}&index_no=${trainingCategoryTerms.index_no}");
		}	
	});
	
});
</script>

<form:form id="trainingCategoryTerms" modelAttribute="trainingCategoryTerms" method="post" action="save.do">
	<form:hidden path="homepage_id"/>
	<form:hidden path="large_category_idx"/>
	<form:hidden path="group_idx"/>
	<form:hidden path="category_idx"/>
	<form:hidden path="idx_param"/>
	<form:hidden path="index_no"/>
<table class="type1 center">
	<colgroup>
	   <col width="50" />
       <col width="500" />
       <col width="*"/>
      	</colgroup>
      	<thead>
		<tr>
			<th>번호</th>				
			<th>약관선택</th>
			<th>기능</th>
		</tr>
	</thead>
      	<tbody>
		
			<c:choose>
				<c:when test="${trainingCategoryTermsListCount > 0 }">
				<c:forEach var="i" items="${trainingCategoryTermsList }" varStatus="status">	         		
	         		<tr>
	         			<c:if test="${status.index == 0}">
							<td rowspan="${trainingCategoryTermsListCount}">
								${trainingCategoryTerms.index_no}
							</td>
						</c:if>
	         			<td>
		         			약관분류 : ${i.terms_type_name } > 제목 : ${i.title }			         						         					        			 					         			        					         				         	
		         		</td>
		         		<td>
		         			<a href="#" class="btn delete" keyValue="${i.terms_idx}">삭제</a>
		         		</td>
		         	</tr>
	         		</c:forEach>
         		</c:when>
         		<c:otherwise>	         			
	         		<tr>
	         			<td>
	         				${trainingCategoryTerms.index_no}
	         			</td>
		         		<td>
		         			등록된 약관이 없습니다.		
		         		</td>
	         		</tr>
         		</c:otherwise>
        		</c:choose>

       	<tr>
       		<td colspan="2">
       			<form:select path="terms_idx" cssClass="selectmenu">
        				<c:forEach var="i" items="${trainingTermsList }">
        					<form:option value="${i.terms_idx }">약관분류 : ${i.terms_type_name} > 제목 : ${i.title}</form:option>
        				</c:forEach>
        			</form:select> 
       		</td>
       		<td>
       			<a href="#" class="btn btn5 add">등록</a>
       		</td>
       	</tr>			
	</tbody>
</table>
</form:form>