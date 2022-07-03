<%--
  Created by IntelliJ IDEA.
  User: huijing
  Date: 2022/06/23
  Time: 4:47 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>게시물 상세</title>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <h3 style="background-color: lightgoldenrodyellow; padding: 40px" >HUIJING BOARD</h3>
</head>
<body>
<h5>수정하기</h5>
<div>
<form name="update" action="/board/delete" method="POST" return="false">
    <table border="1" width="70%" bordercolor="white" cellspacing="5" class="table" name="table-detail">
        <tr>
            <td>아이디</td>
            <td><input name="id" value="${vo.id}"> </td>
       </tr>
        <tr>
        <td>제목</td>
        <td><input type="text" name="title" value="${vo.title}"></td>
        </tr>
        <tr>
         <td>내용</td>
            <td><input type="textarea" name="content" value="${vo.content}"></td>
        </tr>
    </table>

    <button type="button" class="btn btn-info"><a href="/board/list"/>목록</button>
    <button type="submit" class="btn btn-warning"><a href="#" onclick="document.update.submit();" />저장</button>
    <button type="submit" class="btn btn-danger"><a href="/board/delete" onclick=document.update.submit();" >삭제</a> </button>
</form>
</div>
</body>
</html>