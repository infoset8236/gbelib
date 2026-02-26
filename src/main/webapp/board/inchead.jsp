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
<link rel="stylesheet" type="text/css" href="/resources/board/css/default.css"/>
<script type="text/javascript" src="/resources/common/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/common/js/default.js"></script>
<script type="text/javascript" src="/resources/board/js/common.js"></script>
<!--[if lte IE 7]>
<link rel="stylesheet" type="text/css" href="/resources/common/css/fontawesome-ie7.min.css"/>
<![endif]-->
</head>
<body>