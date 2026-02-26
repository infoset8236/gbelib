<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.net.ssl.HttpsURLConnection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
try {
URL url = new URL("https://dapi.kakao.com/v3/search/book?query=%EA%B9%80%ED%99%8D%EB%8F%84&page=1&target=person");

HttpsURLConnection connection = null;
connection = (HttpsURLConnection) url.openConnection();
connection.setRequestProperty("Content-Type", "application/json; utf-8");
connection.setRequestProperty("Accept-Charset", "UTF-8");
connection.setRequestProperty("Authorization", "KakaoAK e1230474b73f63cdc0c50a7c724b142c");
connection.setRequestProperty("Accept-Language", "utf-8,ko;q=0.8,en-us;q=0.5,en;q=0.3");
connection.setRequestProperty("User-Agent", "Mozilla/5.0");
connection.setDoOutput(true);
connection.setConnectTimeout(10000);
connection.setReadTimeout(10000);

connection.setRequestMethod("GET");
int responseCode = connection.getResponseCode();

System.out.println("######################################################");
System.out.println("status code="+connection.getResponseCode());
System.out.println("content type="+connection.getContentType());
System.out.println("content length="+connection.getContentLength());
System.out.println("######################################################");

%>
<div align="left" style="font-size: 85px;">
<% 
BufferedReader br = null;
br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
String inputLine;
StringBuffer result = new StringBuffer();
while ((inputLine = br.readLine()) != null) {
	result.append(inputLine);
}
%>
<%
if (responseCode == 200) {
%>
<br/>
RESULT : <%=result.toString()%>
<%
}else{
%>
	<%=result.toString()%>
<% 
}
%>
<%
}
catch ( Exception e ) {
	e.printStackTrace();
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!에러 : " + e);
}
%>
</body>
</html>