<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.sample.hibernate.controller.UserDAO" import="java.util.*"
    import="com.sample.hibernate.model.Categories"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert product</title>
<link rel="stylesheet" href="../css/styles.css"></link>
<script src="../js/checkForm.js" type="text/javascript">
</script>
</head>
<body class="prod">
<div id="prod_container">
<h1 id="prod_head">ADD Products </h1>
<%int i=Integer.parseInt(request.getParameter("eid1")); System.out.println(i);%>
<form name="product" id="product" action="<%=request.getContextPath()%>/com.sample.hibernate.controller.AddServlet?eeid1=<%=request.getParameter("eid1") %>" method="post" onSubmit="return validate()">
<table id="prod_table" cellspacing="7" cellpadding="7">
<tr>
<th><div align="center">
</div></th>
</tr>
<tr>

<th>Name </th>
<td><input name="product_name" type="text" id="txt"  value="" /></td>
</tr>
<tr>
<th>Category </th>
<td>
<select name="category" id="sel">
<option value="0">Select</option>
<%
List category=new UserDAO().getCategoryDetails();
for (Iterator iterator1 = category.iterator(); iterator1.hasNext();){
    Categories cat = (Categories) iterator1.next(); 
 %> 
 <option value="<%= cat.getCid()%>"><%= cat.getCname() %></option>
 <%} %>  
</select>
</td>
</tr>
<tr>
<th>Price</th>
<td><input name="product_price" type="text" id="txt"  value="" /></td>
</tr>
<tr>
<th>Quantity</th>
<td><input name="quantity" type="text" id="txt" value="" /></td>
</tr>
<tr>
<td  colspan="2"><div align="center">
<input type="submit"  value="ADD" id="btn" />

</div></td>
</tr>

</table>
</form>
</div>

</body>
</html>