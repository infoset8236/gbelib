<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.net.ssl.HttpsURLConnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="/resources/common/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/common/js/jquery-ui-1.12.0.min.js"></script>
<script type="text/javascript" src="/resources/common/js/jquery-ui-1.12.0-datepicker.min.js"></script>
<script>
async function postData(url = '', data = {}) {
	  // 옵션 기본 값은 *로 강조
	  const response = await fetch(url, {
	    method: 'POST', // *GET, POST, PUT, DELETE 등
	    mode: 'cors', // no-cors, *cors, same-origin
	    cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
	    credentials: 'same-origin', // include, *same-origin, omit
	    headers: {
	      'Content-Type': 'application/json',
	      // 'Content-Type': 'application/x-www-form-urlencoded',
	      'Authorization' : 'KakaoAK e1230474b73f63cdc0c50a7c724b142c'
	    },
	    redirect: 'follow', // manual, *follow, error
	    referrerPolicy: 'no-referrer', // no-referrer, *no-referrer-when-downgrade, origin, origin-when-cross-origin, same-origin, strict-origin, strict-origin-when-cross-origin, unsafe-url
	    body: JSON.stringify(data), // body의 데이터 유형은 반드시 "Content-Type" 헤더와 일치해야 함
	  });
	  return response.json(); // JSON 응답을 네이티브 JavaScript 객체로 파싱
	}

	
	postData('https://dapi.kakao.com/v3/search/book?', { query: '홍길동', page : 1, target : 'person' }).then((data) => {
	  console.log(data); // JSON 데이터가 `data.json()` 호출에 의해 파싱됨
	});




</script>
<body>

</body>
</html>