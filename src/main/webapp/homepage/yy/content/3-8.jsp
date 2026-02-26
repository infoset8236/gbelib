<%@ page language="java" pageEncoding="utf-8" %>

<ul class="library_newsletter">
	<li>
		<dl>
			<dt>2011 창간호</dt>
			<dd class="thumb"><img src="/resources/homepage/yy/img/contents/library_newsletter2011.jpg" alt="2011 창간호"/></dd>
			<dd><a href="" class="btn btn2">내용보기</a></dd>
		</dl>
	</li>
	<% for(int i=2; i<=6; i++){ %>
	<li>
		<dl>
			<dt>201<%=i%> 제<%=i%>호</dt>
			<dd class="thumb"><img src="/resources/homepage/yy/img/contents/library_newsletter201<%=i%>.jpg" alt="201<%=i%> 제<%=i%>호"/></dd>
			<dd><a href="" class="btn btn2">내용보기</a></dd>
		</dl>
	</li>
	<% } %>
</ul>