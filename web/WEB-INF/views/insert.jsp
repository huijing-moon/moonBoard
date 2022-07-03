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

    <script type="text/javascript">
        window.onload =function() {
            var id = document.register.id;
            var title = document.register.title;
            var content = document.register.content;
            document.register.onsubmit = function () {
                if (!id.value) {
                    alert("id를 입력해주세요.");
                    id.focus();
                    return false;
                }
                if(!title.value){
                    alert("제목을 입력해주세요.");
                    return false;
                }
                if(!content.value){
                    alert("내용을 입력해주세요.");
                    return false;
                }
            }
        }
    </script>
</head>

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
    <button type="submit"><a href="#" onclick="document.register.onsubmit()" /> 완료</button>


</form>

</div>

</body>

