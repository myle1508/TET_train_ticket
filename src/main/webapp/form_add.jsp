<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-image: url('img/slide1.jpg'); 
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            position: relative;
        }

        body::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.5); 
            z-index: -1; 
        }
        .container {
        	background-color: #ffffff;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
           
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
        function checkID() {
            var account_username = document.getElementById("username").value;
            var errorField = document.getElementById("id-error");
            var passwordField = document.getElementById("password");
            var passwordField1 = document.getElementById("password1");
            var roleField = document.getElementById("role");
            var firstnameField = document.getElementById("firstname")
            var lastnameField = document.getElementById("lastname");
            var submitButton = document.querySelector("button[type='submit']");

            var httpRequest = new XMLHttpRequest();
            httpRequest.open("GET", "account?action=checkID&username=" + encodeURIComponent(account_username), true);
            // check tên đăng nhập tồn tại

            httpRequest.onload = function () {
                if (httpRequest.status === 200) {
                    var response = JSON.parse(httpRequest.responseText);

                    if (response.exists) {
                        errorField.textContent = "Tên đăng nhập đã tồn tại! Vui lòng nhập mã khác.";
                        passwordField.disabled = true;
                        passwordField1.disabled = true;
                        roleField.disabled = true;
                        firstnameField.disabled = true;
                        lastnameField.disabled = true;
                        submitButton.disabled = true;
                    } else {
                        errorField.textContent = "";
                        passwordField.disabled = false;
                        passwordField1.disabled = false;
                        roleField.disabled = false;
                        firstnameField.disabled = false;
                        lastnameField.disabled = false;
                        submitButton.disabled = false;
                    }
                }
            };

            httpRequest.send();
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>Đăng ký</h2>

        <form action="account?action=insert" method="post">
            <input type="hidden" name="action" value="add">
            
            <div class="input-group">
			    <label for="username">Tên đăng nhập:</label>
			    <input type="text" id="username" name="username" onchange="checkID()" required>
			    <span id="id-error" style="color: red; font-size: 14px; margin-left: -20px;"></span>
			</div>
			
			<div class="input-group">
			    <label for="password">Mật khẩu:</label>
			    <input type="password" id="password" name="password" disabled required>
			</div>
			<div class="input-group">
			    <label for="password">Lặp lại mật khẩu:</label>
			    <input type="password" id="password1" name="password1" disabled required>
			</div>
            
            <div class="input-group">
                <label for="firstname">Họ và tên:</label>
                <input type="text" id="firstname" name="firstname" disabled required>
            </div>
            <div class="input-group">
                <label for="lastname">Email:</label>
                <input type="text" id="lastname" name="lastname" disabled required>
            </div>
            <div class="input-group">
                <label for="lastname">Số điện thoại:</label>
                <input type="text" id="lastname" name="lastname" disabled required>
            </div>
            <div class="form-actions">
                <button type="submit" disabled>Thêm</button>
                <a href="javascript:window.history.back()">Quay lại</a>

            </div>
        </form>
    </div>
</body>
</html>
