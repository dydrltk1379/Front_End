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
    <title>

    </title>
</head>
<body>
<h2>Add Customer</h2>
<form action="/customer_add" method="post">
    Customer ID : <input type="text" name="id"/><br>
    Name : <input type="text" name="name"/><br>
    Email : <input type="text" name="email"/><br>
    <input type="submit" value="Add"/>
</form>

<h2>Delete Customer</h2>
<form action="/customer_delete" method="post">
    Customer ID : <input type="text" name="id"/><br>
    <input  type="submit" value="Delete"/>
</form>

</body>
</html>
