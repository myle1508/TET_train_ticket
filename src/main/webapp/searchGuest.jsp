
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
    <%@ include file ="headIncludeGuest.jsp"%>
</head>

<body>
    <div class="container-xxl bg-white p-0">
        <%@ include file="navbarGuest.jsp" %>


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
     	         						String linkChiTietLichTrinh = "guest_servlet?action1=1&malichtrinh=" + lichTrinh.get_ma_lich_trinh();
                        %>
                            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                                <div class="property-item rounded overflow-hidden">
                                    <div class="position-relative overflow-hidden">
                                        <a href="<%= linkChiTietLichTrinh%>"><img class="img-fluid" src="img/5.jpg" alt=""></a>
                                        
                        				
                                        <div class="bg-primary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">Xe 1 tầng</div>
                                        <div class="bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3"><%=tuyenDuong.get_diem_xuat_phat() %></div>
                                    </div>
                                    <div class="p-4 pb-0">
                                        <h5 class="text-primary mb-3"><%= tuyenDuong.get_gia_ve() %> VNĐ</h5>
                                        <a class="d-block h5 mb-2" href="<%= linkChiTietLichTrinh%>"><%=tuyenDuong.get_diem_xuat_phat()%> - <%=tuyenDuong.get_diem_ket_thuc() %></a>
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

	<%@ include file ="scriptsIncludeGuest.jsp"%>
</body>

</html>
