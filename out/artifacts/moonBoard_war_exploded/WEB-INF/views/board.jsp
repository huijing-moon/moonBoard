<%--
  Created by IntelliJ IDEA.
  User: huijing
  Date: 2022/06/21
  Time: 10:11 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Board main</title>
</head>
<body>

<header name="header-a">
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <h3 style="background-color: lightgoldenrodyellow; padding: 40px" >HUIJING BOARD</h3>

</header>
<ul class="nav">
    <li class="nav-item">
        <a class="nav-link active" href="/board/insert">글쓰기</a></li>
    <li class="nav-item">
        <a class="nav-link actice" href="/board/listPage?num=1">글목록(페이징)</a>
    </li>
</ul>
<form id="new_board" name="new_board" method="GET">
    <h2>게시글 목록</h2>
    <table border="1" width="70%" bordercolor="white" cellspacing="5" class="table">
        <tr align="center" bgcolor="white" >
            <thead></thead>
            <th>번호</th>
            <th>작성자</th>
            <th>제목</th>
            <th>내용</th>
            <th>게시일</th>
            <th>상세</th>
        </tr>
        <c:forEach items="${list}" var="list">
            <tr bgcolor="white">
                <td align="center">${list.idx}</td>
                <td>${list.id}</td>
                <td>${list.title}</td>
                <td>${list.content}</td>
                <td><fmt:formatDate value="${list.date}" pattern="yyyy년MM월dd일"></fmt:formatDate> </td>
                <td><button type="button" class="btn btn-secondary"><a href="/board/detail/${list.id}"/>상세</button> </td>
            </tr>
        </c:forEach>
    </table>
    <br/>

</form>
</body>
</html>
