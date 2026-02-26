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
		<link href="/resources/ict/mediawall/css/type_c/font.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/mediawall/css/type_c/reset.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/mediawall/css/type_c/styles.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/mediawall/css/type_c/swiper-bundle.min.css" rel="stylesheet" type="text/css " />
		<script src="/resources/ict/mediawall/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
		<script src="/resources/ict/mediawall/plugin/swiper-bundle.min.js" type="text/javascript"></script>
		<script src="/resources/ict/mediawall/js/type_c/script.js" type="text/javascript"></script>
		<title>대출반납일</title>
	</head>
	<body>
	<div class="media_return_container">
		<div class="media_common_header_wrapper">
			<div class="media_common_header">
				<div class="media_common_header_kr media_common_black">대출반납일</div>
				<div class="media_common_header_en">BOOK LOAN RETURN DATE</div>
			</div>
			<div class="media_common_header">
				<div class="media_common_header_time media_common_black"></div>
				<div class="media_common_header_date media_common_black"></div>
			</div>
		</div>
		<div class="media_return_content">
			<div class="media_return_top">
				<div class="media_return_number_wrapper media_return_20">
					<div class="media_return_number">${fn:substring(month, 0, 1)}</div>
					<div class="media_return_number_divider"></div>
				</div>
				<div class="media_return_number_wrapper media_return_120">
					<div class="media_return_number">${fn:substring(month, 1, 2)}</div>
					<div class="media_return_number_divider"></div>
				</div>
				<div class="media_return_number_wrapper media_return_20">
					<div class="media_return_number">${fn:substring(day, 0, 1)}</div>
					<div class="media_return_number_divider"></div>
				</div>
				<div class="media_return_number_wrapper media_return_120">
					<div class="media_return_number">${fn:substring(day, 1, 2)}</div>
					<div class="media_return_number_divider"></div>
				</div>
				<div class="media_return_text_wrapper">
					<div class="media_return_text">${loanDate}</div>
					<div class="media_return_text_divider"></div>
				</div>
			</div>
			<div class="media_return_bottom">
				<div class="media_return_number_wrapper media_return_20">
					<div class="media_return_number">${fn:substring(returnMonth, 0, 1)}</div>
					<div class="media_return_number_divider"></div>
				</div>
				<div class="media_return_number_wrapper media_return_120">
					<div class="media_return_number">${fn:substring(returnMonth, 1, 2)}</div>
					<div class="media_return_number_divider"></div>
				</div>
				<div class="media_return_number_wrapper media_return_20">
					<div class="media_return_number">${fn:substring(returnDay, 0, 1)}</div>
					<div class="media_return_number_divider"></div>
				</div>
				<div class="media_return_number_wrapper media_return_120">
					<div class="media_return_number">${fn:substring(returnDay, 1, 2)}</div>
					<div class="media_return_number_divider"></div>
				</div>
				<div class="media_return_text_wrapper">
					<div class="media_return_text">${returnDate}</div>
					<div class="media_return_text_divider"></div>
				</div>
			</div>
		</div>
	</div>
	</body>
</html>