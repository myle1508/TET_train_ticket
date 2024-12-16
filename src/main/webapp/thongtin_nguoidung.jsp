<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông tin tài khoản</title>
    <link rel="stylesheet" href="path/to/your/css/bootstrap.min.css">
    <!-- Thay thế đường dẫn này bằng đường dẫn thực tế của bạn đến file CSS -->
</head>
<body>
    <!-- Navbar Start -->
    <div class="container-fluid nav-bar bg-transparent">
        <nav class="navbar navbar-expand-lg bg-white navbar-light py-0 px-4">
            <a href="index.jsp" class="navbar-brand d-flex align-items-center text-center">
                <div class="icon p-2 me-2">
                    <img class="img-fluid" src="img/1.png" alt="Icon" style="width: 30px; height: 30px;">
                </div>
                <h1 class="m-0 text-primary">N_L_N</h1>
            </a>
            <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto">
                    <a href="index.jsp" class="nav-item nav-link active">Trang chủ</a>
                    <a href="about.jsp" class="nav-item nav-link">Nhóm tôi</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Property</a>
                        <div class="dropdown-menu rounded-0 m-0">
                            <a href="property-list.jsp" class="dropdown-item">Property List</a>
                            <a href="property-type.jsp" class="dropdown-item">Property Type</a>
                            <a href="property-agent.jsp" class="dropdown-item">Property Agent</a>
                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                        <div class="dropdown-menu rounded-0 m-0">
                            <a href="testimonial.jsp" class="dropdown-item">Testimonial</a>
                            <a href="404.jsp" class="dropdown-item">404</a>
                        </div>
                    </div>
                    <a href="contact.jsp" class="nav-item nav-link">Liên hệ</a>
                </div>
                <%
                    String username = (String) session.getAttribute("username");
                    String userImage = "img/2.png"; // Đường dẫn hình ảnh cố định
                %>
                <nav>
                    <% if (username != null) { %>
                        <!-- Nếu đã đăng nhập, hiển thị hình người dùng và menu thả xuống -->
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                <img src="<%= userImage %>" alt="User" class="img-fluid" style="width: 30px; height: 30px; border-radius: 50%;">
                            </a>
                            <div class="dropdown-menu rounded-0 m-0">
                                <a href="account.jsp" class="dropdown-item">Thông tin tài khoản</a>
                                <a href="thanhvien.jsp" class="dropdown-item">Thành viên Thường</a>
                                <a href="donhang.jsp" class="dropdown-item">Đơn hàng của tôi</a>
                                <a href="uudai.jsp" class="dropdown-item">Ưu đãi</a>
                                <a href="quanlythe.jsp" class="dropdown-item">Quản lý thẻ</a>
                                <a href="chuyendi.jsp" class="dropdown-item">Nhận xét chuyến đi</a>
                                <a href="logout.jsp" class="dropdown-item">Đăng xuất</a>
                            </div>
                        </div>
                    <% } else { %>
                        <!-- Nếu chưa đăng nhập, hiển thị nút Đăng nhập -->
                        <a href="login.jsp" class="btn btn-primary px-3 d-none d-lg-flex">Đăng nhập</a>
                    <% } %>
                </nav>
            </div>
        </nav>
    </div>
    <!-- Navbar End -->

    <!-- Main Content Start -->
    <div class="container mt-5">
        <h1 class="mb-4">Thông tin tài khoản</h1>
        <div class="card">
            <div class="card-body">
                <form action="updateAccount.jsp" method="post">
                    <div class="mb-3">
                        <label for="fullName" class="form-label">Họ và tên*</label>
                        <input type="text" class="form-control" id="fullName" name="fullName" value="Nhân Huynh" required>
                    </div>
                    <div class="mb-3">
                        <label for="phone" class="form-label">Số điện thoại</label>
                        <input type="text" class="form-control" id="phone" name="phone" value="342857663">
                    </div>
                    <div class="mb-3">
                        <label for="birthDate" class="form-label">Ngày sinh</label>
                        <input type="date" class="form-control" id="birthDate" name="birthDate" value="2004-03-11">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Giới tính</label>
                        <div>
                            <input type="radio" id="male" name="gender" value="Nam" checked>
                            <label for="male">Nam</label>
                        </div>
                        <div>
                            <input type="radio" id="female" name="gender" value="Nữ">
                            <label for="female">Nữ</label>
                        </div>
                        <div>
                            <input type="radio" id="other" name="gender" value="Khác">
                            <label for="other">Khác</label>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">Lưu</button>
                </form>
            </div>
        </div>
    </div>
    <!-- Main Content End -->

    <!-- Bootstrap JS (Optional, include it if you are using any JS from Bootstrap) -->
    <script src="path/to/your/js/bootstrap.bundle.min.js"></script>
    <!-- Thay thế đường dẫn này bằng đường dẫn thực tế của bạn đến file JS -->
</body>
</html>