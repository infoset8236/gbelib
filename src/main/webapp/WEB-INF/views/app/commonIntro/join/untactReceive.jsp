<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
 /**
  * @Class Name  : receive.jsp
  * @Description : 데이터 전송화면
  */
%>
<%
	String txId = request.getParameter("txId");
// 	if (txId != null) {
// 		txId = txId.replace(/</g,"&lt;");
// 		txId = txId.replace(/>/g,"&gt;");
// 	} else {
// 		return;
// 	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>비대면 자격확인 데이터전송</title>
<script type="text/javascript">   

function init(){
    self.close();
    alert(' 처리하는데 5~10초 정도 소요됩니다.\n 확인 후 인증 완료 안내창이 뜨기 전 까지 잠시만 기다려주세요.');
	//트랜젝션ID 전송 및 스크립트 실행
    opener.document.getElementById('tx_id').value = document.frm.txId.value;
    opener.location.href="javascript:fn_info_set();";
};
</script>
</head>
<body onLoad="javascript:init();">
<form name="frm" method="post" action="" >
    <input type="hidden" name="txId" value="<%=txId%>"/>
</form>
</body>
</html>