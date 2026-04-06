<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<html>
<head>
    <title>Tìm kiếm sự kiện</title>
    <style>
        .status-soldout { color: red; font-weight: bold; }
        .status-warning { color: orange; }
        .status-available { color: green; }
        .badge-free { background-color: #28a745; color: white; padding: 3px 7px; border-radius: 4px; }
        .disabled-link { color: gray; pointer-events: none; text-decoration: none; }
    </style>
</head>
<body>

<h2>Kết quả tìm kiếm cho: <c:out value="${keyword}" default="(Trống)" /></h2>
<p>Tìm thấy <strong>${fn:length(events)}</strong> sự kiện.</p>

<c:choose>
    <c:when test="${empty events}">
        <div class="alert">Không tìm thấy sự kiện nào phù hợp.</div>
    </c:when>


    <c:otherwise>
        <table border="1" cellpadding="10" width="100%">
            <thead>
            <tr>
                <th>STT</th>
                <th>Tên sự kiện</th>
                <th>Ngày tổ chức</th>
                <th>Giá vé</th>
                <th>Vé còn lại</th>
                <th>Thao tác</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${events}" var="event" varStatus="loop">
                <tr>
                    <td>${loop.count}</td>


                    <td><c:out value="${event.name}" /></td>

                    <td>${event.date}</td>

                    <td>
                        <c:choose>
                            <c:when test="${event.price == 0}">
                                <span class="badge-free">MIỄN PHÍ</span>
                            </c:when>
                            <c:otherwise>
                                <fmt:formatNumber value="${event.price}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                            </c:otherwise>
                        </c:choose>
                    </td>

                    <td>
                        <c:choose>
                            <c:when test="${event.remainingTickets == 0}">
                                <span class="status-soldout">HẾT VÉ</span>
                            </c:when>
                            <c:when test="${event.remainingTickets < 10}">
                                <span class="status-warning">Sắp hết (còn ${event.remainingTickets} vé)</span>
                            </c:when>
                            <c:otherwise>
                                <span class="status-available">${event.remainingTickets}</span>
                            </c:otherwise>
                        </c:choose>
                    </td>

                    <td>
                        <c:url value="/events/${event.id}/book" var="bookUrl" />
                        <a href="${bookUrl}" class="${event.remainingTickets == 0 ? 'disabled-link' : ''}">
                            Đặt vé
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:otherwise>
</c:choose>


<hr>
<c:if test="${not empty events}">
    <p>Sự kiện nổi bật nhất: <strong>${fn:toUpperCase(events[0].name)}</strong></p>
</c:if>

<p>Độ dài từ khóa: ${fn:length(keyword)} ký tự.</p>

</body>
</html>