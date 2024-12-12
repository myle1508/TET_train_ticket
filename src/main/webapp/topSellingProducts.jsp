<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>Sản phẩm bán chạy</h3>
<table>
    <tr>
        <th>Sản phẩm</th>
        <th>Số lượng bán</th>
    </tr>
    <c:forEach items="${topSellingProducts}" var="entry">
        <tr>
            <td>${entry.key}</td>
            <td>${entry.value}</td>
        </tr>
    </c:forEach>
</table>

</body>
</html>