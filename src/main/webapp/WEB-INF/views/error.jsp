<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Hệ thống có lỗi</title>
    <style>
        .error-wrapper { text-align: center; margin-top: 100px; font-family: sans-serif; }
        .error-code { font-size: 48px; color: #d9534f; }
        .btn-back { display: inline-block; margin-top: 20px; padding: 10px 20px; background: #5cb85c; color: white; text-decoration: none; border-radius: 4px; }
    </style>
</head>
<body>

<div class="error-wrapper">
    <div class="error-code">Oops!</div>
    <h2>Đã xảy ra lỗi hệ thống</h2>

    <p style="color: #555;">
        Thông báo: <strong><c:out value="${errorMessage}" default="Đã có lỗi không xác định xảy ra." /></strong>
    </p>

    <a href="<c:url value='/employees'/>" class="btn-back">Quay lại trang chủ</a>
</div>

<div style="position: fixed; bottom: 0; width: 100%;">
    <%@ include file="common/footer.jsp" %>
</div>

</body>
</html>