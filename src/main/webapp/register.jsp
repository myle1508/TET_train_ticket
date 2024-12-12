<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Ký Tài Khoản</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e8f5e9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 30px;
            width: 100%;
            max-width: 400px;
        }

        .header {
            text-align: center;
            margin-bottom: 20px;
        }

        .header h2 {
            margin: 0;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
        }

        input {
            width: 100%;
            padding: 12px;
            margin: 8px 0;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 16px;
            background-color: #f9f9f9;
            transition: 0.3s ease;
        }

        input:focus {
            border-color: #4CAF50;
            background-color: #ffffff;
        }

        .submit-btn {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 12px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }

        .submit-btn:hover {
            background-color: #45a049;
        }

        .error-message {
            color: red;
            text-align: center;
            margin-bottom: 10px;
        }

        .footer {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2>Đăng Ký Tài Khoản</h2>
        </div>

        <form name="form2" action="UsersServlet?action=add" method="post">
            <label for="username">Tên Đăng Nhập:</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Mật Khẩu:</label>
            <input type="password" id="password" name="password" required>

            <label for="confirm_password">Xác Nhận Mật Khẩu:</label>
            <input type="password" id="confirm_password" name="confirm_password" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="address">Địa Chỉ:</label>
            <input type="text" id="address" name="address" required>

            <label for="phone">Số Điện Thoại:</label>
            <input type="text" id="phone" name="phone" required>
            <input type="hidden" id="roleid" name="roleid" value="1">

            <input type="submit" class="submit-btn" value="Đăng Ký">
        </form>

        <div class="footer">
            <p>Đã có tài khoản? <a href="login.jsp">Đăng nhập ngay</a></p>
        </div>

        <% if (request.getAttribute("errorMessage") != null) { %>
            <p class="error-message"><%= request.getAttribute("errorMessage") %></p>
        <% } %>
    </div>
</body>
</html>
