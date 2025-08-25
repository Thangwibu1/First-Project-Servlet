<%-- BƯỚC 1: Dòng này BẮT BUỘC phải có ở trên cùng, không được thiếu --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách sản phẩm</title>
    <style>
        body {
            font-family: sans-serif;
        }

        table {
            border-collapse: collapse;
            width: 60%;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>

<h1>Danh sách sản phẩm</h1>

<%-- Thử in một giá trị đơn giản để kiểm tra JSTL và EL có hoạt động không --%>
<p>Kiểm tra EL: ${"Hello JSTL!"}</p>

<c:if test="${not empty products}">
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Tên sản phẩm</th>
            <th>Giá</th>
        </tr>
        </thead>
        <tbody>
            <%-- BƯỚC 2: Đảm bảo "products" khớp với tên attribute trong Servlet --%>
        <c:forEach items="${products}" var="p">
            <tr>
                    <%-- BƯỚC 3: Đảm bảo p.id, p.name, p.price khớp với getter trong file Product.java --%>
                <td><c:out value="${p.id}"/></td>
                <td><c:out value="${p.name}"/></td>
                <td><c:out value="${p.price}"/></td>
                <td>
                    <a href="edit-product?id=${p.id}">Sửa</a> |
                    <a href="delete-product?id=${p.id}"
                        onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này không?');">
                        Xóa
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>

<c:if test="${empty products}">
    <p style="color: red;">Không tìm thấy sản phẩm nào.</p>
</c:if>
<%-- Thêm vào cuối file productList.jsp, sau thẻ </table> --%>

<hr style="margin-top: 40px;">
<h2>Thêm sản phẩm mới</h2>

<form action="add-product" method="post">
    <table>
        <tr>
            <td>Tên sản phẩm:</td>
            <td><input type="text" name="productName" required size="50"></td>
        </tr>
        <tr>
            <td>Giá sản phẩm:</td>
            <td><input type="number" name="productPrice" required step="0.01" min="0"></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: right;">
                <input type="submit" value="Thêm sản phẩm">
            </td>
        </tr>
    </table>
</form>
</body>
</html>