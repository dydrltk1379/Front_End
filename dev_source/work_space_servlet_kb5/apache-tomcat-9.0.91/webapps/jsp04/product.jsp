<%--
  Created by IntelliJ IDEA.
  User: student
  Date: 2024-07-31
  Time: 오후 3:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Page</title>
</head>
<body>
<h2>Add Product</h2>
<form action="${pageContext.request.contextPath}/product_add" method="post">
    Product ID : <input type="text" name="id"/><br>
    Name : <input type="text" name="name"/><br>
    Price : <input type="text" name="price"/><br>
    <input type="submit" value="Add"/>
</form>

<h2>Delete Product</h2>
<form action="${pageContext.request.contextPath}/product_delete" method="post">
    Product ID : <input type="text" name="id"/><br>
    <input  type="submit" value="Delete"/>
</form>

</body>
</html>
