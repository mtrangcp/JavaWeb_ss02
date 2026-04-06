Thông báo lỗi đăng nhập (Request vs Session):
    - Tại sao dùng Request Scope: Thông báo lỗi chỉ có giá trị ngay tại thời điểm đăng nhập sai.
    Sau khi người dùng sửa lỗi và tải lại trang, thông báo này phải biến mất.
    - Nếu lưu nhầm vào Session: Thông báo lỗi sẽ đi theo người dùng mãi mãi. Ngay cả khi họ đã đăng nhập
    thành công ở lần sau, dòng chữ "Sai mật khẩu" vẫn hiện ra do Session chưa bị xóa.

Bộ đếm totalViewCount (Application vs Session):
    - Tại sao dùng Application Scope: Đây là dữ liệu dùng chung toàn hệ thống. Application Scope tồn tại
    duy nhất một bản thể cho mọi người dùng từ lúc server chạy đến khi tắt.
    - Nếu lưu vào Session Scope: Mỗi nhân viên sẽ có một bộ đếm riêng. Nhân viên A xem 3 lần thấy số 3,
    nhân viên B mới vào xem 1 lần sẽ thấy số 1, không phản ánh được tổng lượt tương tác của cả cửa hàng.

Race Condition & Cách phòng tránh:
    - Race Condition: Là tình trạng "tranh chấp dữ liệu" khi nhiều luồng (nhiều nhân viên) cùng đọc và ghi vào
    một biến dùng chung (application scope) tại cùng một thời điểm.
  - Tại sao đoạn code mẫu bị lỗi: Giả sử count = 10. Nhân viên A và B cùng đọc được số 10. Cả hai cùng
  tăng lên 11 và cùng ghi đè số 11 vào Application. Lẽ ra tổng phải là 12, nhưng kết quả chỉ là 11
  (bị mất 1 lượt đếm).
    - Đề xuất: Sử dụng AtomicInteger (thread-safe) hoặc dùng khối synchronized khi cập nhật biến trong
    Application Scope.