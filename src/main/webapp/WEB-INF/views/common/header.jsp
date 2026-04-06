<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<header style="background:#f4f4f4; padding:10px; margin-bottom:20px;">
    <nav>
        <a href="<c:url value='/employees'/>">Trang chủ</a> |
        <c:if test="${sessionScope.role == 'hr_manager'}">
            <strong>Khu vực Quản lý</strong> |
        </c:if>
        <span style="float:right">
            Xin chào, <b><c:out value="${sessionScope.loggedUser}"/></b>
            (<c:out value="${sessionScope.role}"/>) |
            <a href="<c:url value='/logout'/>">Đăng xuất</a>
        </span>
    </nav>
</header>