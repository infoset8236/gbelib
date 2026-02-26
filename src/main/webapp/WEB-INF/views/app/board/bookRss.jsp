<%@ page language="java" contentType="application/rss+xml; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0"
	xmlns:content="http://purl.org/rss/1.0/modules/content/"
	xmlns:dc="http://purl.org/dc/elements/1.1/"
	xmlns:atom="http://www.w3.org/2005/Atom"
	>

	<channel>
		<title>${homepage.homepage_name}</title>
		<c:choose>
		<c:when test="${fn:length(boardList) > 0}">
		<atom:link href="http://www.gbelib.kr/${homepage.context_path}/board/index.do?manage_idx=${boardList[0].manage_idx}&amp;menu_idx=${boardList[0].menu_idx}"  rel="self" type="application/rss+xml"/>
		<link>http://www.gbelib.kr/${homepage.context_path}/board/index.do?manage_idx=${boardList[0].manage_idx}&amp;menu_idx=${boardList[0].menu_idx}</link>
		</c:when>
		<c:otherwise>
		<atom:link href="http://www.gbelib.kr/${homepage.context_path}/index.do"  rel="self" type="application/rss+xml"/>
		<link>http://www.gbelib.kr/${homepage.context_path}/index.do</link>
		</c:otherwise>
		</c:choose>
		<description>${homepage.homepage_name} 추천도서</description>
		<language>ko-KR</language>
		<%--<lastBuildDate>Mon, 30 Sep 2002 11:00:00 GMT</lastBuildDate>--%>
		<c:forEach var="i" varStatus="status" items="${boardList}">
		<item>
			<title><![CDATA[${i.title}]]></title>
			<category><![CDATA[${i.category1_name}]]></category>
			<img><![CDATA[${i.preview_img}]]></img>
			<author><![CDATA[${i.imsi_v_3}]]></author>
			<publisher><![CDATA[${i.imsi_v_4}]]></publisher>
			<pub_year><![CDATA[${i.imsi_v_2}]]></pub_year>
			<loc><![CDATA[${i.imsi_v_6}]]></loc>
			<classno><![CDATA[${i.imsi_v_7}]]></classno>
			<link><![CDATA[http://www.gbelib.kr/${homepage.context_path}/board/view.do?manage_idx=${i.manage_idx}&board_idx=${i.board_idx}&menu_idx=${i.menu_idx}]]></link>
		</item>
		</c:forEach>
	</channel>
</rss>