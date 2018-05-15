<html>  
<head> 
	<link href="https://fonts.googleapis.com/css?family=Cinzel:900|Noto+Serif" rel="stylesheet"> 
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<style type="text/css">
		.products{
			
			margin: :0px 10px;
			padding: 15px;
			position: relative;
		}
		.price{
			float: right;
		}

		.subtotal{
			margin: 10px;
		}
		#totalplace{
			margin: 10px;
			font-size: 1.5em;
		}
		.amts{
			margin-left: 5px;
			margin-right: 5px;
		}
		.update{
			margin-left: 5px;
			margin-right: 5px;
		}
		.X{
			color: red;
		}
		.names{
			margin-right: 5px;
		}
		a{
			color:green;
		}
@font-face {
    font-family: Godfather;
    src: url(css/Corleone.ttf);
}
		a:hover{
			color:inherit;
			text-shadow:1px 1px yellow;
		}

		.navbar .navbar-brand{
	text-shadow: 1px 1px black;
	font-family: 'Godfather', serif;
	letter-spacing: 2px;
	color: white;
	font-size: 3em;
}

body{
	background:url('http://www.cafeitalia.com.au/Content/images/background/pizza.jpg') no-repeat fixed;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
    margin: 0;
    overflow-x: hidden;
    overflow-y:auto;
}
#allstuff{
	font-family: 'Noto Serif', serif;

}

h3{
	margin-top: 10px;
}

#menustuff,#cartstuff,#stuff{
	background: white;
	opacity: 0.8;
}
	</style>
	<script>  
		var request;
		var v;  
		var temp;
		function sendInfo(id)  
		{ 
			document.getElementById('stuff').innerHTML='';
			console.log(id);  
//console.log(document.getElementById(id));
var type=document.getElementById("type");
temp=type.options[type.selectedIndex].value;
console.log(temp);
if(temp==='Veg')
	temp='V';
else temp='NV';
var url="item?val="+id+"&type="+temp;  

if(window.XMLHttpRequest){  
	request=new XMLHttpRequest();  
}    
request.onreadystatechange=getInfo;  
request.open("GET",url,true);  
request.send();    
}  

function getInfo(){  
	// /console.log(stuff);
//	console.log("resp="+request.responseText);
if(request.readyState==4){  
	var val=request.responseText;  
	console.log("val "+val);
	var newval=val.split(" ").join("\n");
	if(temp==='V')
		document.getElementById("stuff").style.color="green";
	else if(temp==='NV')
		document.getElementById("stuff").style.color="red";
	document.getElementById("stuff").innerHTML=request.responseText;

}  
}

function sendcart(id,index)
{
	var counts=document.getElementsByName("quant");
	var url="cookie?id="+id+"&count="+counts[index].value;

	
	if(window.XMLHttpRequest){  
		request=new XMLHttpRequest();  
	}    
	request.onreadystatechange=function(){
		if(request.readyState===4)
			dispcart();

	} ;
	request.open("GET",url,true);  
	request.send(); 

}  

function dispcart()
{
	var url="cart";
	if(window.XMLHttpRequest){  
		request=new XMLHttpRequest(); 
		console.log("hello"); 
	}    
	
	request.onreadystatechange=getStuff
	request.open("GET",url,true);  
	request.send(); 

}

