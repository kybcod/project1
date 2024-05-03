<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="secc" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css"
          integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <style>
        @font-face {
            font-family: 'TTHakgyoansimUndongjangL';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2402_keris@1.0/TTHakgyoansimUndongjangL.woff2') format('woff2');
            font-weight: 300;
            font-style: normal;
        }
    </style>
</head>
<body>

<c:import url="/WEB-INF/fragment/navbar.jsp"/>

<%--div.container>div.row.justify-content-center>div.col-6--%>
<div class="container" style="font-family: 'TTHakgyoansimUndongjangL'">
    <div class="row justify-content-center">
        <div class="col-8">
            <h3 class="mb-4">회원 정보 조회</h3>
            <%--                div*3>label.form-label+input.form-control--%>
            <div class="mb-3">
                <label for="emailInput" class="form-label">이메일</label>
                <input readonly name="email" id="emailInput" type="email" class="form-control"
                       placeholder="E-mail" value="${member.email}">
            </div>
            <div class="mb-3">
                <label for="pwdInput" class="form-label">패스워드</label>
                <input readonly name="password" id="pwdInput" required type="text"
                       class="form-control" value="${member.password}">
            </div>
            <div class="mb-3">
                <label for="nickInput" class="form-label">별명</label>
                <input readonly name="nickName" id="nickInput" required type="text"
                       class="form-control" value="${member.nickName}">
            </div>
            <div class="mb-3">
                <label for="insertedInput" class="form-label">가입일자</label>
                <input readonly name="inserted" id="insertedInput" required type="text"
                       class="form-control" value="${member.inserted}">
            </div>
            <sec:authorize access="isAuthenticated()">
                <sec:authentication property="principal.member" var="authMember"/>
                <c:if test="${authMember.id eq member.id}">
                    <div>
                        <button class="btn btn-danger" form="formDelete">탈퇴</button>
                        <a href="/member/modify?id=${member.id}" class="btn btn-primary">정보 수정</a>
                    </div>
                </c:if>
            </sec:authorize>
        </div>
    </div>
</div>


<%--div.d-none>form>input:h[name=id]--%>
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.member" var="authMember"/>
    <c:if test="${authMember.id eq member.id}">
        <div class="d-none" onsubmit="return confirm('탈퇴 하시겠습니까?')">
            <form action="/member/remove" id="formDelete" method="post">
                <input type="hidden" name="id" value="${member.id}">
            </form>
        </div>
    </c:if>
</sec:authorize>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
