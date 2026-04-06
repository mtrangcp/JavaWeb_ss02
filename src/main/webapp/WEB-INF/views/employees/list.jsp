<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<html>
<head><title>Danh sách nhân viên</title></head>
<body>
<%@ include file="../common/header.jsp" %>
<table border="1" width="100%" cellpadding="8">
    <tr>
        <th>STT</th><th>Mã NV</th><th>Họ tên</th><th>Phòng ban</th><th>Lương</th><th>Ngày vào</th><th>Trạng thái</th><th>Thao tác</th>
    </tr>
    <c:forEach items="${empList}" var="e" varStatus="vs">
        <tr>
            <td>${vs.count}</td>
            <td><c:out value="${e.code}"/></td>
            <td><c:out value="${e.name}"/></td>
            <td>${e.department}</td>
            <td><fmt:formatNumber value="${e.salary}" type="currency" currencySymbol="₫"/></td>
            <td><fmt:formatDate value="${e.joinDate}" pattern="dd/MM/yyyy"/></td>
            <td>
                <c:choose>
                    <c:when test="${e.status == 'Đang làm'}"><b style="color:green">Đang làm</b></c:when>
                    <c:when test="${e.status == 'Nghỉ phép'}"><b style="color:orange">Nghỉ phép</b></c:when>
                    <c:otherwise><b style="color:blue">Thử việc</b></c:otherwise>
                </c:choose>
            </td>
            <td><a href="<c:url value='/employees/${e.code}'/>">Xem chi tiết</a></td>
        </tr>
    </c:forEach>
</table>
<h3>Tổng lương phòng Kỹ thuật: <fmt:formatNumber value="${techSalary}" type="currency" currencySymbol="₫"/></h3>
</body>
</html>