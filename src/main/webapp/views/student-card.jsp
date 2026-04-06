<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Thẻ Sinh Viên Điện Tử</title>
    <style>
        .card { border: 2px solid #333; width: 400px; padding: 20px; border-radius: 10px; font-family: Arial, sans-serif; }
        .error { color: red; font-weight: bold; padding: 10px; border: 1.5px solid red; display: inline-block; }
        .info { color: blue; }
        .rank-good { color: green; }
        .rank-fair { color: blue; }
        .rank-average { color: orange; }
        .rank-warning { color: red; font-weight: bold; text-transform: uppercase; }
    </style>
</head>
<body>

<h2>Hệ thống Tra cứu Thẻ Sinh viên</h2>

<c:if test="${not empty infoMessage}">
    <p class="info">${infoMessage}</p>
</c:if>

<c:if test="${not empty errorMessage}">
    <div class="error">
        <c:out value="${errorMessage}" />
    </div>
</c:if>

<c:if test="${not empty studentName}">
    <div class="card">
        <h3 style="text-align: center;">THẺ SINH VIÊN</h3>
        <p><strong>Mã SV:</strong> ${msv}</p>
        <p><strong>Họ tên:</strong> <c:out value="${studentName}"/></p>
        <p><strong>Khoa:</strong> ${faculty}</p>
        <p><strong>Năm học:</strong> ${year}</p>
        <p><strong>Điểm TB (GPA):</strong> ${gpa}</p>
        <p><strong>Xếp loại:</strong>
            <c:choose>
                <c:when test="${gpa >= 8.0}">
                    <span class="rank-good">Giỏi</span>
                </c:when>
                <c:when test="${gpa >= 6.5}">
                    <span class="rank-fair">Khá</span>
                </c:when>
                <c:when test="${gpa >= 5.0}">
                    <span class="rank-average">Trung bình</span>
                </c:when>
                <c:otherwise>
                    <span class="rank-warning">Cảnh báo học vụ</span>
                </c:otherwise>
            </c:choose>
        </p>
    </div>
</c:if>

<br>
<a href="${pageContext.request.contextPath}/student-card">Tra cứu sinh viên khác</a>

</body>
</html>