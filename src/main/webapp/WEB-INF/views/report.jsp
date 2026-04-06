<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Báo cáo điểm</title>
    <style>
        .rank-excellent { color: gold; font-weight: bold; }
        .rank-poor { color: red; }
    </style>
</head>
<body class="container">

<h1><c:out value="${reportTitle}" /></h1>

<table class="table table-bordered table-striped">
    <thead>
        <tr>
            <th>STT</th>
            <th>Họ tên</th>
            <th>Điểm</th>
            <th>Xếp loại</th>
        </tr>
    </thead>
    <tbody>

    <c:forEach  var="sv" items="${studentList}"  varStatus="loop">
        <tr>
            <td>${loop.count}</td>
            <td><c:out value="${sv.name}" /></td>
            <td>${sv.score}</td>

            <td>
                <c:choose>
                    <c:when test="${sv.score >= 90}">
                        <span class="rank-excellent">Xuất sắc</span>
                    </c:when>
                    <c:when test="${sv.score >= 80}">Giỏi</c:when>
                    <c:when test="${sv.score >= 70}">Khá</c:when>
                    <c:when test="${sv.score >= 60}">Trung bình khá</c:when>
                    <c:when test="${sv.score >= 50}">Trung bình</c:when>
                    <c:otherwise>
                        <span class="rank-poor">Yếu</span>
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<c:if test="${empty studentList}">
    <p>Danh sách sinh viên đang trống.</p>
</c:if>

</body>
</html>