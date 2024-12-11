
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
    <style>
        .sofa {
            width: 60px;
            height: 40px;
            background-color: white;
            color: #333;
            font-weight: bold;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            border: 3px solid #9bc5e6;
            border-radius: 15px 15px 5px 5px;
            cursor: pointer;
            transition: background-color 0.3s ease, border-color 0.3s ease;
        }
        .sofa.selected {
            background-color: #ffcccc;
            border-color: #ff6666;
            color: #fff;
        }
        .sofa.sold {
            background-color: #d3d3d3;
            border-color: #a9a9a9;
            color: #666;
            pointer-events: none;
        }
        .legend-color {
            width: 30px;
            height: 30px;
            border-radius: 5px;
            border: 2px solid #ccc;
        }
        .legend-color.sold {
            background-color: #d3d3d3;
        }
        .legend-color.available {
            background-color: white;
            border-color: #9bc5e6;
        }
        .legend-color.selected {
            background-color: #ffcccc;
        }
        .sofa + .sofa {
            margin-left: 15px;
        }
    </style>
</head>

<body>
    <div class="container-xxl bg-white p-0">
        <%@ include file="navbarGuest.jsp" %>

		<div class="container my-5">
        	
		</div>
		    
		    <div class="container">
                <div class="bg-light rounded p-3">
                    <div class="bg-white rounded p-4" style="border: 1px dashed rgba(0, 185, 142, .3)">
                        <div class="row g-5 align-items-center">
                        	
					        <div class="row justify-content-center p-5">
					       		
					            <div class="col-md-7">
					            	<h2 class="text-center mb-4">Chọn Ghế</h2>	
					                 <!-- Sơ đồ ghế -->
						                <% 
						                    // Lấy chuỗi danh_sach_ghe từ request
						                    lichtrinh lichTrinh = (lichtrinh) request.getAttribute("lichTrinh");
						                	tuyenduong tuyenDuong = (tuyenduong) request.getAttribute("tuyenDuong");
						                    String danhSachGhe = (String) lichTrinh.get_danh_sach_ghe();
						                    if (danhSachGhe != null) {
						                        int soLuongGhe = danhSachGhe.length();
						                        int soCot = 4; // Số ghế mỗi hàng
						                        int soHang = (int) Math.ceil((double) soLuongGhe / soCot); // Tính số hàng cần thiết
						
						                        int gheIndex = 0; // Chỉ số ghế trong danh_sach_ghe
						
						                        for (int i = 0; i < soHang; i++) { 
						                %>
						                <div class="d-flex justify-content-center mb-3">
						                    <% for (int j = 0; j < soCot; j++) { 
						                        if (gheIndex < soLuongGhe) {
						                            char trangThai = danhSachGhe.charAt(gheIndex);
						                            gheIndex++;
						                    %>
						                    <div class="sofa <%= trangThai == '1' ? "sold" : "" %>">
						                        G<%= gheIndex %>
						                    </div>
						                    <% } else { %>
						                    <!-- Ghế trống nếu chuỗi danh sách không đủ ghế -->
						                    <div class="sofa"></div>
						                    <% } } %>
						                </div>
						                <% } } else { %>
						                <p class="text-center text-danger">Danh sách ghế không có dữ liệu.</p>
						                <% } %>
					            </div>
					            <!-- Hướng dẫn -->
					            <div class="col-md-5">
					            	<div class="bg-white rounded p-4 mt-5" style="border: 1px dashed rgba(0, 185, 142, .3);">
                    						<h5>Trạng thái ghế</h5>
							                <div class="d-flex align-items-center mb-2">
							                    <div class="legend-color sold me-2"></div>
							                    <span>Đã bán</span>
							                </div>
							                <div class="d-flex align-items-center mb-2">
							                    <div class="legend-color available me-2"></div>
							                    <span>Còn trống</span>
							                </div>
							                <div class="d-flex align-items-center">
							                    <div class="legend-color selected me-2"></div>
							                    <span>Đang chọn</span>
							                </div>
                    				</div>

                  					<div class="bg-white rounded p-4 mt-2" style="border: 1px dashed rgba(0, 185, 142, .3)">
                  						<h5>Thông tin chuyến đi</h5>
                  						<div class="row justify-content-center">
                  							<div class="col-md-6">Tuyến xe</div>
                  							<div class="col-md-6 text-end" style="color: black;"><%= tuyenDuong.get_diem_xuat_phat()%> - <%= tuyenDuong.get_diem_ket_thuc() %></div>
                  						</div>
                  						<div class="row justify-content-center">
                  							<div class="col-md-6">Thời gian xuất phát</div>
                  							<div class="col-md-6 text-end" style="color: #00613D;"><%= lichTrinh.get_gio_xuat_phat() %>  <%= lichTrinh.get_ngay_xuat_phat() %></div>
                  						</div>
                  						<div class="row justify-content-center">
                  							<div class="col-md-6">Số lượng ghế</div>
                  							<div class="col-md-6 text-end" id="soluongghe" style="color: black;"></div>
                  						</div>
                  						<div class="row justify-content-center">
                  							<div class="col-md-6">Số ghế</div>
                  							<div class="col-md-6 text-end" id="soghe" style="color: #00613D;"></div>
                  						</div>
                  						<div class="row justify-content-center">
                  							<div class="col-md-6">Tổng tiền chuyến đi</div>
                  							<div class="col-md-6 text-end" id="tongtien" style="color: #ef5222;"></div>
                  						</div>
                  					</div>
                    				
					            </div>
					        </div>
                        </div>
                    </div>
                </div>
            </div>
            


		<%@ include file="footerIncludeGuest.jsp" %>


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

	<%@ include file ="scriptsIncludeGuest.jsp"%>
	<script>
        // Xử lý chọn ghế
        document.addEventListener('DOMContentLoaded', () => {
		    const sofas = document.querySelectorAll('.sofa');
		    const soluongghe = document.getElementById('soluongghe');
		    const soghe = document.getElementById('soghe');
		    const tongtien = document.getElementById('tongtien');
		    var sotien = 0;
		    const maxSeats = 5; // Giới hạn số lượng ghế tối đa
		
		    sofas.forEach(sofa => {
		        sofa.addEventListener('click', () => {
		            // Kiểm tra nếu ghế đã bán thì không thay đổi
		            if (!sofa.classList.contains('sold')) {
		                // Kiểm tra số lượng ghế đã chọn
		                const selectedSofas = document.querySelectorAll('.sofa.selected');
		                if (selectedSofas.length >= maxSeats && !sofa.classList.contains('selected')) {
		                    alert("Bạn chỉ có thể chọn tối đa " + maxSeats + " ghế!");
		                    return; // Nếu đã chọn đủ số ghế, không cho phép chọn thêm
		                }
		
		                sofa.classList.toggle('selected');
		                updateGhichu(); // Cập nhật sau khi ghế được chọn
		            }
		        });
		    });
		
		    function updateGhichu() {
		        const selectedSofas = document.querySelectorAll('.sofa.selected');
		        const selectedSofaIds = [];
		
		        selectedSofas.forEach((sofa) => {
		            // Lấy ID của ghế trong danh sách, ví dụ G14, G9, ...
		            const sofaId = sofa.textContent.trim();
		            selectedSofaIds.push(sofaId); // Thêm ID ghế vào danh sách
		        });
		
		        soluongghe.textContent = selectedSofaIds.length + " ghế"; // Cập nhật số lượng ghế
		        soghe.textContent = selectedSofaIds.join(', '); // Cập nhật danh sách ghế, cách nhau bằng dấu phẩy
		        sotien = selectedSofaIds.length * <%= tuyenDuong.get_gia_ve()%>;
		        tongtien.textContent = sotien + ".000 VND";
		    }
		});


    </script>
</body>

</html>
