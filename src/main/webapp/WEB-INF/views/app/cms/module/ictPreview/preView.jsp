<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
div.page-subtitle, div.copyright {display:none;}
.wrapper-white{padding:0;}
</style>

<link href="/resources/common/ict/css/reset.css" rel="stylesheet" type="text/css" />
<link href="/resources/common/ict/css/index.css" rel="stylesheet" type="text/css" />
<title>Document</title>
</head>
<body>
<div class="content">
  <div class="home">
    <a href="javascript:history.back('-2');">
      <img src="/resources/common/ict/img/home.svg" alt="">
    </a>
  </div>
  <iframe src="${param.url}" width="${param.width}" height="${param.height}" title="키오스크 메인 세로형"></iframe>
</div>
<script>
	const zoomLevel = 0.50;

	$('body').css({
		transform: `scale(${zoomLevel})`,
		transformOrigin: 'top left',
		width: `${100 / zoomLevel}%`,
		height: '200vh',
	});

	$('html, body').css({
		margin: '0',
		padding: '0',
	});
</script>
