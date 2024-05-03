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

<%--div.container>div.row.justify-content-center>div.col-6--%>
<div class="container" style="font-family: 'TTHakgyoansimUndongjangL'">
    <div class="row justify-content-center">
        <div class="col-6">
            <h3 class="mb-4">회원 가입</h3>
            <form action="/member/signup" method="post" onsubmit="return checkValues()">
                <%--                div*3>label.form-label+input.form-control--%>
                <div class="mb-3">
                    <label for="emailInput" class="form-label">이메일</label>
                    <div class="input-group">
                        <input name="email" id="emailInput" required type="email" class="form-control"
                               placeholder="E-mail">
                        <button onclick="emailCheck();" type="button" id="btnEmailCheck"
                                class="btn btn-outline-secondary">중복 확인
                        </button>
                    </div>
                    <small class="form-text text-muted">이메일 양식에 맞춰 작성해주세요</small>
                </div>
                <div class="mb-3">
                    <label for="pwdInput" class="form-label">패스워드</label>
                    <input oninput="passwordCheck()" name="password" id="pwdInput" required type="password"
                           class="form-control"
                           placeholder="password">
                </div>
                <div class="mb-3">
                    <label for="pwdCheckInput" class="form-label">패스워드 확인</label>
                    <input oninput="passwordCheck()" id="pwdCheckInput" required type="password" class="form-control"
                           placeholder="password">
                    <div class="form-text" id="passwordMessage"></div>
                </div>
                <div class="mb-3">
                    <label for="nickInput" class="form-label">별명</label>
                    <input name="nickName" id="nickInput" required type="text" class="form-control"
                           placeholder="nick name">
                </div>
                <div>
                    <button class="btn btn-primary">가입</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    async function emailCheck() {
        const emailValue = document.querySelector("#emailInput").value;
        const url = "/member/email?email=" + emailValue;

        //ajax 요청
        const response = await fetch(encodeURI(url));

        // 응답처리
        // console.log(response.text());
        alert(await response.text())
    }

    function passwordCheck() {
        const password = document.querySelector("#pwdInput").value;
        const passwordCheck = document.querySelector("#pwdCheckInput").value;

        if (password != passwordCheck) {
            //메시지 보여주기
            document.querySelector("#passwordMessage").textContent = "패스워드가 일치하지 않습니다.";
        } else {
            document.querySelector("#passwordMessage").textContent = "";
        }
    }

    function checkValues() {
        const password = document.getElementById("pwdInput").value;
        const passwordCheck = document.getElementById("pwdCheckInput").value;

        if (password != "" && password == passwordCheck) {
            return true;
        } else {
            alert("패스워드가 일치하지 않습니다.");
            return false;
        }
    }
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

</body>
</html>
