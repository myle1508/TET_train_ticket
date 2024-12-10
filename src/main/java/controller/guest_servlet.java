package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.lichtrinh;
import model.bean.tuyenduong;
import model.bo.lichtrinh_BO;
import model.bo.tuyenduong_BO;
@WebServlet("/guest_servlet")
// người dùng 3 -> Không cần đăng nhấp
public class guest_servlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
 	protected void forwardToDestination(String destination, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
        rd.forward(request, response);
 	}
 	
 	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		lichtrinh_BO lichtrinhBO = new lichtrinh_BO();
 		tuyenduong_BO tuyenduongBO = new tuyenduong_BO();
 		if (request.getParameter("submitForm").equals("searchForm")) {
 			String diemxuatphat = request.getParameter("diem-di");
 			String diemketthuc = request.getParameter("diem-den");
 			String ngaydi = request.getParameter("ngay-di");

 			ArrayList<tuyenduong> tuyenDuongList =  tuyenduongBO.searchtuyenduong( "diem_xuat_phat_va_diem_ket_thuc",  diemxuatphat,  diemketthuc );
 			if (tuyenDuongList.size() > 0) {
 				tuyenduong tuyenDuong = tuyenDuongList.get(0);
 	 			ArrayList<lichtrinh> lichTrinhList = lichtrinhBO.get_lich_trinh_by_ma_tuyen_duong(tuyenDuong.get_ma_tuyen_duong());
 	 			request.setAttribute("tuyenDuong", tuyenDuong);
 	 			request.setAttribute("lichTrinhList", lichTrinhList);
 	 			this.forwardToDestination("/searchGuest.jsp", request, response);
 			}else {
 				System.out.println("Ke toi");
 			}
 			
 		}
 	}
 	
 	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

 	}
}