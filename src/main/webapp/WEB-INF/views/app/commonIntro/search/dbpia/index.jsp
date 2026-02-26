<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script type="text/javascript" src="https://www.dbpia.co.kr/js/dbpia_outConn.js"></script>
<style>
    .DBpia-box {
        display: flex;
        align-items: center;
        border: 5px solid #e9e9e9;
        gap: 50px;
    }
</style>

<div class="DBpia-box">
    <img
            src="/data/menuResources/h9/207/1746158580244.JPG"
            alt=""
            style="width: 200px"
    />
    <div>
        <h3 style="padding: 0; background: none; margin-top: 0">
            DBpia (학술논문 및 전자저널)
        </h3>
        <p>
            국내의 학회, 출판사 및 연구소에서 발행되는 전체 주제분야의 학술 논문<br />
            400만편과 전자저널 4000여종을 원문형태로 제공하는 서비스입니다.
        </p>
        <div class="basic_btn">
        <c:choose>

            <c:when test="${sessionScope.member.loginType eq 'HOMEPAGE' and sessionScope.member.login and not empty sessionScope.member.status_code and sessionScope.member.status_code eq '0'}">
            <a
                    href="javascript:dbpia_open('5423');"
                    class="btn_go newWin"
                    title="새창열림"
            >
                <span>DBPIA 바로가기</span> <i class="fa fa-external-link"></i
            ></a>
           </c:when>
            <c:otherwise>
                <a
                        href="https://www.dbpia.co.kr/"
                        class="btn_go newWin"
                        target="_blank"
                        title="새창열림"
                >
                    <span>DBPIA 바로가기</span> <i class="fa fa-external-link"></i
                ></a>
            </c:otherwise>

        </c:choose>
        </div>
    </div>
</div>

<br />
<h3>제공서비스</h3>
<ul class="con">
    <li>전자저널 4000천여종</li>
    <li>학술논문(기사) 400만편</li>
    <li>AI 검색, AI 요약 서비스 등 AI 기반 논문 서비스</li>
</ul>

<h3>이용방법</h3>
<ul class="con">
    <li>
        도서관 내부
        <ul class="con2">
            <li>디지털 자료실 PC 사용: DBpia 접속 시 바로 사용 가능</li>
            <li>
                개인 휴대폰 및 노트북 사용: 외동도서관 와이파이 연결 후 DBpia 접속 시
                바로 사용 가능
            </li>
        </ul>
    </li>
    <li>
        도서관 외부
        <ul class="con2">
            <li>
                도서관 내부 이용방법으로 DBpia 접속 후 개인 아이디로 로그인(DBpia
                회원가입 필요)
            </li>
            <li>
                180일 이용권 자동 획득 됨으로 이후 외부에서 사용 가능(연장처리 가능)
            </li>
        </ul>
    </li>
</ul>
