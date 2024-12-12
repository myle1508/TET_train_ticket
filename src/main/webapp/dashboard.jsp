<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            height: 100vh;
            background-color: #f4f4f9;
        }
        .header {
            background-color: #333;
            color: #fff;
            padding: 20px;
            text-align: center;
        }
         .welcome {
        margin-top: 10px;
    }
    .welcome p {
        margin: 0;
        font-size: 1.2em;
    }
    .welcome a {
        color: #1abc9c;
        text-decoration: none;
        font-weight: bold;
    }
    .welcome a:hover {
        color: #16a085;
        text-decoration: underline;
    }
        .main-content {
            display: flex;
            flex-grow: 1;
            overflow: hidden;
        }
        .sidebar {
            width: 250px;
            background-color: #2c3e50;
            padding: 20px;
            color: #fff;
            height: 100%;
            box-sizing: border-box;
        }
        .sidebar a {
            display: block;
            padding: 12px;
            margin: 10px 0;
            text-decoration: none;
            color: #fff;
            background-color: #34495e;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .sidebar a:hover {
            background-color: #1abc9c;
        }
        .content-area {
            flex-grow: 1;
            padding: 0;
            box-sizing: border-box;
        }
        iframe {
            width: 100%;
            height: 100%;
            border: none;
        }
        .footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px;
            margin-top: auto;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Admin Dashboard</h1>
        <div class="welcome">
            <%
                String username = (String) session.getAttribute("username");
                if (username != null) {
            %>
                <p>Chào mừng, <a target="mainFrame" href="UsersServlet?action=xem&username=<%= username %>"><%= username.substring(0, 1).toUpperCase() + username.substring(1) %></a>!</p>
            <% 
                } else {
            %>
                <p>Chào mừng, khách!</p>
            <% 
                }
            %>
        </div>
    </div>
    <div class="main-content">
        <div class="sidebar">
        	<a href="dashboard.jsp" >Dashboard</a>
            <a href="manageUsers.jsp" target="mainFrame">Quản lý người dùng</a>
            <a href="manageProducts.jsp" target="mainFrame">Quản lý vé</a>
            <a href="OrdersServlet?action=xem" target="mainFrame">Quản lý tuyến đường</a>
            <a href="manageCategories.jsp" target="mainFrame">Quản lý tiến trình</a>
            <a href="StatisticalServlet" target="mainFrame">Thống kê</a>
            <a href="logout.jsp" target="_top">Đăng xuất</a>
        </div>
        <div class="content-area">
            <iframe name="mainFrame" src="StatisticalServlet?action=viewByDate"></iframe>
        </div>
    </div>
    <div class="footer">
        <p>&copy; 2024 Admin Dashboard</p>
    </div>
</body>
</html>
