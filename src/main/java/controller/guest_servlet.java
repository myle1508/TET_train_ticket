package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// người dùng 3 -> Không cần đăng nhấp
public class guest_servlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
 	protected void forwardToDestination(String destination, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
        rd.forward(request, response);
 	}
 	
 	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		
 	}
 	
 	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		if (request.getParameter("submitForm").equals("searchForm")) {
 			String diemxuatphat = request.getParameter("diem-di");
 			String diemketthuc = request.getParameter("diem-den");
 			String ngaydi = request.getParameter("ngay-di");
 			
 		}
 	}
}
