<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
	<div class="form-inline col-lg-12" style="margin-bottom: 10px;">
		<div class="col-lg-5 names" style="color: ${param.col}">(${param.type})${param.name}</div>
		<div class="col-lg-offset-1 col-lg-3" style="float: right">
			<input type="text" id="amt" class="form-control amts" value="${param.quant}" style=" width: 20%">
			<span class="update" onclick="update(${param.id},this)" style=""><a href="#">Update</a></span><span class="X" onclick="del(${param.id})" style="">X</span>
		</div>
		<div class="subtotal col-lg-3 col-lg-offset-4" style="float: right; margin-left: 40px;">SUBTOTAL=Rs.<span class="total">${param.sum}</span></div><br>
	</div>
</body>
</html>