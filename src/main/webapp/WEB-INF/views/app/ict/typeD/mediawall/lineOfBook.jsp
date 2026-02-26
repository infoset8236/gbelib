<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" name="viewport" />
		<meta content="ie=edge" http-equiv="X-UA-Compatible" />
		<link href="/resources/ict/typeD/mediawall/css/type_a/reset.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/typeD/mediawall/css/type_a/font.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/typeD/mediawall/css/type_a/common.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/typeD/mediawall/css/type_a/a_line_of_book.css" rel="stylesheet" type="text/css" />
		<script src="/resources/ict/typeD/mediawall/js/type_a/wisesaying.js" type="text/javascript"></script>
		<script src="/resources/ict/typeD/mediawall/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
		<script src="/resources/ict/typeD/mediawall/js/type_a/a_line_of_book.js" type="text/javascript"></script>
		<!--<script src="/resources/ict/typeD/mediawall/js/type_a/wisesaying.js" type="text/javascript"></script>-->
		<title>책속한줄</title>
	</head>
	<body>
	<div class="div_wrap bookline-wrap" id="fade-effect">
		<img class="bg_wrap" src="/resources/ict/typeD/mediawall/img/type_a/a_line_of_book/leaves.png" />
		<div class="bg_point_01"></div>
		<div class="bg_point_02"></div>
		<div class="header_wrap">
			<div class="header_frame">
				<div class="header_group">
					<div class="ict_tit_01">책 속 한 줄</div>
					<div class="ict_tit a-line-of-books">A LINE OF BOOK</div>
				</div>
			</div>
		</div>
		<div id="leaves">
			<i></i>
			<i></i>
			<i></i>
			<i></i>
			<i></i>
			<i></i>
			<i></i>
			<i></i>
			<i></i>
			<i></i>
			<i></i>
			<i></i>
			<i></i>
			<i></i>
			<i></i>
		</div>
		<div class="li_book_tit_wrap">
			<p class="li_book_tit" id="wiseSayingTxt"></p>
			<div class="li_book_tit_02" id="wiseSayingComentary"></div>
		</div>
	</div>
	</body>
	<script>
		$(document).ready(function () {
			wisesaying();
			let timerId = setInterval(() => wisesaying(), 15000);
		});

		function wisesaying() {
			var randomNum = Math.floor(Math.random() * 11);

			$('#wiseSayingComentary').css({ opacity: '0', marginTop: '30px' });
			$('#wiseSayingTxt').css({ opacity: '0' });
			$('#wiseSayingTxt').html(wiseSayingTxt[randomNum]);
			$('#wiseSayingComentary').html(wiseSayingComentary[randomNum]);
			$('#wiseSayingComentary').animate({ opacity: '1', marginTop: '0' }, 4000);
			$('#wiseSayingTxt').animate({ opacity: '1', marginTop: '0' }, 6000);

			animate();
		}
	</script>
</html>