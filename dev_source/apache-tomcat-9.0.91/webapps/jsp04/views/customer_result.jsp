<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>
<html>
<head>
    <title>customer</title>
</head>
<body>
<br>
<hr color="blue">
<h3>Add Customer</h3>
add customer : <%=request.getAttribute("customer")%>

<hr color="red">

<h3>Delete Customer</h3>
deletion customer_id : <%=request.getAttribute("customer_id")%>
</body>
</html>