function getStuff()
{
	if(request.readyState==4)
	{  
		var val=request.responseText;  
			//console.log("val "+val);
			var newval=val.split(" ").join("\n");
			//Color(this);
			document.getElementById("cart").innerHTML='';
			document.getElementById("cart").innerHTML+=request.responseText;
			//document.getElementById("amt").value=
			getTotal();
		}  
	}

	function getTotal()
	{
		var subs=document.getElementsByClassName("total");
		var total=0
		for(var i=0;i<subs.length;i++)
			total+=parseInt(subs[i].innerHTML);

		console.log(total);
		document.getElementById("totalplace").innerHTML="<b>Total=Rs."+total+"</b>";

	}

	function del(id)
	{
		document.cookie = id + '=;expires=Thu, 01 Jan 1970 00:00:01 GMT;';
		dispcart();
	}

	function update(id,tem)
	{
		document.cookie= id+"="+tem.previousElementSibling.value+";";
		console.log("this is "+tem.previousElementSibling.value);
		dispcart();

	}

	function Color()
	{
		var type=document.getElementById("type");
	temp=type.options[type.selectedIndex].value;
		var x=document.getElementsByClassName("menu");
		x[0].style.color="green";
		console.log(x.length);
		console.log(temp);
		if(temp==='Veg')
			{
				for(var i=0;i<x.length;i++)
							{
								x[i].style.color="green";
								console.log(x[i].style.color);
							}
				x=document.getElementsByClassName("link");
				for(var i=0;i<x.length;i++)
							{
								x[i].style.color="green";

								console.log(x[i].style.color);
							}
			}
		else if(temp==='Non Veg')
			{
				for(var i=0;i<x.length;i++)
							x[i].style.color="red";
				x=document.getElementsByClassName("link");
				for(var i=0;i<x.length;i++)
							{
								x[i].style.color="red";
								console.log(x[i].style.color);
							}

			}

		//x=
		document.getElementById("stuff").innerHTML="";
	}
</script>  
</head>  
<body> 
	<nav class="navbar navbar-inverse bg-inverse">
		<div class="container container-fluid">
			<div class="navbar-header">
				<div class="navbar-brand">La Cucina Italiana</div>

			</div>
		</div>
	</nav> 
	<div id="allstuff" class="container container-fluid">
				<section id="stuff" class="col-lg-9" ></section>

		<div style="float: right;" class="col-lg-3">
			<section id="menustuff" style="float: right;position: relative; border:1px solid black; padding: 5px; margin:10px; margin-top: 0px; box-shadow: 1px 1px black; clear: left;" class="col-lg-12">

				<center><h3><b>Select Category</b></h3>

					<div class="form-inline" style="padding:10px">
						<select onchange="Color();" id="type" class="form-control">
							<option style="color: green;">Veg</option>
							<option style="color: red;">Non Veg</option>
						</select>
					</div>
				</center>
				<ul id="menu" >
					<li class="menu" onclick="sendInfo('Appetizers')"><a class="link" href="#">Appetizers</a></li>
					<li class="menu" onclick="sendInfo('Beverages')"><a class="link" href="#">Beverages</a></li>
					<li class="menu" onclick="sendInfo('Conizza')"><a class="link" href="#">Conizza</a></li>
					<li class="menu" onclick="sendInfo('My Pizza Combo')"><a class="link" href="#">My Pizza Combo</a></li>
					<li class="menu" onclick="sendInfo('Pizza-Classic')"><a class="link" href="#">Pizza-Classic</a></li>
					<li class="menu" onclick="sendInfo('Pizza-Exotic')"><a class="link" href="#">Pizza-Exotic</a></li>
					<li class="menu" onclick="sendInfo('Pizza-Flavours')"><a class="link" href="#">Pizza-Flavours</a></li>
					<li class="menu" onclick="sendInfo('Pizza-Supreme')"><a class="link" href="#">Pizza-Supreme</a></li>
					<li class="menu" onclick="sendInfo('Dessert')"><a class="link" href="#">Dessert</a></li>
					<li class="menu" onclick="sendInfo('Sandwizza')"><a class="link" href="#">Sandwizza</a></li>
				</ul>

			</section>
			<br>
			

		</div>
		<div class="col-lg-12">
			<section id="cartstuff" style="float: right; position: relative; clear: right; border:1px solid black; padding: 5px; margin:10px; box-shadow: 1px 1px black;" class="col-lg-12">
				<h3><b>Your Cart</b></h3>
				<div id="cart">
					<div class="form-inline col-lg-12">
						<div id="cname" class="col-lg-8" style="font-size: 1em;"></div>
						
					</div>
					
				</div>
				<div id="totalplace"></div>
			</section>
		</div>
	</div>
</body>  
</html>  