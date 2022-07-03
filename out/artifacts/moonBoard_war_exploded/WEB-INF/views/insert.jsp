<%--
  Created by IntelliJ IDEA.
  User: huijing
  Date: 2022/06/22
  Time: 5:25 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>



<head>
    <title>등록</title>
<%--    <script>--%>
<%--        function sendData(){--%>
<%--            document.reg.submit();--%>
<%--        }--%>

<%--    </script>--%>
</head>
<script type="text/javascript">


    var id = ${vo.id};
    function fn_board_register(){
        if(id != null){
            document.register.action = "<c:url value= '/board/register' />";
            document.register.submit();
        }
        else{
            alert("id를 입력해주세요.");
        }
        alert("alert");
    }

</script>
<body>
<h1>게시글 등록</h1>
<div>
<form name="register" action="/board/register" method="POST" return="false">
    <table class="table" name="board-insert">
    <tr>
    <td>아이디</td>
    <td><input type="text" name="id" value="${vo.id}"></td>
    </tr>
    <br/>
    <tr>
    <td>제목</td>
    <td><input type="text" name="title" value="${vo.title}"></td>
    </tr>
    <tr>
    <td>내용</td>
    <td><input type="textarea" name="content" value="${vo.content}"></td>
    </tr>®
    </table>
    <button type="submit"><a href="#" onclick="fn_board_register()" /> 완료</button>


</form>

</div>

</body>

