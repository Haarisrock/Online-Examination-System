<!DOCTYPE html>
<html>
<head>
	<title>Result</title>
	<link rel="stylesheet" href="results.css">
	<style>
	body {
	background-image:url("image-122.jpg");
	background-color: #cccc;
	};
	</style>
</head>
<body>
	<center> <h1><a>YOU HAVE SCORED:)</a></h1></center>
</br>
	<h1><center><a style="color: blue"><%=request.getAttribute("scores")%></a></center></h1>
	</br>
	</br>
	</br>
	</br>
	<b id="tryit"></b>
	<form action="./Retry" method="POST">
		<button id="position" class="button" onclick="/Retry">Retry</button>
	</form>
		<br>
	<br>
	<form action="./Logout">
		<button id="position2" class="button" onclick="/Logout">Logout</button>
	</form>

</body>
</html>