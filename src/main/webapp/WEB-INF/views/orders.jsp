<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<html>
<head>
    <title>Quản lý đơn hàng</title>
</head>
<body>
<div style="background: #eee; padding: 10px;">
    Xin chào, <strong>${sessionScope.loggedUser}</strong>!
    Vai trò: <span class="badge">${sessionScope.role}</span> |
    <a href="<c:url value='/logout'/>">Đăng xuất</a>
</div>

<h2>Danh sách đơn hàng</h2>
<table border="1" width="100%" cellpadding="10">
    <thead>
    <tr>
        <th>Mã đơn</th>
        <th>Sản phẩm</th>
        <th>Tổng tiền</th>
        <th>Ngày đặt</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${orderList}" var="o">
        <tr>
            <td>${o.orderId}</td>
            <td><c:out value="${o.productName}" /></td>
            <td>
                <fmt:formatNumber value="${o.amount}" type="currency" currencySymbol="₫" />
            </td>
            <td>
                <fmt:formatDate value="${o.orderDate}" pattern="dd/MM/yyyy" />
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<hr>
<p><i>Tổng lượt xem đơn hàng toàn hệ thống:
    <strong>${applicationScope.totalViewCount}</strong> lần.
</i></p>

</body>
</html>