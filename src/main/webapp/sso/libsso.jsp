<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.IOException" %>
<%@ page import="com.ksign.access.wrapper.sso.conf.SSOConfManager" %>
<%@ page import="com.ksign.access.wrapper.api.*"%>
<%@ page import="kr.co.whalesoft.app.cms.member.Member" %>

<%!
    // -------------------------------------------------------------------------
    //  [유틸] 로그인 오류 발생 시, alert() 출력 후 다음 페이지로 이동하는 메소드
    // -------------------------------------------------------------------------
    public void sendAlert(HttpServletResponse resp, String alertMsg, String nextURI) throws IOException {

        alertMsg = alertMsg.replaceAll("\"", "\\\"");
        alertMsg = alertMsg.replaceAll("\r", "\\r");
        alertMsg = alertMsg.replaceAll("\n", "\\n");

        String msg = 
            "<script language=\"javascript\">\r\n" +
            "  alert(\"" + alertMsg + "\");\r\n" +
            "  top.location.href = \"" + nextURI + "\";\r\n" +
            "</script>\r\n";

        resp.setCharacterEncoding("UTF-8");
        // resp.setContentLength();

        PrintWriter out = resp.getWriter();
        out.println(msg);
        out.flush();
    }
%>
<%
	//<SSO.1> SSO 서비스 객체 획득
	//String federation = request.getParameter("federation");
	SSOService ssoService = SSOService.getInstance();
	
	Member member = (Member)request.getSession().getAttribute("member");
	
	// <SSO.2> 인증토큰 발급: 추가 속성정보 설정
	// - 응용시스템에서 SSO 처리 시 필요로 하는 추가 정보를 인증토큰을 통해
	// 안전하고 신뢰 할 수 있는 방식으로 전달하기 위해 사용
	// - eg. 이름/부서/직급/권한/역할 등
	
	String avps = "member_name="+member.getMember_name()+"$loca="+member.getLoca()+"$status_code="+member.getStatus_code()+"$login_type="+member.getLoginType();
	
	// <SSO.3>. 인증 토큰 생성 요청
	// returnUrl: 응용 커스터 마이징 필요
	String reqCtx = request.getContextPath();
	String ssoReturnUrl = "http://" + request.getServerName() + ":" + request.getServerPort() + reqCtx + "/sso/index.jsp";
	String agentip = request.getLocalAddr();
	
	// case1. SSO API 내에서 SSO 서버로 리다이렉트 수행
	SSORspData rspData = null;
	rspData = ssoService.ssoReqIssueToken(request, response, "form-based", member.getMember_id(), avps, ssoReturnUrl, agentip, request.getRemoteAddr());

	
	if(rspData != null && rspData.getResultCode() == -1) {
		String alertMsg = "사용자 인증토큰 요청정보 생성에 실패하였습니다. 시스템 자체 로그인을 수행합니다.";
		String nextURI = reqCtx + "/sso/index.jsp";
		sendAlert(response, alertMsg, nextURI);
		return;
	}
%>