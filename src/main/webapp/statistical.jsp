<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thống Kê Tổng Hợp</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f7f9fc;
            color: #333;
            margin: 0;
            padding: 20px;
        }
        
        h1, h2 {
            color: #2c3e50;
            margin-bottom: 15px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        table th, table td {
            border: 1px solid #e1e4ea;
            padding: 12px;
            text-align: left;
        }
        table th {
            background-color: #34495e;
            color: #ecf0f1;
        }
        table tbody tr:nth-child(even) {
            background-color: #f2f4f8;
        }
        .no-data {
            text-align: center;
            font-style: italic;
            color: #aaa;
        }
        .chart-container {
            width: 90%;
            max-width: 800px;
            margin: 25px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }
        .table-container {
            margin-bottom: 40px;
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <h1>Thống Kê Tổng Hợp</h1>
    <%-- Revenue by Date Chart --%>
    <%
        Map<String, Double> revenueByDate = (Map<String, Double>) request.getAttribute("revenueByDate");
        StringBuilder dates = new StringBuilder();
        StringBuilder revenues = new StringBuilder();
        if (revenueByDate != null && !revenueByDate.isEmpty()) {
            for (Map.Entry<String, Double> entry : revenueByDate.entrySet()) {
                dates.append("'").append(entry.getKey()).append("',");
                revenues.append(entry.getValue()).append(",");
            }
        }
    %>
    <h2>Biểu Đồ Doanh Thu Theo Ngày</h2>
    <div class="chart-container">
        <canvas id="revenueChart"></canvas>
    </div>
    <script>
        var ctx = document.getElementById('revenueChart').getContext('2d');
        var revenueChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: [<%= dates.toString() %>],
                datasets: [{
                    label: 'Doanh Thu (VNĐ)',
                    data: [<%= revenues.toString() %>],
                    borderColor: '#3498db',
                    borderWidth: 3,
                    tension: 0.1,
                    fill: false
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        display: true
                    }
                },
                scales: {
                    x: {
                        title: {
                            display: true,
                            text: 'Ngày'
                        }
                    },
                    y: {
                        title: {
                            display: true,
                            text: 'Doanh Thu (VNĐ)'
                        },
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
    <%-- Revenue by Date Table --%>
    <div class="table-container">
        <h2>Doanh Thu Theo Ngày</h2>
        <table>
            <thead>
                <tr>
                    <th>Ngày</th>
                    <th>Doanh Thu (VNĐ)</th>
                </tr>
            </thead>
            <tbody>
                <% if (revenueByDate != null && !revenueByDate.isEmpty()) { %>
                    <% for (Map.Entry<String, Double> entry : revenueByDate.entrySet()) { %>
                        <tr>
                            <td><%= entry.getKey() %></td>
                            <td><%= String.format("%,.0f", entry.getValue()) %></td>
                        </tr>
                    <% } %>
                <% } else { %>
                    <tr>
                        <td colspan="2" class="no-data">Không có dữ liệu</td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
    <%-- Top Selling Products Table --%>
    <% 
        Map<String, Integer> topSellingProducts = (Map<String, Integer>) request.getAttribute("topSellingProducts");
    %>
    <div class="table-container">
        <h2>Sản Phẩm Bán Chạy</h2>
        <table>
            <thead>
                <tr>
                    <th>Sản Phẩm</th>
                    <th>Số Lượng Bán</th>
                </tr>
            </thead>
            <tbody>
                <% if (topSellingProducts != null && !topSellingProducts.isEmpty()) { %>
                    <% for (Map.Entry<String, Integer> entry : topSellingProducts.entrySet()) { %>
                        <tr>
                            <td><%= entry.getKey() %></td>
                            <td><%= entry.getValue() %></td>
                        </tr>
                    <% } %>
                <% } else { %>
                    <tr>
                        <td colspan="2" class="no-data">Không có dữ liệu</td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
    <%-- Product Count by Category Table --%>
    <% 
        Map<String, Integer> productCountByCategory = (Map<String, Integer>) request.getAttribute("productCountByCategory");
    %>
    <div class="table-container">
        <h2>Số Lượng Sản Phẩm Theo Danh Mục</h2>
        <table>
            <thead>
                <tr>
                    <th>Danh Mục</th>
                    <th>Số Lượng</th>
                </tr>
            </thead>
            <tbody>
                <% if (productCountByCategory != null && !productCountByCategory.isEmpty()) { %>
                    <% for (Map.Entry<String, Integer> entry : productCountByCategory.entrySet()) { %>
                        <tr>
                            <td><%= entry.getKey() %></td>
                            <td><%= entry.getValue() %></td>
                        </tr>
                    <% } %>
                <% } else { %>
                    <tr>
                        <td colspan="2" class="no-data">Không có dữ liệu</td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
    <%-- Top Customers Table --%>
    <div class="table-container">
        <h1>Thống Kê Khách Hàng</h1>
        <h2>Danh Sách Khách Hàng Có Tổng Chi Tiêu Cao Nhất</h2>
        <table>
            <thead>
                <tr>
                    <th>Tên Khách Hàng</th>
                    <th>Tổng Chi Tiêu (VNĐ)</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<String> topCustomers = (List<String>) request.getAttribute("topCustomers");
                    if (topCustomers != null && !topCustomers.isEmpty()) {
                        for (String customer : topCustomers) {
                %>
                <tr>
                    <td><%= customer.split(" - ")[0] %></td>
                    <td><%= customer.split(" - ")[1] %></td>
                </tr>
                <% 
                        }
                    } else {
                %>
                <tr>
                    <td colspan="2" class="no-data">Không có dữ liệu</td>
                </tr>
                <% 
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
