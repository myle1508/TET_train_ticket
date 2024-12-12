<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,model.bean.nguoidung;" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="img/1.png">
    <title>Thay đổi mật khẩu admin</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
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
        .error-message {
            color: red;
            font-size: 14px;
            text-align: center;
            margin-bottom: 20px;
        }
        form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        .input-group {
            display: flex;
            flex-direction: row;
            align-items: center;
            gap: 20px;
        }
        .input-group label {
            flex: 0 0 150px;
            font-weight: bold;
            color: #333;
        }
        .input-group input[type="text"],.input-group input[type="password"], .input-group select {
            flex: 1;
            padding: 10px 20px;
            margin-right: 30px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }
        .input-group input[type="text"]:focus,.input-group input[type="password"]:focus, .input-group select:focus {
            outline: none;
            border-color: #4CAF50;
        }
        .form-actions {
            text-align: center;
            margin-top: 20px;
        }
        button, a {
            padding: 10px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            text-decoration: none;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover, a:hover {
            background-color: #45a049;
        }
        a {
            background-color: #f44336;
        }
        a:hover {
            background-color: #d32f2f;
        }

    </style>
    <script>
        function checkpass() {
            var errorField = document.getElementById("id-error");
            var passwordField = document.getElementById("newpassword");
            var passwordField1 = document.getElementById("newpassword_repeat");
            var submitButton = document.querySelector("button[type='submit']");

            if(passwordField.value != passwordField1.value){
                errorField.textContent = "Mật khẩu nhập lại không khớp.";
                submitButton.disabled = true;
            }
            else{
            	errorField.textContent = "";
                submitButton.disabled = false;
            }
        };
    </script>
</head>
<body>
    <div class="container">
        <h2>Thay đổi mật khẩu</h2>
<%
        nguoidung nguoidung = (nguoidung) request.getAttribute("nguoidung");
    %>
        <form action="admin?action=doi_mk" method="post">            
            <div class="input-group">
			    <label for="username">Tên đăng nhập:</label>
			    <input type="text" id="username" name="username" value="<%= nguoidung.get_ten_dang_nhap() %>"  required>
			    <span id="id-error" style="color: red; font-size: 14px; margin-left: -20px;"></span>
			</div>		
			<div class="input-group">
			    <label for="password">Mật khẩu cũ:</label>
			    <input type="password" id="password" name="password"  required>
			</div>
			<div class="input-group">
			    <label for="newpassword">Mật khẩu mới:</label>
			    <input type="password" id="newpassword" name="newpassword" required>
			</div>
			<div class="input-group">
			    <label for="newpassword_repeat">Nhập lại mật khẩu mới:</label>
			    <input type="password" id="newpassword_repeat" name="newpassword_repeat" onchange="checkpass()"  required>
			    <span id="id-error1" style="color: red; font-size: 14px; margin-left: -20px;"></span>
			</div>
            <div class="form-actions">
                <button type="submit" disabled>Thêm</button>
                <a href="javascript:window.history.back()">Quay lại</a>

            </div>
        </form>
    </div>
</body>
</html>
