<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<style type="text/css">
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f9;
    }
    .header {
        background-color: ; rgb(255, 215, 0);
        color: rgb(220, 20, 60); ;
        padding: 20px;
        text-align: center;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .header h1 {
        margin: 0;
        font-size: 2.5em;
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
                <p>Chào mừng, <a href="UsersServlet?action=xem&username=<%= username %>"><%= username.substring(0, 1).toUpperCase() + username.substring(1) %></a>!</p>
            <% 
                } else {
            %>
                <p>Chào mừng, khách!</p>
            <% 
                }
            %>
        </div>
    </div>
</body>
</html>
