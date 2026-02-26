<%@ page language="java" pageEncoding="utf-8" %>

<div class="tabmenu tab1">
	<ul>
		<li><a href="#tabCon1">소개&middot;연혁</a></li>
		<li><a href="#tabCon2">운영내용</a></li>
		<li class="active"><a href="#tabCon3">연간계획</a></li>
		<li><a href="#tabCon4">문집</a></li>
		<li><a href="#tabCon5">게시판</a></li>
		<li><a href="#tabCon6">활동사진</a></li>
	</ul>
</div>

<div class="tabCon" id="tabCon1">
	<%@ include file="2-11-1.jsp"%>
</div>

<div class="tabCon" id="tabCon2">
	<%@ include file="2-11-2.jsp"%>
</div>

<div class="tabCon active" id="tabCon3">
	<%@ include file="2-11-3.jsp"%>
</div>