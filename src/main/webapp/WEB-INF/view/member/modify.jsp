<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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

<div class="container" style="font-family: 'TTHakgyoansimUndongjangL'">
    <div class="row justify-content-center">
        <div class="col-8">
            <h3 class="mb-4">${member.id}번 회원 정보</h3>
            <form action="/member/modify" method="post"
            ">
            <input type="hidden" name="id" value="${member.id}">
            <div class="mb-4">
                <small style="background-color: beige; color: gray">❌ 이메일과 가입일자는 수정할 수 없습니다.</small>
            </div>

            <div class="mb-3">
                <label for="emailInput" class="form-label">이메일</label>
                <input id="emailInput" class="form-control" value="${member.email}" type="text"
                       aria-label="Disabled input example"
                       disabled>
            </div>
            <div class="mb-3">
                <label for="pwdInput" class="form-label">패스워드</label>
                <input name="password" id="pwdInput" required type="text"
                       class="form-control" value="${member.password}">
            </div>
            <div class="mb-3">
                <label for="pwdCheckInput" class="form-label">패스워드 확인</label>
                <input oninput="pwdCheck()" id="pwdCheckInput" required type="text"
                       class="form-control" value="${member.password}">
                <div class="form-text" id="checkMessage"></div>
            </div>
            <div class="mb-3">
                <label for="nickInput" class="form-label">별명</label>
                <input oninput="pwdCheck()" name="nickName" id="nickInput" required type="text"
                       class="form-control" value="${member.nickName}">
            </div>
            <div class="mb-3">
                <label for="insertedInput" class="form-label">가입일자</label>
                <input readonly name="inserted" id="insertedInput" required type="text"
                       class="form-control" value="${member.inserted}" aria-label="Disabled input example"
                       disabled>
            </div>
            <div class="mb-3">
                <button class="btn btn-secondary">수정</button>
            </div>
            </form>
        </div>
    </div>
</div>

<script>
    function pwdCheck() {
        const pw = document.querySelector("#pwdInput").value;
        const pwCheck = document.querySelector("#pwdCheckInput").value;

        if (pw != pwCheck) {
            document.querySelector("#checkMessage").textContent = "패스워드가 일치하지 않습니다."
        } else {
            document.querySelector("#checkMessage").textContent = ""
        }
    }
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
