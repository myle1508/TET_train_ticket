
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.bean.tuyenduong" %>
<%@ page import="model.bean.lichtrinh" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Timestamp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>NLN_Chuyến xe ngày tết</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
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
	<link href="css/styleGuests.css" rel="stylesheet">
</head>

<body>
    <div class="container-xxl bg-white p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Navbar Start -->
        <div class="container-fluid nav-bar bg-transparent py-2">
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
                    <a href="login.jsp" class="btn btn-primary px-3 d-none d-lg-flex">Đăng nhập</a>
                </div>
            </nav>
        </div>
        <!-- Navbar End -->


        <!-- Search Start -->
        <div class="container-fluid bg-primary mb-5 wow fadeIn" data-wow-delay="0.1s" style="padding: 35px;">
            <div class="container">
                <div class="row g-2">
                	<form name="form1" action="guest_servlet" method="GET">
                    <div class="col-md-12">
                        <div class="row g-2">
                            <div class="col-md-4">
                            	<label class="mx-2" for="diem-di" style="color: #FDF5E6">Điểm Xuất Phát</label>
                                <input type="text" id="diem-di" name="diem-di" placeholder="Nhập tên tỉnh" class="form-control border-0 py-3" required>
                                <div id="suggestions-diem-di" class="autocomplete-suggestions"></div>
                            </div>
                            <div class="col-md-4">
                            	<label class="mx-2" for="diem-di" style="color: #FDF5E6">Điểm Đến</label>
                                <input type="text" id="diem-den" name="diem-den" placeholder="Nhập tên tỉnh" class="form-control border-0 py-3" required>
                                <div id="suggestions-diem-den" class="autocomplete-suggestions"></div>
                            </div>
                            <div class="col-md-3">
                       			<label class="mx-2" for="ngay-di" style="color: #FDF5E6">Ngày đi</label>
                        		<input type="date" id="ngay-di" name="ngay-di" class="form-control border-0 py-3" >
                    		</div>
                    		<div class="col-md-1">
                    		<label class="mx-2" style="color: #FDF5E6"></label>
                       		<button name="submitForm" value="searchForm" class="btn btn-dark border-0 w-100 py-3">Search</button>
                    	</div>
                        </div>
                        
                    </div>
                    
                    </form>
                </div>
            </div>
        </div>
        <!-- Search End -->


        <!-- Property List Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="row g-0 gx-5 align-items-end">
                    <div class="col-lg-6">
                        <div class="text-start mx-auto mb-5 wow slideInLeft" data-wow-delay="0.1s">
                            <h1 class="mb-3">Các tuyến đường</h1>
                            <p>Đong đầy từ Bắc, Trung, Nam.</p>
                        </div>
                    </div>                   
                    <div class="col-lg-6 text-start text-lg-end wow slideInRight" data-wow-delay="0.1s">
                        <ul class="nav nav-pills d-inline-flex justify-content-end mb-5">
                            <li class="nav-item me-2">
                                <a class="btn btn-outline-primary active" data-bs-toggle="pill" href="#tab-1">Tất cả</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="tab-content">
                <!-- tab-1 là tất cả 2 loại xe nè -->
                    <div id="tab-1" class="tab-pane fade show p-0 active">
                        <div class="row g-4">
                        <!-- bắt đầu từ chỗ này cho vòng lặp for đọc trong CSDL ra các tuyến đường nè-->
                        <%
                              	tuyenduong tuyenDuong = (tuyenduong) request.getAttribute("tuyenDuong");
              					ArrayList<lichtrinh> lichTrinhList =(ArrayList<lichtrinh> ) request.getAttribute("lichTrinhList");
                        		if (tuyenDuong != null && lichTrinhList.size() > 0){
     	         					for (lichtrinh lichTrinh : lichTrinhList){
                        %>
                            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                                <div class="property-item rounded overflow-hidden">
                                    <div class="position-relative overflow-hidden">
                                        <a href=""><img class="img-fluid" src="img/5.jpg" alt=""></a>
                                        
                        				
                                        <div class="bg-primary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">Xe 1 tầng</div>
                                        <div class="bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3"><%=tuyenDuong.get_diem_xuat_phat() %></div>
                                    </div>
                                    <div class="p-4 pb-0">
                                        <h5 class="text-primary mb-3"><%= tuyenDuong.get_gia_ve() %> VNĐ</h5>
                                        <a class="d-block h5 mb-2" href=""><%=tuyenDuong.get_diem_xuat_phat()%> - <%=tuyenDuong.get_diem_ket_thuc() %></a>
                                        <p><i class="fa fa-map-marker-alt text-primary me-2"></i><%=(Timestamp)lichTrinh.get_thoi_gian_xuat_phat() %></p>
                                    </div>
                                    <div class="d-flex border-top">
                                        <small class="flex-fill text-center border-end py-2"><i class="fa fa-ruler-combined text-primary me-2"></i><%=tuyenDuong.get_khoang_cach()%> km</small>
                                       
                                        <small class="flex-fill text-center py-2"><i class="fa fa-bath text-primary me-2"></i><%=lichTrinh.get_so_ghe_trong()%> chỗ trống</small>
                                    </div>
                                </div>
                            </div>
                            <%
                        					}
                        		}else {
                        			%>
                        			<div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px; visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
					                    <h1 class="mb-3">Không Có Tuyến Xe Nào Phù Hợp Với Tìm Kiếm Của Bạn</h1>
					                    <p>Hãy Bắt Đầu Tìm Kiếm Tuyến Xe Khác Cho Bản Thân</p>
					                </div>
                        			<%
                        		}
                                        %>
                          <!-- kết thúc vòng lặp ở đây -->


                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- Property List End -->
        

        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-white-50 footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="container py-5">
                <div class="row g-5">
                    <div class="col-lg-3 col-md-6">
                        <h5 class="text-white mb-4">Liên hệ</h5>
                        <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>57 Nguyễn Lương Bằng, Đà Nẵng, Việt Nam</p>
                        <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+0704407803</p>
                        <p class="mb-2"><i class="fa fa-envelope me-3"></i>bachkhoaDN@example.com</p>
                        <div class="d-flex pt-2">
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-youtube"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h5 class="text-white mb-4">Liên kết nhanh</h5>
                        <a class="btn btn-link text-white-50" href="">Về chúng tôi</a>
                        <a class="btn btn-link text-white-50" href="">Liên hệ chúng tôi</a>
                        <a class="btn btn-link text-white-50" href="">Dịch vụ </a>
                        <a class="btn btn-link text-white-50" href="">Chính sách bảo mật</a>
                        <a class="btn btn-link text-white-50" href="">Thời hạn & điều kiện</a>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h5 class="text-white mb-4">Thư viện ảnh</h5>
                        <div class="row g-2 pt-2">
                            <div class="col-4">
                                <img class="img-fluid rounded bg-light p-1" src="img/5.jpg" alt="">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid rounded bg-light p-1" src="img/2.jpg" alt="">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid rounded bg-light p-1" src="img/5.jpg" alt="">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid rounded bg-light p-1" src="img/2.jpg" alt="">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid rounded bg-light p-1" src="img/5.jpg" alt="">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid rounded bg-light p-1" src="img/2.jpg" alt="">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h5 class="text-white mb-4">Bài báo</h5>
                        <p>Cùng trải nghiệm.</p>
                        <div class="position-relative mx-auto" style="max-width: 400px;">
                            <input class="form-control bg-transparent w-100 py-3 ps-4 pe-5" type="text" placeholder="Nhập email">
                            <button type="button" class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">Đăng ký</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="copyright">
                    <div class="row">
                        <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                            &copy; <a class="border-bottom" href="#">Nha - Lệ - Nhàn</a>, Chúng tôi là nhất. 
							
                        </div>
                        <div class="col-md-6 text-center text-md-end">
                            <div class="footer-menu">
                                <a href="">Trang chủ</a>
                                <a href="">Liên hệ</a>
                                <a href="">Trợ giúp</a>
                                <a href="">FQAs</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
    <script  src="js/jsGuest.js">
    </script>
</body>

</html>
