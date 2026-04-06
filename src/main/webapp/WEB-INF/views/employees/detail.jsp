<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<html>
<body>
<%@ include file="../common/header.jsp" %>
<h2>Chi tiết nhân viên: <c:out value="${emp.name}"/></h2>
<ul>
    <li>Mã: ${emp.code}</li>
    <li>Phòng: ${emp.department}</li>
    <li>Ngày vào: <fmt:formatDate value="${emp.joinDate}" pattern="dd/MM/yyyy"/></li>
    <li>Lương:
        <c:choose>
            <c:when test="${sessionScope.role == 'hr_manager'}">
                <fmt:formatNumber value="${emp.salary}" type="currency" currencySymbol="₫"/>
            </c:when>
            <c:otherwise>*** (Chỉ dành cho Quản lý)</c:otherwise>
        </c:choose>
    </li>
</ul>
<a href="<c:url value='/employees'/>">Quay lại</a>
</body>
</html>