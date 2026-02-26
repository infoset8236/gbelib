<%@ page language = "java" contentType = "text/html; charset=UTF-8"%>

<%!
    String getSession(HttpSession session, String attrName)
    {
        return session.getAttribute(attrName) != null ? (String)session.getAttribute(attrName) : "";
    }
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta content="text/html; charset=utf-8" http-equiv="content-type" />
    <title>GPIN SP - SAMPLE - �ъ�⑹�� 蹂몄�몄�몄� 寃곌낵</title>
</head>
<body>
<%
    /**
     * Sample-AuthRequest 瑜� �듯�� �ъ�⑹���몄� ��猷��� session�� ���λ�� �ъ�⑹����蹂대�� 媛��몄�ㅻ�� ���댁�������.
     * Sample-AuthRequest���� 由ы�댄���댁�濡� 吏����� �댁＜�댁�� �곌껐��硫� 蹂댁�ъ��� ��紐⑹�� ���명�� �댁�⑹�� 媛��대��瑜쇱갭議고����湲곕�������.
     */
    // �몄� ������ ��泥�泥��� ���쇳�� ��移��몄�瑜� session�� ���ν�� ��泥��� IP�� 鍮�援��⑸����.
	if (request.getRemoteAddr().equals(session.getAttribute("gpinUserIP")))
	{
%>
    <table>
        <tr>
            <td>以�蹂듯���몄���(dupInfo)</td>
            <td><%= getSession(session, "dupInfo") %></td>
        </tr>
        <tr>
            <td>媛��몄��蹂�踰���(virtualNo)</td>
            <td><%= getSession(session, "virtualNo") %></td>
        </tr>
        <tr>
            <td>�대�(realName)</td>
            <td><%= getSession(session, "realName") %></td>
        </tr>
        <tr>
            <td>�깅�(sex)</td>
            <td><%= getSession(session, "sex") %></td>
        </tr>
        <tr>
            <td>����(age)</td>
            <td><%= getSession(session, "age") %></td>
        </tr>
        <tr>
            <td>��������(birthDate)</td>
            <td><%= getSession(session, "birthDate") %></td>
        </tr>
        <tr>
            <td>援���(nationalInfo)</td>
            <td><%= getSession(session, "nationalInfo") %></td>
        </tr>
        <tr>
            <td>蹂몄�몄�몄�諛⑸�(authInfo)</td>
            <td><%= getSession(session, "authInfo") %></td>
        </tr>
    </table>
<%
	}
	else
	{
%>
		<table>
		<tr><td>�몄��媛��� 諛�吏� 紐삵���듬����.</td></tr>
		</table>
<%
	}
	%>


    <br />
    <a href="javascript:history.back(-2)">Go Back</a>
    <br />
    <a href="Sample-SessionClear.jsp">Session Clear</a>
</body>
</html>