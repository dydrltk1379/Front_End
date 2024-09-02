<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>
<html>
<head>
    <title>product</title>
</head>
<body>
<br>
<hr color="blue">
<h3>Add Customer</h3>
add product : <%= request.getAttribute("product")%>
<hr color="red">

<h3>Delete Customer</h3>
deletion product_id : <%=request.getAttribute("product_id")%>
</body>
</html>