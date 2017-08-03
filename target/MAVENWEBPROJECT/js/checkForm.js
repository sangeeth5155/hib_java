function validateIndex()
{
	var regex=/^\d{3}$/;
	if(document.forms["f1"]["emp"].value=="")
		{
		alert("Please enter Employee Id!");
		f1.emp.focus();
		return false;
		}
	if(regex.test(document.forms["f1"]["emp"].value)==false)
		{
		alert("Please enter valid Employee Id!");
		f1.emp.focus();
		return false;
		}
	return true;
}
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