<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript">
$(function() {
	$('a.add').on('click', function(e) {		
		$('#dialog-1').load('edit.do?editMode=ADD&idx_param=' + $(this).attr('keyValue1')
				 + '&index_no=' + $(this).attr('keyValue2'), function( response, status, xhr ) {
			$('#dialog-1').dialog('open')
		});		
		e.preventDefault();
	});
});
</script>
<table class="type1 center">
	<thead>
		<tr>
			<th>번호</th>
			<th>
				대분류 명<br/>(코드)			
			</th>
			<th>
				중분류 명<br/>(코드)							
			</th>	
			<th>
				소분류 명<br/>(코드)
			</th>
			<th>
				관리
			</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${codeListCount > 0 }">
				<c:forEach var="i" items="${codeList }" varStatus="status">
					<tr>
						<td>${status.index + 1 }</td>
						<td>
							<c:set var="large" value="${fn:split(i,'//')[0]} "/>
							${fn:split(large,':')[1]}<br/>(${fn:split(large,':')[0]})
						</td>
						<td>
							<c:choose>
								<c:when test="${fn:split(i,'//')[1] ne null and fn:split(i,'//')[1] ne ''}">
									<c:set var="group" value="${fn:split(i,'//')[1]} "/>
									${fn:split(group,':')[1]}<br/>(${fn:split(group,':')[0]})
								</c:when>
								<c:otherwise>
									-
								</c:otherwise>
							</c:choose>					
						</td>
						<td>
							<c:choose>
								<c:when test="${fn:split(i,'//')[2] ne null and fn:split(i,'//')[2] ne ''}">
									<c:set var="cate" value="${fn:split(i,'//')[2]} "/>
									${fn:split(cate,':')[1]}<br/>(${fn:split(cate,':')[0]})
								</c:when>
								<c:otherwise>
									-
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<a href="" class="btn add" keyValue1="${fn:split(large,':')[0]}_${fn:split(group,':')[0]}_${fn:split(cate,':')[0]}" keyValue2="${status.index + 1 }">등록/삭제</a>											
						</td>					
					</tr>			
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="4">
						데이터가 존재하지 않습니다.
					</td>
				</tr>
			</c:otherwise>
		</c:choose>		
		
	</tbody>	
</table>
<div id="dialog-1" class="dialog-common" title="약관 선택"></div>