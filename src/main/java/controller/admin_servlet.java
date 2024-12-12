package controller;
//người dùng 1 -> quản trị cần đăng nhập
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.*;
import model.bo.*;
@WebServlet("/admin")
public class admin_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	lichtrinh_BO lichtrinh_BO = new lichtrinh_BO();
	nguoidung_BO nguoidung_BO = new nguoidung_BO();
	tuyenduong_BO tuyenduong_BO = new tuyenduong_BO(); 
	ve_BO ve_BO = new ve_BO();
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String destination = null;
        try {
            switch (action) {
	            case "update_admin":
                	handleUpdate(request, response, nguoidung_BO);
                    return;
	            case "doi_mk":
	            	handleUpdatepass(request, response, nguoidung_BO);
                    return;
                case "insert_tuyen_duong":
                    handleInsert(request, response, tuyenduong_BO);
                    return; 
                    
                case "select_tuyen_duong":
                    handleSelect(request, response, tuyenduong_BO);
                    return;                                     

                case "update_tuyen_duong":
                	handleUpdate(request, response, tuyenduong_BO);
                    return;
                    
                case "insert_lich_trinh":
                    handleInsert(request, response, lichtrinh_BO);
                    return; 
                    
                case "select_lich_trinh":
                    handleSelect(request, response, lichtrinh_BO);
                    return;                                     

                case "update_lich_trinh":
                	handleUpdate(request, response, lichtrinh_BO);
                    return;
                    
                case "search":
                    handleSearch(request, response, nguoidung_BO);
                    return;
                
                case "select_ve":
                    handleSelect(request, response, lichtrinh_BO);
                    return;
                    
                case "detail_ve":
                    //handleView(request, response, lichtrinh_BO);
                    return;
                default:
                    request.setAttribute("errorMessage", "Hành động không hợp lệ!");
                    destination = "/error.jsp";
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Lỗi xử lý hành động: " + e.getMessage());
            destination = "/error.jsp";
        }

        if (destination != null) {
            RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
            rd.forward(request, response);
        }
    }

	private void handleInsert(HttpServletRequest request, HttpServletResponse response, tuyenduong_BO tuyenduong_BO) throws ServletException, IOException {
		if ("post".equalsIgnoreCase(request.getMethod())) {
			String diem_xuat_phat = request.getParameter("diem_xuat_phat");
	        String diem_ket_thuc = request.getParameter("diem_ket_thuc");
	        int gia_ve = Integer.parseInt(request.getParameter("gia_ve")); 
	        int khoang_cach  = Integer.parseInt(request.getParameter("khoang_cach")); 
	        
	        tuyenduong tuyenduong = new tuyenduong();
	        tuyenduong.set_diem_xuat_phat(diem_xuat_phat);
	        tuyenduong.set_diem_ket_thuc(diem_ket_thuc);
	        tuyenduong.set_khoang_cach(khoang_cach);
	        tuyenduong.set_gia_ve(gia_ve);

	        boolean isInserted = tuyenduong_BO.inserttuyenduong(tuyenduong);

	        if (isInserted) {
	            handleSelect(request, response, tuyenduong_BO);
	        } else {
	            request.setAttribute("errorMessage", "Thêm nhân viên thất bại!");
	            forwardToErrorPage(request, response);
	        }
		}
		else {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/form_add_tuyen_duong.jsp");
            rd.forward(request, response);
            return;
		}
        
    }
	
	private void handleInsert(HttpServletRequest request, HttpServletResponse response, lichtrinh_BO lichtrinh_BO) throws ServletException, IOException {
		if ("post".equalsIgnoreCase(request.getMethod())) {
	        String danh_sach_ghe = request.getParameter("danh_sach_ghe");
	        int ma_tuyen_duong = Integer.parseInt(request.getParameter("ma_tuyen_duong")); 
	        int so_ghe_trong  = Integer.parseInt(request.getParameter("so_ghe_trong"));
	        Date thoi_gian_xuat_phat = null;
	        try {
	            thoi_gian_xuat_phat = formatter.parse(request.getParameter("thoi_gian_xuat_phat"));
	        } catch (Exception e) {
	        	request.setAttribute("errorMessage", "Lỗi thời gian!");
	            forwardToErrorPage(request, response);  
	        }
	        boolean trang_thai = Boolean.parseBoolean(request.getParameter("trang_thai"));

	        lichtrinh lichtrinh = new lichtrinh();
	        lichtrinh.set_ma_tuyen_duong(ma_tuyen_duong);
	        lichtrinh.set_thoi_gian_xuat_phat(thoi_gian_xuat_phat);
	        lichtrinh.set_danh_sach_ghe(danh_sach_ghe);
	        lichtrinh.set_so_ghe_trong(so_ghe_trong);
	        lichtrinh.set_trang_thai(trang_thai);

	        boolean isInserted = lichtrinh_BO.insertlichtrinh(lichtrinh);

	        if (isInserted) {
	            handleSelect(request, response, lichtrinh_BO);
	        } else {
	            request.setAttribute("errorMessage", "Thêm nhân viên thất bại!");
	            forwardToErrorPage(request, response);
	        }
		}
		else {
			ArrayList<String> tuyenduongList = lichtrinh_BO.getAlltuyenduong();
        	request.setAttribute("tuyenduongList", tuyenduongList);

            RequestDispatcher rd = getServletContext().getRequestDispatcher("/form_add_lich_trinh.jsp");
            rd.forward(request, response);
            return;
		}
        
    }

    private void handleSelect(HttpServletRequest request, HttpServletResponse response, tuyenduong_BO tuyenduong_BO) throws ServletException, IOException {
    	ArrayList<tuyenduong> List_tuyen_duong = tuyenduong_BO.getList();
        request.setAttribute("List_tuyen_duong", List_tuyen_duong);
        request.getRequestDispatcher("/List_tuyen_duong.jsp").forward(request, response);
    }
    private void handleSelect(HttpServletRequest request, HttpServletResponse response, lichtrinh_BO lichtrinh_BO) throws ServletException, IOException {
    	ArrayList<lichtrinh> List_lich_trinh = lichtrinh_BO.getList();
        request.setAttribute("List_lich_trinh", List_lich_trinh);
        request.getRequestDispatcher("/List_tuyen_duong.jsp").forward(request, response);
    }
    private void handleUpdate(HttpServletRequest request, HttpServletResponse response, tuyenduong_BO tuyenduong_BO) throws ServletException, IOException {
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String matuyenduongStr = request.getParameter("ma_tuyen_duong");
            int matuyenduong = Integer.parseInt(matuyenduongStr); 
            
            String diemXuatPhat = request.getParameter("diem_xuat_phat");
            String diemKetThuc = request.getParameter("diem_ket_thuc");
            
            String khoangCachStr = request.getParameter("khoang_cach");
            int khoangCach = Integer.parseInt(khoangCachStr); 
            
            String giaVeStr = request.getParameter("gia_ve");
            int giaVe = Integer.parseInt(giaVeStr);

            tuyenduong updatedtuyenduong = new tuyenduong();
            updatedtuyenduong.set_ma_tuyen_duong(matuyenduong);
            updatedtuyenduong.set_diem_xuat_phat(diemXuatPhat);
            updatedtuyenduong.set_diem_ket_thuc(diemKetThuc);
            updatedtuyenduong.set_khoang_cach(khoangCach);
            updatedtuyenduong.set_gia_ve(giaVe);

            boolean isUpdated = tuyenduong_BO.updatetuyenduong(updatedtuyenduong);

            if (isUpdated) {
            	handleSelect(request, response, tuyenduong_BO);
            } else {
                request.setAttribute("errorMessage", "Cập nhật tuyến đường thất bại!");
                forwardToErrorPage(request, response);
            }
        } else {
            String matuyenduongStr = request.getParameter("ma_tuyen_duong");
            int matuyenduong = Integer.parseInt(matuyenduongStr);
            tuyenduong currenttuyenduong = tuyenduong_BO.get_tuyen_duong_By_ma_tuyen_duong(matuyenduong);
            
            if (currenttuyenduong != null) {
                request.setAttribute("tuyenduong", currenttuyenduong);
                request.getRequestDispatcher("/form_edit_tuyen_duong.jsp").forward(request, response);
            } else {
            	request.setAttribute("errorMessage", "Không có mã tuyến đường này!");
                forwardToErrorPage(request, response);
            }
        }
    }

    private void handleUpdate(HttpServletRequest request, HttpServletResponse response, lichtrinh_BO lichtrinh_BO) throws ServletException, IOException {
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String maLichTrinhStr = request.getParameter("ma_lich_trinh");
            int maLichTrinh = Integer.parseInt(maLichTrinhStr);
            
            String matuyenduongStr = request.getParameter("ma_tuyen_duong");
            int matuyenduong = Integer.parseInt(matuyenduongStr);
            
            String thoiGianXuatPhatStr = request.getParameter("thoi_gian_xuat_phat");
            String danhSachGhe = request.getParameter("danh_sach_ghe");
            
            String soGheTrongStr = request.getParameter("so_ghe_trong");
            int soGheTrong = Integer.parseInt(soGheTrongStr); 
            
            String trangThaiStr = request.getParameter("trang_thai");
            boolean trangThai = Boolean.parseBoolean(trangThaiStr); 

            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date thoiGianXuatPhat = null;
            try {
            	thoiGianXuatPhat = formatter.parse(thoiGianXuatPhatStr);
	        } catch (Exception e) {
	        	request.setAttribute("errorMessage", "Lỗi thời gian!");
	            forwardToErrorPage(request, response);  
	        }

            lichtrinh updatedLichTrinh = new lichtrinh();
            updatedLichTrinh.set_ma_lich_trinh(maLichTrinh);
            updatedLichTrinh.set_ma_tuyen_duong(matuyenduong);
            updatedLichTrinh.set_thoi_gian_xuat_phat(thoiGianXuatPhat);
            updatedLichTrinh.set_danh_sach_ghe(danhSachGhe);
            updatedLichTrinh.set_so_ghe_trong(soGheTrong);
            updatedLichTrinh.set_trang_thai(trangThai);

            boolean isUpdated = lichtrinh_BO.updatelichtrinh(updatedLichTrinh);

            if (isUpdated) {
                handleSelect(request, response, lichtrinh_BO);
            } else {
                request.setAttribute("errorMessage", "Cập nhật lịch trình thất bại!");
                forwardToErrorPage(request, response);
            }
        } else {
            String maLichTrinhStr = request.getParameter("ma_lich_trinh");
            int maLichTrinh = Integer.parseInt(maLichTrinhStr);
            lichtrinh currentLichTrinh = lichtrinh_BO.get_lich_trinh_by_ma_lich_trinh(maLichTrinh);
            
            if (currentLichTrinh != null) {
                request.setAttribute("lichtrinh", currentLichTrinh);
                ArrayList<String> tuyenduongList = lichtrinh_BO.getAlltuyenduong(); 
                request.setAttribute("tuyenduongList", tuyenduongList);
                request.getRequestDispatcher("/form_edit_lich_trinh.jsp").forward(request, response);
            } else {
            	request.setAttribute("errorMessage", "Không có mã lịch trình này!");
                forwardToErrorPage(request, response);
            }
        }
    }
    
    private void handleUpdatepass(HttpServletRequest request, HttpServletResponse response, nguoidung_BO nguoidung_BO) throws ServletException, IOException {
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String username = request.getParameter("username");         
            String newmatkhau = request.getParameter("newmatkhau");
            nguoidung currentnguoidung = nguoidung_BO.get_nguoi_dung_By_ten_dang_nhap(username);
            currentnguoidung.set_mat_khau(newmatkhau);


            boolean isUpdated = nguoidung_BO.updatenguoidung(currentnguoidung);

            if (isUpdated) {
            	request.setAttribute("errorMessage", "Đổi mật khẩu thành công!");
                forwardToErrorPage(request, response);
            } else {
                request.setAttribute("errorMessage", "Đổi mật khẩu thất bại thất bại!");
                forwardToErrorPage(request, response);
            }
        } else {
        	String username = request.getParameter("username");
            nguoidung currentnguoidung = nguoidung_BO.get_nguoi_dung_By_ten_dang_nhap(username);
            
            if (currentnguoidung != null) {
                request.setAttribute("nguoidung", currentnguoidung);
                request.getRequestDispatcher("/form_doi_mk.jsp").forward(request, response);
            } else {
            	request.setAttribute("errorMessage", "Lỗi!");
                forwardToErrorPage(request, response);
            }
        }
    }
    
    private void handleUpdate(HttpServletRequest request, HttpServletResponse response, nguoidung_BO nguoidung_BO) throws ServletException, IOException {
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String ma_nguoi_dungStr = request.getParameter("ma_nguoi_dung");
            int ma_nguoi_dung = Integer.parseInt(ma_nguoi_dungStr); 
            
            String ten_dang_nhap = request.getParameter("ten_dang_nhap");
            String mat_khau = request.getParameter("mat_khau");           
            String ho_ten = request.getParameter("ho_ten");          
            String email = request.getParameter("email");
            String so_dien_thoai = request.getParameter("email");
            String vai_troStr = request.getParameter("email");
            int vai_tro = Integer.parseInt(vai_troStr);

            nguoidung nguoidung = new nguoidung();
            nguoidung.set_ma_nguoi_dung(ma_nguoi_dung);
            nguoidung.set_ten_dang_nhap(ten_dang_nhap);
            nguoidung.set_mat_khau(mat_khau);
            nguoidung.set_ho_ten(ho_ten);
            nguoidung.set_email(email);
            nguoidung.set_so_dien_thoai(so_dien_thoai);
            nguoidung.set_vai_tro(vai_tro);

            boolean isUpdated = nguoidung_BO.updatenguoidung(nguoidung);

            if (isUpdated) {
            	request.setAttribute("errorMessage", "Cập nhật người dùng thành công!");
                forwardToErrorPage(request, response);
            } else {
                request.setAttribute("errorMessage", "Cập nhật người dùng thất bại!");
                forwardToErrorPage(request, response);
            }
        } else {
        	String ma_nguoi_dungStr = request.getParameter("ma_nguoi_dung");
            int ma_nguoi_dung = Integer.parseInt(ma_nguoi_dungStr); 
            nguoidung currentnguoidung = nguoidung_BO.get_nguoi_dung_By_ma_nguoi_dung(ma_nguoi_dung);
            
            if (currentnguoidung != null) {
                request.setAttribute("nguoidung", currentnguoidung);
                request.getRequestDispatcher("/form_edit_nguoi_dung.jsp").forward(request, response);
            } else {
            	request.setAttribute("errorMessage", "Không có mã người dùng này!");
                forwardToErrorPage(request, response);
            }
        }
    }
    
    private void handleSearch(HttpServletRequest request, HttpServletResponse response, nguoidung_BO nguoidung_BO) throws ServletException, IOException {
    	String searchOption = request.getParameter("searchOption");
        String searchValue = request.getParameter("searchValue");

        if ( searchValue != null && !searchValue.isEmpty()) {
            ArrayList<nguoidung> searchResults = nguoidung_BO.searchnguoidung(searchOption, searchValue);

            if (searchResults != null && !searchResults.isEmpty()) {
                request.setAttribute("adminArray", searchResults);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/form_search.jsp");
                rd.forward(request, response);
            } else {
                request.setAttribute("message", "Không có kết quả tìm kiếm!");
                request.getRequestDispatcher("/form_search.jsp").forward(request, response);
            }
        } else {
            request.getRequestDispatcher("/form_search.jsp").forward(request, response);
        }
    }

    private void forwardToErrorPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/error.jsp");
        rd.forward(request, response);
    }
}
