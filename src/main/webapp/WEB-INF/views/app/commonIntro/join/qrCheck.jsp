<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="/tlds/SecuKeyPad.tld" prefix="secuKeypad"%>
<%@ page import="java.util.*" %>
<%@ page import="com.yhdb.solution.secukeypad.interweb.*" %>
<%@ page import="java.net.*" %>
<%
    InetAddress inet= InetAddress.getLocalHost();
    // 입력폼 이름
    String formName = "member";
// 키패드 입력 태그 이름
    String inputPasswdName = "member_pw";
// 키패드 사용여부 태그 이름
    String inputPasswdUseYnName = "loginPasswdInputUseYn";

    String theme = "";
    if("darkBlue".equals(request.getParameter("theme"))){
        theme = SecuKeypadConstant.SECU_KEYPAD_THEME_DARKBLUE;
    }else{
        theme = SecuKeypadConstant.SECU_KEYPAD_THEME_BASICGREY;
    }

//문자키패드 사용시
    SecuKeypadConfiguration confPc = new SecuKeypadConfiguration.Builder(request, getServletContext())
            .form(formName, inputPasswdName, "DIV_SECU_KEYPAD_PC") // 필수
            .keypadType(SecuKeypadConstant.SECU_KEYPAD_TYPE_PC_ALPHABET) // 필수
            .useYn(SecuKeypadConstant.USEYN_TYPE_CHECKBOX)
            .useYnEnableInputName(inputPasswdUseYnName)
            .xPos(382)
            .yPos(322)
            .theme(theme)
            .create();

    SecuKeypadConfiguration confMo = new SecuKeypadConfiguration.Builder(request, getServletContext())
            .form(formName, inputPasswdName, "DIV_SECU_KEYPAD_MO") // 필수
            .keypadType(SecuKeypadConstant.SECU_KEYPAD_TYPE_MOBILE_ALPHABET) // 필수
            .useYn(SecuKeypadConstant.USEYN_TYPE_CHECKBOX)
            .useYnEnableInputName(inputPasswdUseYnName)
            .xPos(0)
            .yPos(-15)
            .theme(theme)
            .create();

    SecuKeypadEncoderFactory factory = new SecuKeypadEncoderFactory();
    SecuKeypadEncoder skeMo = factory.createEncoder(confMo);
    SecuKeypadEncoder skePc = factory.createEncoder(confPc);
%>

<script>
    $(function() {
        $('#member').on('submit', function() {
            var cell_phone = $('#cell_phone1').val() + '-' + $('#cell_phone2').val() + '-' + $('#cell_phone3').val();
            $('#cell_phone').val(cell_phone);
        });
    })
</script>

<div class="login-box">
    <div class="login-body">
        <div class="tab">
            <dl class="tcon t1">
                <dt class="blind">통합도서관 로그인</dt>
                <div class="loginBox1">
                    <dd class="login">
                        <div class="loginImgBox">
                            <img src="/resources/common/img/mem_loginimg.png" alt="" class="loginImg">
                        </div>
                        <fieldset>
                            <legend class="blind">로그인</legend>
                            <form:form modelAttribute="member" name="member" method="post" action="/${homepage.context_path}/intro/join/qrLoginProc.do">
                                <%-- y-SecuKeypad Hidden Object --%>
                                <secuKeypad:SecuKeypadHidden tagParam="<%=skePc %>"/>
                                <secuKeypad:SecuKeypadHidden tagParam="<%=skeMo %>"/>
                                <%-- y-SecuKeypad Hidden Object --%>
                                <form:hidden path="menu_idx"/>
                                <form:hidden path="homepage_id"/>
                                <form:hidden path="cell_phone"/>
                                <input type="hidden" name="training_idx" value="${param.training_idx}">
                                <input type="hidden" name="token" value="${param.token}">
                                <input type="hidden" name="qr_count" value="${param.qr_count}">
                                <input type="hidden" name="teach_idx" value="${param.teach_idx}">
                                <input type="hidden" name="qr_check_type" value="${param.qr_check_type}">
                                <c:choose>
                                    <c:when test="${param.qr_check_type eq 'TEACH'}">
                                        <div class="form-box">
                                            <p class="idtype" class="blind">
                                                <label class="blind" for="member_name">성명</label>
                                                <form:input path="member_name" class="txt" placeholder="성명" title="성명" maxlength="20" style="ime-mode:inactive" autocorrect="off" autocapitalize="none" autocomplete="off"/>
                                            </p>
                                            <div>핸드폰 번호</div>
                                            <label for="cell_phone" class="blind">핸드폰 번호</label>
                                            <div style="display: flex; align-items: center; gap: 4px;">
                                                <p class="idtype" class="blind">
                                                    <form:input path="cell_phone1" class="txt" title="핸드폰 번호" maxlength="20" style="ime-mode:inactive" autocorrect="off" autocapitalize="none" autocomplete="off"/>
                                                </p>
                                                -
                                                <p class="idtype" class="blind">
                                                    <form:input path="cell_phone2" class="txt" title="핸드폰 번호" maxlength="20" style="ime-mode:inactive" autocorrect="off" autocapitalize="none" autocomplete="off"/>
                                                </p>
                                                -
                                                <p class="idtype" class="blind">
                                                    <form:input path="cell_phone3" class="txt" title="핸드폰 번호" maxlength="20" style="ime-mode:inactive" autocorrect="off" autocapitalize="none" autocomplete="off"/>
                                                </p>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="form-box">
                                            <p class="idtype" class="blind">
                                                <label class="blind" for="member_id">아이디</label>
                                                <form:input path="member_id" class="txt" placeholder="아이디" title="아이디" maxlength="20" style="ime-mode:inactive" autocorrect="off" autocapitalize="none" autocomplete="off" />
                                            </p>
                                            <p id="pwp" class="idtype" class="blind">
                                                <label for="member_pw" class="blind" >비밀번호</label>
                                                <form:password path="member_pw" class="txt" placeholder="비밀번호" title="비밀번호" maxlength="20"/>
                                            </p>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                                <button id="save-btn">
                                    출석체크
                                </button>
                            </form:form>
                        </fieldset>
                    </dd>
                </div>
            </dl>
        </div>
    </div>
</div>
