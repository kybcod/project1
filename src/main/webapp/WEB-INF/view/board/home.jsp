<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>home</title>
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
            <h3>게시물 목록</h3>
            <table class="table">
                <thead>
                <tr>
                    <th style="width: 50px">NO</th>
                    <th>제목</th>
                    <th style="width: 170px">작성자</th>
                </tr>
                </thead>
                <tbody class="table-group-divider">
                <c:forEach items="${boardList}" var="board" varStatus="status">
                    <c:url value="/board" var="viewLink">
                        <c:param name="id" value="${board.id}"/>
                    </c:url>
                    <tr onclick="location.href='${viewLink}'">
                        <td style="color:blue;">${(pageInfo.numberOfBoard)- (pageInfo.currentPageNumber-1) * 10 - status.index}</td>
                        <td>
                                ${board.title}
                        </td>
                        <td>${board.writer}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>


            <div class="row justify-content-center">
                <div class="col-8">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-center">

                            <%--맨 처음--%>
                            <c:if test="${pageInfo.currentPageNumber > 1}">

                            <c:url var="fistPageLink" value="/">
                                <c:param name="page" value="1"/>
                            </c:url>
                            <li class="page-item">
                                <a class="page-link" href="${fistPageLink}">
                                    <span aria-hidden="true">&laquo;&laquo;</span>
                                </a>
                            </li>
                            </c:if>

                            <%--이전--%>
                            <c:if test="${pageInfo.prevPageNumber > 0}">
                            <c:url var="prevPageLink" value="/">
                                <c:param name="page" value="${pageInfo.prevPageNumber}"/>
                            </c:url>
                            <li class="page-item">
                                <a class="page-link" href="${prevPageLink}">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            </c:if>

                            <c:forEach begin="${pageInfo.beginPageNumber}" end="${pageInfo.endPageNumber}"
                                       var="pageNumber">
                            <c:url var="link" value="/">
                                <c:param name="page" value="${pageNumber}"/>
                            </c:url>
                            <li class="page-item ${pageInfo.currentPageNumber eq pageNumber ? 'active' : ''}">
                                <a class="page-link"
                                   href="${link}">${pageNumber}</a>
                            </li>
                            </c:forEach>

                            <%--다음--%>
                            <c:if test="${pageInfo.nextPageNumber < pageInfo.lastPageNumber}">
                            <c:url var="nextPageNumber" value="/">
                                <c:param name="page" value="${pageInfo.nextPageNumber}"/>
                            </c:url>
                            <li class="page-item">
                                <a class="page-link" href="${nextPageNumber}">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                            </c:if>

                            <%--맨 끝--%>
                            <c:if test="${pageInfo.currentPageNumber < pageInfo.lastPageNumber}">
                            <c:url var="lastPageLink" value="/">
                                <c:param name="page" value="${pageInfo.lastPageNumber}"/>
                            </c:url>
                            <li class="page-item">
                                <a class="page-link" href="${lastPageLink}">
                                    <span aria-hidden="true">&raquo;&raquo;</span>
                                </a>
                            </li>
                            </c:if>
                </div>
            </div>

            </ul>
            </nav>
        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>