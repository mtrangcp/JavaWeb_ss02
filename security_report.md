XSS (Cross-Site Scripting) và <c:out>:

XSS là gì: Là lỗ hổng cho phép kẻ tấn công chèn các đoạn mã script độc hại (thường là JavaScript) vào trang web. 
Khi người dùng khác xem trang, trình duyệt sẽ thực thi mã này, dẫn đến mất Cookie, chiếm đoạt phiên làm việc hoặc 
điều hướng trang giả mạo.
So sánh: ${keyword} sẽ in nguyên văn <script>alert(1)</script>, khiến trình duyệt thực thi nó. Ngược lại, 
<c:out value="${keyword}"/> sẽ chuyển đổi các ký tự đặc biệt thành thực thể HTML (HTML Entities).
Output sinh ra: <script>alert(1)</script> sẽ trở thành &lt;script&gt;alert(1)&lt;/script&gt;. Trình duyệt chỉ 
hiển thị nó dưới dạng văn bản thuần và không thực thi.

So sánh <c:if> và <c:choose>:
<c:if>: Dùng cho các điều kiện đơn lẻ (đúng thì làm, sai thì thôi).
<c:choose>: Dùng cho logic rẽ nhiều nhánh (tương đương if-else if-else).
Áp dụng: Trong bài này, phần "Giá vé" và "Vé còn lại" nên dùng <c:choose> vì chúng có từ 3 trạng thái trở lên 
(Hết vé/Sắp hết/Còn vé hoặc Miễn phí/Có phí). Việc dùng <c:choose> giúp code tường minh và tránh việc kiểm tra 
nhiều điều kiện rời rạc.

Lợi ích của <c:url>:
Vấn đề: Hardcode href="/events/1/book" sẽ bị lỗi nếu ứng dụng được triển khai dưới một Context Path 
(ví dụ /ticketing). Link sẽ bị sai thành localhost:8080/events/1/book thay vì localhost:8080/ticketing/events/1/book.
Giải pháp: <c:url> tự động nhận diện và chèn Context Path hiện tại vào trước đường dẫn, đảm bảo các liên kết 
luôn hoạt động chính xác trong mọi môi trường triển khai.

