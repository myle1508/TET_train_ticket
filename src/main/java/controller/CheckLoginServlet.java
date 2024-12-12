package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.bo.nguoidung_BO;

@WebServlet("/CheckLoginServlet")
public class CheckLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String destination = null;
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        nguoidung_BO nguoidung_BO = new nguoidung_BO();
               
        try {
        	int role = nguoidung_BO.isValidUser(username, password);
            if ( role == 1 ) {
                request.getSession().setAttribute("username", username);
                destination = "/dashboard.jsp";
            }else if(role == 2){
            	request.getSession().setAttribute("username", username);
                destination = "/index.jsp";
            }          
            else {
                request.setAttribute("errorMessage", "Tên đăng nhập hoặc mật khẩu không đúng.");
                destination = "/login.jsp";
            }
            
            RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Đã có lỗi xảy ra.");
        }
    }
}
