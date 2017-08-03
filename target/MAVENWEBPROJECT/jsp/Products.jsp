<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.sample.hibernate.model.Employees" import="com.sample.hibernate.model.Products" 
    import="com.sample.hibernate.model.Categories" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery.ui/1.8.6/jquery-ui.min.js"></script>
<script>
$(document).ready(function(){
	
    $("#a1").live('click', function (e) {
        e.preventDefault();
        var page = $(this).attr("href")
        var pagetitle = $(this).attr("title")
        var $dialog = $('<div></div>')
        .html('<iframe style="border: 0px; " src="' + page + '" width="100%" height="100%"></iframe>')
        .dialog({
            autoOpen: false,
            modal: true,
            title: pagetitle,
            height: 720,
            width: 920
        });
        $dialog.dialog('open');
        
    })
});


function loadAdd() {
 alert("added Successfully!");	
}
function loadDelete() {
	 alert("deleted Successfully!");	
	}
function loadEdit() {
	 alert("updated Successfully!");	
	}
function confirmGo(m,u) {
    if ( confirm(m) ) {
        window.location = u;
    }
}
</script>
    <link type="text/css" rel="Stylesheet" href="http://ajax.microsoft.com/ajax/jquery.ui/1.8.6/themes/smoothness/jquery-ui.css">
   
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Products Page</title>
<link rel="stylesheet" href="css/styles.css"/>
</head>
<body class="display">
<%Employees e=(Employees)session.getAttribute("currentemployee");%>
<p style="text-align:right; font-size: 15px;">Welcome <%=e.getFirstname()+" "+e.getLastname()%></p>
<center>
<table border="2" cellspacing="7" cellpadding="7" id="disp_table">
<tr>
<th>Product ID</th>
<th>Product Name</th>
<th>View</th>
<th>Delete</th>
<th>Edit</th>
</tr>
<%List products=(List)session.getAttribute("products");
if(session.getAttribute("newproducts")!=null) {
	Products newproduct=(Products)session.getAttribute("newproducts");
	products.add(newproduct);
%>
<script>
	loadAdd();
</script>
<%}
 session.setAttribute("newproducts", null);
if(session.getAttribute("editproducts")!=null) {
	Products editproduct=(Products)session.getAttribute("editproducts");
	System.out.print(editproduct.getId()+" "+editproduct.getName()+" "+editproduct.getPrice()+" "+editproduct.getQuantity());
%>
<%for (int i=0;i<products.size();i++){
    Products prod = (Products)products.get(i);
    if(prod.getId()==editproduct.getId()){
    	prod=editproduct;
    	products.set(i,editproduct);
    	System.out.println("upadate check.."+prod.getId()+" "+prod.getName());
    	System.out.println("updated successfully");
    }
    }
for (Iterator iterator1 = products.iterator(); iterator1.hasNext();){
    Products prod = (Products) iterator1.next(); 
    System.out.print("edit results");
    System.out.println(prod.getId()+" "+prod.getName());
}
%>
<script>
	loadEdit();
</script>
	<% session.setAttribute("editproducts", null);}%>
<%if(session.getAttribute("removeproducts")!=null) {
	Products removeproduct=(Products)session.getAttribute("removeproducts");
	for (Iterator iterator1 = products.iterator(); iterator1.hasNext();){
        Products prod = (Products) iterator1.next();
        if(prod.getId()==removeproduct.getId()) {
	   iterator1.remove();
	   
	}}
	%>
<script>
	loadDelete();
</script>
	<% session.setAttribute("removeproducts", null);}%>
<%
for (Iterator iterator1 = products.iterator(); iterator1.hasNext();){
	           Products prod = (Products) iterator1.next(); 	       
%>
<tr class="products">
<td><%=prod.getId() %></td>
<td><%=prod.getName() %></td>
<%System.out.print("hai"+request.getContextPath()); %>
<td><a id="a1" title="Product Details" target="i_f" href="<%=request.getContextPath()%>/com.sample.hibernate.controller.ViewServlet?id1=<%=prod.getId() %>&emp=<%=e.getId()%>" ><button id="but">view details</button></a></td>
<td><a href="javascript:confirmGo('Sure to delete this record?','<%=request.getContextPath()%>/com.sample.hibernate.controller.DeleteServlet?eid1=<%= e.getId()%>&id1=<%=prod.getId() %>')"><button id="but">delete product</button></a></td>
<td><a href="jsp/EditProducts.jsp?eid1=<%=e.getId()%>&id1=<%=prod.getId() %>"><button id="but">edit product</button></a></td>
</tr>
<%} %>
</table>

</center>
<iframe src="" id="someFrame" name="i_f" style="visibility: hidden;" ></iframe>
<form action="jsp/addProducts.jsp?eid1=<%=e.getId()%>" method="post"><input type="submit" value="Add Product" id="add"/></form>
</body>
</html>