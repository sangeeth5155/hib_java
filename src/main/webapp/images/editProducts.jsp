<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.sample.hibernate.controller.UserDAO" import="java.util.*"
    import="com.sample.hibernate.model.Categories"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert product</title>
<link rel="stylesheet" href="styles.css"/>
<script language="javascript">
function validate()
{
	var x=document.forms["product"];
	var regex = /^\d{4}$/;
	var regex1= /^\d+.\d{2}$/;
	var regex2=/^[A-Z]([a-z])*$/;
	var regex3=/^\d+[a-z]*$/;
if(x["product_name"].value=="")
{
alert("Please enter Name!");
product.product_name.focus();
product.product_name.style.borderColor= "red";
return false;
}
if(x["category"].value=="0")
{
alert("Please enter category");
product.sel.focus();
product.sel.style.borderColor= "red";
return false;
}
if(regex2.test(x["product_name"].value)== false)
{
alert("Product Name should start with Capital Letter and should not have any digits!");
product.product_name.focus();
product.product_name.style.borderColor= "red";
return false;
}

if(x["product_price"].value=="")
{
alert("Please enter price!");
product.product_price.focus();
product.product_price.style.borderColor= "red";
return false;
}
if(x["quantity"].value=="")
{
alert("Please enter quantity!");
product.quantity.focus();
product.quantity.style.borderColor= "red";
return false;
}
if(x["product_id"].value=="" )
{
alert("Please enter id!");
product.product_id.focus();
product.product_id.style.borderColor= "red";
return false;
}
if((regex.test(x["product_id"].value))==false)
	{
	alert("Please enter only digits with length 3!");
	product.product_id.focus();
	product.product_id.style.borderColor= "red";
	return false;
	}

if((regex3.test(x["quantity"].value))==false)
	{
	alert("Please enter valid quantity");
	product.quantity.focus();
	product.quantity.style.borderColor= "red";
	return false;
	}
product.product_name.style.borderColor= "none";
product.product_price.style.borderColor= "none";
product.product_id.style.borderColor= "none";
product.quantity.style.borderColor= "none";	
return true;
}

</script>

</head>
<body class="index">
<div class="box" style="width:600px; height:700px;">
<h1 class="l1">ADD Products </h1>
<%int i=Integer.parseInt(request.getParameter("eid1")); System.out.println(i);%>
<form name="product" id="product" action="<%=request.getContextPath()%>/com.sample.hibernate.controller.AddServlet?eeid1=<%=request.getParameter("eid1") %>" method="post" onSubmit="return validate()">
<table width="332" height="252" border="0" align="center" cellpadding="2" cellspacing="2">
<tr>
<th height="33" colspan="2"><div align="center">
</div></th>
</tr>
<tr>
<th>Id </th>
<td><input name="product_id" type="text" class="txt" id="product_id" value="" /></td>
</tr>
<tr>

<th>Name </th>
<td><input name="product_name" type="text" class="txt" id="product_name" value="" /></td>
</tr>
<tr>
<th>Category </th>
<td>
<select id="sel" name="category" style="height:30px;color: #22aeaa; width: 250px;padding-left: 25px;font-size: 20px;">
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
<td><input name="product_price" type="text" class="txt" id="product_price" value="" /></td>
</tr>
<tr>
<th>Quantity</th>
<td><input name="quantity" type="text" class="txt" id="quantity" value="" /></td>
</tr>
<tr>
<td class="submission" colspan="2"><div align="center">
<input name="s" type="submit" class="btn" value="ADD" />

</div></td>
</tr>

</table>
</form>
</div>

</body>
</html>