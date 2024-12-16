<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.bean.nguoidung" %>
<%
    nguoidung user = (nguoidung) request.getAttribute("user");
session.setAttribute("user", user);
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>NLN_Chuyến xe ngày tết</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f6f9;
        }

        .main-container {
            margin-top: 50px;
        }

        .info-card {
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-bottom: 30px;
        }

        .info-header {
            text-align: center;
            font-size: 1.8rem;
            color: #007bff;
            margin-bottom: 20px;
            font-weight: 700;
        }

        .info-section {
            margin-bottom: 20px;
            padding: 15px;
            border-radius: 8px;
            background: #f8f9fa;
            border-left: 4px solid #007bff;
        }

        .info-section p {
            margin: 0;
            font-size: 1rem;
        }

        .info-section i {
            margin-right: 10px;
            color: #007bff;
        }

        .action-btns {
            text-align: center;
            margin-top: 30px;
        }

        .btn {
            border-radius: 25px;
            padding: 10px 20px;
            font-weight: 600;
            transition: 0.3s;
        }

        .btn:hover {
            transform: scale(1.05);
        }

        .footer {
            margin-top: 50px;
            text-align: center;
            background-color: #343a40;
            color: white;
            padding: 10px 0;
        }
    </style>
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
                %>
                <nav>
                    <% if (username != null) { %>
                        <!-- Nếu đã đăng nhập, hiển thị hình người dùng và menu thả xuống -->
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                <img src="img/user.png" alt="User" class="img-fluid" style="width: 30px; height: 30px; border-radius: 50%;">
                            </a>
                            <div class="dropdown-menu rounded-0 m-0">
                                <a href="thongtin_nguoidung.jsp" class="dropdown-item">Thông tin tài khoản</a>
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
    <div class="container main-container">
        <div class="row justify-content-center">
            <!-- Cột bên trái: Thông tin người dùng -->
            <div class="col-md-6">
                <div class="info-card">
                    <div class="info-header">
                        Xác Nhận Thông Tin Người Dùng
                    </div>
                    <% if (user != null) { %>
                        <div class="info-section">
                            <p><i class="fas fa-user-circle"></i> <strong>Họ tên người đặt:</strong> <%= user.get_ho_ten() %></p>
                        </div>
                        <div class="info-section">
                            <p><i class="fas fa-envelope"></i> <strong>Email:</strong> <%= user.get_email() %></p>
                        </div>
                        <div class="info-section">
                            <p><i class="fas fa-phone"></i> <strong>Số điện thoại:</strong> <%= user.get_so_dien_thoai() %></p>
                        </div>
                    <% } else { %>
                        <div class="alert alert-danger text-center">
                            <i class="fas fa-exclamation-triangle"></i> Không tìm thấy thông tin người dùng!
                        </div>
                    <% } %>
                </div>
            </div>

            <!-- Cột bên phải: Thông tin chuyến đi -->
            <div class="col-md-4">
                <!-- Tạm tính -->
                <div class="info-card mb-4">
                    <h5 class="info-header">Tạm tính</h5>
                    <%
                        String giaTienStr = (String) session.getAttribute("giaTien"); 
                        String soVeStr = (String) session.getAttribute("sove");    
                        int giaTien = Integer.parseInt(giaTienStr.replace(".", "").replace("đ", ""));
                        int soVe = Integer.parseInt(soVeStr);
                        int tongTien = giaTien * soVe;
                        session.setAttribute("tongGiaTien", tongTien);
                    %>
                    <p style="font-size: 1.5rem; font-weight: bold; text-align: center; color: #333;">
                        <%= String.format("%,d", tongTien) %>đ
                    </p>
                </div>

                <div class="info-card">
                    <h5 class="info-header">Thông tin chuyến đi</h5>
                    <div>
                        <p><strong>Ngày đi:</strong> <%= session.getAttribute("ngayDi") %></p>
                        <hr>
                        <p><strong>Điểm đi:</strong>  <%= session.getAttribute("diemDi") %></p>
                        <p><strong>Điểm đến:</strong> <%= session.getAttribute("diemDen") %></p>
                    </div>
                </div>
            </div>
        </div>
      <div class="action-btns">
    <a href="index.jsp" class="btn btn-secondary btn-lg"><i class="fas fa-arrow-left"></i> Quay lại</a>
    <a href="thanhtoan.jsp" class="btn btn-success btn-lg"><i class="fas fa-check-circle"></i> Tiếp tục đặt vé </a>
</div>

    </div>

    <!-- Footer Start -->
    <div class="footer">
        &copy; 2024 N_L_N. All Rights Reserved.
    </div>
    <!-- Footer End -->
    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
</div>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="lib/wow/wow.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/waypoints/waypoints.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Template Javascript -->
<script src="js/main.js"></script>

<!-- Bootstrap and FontAwesome Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>  
