<%@ page language="java" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ko">
<head>
<meta charset="UTF-8"/>
<meta id="_csrf" name="_csrf" th:content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" th:content="${_csrf.headerName}"/>
<title>WBuilder - 더블유빌더</title>
<!--[if IE]>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<![endif]-->
<link rel="icon" type="image/x-icon" href="/favicon.ico"/>
<link rel="stylesheet" type="text/css" href="/resources/common/css/default.css"/>
<link rel="stylesheet" type="text/css" href="/resources/common/css/fontawesome.min.css"/>
<link rel="stylesheet" type="text/css" href="/resources/common/css/select2.min.css"/>
<link rel="stylesheet" type="text/css" href="/resources/common/css/jquery-ui-1.12.0.min.css"/>
<link rel="stylesheet" type="text/css" href="/resources/cms/css/container.css"/>
<script type="text/javascript" src="/resources/common/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/common/js/jquery-ui-1.12.0.min.js"></script>
<script type="text/javascript" src="/resources/common/js/jquery-ui-1.12.0-datepicker.min.js"></script>
<script type="text/javascript" src="/resources/common/js/default.js"></script>
<script type="text/javascript" src="/resources/cms/js/design.js"></script>
<!--[if lte IE 7]>
<link rel="stylesheet" type="text/css" href="/resources/cms/css/fontawesome-ie7.min.css"/>
<link rel="stylesheet" type="text/css" href="/resources/cms/css/ie7.css"/>
<![endif]-->
<!--[if lte IE 8]>
<link rel="stylesheet" type="text/css" href="/resources/cms/css/ie-old.css"/>
<![endif]-->
<!--[if lte IE 9]>
<link rel="stylesheet" type="text/css" href="/resources/cms/css/ie9.css"/>
<![endif]-->

<script type="text/javascript">
$(function(){
	//테이블 공통 (tr,th,td 처음과 끝 요소 클래스명 부여)
	$('table tr:first-child').addClass('first');
	$('table tr').each(function(){
		$(this).children('th:first-child,td:first-child').addClass('first');
		$(this).children('th:last-child,td:last-child').addClass('last');
	});
	
	//셀렉트 메뉴
	$('.selectmenu-search').select2({
		//셀렉트 메뉴에 검색 기능 사용
	});
	$('.selectmenu').select2({
		//셀렉트 메뉴에 검색 기능 사용 안함
		minimumResultsForSearch: Infinity
	});
	
	//type1 테이블에서 체크박스 체크 시 highlight
	$('table.type1 tbody tr').each(function(){
		$(this).on('click',function(){
			if($(this).find('input[type="checkbox"]').is(':checked')){
				$(this).addClass('highlight');
			}else{
				$(this).removeClass('highlight');
			}
		});
	});
});
</script>

</head>
<body>
<div id="wrap">

<div id="container">