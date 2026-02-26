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
		<link href="/resources/ict/typeE/common/css/reset.css" rel="stylesheet" type="text/css" />
        <link href="/resources/ict/typeE/common/css/font.css" rel="stylesheet" type="text/css" />
		<link href="/resources/ict/typeE/mediawall/css/type_b/book_loan_return_date.css" rel="stylesheet" type="text/css" />
		<script src="/resources/ict/typeE/mediawall/plugin/jquery-3.7.1.min.js" type="text/javascript"></script>
		<script src="/resources/ict/typeE/mediawall/plugin/flipclock.min.js" type="text/javascript"></script>
		<title>대출반납일</title>
	</head>
	<body>
	<div class="container">
		<div class="header">
			<div>
				<h1 class="header-title black">대출반납일</h1>
			</div>
			<div>
				<div class="header-caption">BOOK LOAN RETURN DATE</div>
			</div>
		</div>
		<div class="content">
			<div class="wrapper">
				<div class="label_wrapper">
					<div class="label">대출일</div>
					<div class="caption">LOAN DATE</div>
				</div>
				<div class="flip_wrapper">
					<div class="flip_label">MONTH</div>
					<div class="number_wrapper">
						<div class="flip">
							<div class="num_mark_wrap"></div>
							<div class="num_mark_wrapper"></div>
							<div class="num_mark_con"></div>
							<div class="num_mark">${fn:substring(month, 0, 1)}</div>
							<div class="num_mark_style"></div>
						</div>
						<div class="flip">
							<div class="num_mark_wrap"></div>
							<div class="num_mark_wrapper"></div>
							<div class="num_mark_con"></div>
							<div class="num_mark">${fn:substring(month, 1, 2)}</div>
							<div class="num_mark_style"></div>
						</div>
					</div>
				</div>
				<div class="flip_wrapper">
					<div class="flip_label">DAY</div>
					<div class="number_wrapper">
						<div class="flip">
							<div class="num_mark_wrap"></div>
							<div class="num_mark_wrapper"></div>
							<div class="num_mark_con"></div>
							<div class="num_mark">${fn:substring(day, 0, 1)}</div>
							<div class="num_mark_style"></div>
						</div>
						<div class="flip">
							<div class="num_mark_wrap"></div>
							<div class="num_mark_wrapper"></div>
							<div class="num_mark_con"></div>
							<div class="num_mark">${fn:substring(day, 1, 2)}</div>
							<div class="num_mark_style"></div>
						</div>
					</div>
				</div>
				<div class="flip_wrapper">
					<div class="flip_label">WEEK</div>
					<div class="flip week_day">
						<div class="num_mark_wrap"></div>
						<div class="num_mark_wrapper"></div>
						<div class="num_mark_con"></div>
						<div class="num_mark">${loanDate}</div>
						<div class="num_mark_style"></div>
					</div>
				</div>
			</div>
			<div class="wrapper">
				<div class="label_wrapper">
					<div class="label">반납일</div>
					<div class="caption">RETURN DATE</div>
				</div>
				<div class="flip_wrapper">
					<div class="flip_label">MONTH</div>
					<div class="number_wrapper">
						<div class="flip">
							<div class="num_mark_wrap"></div>
							<div class="num_mark_wrapper"></div>
							<div class="num_mark_con"></div>
							<div class="num_mark">${fn:substring(returnMonth, 0, 1)}</div>
							<div class="num_mark_style"></div>
						</div>
						<div class="flip">
							<div class="num_mark_wrap"></div>
							<div class="num_mark_wrapper"></div>
							<div class="num_mark_con"></div>
							<div class="num_mark">${fn:substring(returnMonth, 1, 2)}</div>
							<div class="num_mark_style"></div>
						</div>
					</div>
				</div>
				<div class="flip_wrapper">
					<div class="flip_label">DAY</div>
					<div class="number_wrapper">
						<div class="flip">
							<div class="num_mark_wrap"></div>
							<div class="num_mark_wrapper"></div>
							<div class="num_mark_con"></div>
							<div class="num_mark">${fn:substring(returnDay, 0, 1)}</div>
							<div class="num_mark_style"></div>
						</div>
						<div class="flip">
							<div class="num_mark_wrap"></div>
							<div class="num_mark_wrapper"></div>
							<div class="num_mark_con"></div>
							<div class="num_mark">${fn:substring(returnDay, 1, 2)}</div>
							<div class="num_mark_style"></div>
						</div>
					</div>
				</div>
				<div class="flip_wrapper">
					<div class="flip_label">WEEK</div>
					<div class="flip week_day">
						<div class="divider_day"></div>
						<div class="num_mark_wrap"></div>
						<div class="num_mark_wrapper"></div>
						<div class="num_mark_con"></div>
						<div class="num_mark">${returnDate}</div>
						<div class="num_mark_style"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</body>
</html>