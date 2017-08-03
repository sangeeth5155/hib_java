<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.sample.hibernate.model.Products" import="com.sample.hibernate.model.Categories"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/styles.css"/>
</head>
<body class="prod">
<div >
<h1 id="prod_head">Product Details</h1>
<form>
<%Products p=(Products)session.getAttribute("product"); %>
<center>
<table border="0"cellspacing="7" cellpadding="7" >
<tr>
<th><label> Product Name:</label></th>
<td><input type="text" id="txt"  value="<%= p.getName()%>" readonly/></td>
</tr>
<tr>
<th><label>Product-Id:</label></th>
<td><input type="text" id="txt"  value="<%= p.getId()%>" readonly/></td>
</tr>
<tr>
<th><label>Price:</label></th>
<td><input type="text" id="txt"  value="<%= p.getPrice()%>" readonly/></td>
</tr>
<tr>
<th><label>Quantity:</label></th>
<td><input type="text" id="txt" value="<%= p.getQuantity()%>" readonly/></td>
</tr>
<tr>
<% Categories c=p.getCategory(); %>
<th><label>Category:</label></th>
<td><input type="text" id="txt"  value="<%= c.getCname()%>" readonly/></td>
</tr>
</table>
</center>
<br>

</form>
</div>
</body>
</html>