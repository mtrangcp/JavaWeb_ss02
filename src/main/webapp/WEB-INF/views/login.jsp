<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Đăng nhập hệ thống HR</title>
    <style>
        .error-box { color: white; background-color: #d9534f; padding: 10px; margin-bottom: 15px; border-radius: 4px; }
        .login-container { width: 300px; margin: 100px auto; border: 1px solid #ccc; padding: 20px; border-radius: 8px; }
        input { width: 100%; margin-bottom: 10px; padding: 8px; box-sizing: border-box; }
        button { width: 100%; padding: 10px; background-color: #0275d8; color: white; border: none; cursor: pointer; }
    </style>
</head>
<body>

<div class="login-container">
    <h2 style="text-align: center;">HR Portal Login</h2>

    <%-- Hiển thị thông báo lỗi nếu có --%>
    <c:if test="${not empty errorMessage}">
        <div class="error-box">
            <c:out value="${errorMessage}" />
        </div>
    </c:if>

    <form action="<c:url value='/login'/>" method="post">
        <label>Tài khoản:</label>
        <input type="text" name="username" required placeholder="hr_manager hoặc hr_staff">

        <label>Mật khẩu:</label>
        <input type="password" name="password" required placeholder="Mật khẩu tương ứng">

        <button type="submit">Đăng nhập</button>
    </form>

    <p style="font-size: 0.8em; color: #666; margin-top: 15px;">
        * Manager: hr_manager / hr123<br>
        * Staff: hr_staff / staff456
    </p>
</div>

</body>
</html>