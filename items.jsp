<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
	<div class='products col-lg-12'>
		<div class='col-lg-6'>
			<div id="name" style="font-size: 1.5em;" class='col-lg-12'><b>${param.name}</b></div><br><br>
			<div class='col-lg-12' style="color:black;">${param.details}</div>
		</div>
		<div id="price" class='col-lg-3' style='float:left'>Rs.${param.price}</div>
		<div class="col-lg-3 form-inline">
			<input type="text" id="quant" class=" form-control" name="quant" style="float: left; width:30%; margin-right: 5px">
			<button class="btn btn-success" onclick="sendcart(${param.id},${param.index})">+</button>
		</div>

	</div>
	<br><br>

	</body>
	</html>