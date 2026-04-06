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
<body>

<%-- JSP Comment: Chỉ tồn tại ở phía Server, an toàn hơn HTML Comment --%>
<%-- Title được lấy trực tiếp từ model.addAttribute("reportTitle", ...) --%>
<h1><c:out value="${reportTitle}" /></h1>

<table border="1" cellpadding="8">
    <thead>
    <tr>
        <th>STT</th>
        <th>Họ tên</th>
        <th>Điểm</th>
        <th>Xếp loại</th>
    </tr>
    </thead>
    <tbody>
    <%-- Duyệt danh sách studentList bằng JSTL --%>
    <c:forEach items="${studentList}" var="sv" varStatus="loop">
        <tr>
            <td>${loop.count}</td>

                <%-- Dùng c:out để chống tấn công XSS --%>
            <td><c:out value="${sv.fullName}" /></td>

            <td>${sv.score}</td>

            <td>
                    <%-- Thay thế logic if-else Java bằng c:choose --%>
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