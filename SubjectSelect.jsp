
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript">
    function updateName() {
      document.getElementById("ntext").innerHTML="Welcome "+"<%=session.getAttribute("name")%>";
    }
  </script>
<style>
body, html {
    height: 100%;
    margin: 0;
    background-image:url("fhfh.jpg");
	background-color: #cccc;
    background-size: cover;
}
button {
    height: 200px;
    width: 300px;
}
 {
    box-sizing: border-box;
}
.raisedbox { 
    padding: 10px;
    border: 1px solid #77aaff;
    box-shadow:  -1px 1px #77aaff,
         -2px 2px #77aaff,
         -3px 3px #77aaff,
         -4px 4px #77aaff,
         -5px 5px #77aaff;
}
.bg {
    height: 100%;
    background-image: linear-gradient(to right, rgb(204, 230, 255),rgb(0, 79, 153)); /* Standard syntax (must be last) */
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
}
.rows {
    display: flex;
    justify-content: center;
}

/* Create four equal columns that sits next to each other    */
/*.column1 {
    flex: 33.33%;
    padding: 50px;
    position: relative;
    text-align: center;
    font-size: 100%
}
 Create four equal columns that sits next to each other 
.column2 {
    flex: 50%;
    position: relative;
    text-align: center;
    font-size: 100%
 
}*/

}
.bg1 {
    /* The image used */
    background-image: url("https://png.pngtree.com/thumb_back/fw800/back_pic/03/71/50/5557b8007f114a4.jpg");

    /* Full height */
    height: 100%; 

    /* Center and scale the image nicely <div id="grad1"></div>*/
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;

}
img {
   padding:1px;
   border:5px solid #809fff;
   background-color:#809fff;
}
.centered {
	font-size: 300%;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}

.navbar-default { margin-bottom: 0px; }
.container-fluid
{
	background-color:#595959;
}
.navbar-brand
{
	background-color:#595959;
}
#ntext{
 color: #ffffff;
  }
  @media only screen and (min-width : 992px) and (max-width : 1200px){
  	.rows{
  		margin-left: 200px;
  	}
  }
  @media only screen and (min-width : 768px) and (max-width : 991px){
  	.rows{
  		margin-left: 650px;
  	}
  }
</style>
</head>


<body onload="updateName();">

	<nav class="navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#" id="ntext"></a>
    </div>
   
    <ul class="nav navbar-nav navbar-right">
   
      <li><a href="#" id="ntext"><form action="./Logout" method="GET"><span class="glyphicon glyphicon-log-in"></span> <input type="submit" value="Logout" onclick="/Logout" style="color: #FFFFFF;background-color: #595959"></form></a></li>
    </ul>
  </div>
</nav>
<br><br><br>
<form action="./QuestionAnswers" method="POST">
    <input type="hidden" name="question">
    <input type="hidden" name="loadOption1">
    <input type="hidden" name="loadOption2">
    <input type="hidden" name="loadOption3">
    <input type="hidden" name="loadOption4">
<div class="rows" style="text-align: center;">
<div class="row">

<div class="column1 col-sm-12 col-md-12 col-lg-4 col-xs-12">

	<img border="5"  alt="W3Schools" src="http://www.tpni.com/wp-content/uploads/sites/33/2015/10/Gradient-Background-grey.jpg" width="300" height="200">

<button type="submit" onclick="/QuestionAnswers" value="IOT" name="submitSubject" class="centered" style="width: 300;height: 200">Internet Of Things</button>
</a>
</div>

<div class="column1 col-sm-12 col-md-12 col-lg-4 col-xs-12">

	<img border="5"  alt="W3Schools" src="http://www.tpni.com/wp-content/uploads/sites/33/2015/10/Gradient-Background-grey.jpg" width="300" height="200">
<button type="submit" onclick="/QuestionAnswers" value="CG" name="submitSubject" class="centered" style="width: 300;height: 200;background-color:indianred">Computer Graphics</button>
</a>
</div>

<div class="column1 sizer col-sm-12 col-md-12 col-lg-4 col-xs-12">

	<img border="5"   alt="W3Schools" src="http://www.tpni.com/wp-content/uploads/sites/33/2015/10/Gradient-Background-grey.jpg" width="300" height="200">
	<button type="submit" onclick="/QuestionAnswers" value="DSCONE" name="submitSubject" class="centered" style="width: 300;height: 200;background-color: snow">Data Science</button>
</a>
</div>
</div>
</div>
<br><br>
<div class="rows" style="text-align: center;">
<div class="row">
<div class="column2 col-sm-12 col-md-12 col-lg-6 col-xs-12">

	<img border="5"  alt="W3Schools" src="http://www.tpni.com/wp-content/uploads/sites/33/2015/10/Gradient-Background-grey.jpg" width="300" height="200">
	<button type="submit" onclick="/QuestionAnswers" value="OS" name="submitSubject" class="centered" style="width: 300;height: 200;background-color: lightyellow">Operating System</button>
</a>
</div>
<div class="column2 col-sm-12 col-md-12 col-lg-6 col-xs-12">

	<img border="10"  alt="W3Schools" src="http://www.tpni.com/wp-content/uploads/sites/33/2015/10/Gradient-Background-grey.jpg" width="300" height="200">
<button type="submit" onclick="/QuestionAnswers" value="CCONE" name="submitSubject" class="centered" style="width: 300;height: 200;background-color: cadetblue">Cloud Computing</button>
</a>
</div>
</div>
</div>
</form>
</body>
</html>