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
</ul>
<h2>게시글 목록</h2>
<div class="navbar-brand" >

    <select name="searchType" >
        <option value="title" <c:if test="${page.searchType eq 'title'}"> selected</c:if>> 제목</option>
        <option value="content" <c:if test="${page.searchType eq 'content'}"> selected </c:if>>내용</option>
        <option value="id" <c:if test="${page.searchType eq 'id'}"> selected </c:if>>아이디</option>
    </select>
    <input type="text" name="keyword"  value="${page.keyword}"/>
    <button type="button" class="btn btn-warning" id="searchBtn">검색</button>
</div>

<script type="text/javascript">
    document.getElementById("searchBtn").onclick=function(){
        let searchType = document.getElementsByName("searchType")[0].value;
        let keyword = document.getElementsByName("keyword")[0].value;
        location.href="?num=1" +"&searchType="+ searchType +"&keyword=" +keyword;
    };


</script>
<form id="new_board" name="new_board" method="GET">

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

    <div align="center" >
        <c:if test="${page.prev}">
            <span>[<a href="/board/listPage?num=${page.startPageNum -1}${page.searchTypeKey}">이전</a> ]</span>
        </c:if>
        <c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
            <span>

                <c:if test="${select != num}">
                    <a href="/board/listPage?num=${num}${page.searchTypeKey}">${num}</a>
                </c:if>
                <c:if test="${select == num}">
                    <b>${num}</b>
                </c:if>
            </span>
        </c:forEach>

        <c:if test="${page.next}">
            <span>[ <a href="/board/listPage?num=${page.endPageNum +1}${page.searchTypeKey}">다음</a> ]</span>
        </c:if>
    </div>


</form>
</body>
</html>
