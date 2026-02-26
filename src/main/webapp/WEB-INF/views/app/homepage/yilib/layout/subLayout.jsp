<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="homepageTag" uri="/WEB-INF/config/tld/homepageTag.tld"%>
<tiles:insertAttribute name="header" />
<div id="wrap">

<tiles:insertAttribute name="top" />
<div id="container" class="subpage">
	<div class="doc-info">
		<div class="section">
			<ol>			
				<li class="first"><a href=""><i class="fa fa-home"></i><span>HOME</span></a></li>
				<li><a href="">참여공간</a></li>
				<li class="on"><a href="">공지사항</a></li>
			</ol>
			<ul>
				<li><a href="" class="btn"><i class="fa fa-print"></i><span>인쇄</span></a></li>
			</ul>
		</div>
	</div>
	<div class="section">
		<c:if test="${menuOne ne null}">
		<div class="lnb">
			<h2><b>${menuLeftList[0].menu_name}</b></h2>
			<homepageTag:leftMenu menuList="${menuLeftList}"/>
			<!--<div class="lnb">
			<h2><b>참여마당</b></h2>
			 <ul>
				<li><a href="sub.jsp?menu_seq=">게시판</a></li>
				<li><a href="sub.jsp?menu_seq=1">컨텐츠1</a></li>
				<li><a href="sub.jsp?menu_seq=2">컨텐츠2</a></li>
				<li><a href="sub.jsp?menu_seq=3">컨텐츠3</a></li>
				<li><a href="sub.jsp?menu_seq=4">컨텐츠4</a></li>
				<li><a href="sub.jsp?menu_seq=5">컨텐츠5</a></li>
				<li><a href="sub.jsp?menu_seq=6">컨텐츠6</a></li>
				<li><a href="sub.jsp?menu_seq=7">컨텐츠7</a></li>
				<li><a href="sub.jsp?menu_seq=8">컨텐츠8</a></li>
				<li><a href="http://naver.com" target="_blank">새창 메뉴</a></li>
				<li><a href="">하위 메뉴</a>
					<ul>
						<li><a href="">하위 메뉴 1 (3차 메뉴)</a>
							<ul>
								<li><a href="">하위 메뉴 1-1 (4차 메뉴)</a></li>
								<li><a href="">하위 메뉴 1-2</a></li>
								<li><a href="">하위 메뉴 1-3</a></li>
							</ul>
						</li>
						<li><a href="">하위 메뉴 2</a></li>
						<li><a href="">하위 메뉴 3</a></li>
					</ul>
				</li>
			</ul> -->
		</div>
		</c:if>
		
		<div class="content">
			<div class="doc">
				<div class="doc-head">
					<div class="doc-title">
						<h3>${menuOne.menu_name}</h3>
					</div>
				</div>
				<div class="doc-body con${menuOne.menu_idx}" id="contentArea">
					<tiles:insertAttribute name="body" />
				</div>
			</div>
		</div>
	</div>

</div>

</div>

</div>
<tiles:insertAttribute name="footer" />