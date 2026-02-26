<%@ page language="java" pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeE/common/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="/resources/ict/typeE/common/css/font.css" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Document</title>
  </head>
  <body style="overflow: hidden">
    <div style="display: flex">
      <jsp:include page="/WEB-INF/views/app/ict/typeE/media/weather.jsp" />
      <jsp:include page="/WEB-INF/views/app/ict/typeE/media/news.jsp" />
    </div>
  </body>
</html>
