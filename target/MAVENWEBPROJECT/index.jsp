<html>
<head>
<link rel="stylesheet" href="css/styles.css"/>
<script type="text/javascript" src="js/checkForm.js">

</script>
</head>
<body class="index">
<div>
<h1>Sign In</h1>
<label>Enter Your Employee Id:</label><br><br>
<form name="f1" method="post" action="FetchServlet" onSubmit="return validateIndex()">
<input type="text" name="emp" id="txt" onFocus="field_focus(this,'emp')" onBlur="field_blur(this,'emp')" class="emp"/>
<br><br>
<input type="submit" value="Sign in" id="btn"/>
</form>
</div>
</body>
</html>