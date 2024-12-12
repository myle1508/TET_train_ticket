<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.bean.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách vé đã đặt</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        h1 {
            text-align: center;
            color: white;
            background-color: #4CAF50;
            padding: 20px;
        }
        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: white;
        }
        th, td {
            padding: 12px 15px;
            text-align: center;
            border: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        a {
            color: #4CAF50;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        p {
            text-align: center;
            font-size: 18px;
            color: #555;
        }
         .footer {
            text-align: center;
            margin-top: 40px;
            font-size: 16px;
            color: #777;
        }
        .footer a {
            color: #4caf50;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s ease;
        }
        .footer a:hover {
            color: #388e3c;
        }
    </style>
</head>
<body>
    <h1>Danh sách vé</h1>
    <%
        List<ve> ves = (List<ve>) request.getAttribute("ves");
        if (ves != null && !ves.isEmpty()) {
    %>
        <table>
            <thead>
                <tr>
                    <th>Mã vé</th>
                    <th>Mã lịch trình</th>
                    <th>Mã người dùng</th>
                    <th>Số ghế</th>
                    <th>Trạng thái</th>
                </tr>
            </thead>
            <tbody>
                <% for (ve ve : ves) { %>
                <tr>
                    <td><%= ve.get_ma_ve()%></td>
                    <td><%= ve.get_ma_lich_trinh()%></td>
                    <td><%= ve.get_ma_nguoi_dung()%></td>
                    <td><%= ve.get_so_ghe()%></td>
                    <td><%= ve.get_trang_thai()%></td>
                    <td><a href="admin?action=detail_ve&id=<%= ve.get_ma_ve()%>">Chi tiết vé</a></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    <% } else { %>
        <p>Không có đơn hàng nào để hiển thị.</p>
    <% } %>
    <div class="footer">
    <a href="javascript:history.back()">Quay lại trang trước</a>
</div>
    
</body>
</html>
