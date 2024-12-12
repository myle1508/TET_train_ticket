<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList, model.bean.nguoidung" %>
<%
    String ten_dang_nhap = (String) session.getAttribute("ten_dang_nhap");
    if (ten_dang_nhap == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="img/1.png">
    <title>Chỉnh sửa tài khoản</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #4CAF50;
            color: white;
            padding: 15px 20px;
            text-align: center;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #4CAF50;
        }
        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        label {
            font-weight: bold;
            color: #333;
            margin-bottom: 5px;
        }
        input[type="text"], select, textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }
        input[type="text"]:focus, select:focus, textarea:focus {
            outline: none;
            border-color: #4CAF50;
        }
        .form-actions {
            text-align: center;
            margin-top: 20px;
        }
        button {
            padding: 10px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #45a049;
        }
        a {
            display: inline-block;
            padding: 10px 15px;
            background-color: #f44336;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-size: 16px;
        }
        a:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>
    <header>
        <h1>Mô hình MVC</h1>
    </header>
    <%
        nguoidung nguoidung = (nguoidung) request.getAttribute("nguoidung");
    %>
    <div class="container">
        <h2>Chỉnh sửa tài khoản</h2>
        <form action="nguoidung?action=update" method="post">
            <input type="hidden" id="ma_nguoi_dung" name="ma_nguoi_dung" value="<%=nguoidung.get_ten_dang_nhap() %>" >
            <div>
                <label for="ten_dang_nhap">Tên đăng nhập:</label>
                <input type="text" id="ten_dang_nhap" name="ten_dang_nhap" value="<%=nguoidung.get_ten_dang_nhap() %>" readonly="readonly">
            </div>
            <input type="hidden" id="mat_khau" name="mat_khau" value="<%=nguoidung.get_mat_khau() %>" >
            <div>
                <label for="ho_ten">Họ và tên:</label>
                <input type="text" id="ho_ten" name="ho_ten" value="<%=nguoidung.get_ho_ten() %>" required>
            </div>
            <div>
                <label for="email">Email:</label>
                <input type="email"  id="email" name="email"  value="<%= nguoidung.get_email()%>" required>
            </div>
            <div>
                <label for="so_dien_thoai">Số điện thoại:</label>
                <input type="text"  id="so_dien_thoai" name="so_dien_thoai"  value="<%= nguoidung.get_so_dien_thoai()%>" required>
                
            </div>
            <input type="hidden" id="mat_khau" name="mat_khau" value="<%=nguoidung.get_vai_tro()%>" >

            <div class="form-actions">
                <button type="submit">Cập nhật</button>
                <a href="javascript:window.history.back()">Quay lại</a>

            </div>
        </form>
    </div>
</body>
</html>
