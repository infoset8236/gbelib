<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
    <c:when test="${homepage.homepage_id eq 'h11' and param.manage_idx eq '886'}">
        <div class="join-wrap" style="padding: 0px; width: 100%; height: 200px;">
            <h3>개인정보의 수집·이용 동의</h3>
            <div tabindex="0" class="Box" style="height: 100px;">
                <span style="font-size: 10pt;">
                1 .개인정보의 수집·이용목적<br>
                    ·생각 나눔, 한 줄 서평 행사 운영<br>
                2.수집하는 개인정보 항목<br>
                    ·이름, 휴대전화 번호<br>
                3.개인정보의 보유 및 이용 기간<br>
                    ·미당첨자: 당첨자 발표 후 즉시 파기<br>
                    ·당첨자: 당첨자 상품 수령 시까지<br>
                4.개인정보 수집·이용에 대한 동의를 거부할 권리<br>
                 ·개인정보 수집‧이용을 거부할 수 있으며, 미동의 시 생각 나눔, 한 줄 서평에 응모할 수 없습니다.<br>
                ※당첨자 통보 후 1개월 이내 상품권을 수령하지 않으면 무효 처리됩니다.<br>
                </span>
            </div>
        </div>

        <div style="text-align: right">
            <b>개인정보의 수집·이용 동의에 모두 동의 합니다.</b>(<span style="color: red; font-weight: bold;">*</span>)
            <select id="terms_yn_mngcode726" name="terms_yn_mngcode726" class="selectmenu" style="width : 70px" title="개인정보 이용동의 선택">
                <option value="Y">동의</option>
                <option value="N">미동의</option>
            </select>
        </div>
    </c:when>
    <c:when test="${homepage.homepage_id eq 'h11' and param.manage_idx eq '887'}">
        <div class="join-wrap" style="padding: 0px; width: 100%; height: 200px;">
            <h3>개인정보의 수집·이용 동의</h3>
            <div tabindex="0" class="Box" style="height: 100px;">
                <span style="font-size: 10pt;">
                    1 .개인정보의 수집·이용목적<br>
                        · 1달 1권 완독 챌린지 행사 운영<br>
                    2.수집하는 개인정보 항목<br>
                        ·이름, 휴대전화 번호<br>
                    3.개인정보의 보유 및 이용 기간<br>
                        ·미당첨자: 당첨자 발표 후 즉시 파기<br>
                        ·당첨자: 당첨자 상품 수령 시까지<br>
                    4.개인정보 수집·이용에 대한 동의를 거부할 권리<br>
                        ·개인정보 수집‧이용을 거부할 수 있으며, 미동의 시 1달 1권 완독 챌린지 행사에 응모할 수 없습니다.<br>
                    ※당첨자 통보 후 1개월 이내 상품을 수령하지 않으면 무효 처리됩니다.<br>
                 </span>
            </div>
        </div>

        <div style="text-align: right">
            <b>개인정보의 수집·이용 동의에 모두 동의 합니다.</b>(<span style="color: red; font-weight: bold;">*</span>)
            <select id="terms_yn_mngcode726" name="terms_yn_mngcode726" class="selectmenu" style="width : 70px" title="개인정보 이용동의 선택">
                <option value="Y">동의</option>
                <option value="N">미동의</option>
            </select>
        </div>
    </c:when>
</c:choose>

