<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
        margin: 0;
        padding: 0;
    }
    .header {
        background-color: #4caf50;
        color: #fff;
        padding: 10px 20px;
        text-align: center;
    }
    .menu {
        margin: 20px;
    }
    .menu a {
        display: inline-block;
        margin: 10px;
        padding: 10px 20px;
        text-decoration: none;
        background-color: #28a745;
        color: #fff;
        border-radius: 5px;
    }
    .menu a:hover {
        background-color: #218838;
    }
      .welcome {
        font-size: 18px;
        margin-top: 10px;
    }
</style>
</head>
<body>
   <div class="welcome">
        <%
            String username = (String) session.getAttribute("username");
            if (username != null) {
        %>
            <p>Chào mừng, <a href="UsersServlet?action=xem&username=<%= username %>"><%= username.substring(0, 1).toUpperCase() + username.substring(1) %></a>!</p>
        <% 
            } else {
        %>
            <p>Chào mừng, khách!</p>
        <% 
            }
        %>
    </div>

    <div class="menu">
        <a href="viewProducts.jsp">Xem sản phẩm</a>
        <a href="viewOrders.jsp">Xem đơn hàng</a>
        <a href="updateProfile.jsp">Cập nhật thông tin cá nhân</a>
        <a href="LogoutServlet">Đăng xuất</a>
    </div>
</body>
</html>
