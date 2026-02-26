<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.ResourceBundle" %>
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
<%!
public final String API_KEY = ResourceBundle.getBundle("api").getString("kakao.api.key");
%>
<script>
$(document).ready(function() {
	var query = $('#search_text').val();
	var target = $('#search_type').val();
	var page = $('#viewPage').val();	
	var url = 'https://dapi.kakao.com/v3/search/book?query=' + query +'&page=' + page + '&target=' + target;
	var jsonData = new Array();
	var jsonString = null;
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
	      'Authorization' : <%= API_KEY%>
	    },
	    redirect: 'follow', // manual, *follow, error
	    referrerPolicy: 'no-referrer', // no-referrer, *no-referrer-when-downgrade, origin, origin-when-cross-origin, same-origin, strict-origin, strict-origin-when-cross-origin, unsafe-url	  
	  });
	  return response.json(); // JSON 응답을 네이티브 JavaScript 객체로 파싱
	}
	
	// { query: '홍길동', page : 1, target : 'person' }
	postData(url).then((data) => {
		for(var i = 0 ; i < Object.keys(data.documents).length; i++){
			jsonString = "{" + '"authors"' + ":" + JSON.stringify(data.documents[i].authors) + ','
			+ '"contents"' + ":" + JSON.stringify(data.documents[i].contents) + ','
			+ '"datetime"' + ":" + JSON.stringify(data.documents[i].datetime) + ','
			+ '"isbn"' + ":" + JSON.stringify(data.documents[i].isbn) + ','
			+ '"price"' + ":" + JSON.stringify(data.documents[i].price) + ','
			+ '"publisher"' + ":" + JSON.stringify(data.documents[i].publisher) + ','
			+ '"sale_price"' + ":" + JSON.stringify(data.documents[i].sale_price) + ','
			+ '"status"' + ":" + JSON.stringify(data.documents[i].status) + ','
			+ '"thumbnail"' + ":" + JSON.stringify(data.documents[i].thumbnail) + ','
			+ '"title"' + ":" + JSON.stringify(data.documents[i].title) + ','
			+ '"translators"' + ":" + JSON.stringify(data.documents[i].translators) + ','
			+ '"url"' + ":" + JSON.stringify(data.documents[i].url) + "}";
			jsonData.push(jsonString.replaceAll(',','^^^^'));
		}			
		$('#totalDataCount').val(data.meta.pageable_count);
		$('#jsonData').val(jsonData);
			document.getElementById('searchKakaoForm').submit();
	});
});
</script>
<body>
<form id="searchKakaoForm" action="searchKakao.do" onsubmit="return false;" method="post">
<input type="hidden" name="editMode" id="editMode" value="${librarySearch.editMode }"/>
<input type="hidden" name="search_type" id="search_type" value="${librarySearch.search_type }"/>
<input type="hidden" name="search_text" id="search_text" value="${librarySearch.search_text }"/>
<input type="hidden" name="viewPage" id="viewPage" value="${librarySearch.viewPage }"/>
<input type="hidden" name="menu_idx" id="menu_idx" value="${librarySearch.menu_idx}"/>
<input type="hidden" name="isbn" id="isbn" value="${librarySearch.isbn }"/>
<input type="hidden" name="bookValue" id="bookValue" value="${librarySearch.bookValue }" />
<input type="hidden" name="jsonData" id="jsonData" />
<input type="hidden" name="totalDataCount" id="totalDataCount" />
<div id="kakaoLoadingImg" style="position: relative;">
	<br><br>
	<img id="loading_img" alt="loading" src="/resources/common/img/viewLoading.gif" style="position: absolute;left: 50%;">
	<br><br>
	<p style="position: absolute;left: 45%;">검색자료 불러오는 중</p>
	<br><br><br><br>
</div>
</form>		
</body>
</html>