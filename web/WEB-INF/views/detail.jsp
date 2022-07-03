<%--
  Created by IntelliJ IDEA.
  User: huijing
  Date: 2022/06/23
  Time: 4:47 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>게시물 수정</title>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <h3 style="background-color: lightgoldenrodyellow; padding: 40px" >HUIJING BOARD</h3>
</head>
<body>
<h5>상세보기</h5>
<form name="detail">
    <table border="1" width="70%" bordercolor="white" cellspacing="5" class="table" name="table-detail">
        <tr>
            <td>아이디</td>
            <td>${vo.id}</td>
       </tr>
        <tr>
        <td>제목</td>
        <td>${vo.title}</td>
        </tr>
        <tr>
         <td>내용</td>
          <td>${vo.content}</td>
        </tr>
    </table>
    <button type="button" class="btn btn-info"><a href="/board/list"/>목록</button>
    <button type="button" class="btn btn-warning"><a href="/board/updt/${vo.id}">수정</a> </button>
</form>
</body>
</html>
