<!DOCTYPE html>
<html>
<head>
	<title>Exam</title>
	<!-- <link rel="stylesheet" href="questions.css"> -->
	<head>
	<meta charset="utf-8">
	<style>
	body {
	background-image:url("questionpage.png");
	background-size: cover;
	};
	a {
		color: black;
	}
	h1 {
		color: black;
	}
	h2 {
		color: black;
	}
	#opone, #optwo, #opthree ,#opfour ,#qNo {
		color: black;
	}
	#txt {
		position: absolute;
    	top: 20px;
    	right: 120px;
    	font-size: 50px;
	}
	#position {
    position: absolute;
    bottom: 50px;
    left: 120px;
    font-size: 18px;
	}
	#position2 {
    	position: absolute;
   	 	bottom: 50px;
   		right: 120px;
   	 	font-size: 18px;
	}
	</style>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
		var arr=[];
		var counter = 0;
		var a,b,c,d;
		var i;
		var option1="",option2="",option3="",option4="",questions="",resultUpdate;
		var option1arr=[];
		var option2arr=[];
		var option3arr=[];
		var option4arr=[];
		var questionsarr=[];
		for(i=0;i<10;i++) {
			arr[i]="nn";
		}
		function clean() {
				document.getElementById("one").checked=false;
				document.getElementById("two").checked=false;
				document.getElementById("three").checked=false;
				document.getElementById("four").checked=false;
		}
		function increment(x) {
			x=x+1;
			if(x==10) {
				x=0;
			}
			return x;
		}
		function decrement(y) {
			y=y-1;
			if(y==-1) {
				y=9;
			}
			return y;
		}
		 function checkQ() {
			if(document.getElementById("one").checked) {
				return "one";
			}
			else if(document.getElementById("two").checked) {
				return "two";
			}
			else if(document.getElementById("three").checked) {
				return "three";
			}
			else if(document.getElementById("four").checked) {
				return "four";
			}
			else 
				return "nn";
		}
		function nextQ() {
			counter=increment(counter);
			document.getElementById("textSent").innerHTML=questionsarr[counter];
			document.getElementById("opone").innerHTML=option1arr[counter];
			document.getElementById("optwo").innerHTML=option2arr[counter];
			document.getElementById("opthree").innerHTML=option3arr[counter];
			document.getElementById("opfour").innerHTML=option4arr[counter];
			if(arr[counter]=="nn") {
				clean();
			}
			else if(arr[counter]=="one" || arr[counter]=="two" || arr[counter]=="three" || arr[counter]=="four" ) {
				document.getElementById(arr[counter]).checked=true;
			}
			resultUpdate=questionsarr[counter]+"\n"+option1arr[counter]+"\n"+option2arr[counter]+"\n"+option3arr[counter]+"\n"+option4arr[counter];
			document.getElementById("textSent").value=resultUpdate;
		}
		function saveIt() {
			arr[counter]=checkQ();
		}
		function prevQ() {
			counter=decrement(counter);
			document.getElementById("textSent").innerHTML=questionsarr[counter];
			document.getElementById("opone").innerHTML=option1arr[counter];
			document.getElementById("optwo").innerHTML=option2arr[counter];
			document.getElementById("opthree").innerHTML=option3arr[counter];
			document.getElementById("opfour").innerHTML=option4arr[counter];
			if(arr[counter]=="nn") {
				clean();
			}
			else if(arr[counter]=="one" || arr[counter]=="two" || arr[counter]=="three" || arr[counter]=="four" ) {
				document.getElementById(arr[counter]).checked=true;
			}
			resultUpdate=questionsarr[counter]+"\n"+option1arr[counter]+"\n"+option2arr[counter]+"\n"+option3arr[counter]+"\n"+option4arr[counter];
			document.getElementById("textSent").value=resultUpdate;
		}
		function tryit() {
			document.getElementById("checkme").innerHTML=arr;
		}
		function quesNo() {
			document.getElementById("qNo").innerHTML=counter+1;
		}
		function transfer() {
			var arrstr="";
			for(i=0;i<arr.length;i++) {
				arrstr=arrstr+arr[i]+" ";
			}
			var answer = document.getElementById("passValues");
        	answer.value=arrstr;
 			var form = document.getElementById("finalSubmit");
 			loadSubject();
        	form.submit();
		}
		function extract(x) {
			var i,k=0;
			var c;
			var s1="";
			var arrs=[];
			for(i=0;i<x.length;i++) {
				c=x.charAt(i);
				if(c!='@') {
					s1=s1+c;
				}
				else {
					arrs[k]=s1;
					k=k+1;
					s1="";
				}
			}
			return arrs;
		}
		function startTest() {
			questions="<%=request.getAttribute("question")%>";
			option1="<%=request.getAttribute("loadOption1")%>";
			option2="<%=request.getAttribute("loadOption2")%>";
			option3="<%=request.getAttribute("loadOption3")%>";
			option4="<%=request.getAttribute("loadOption4")%>";
			questionsarr=extract(questions);
			option1arr=extract(option1);
			option2arr=extract(option2);
			option3arr=extract(option3);
			option4arr=extract(option4);
			document.getElementById("opone").innerHTML=option1arr[counter];
			document.getElementById("optwo").innerHTML=option2arr[counter];
			document.getElementById("opthree").innerHTML=option3arr[counter];
			document.getElementById("opfour").innerHTML=option4arr[counter];
			/*+"\n"+option1arr[counter]+"\n"+option2arr[counter]+"\n"+option3arr[counter]+"\n"+option4arr[counter];*/
			document.getElementById("textSent").innerHTML=questionsarr[counter];
		}
		var seconds=90;
		function startTime() {
			minutes=checkTime(parseInt(seconds/60));
			sec=checkTime(parseInt(seconds%60));
			seconds=seconds-1;
			if(seconds==0)
			{
				transfer();
			}
			document.getElementById("txt").innerHTML =minutes + ":" + sec;
		    setTimeout(startTime, 1000);
	    }
		function checkTime(i) {
			if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
			return i;
		}
		function loadSubject() {
			document.getElementsByName("subjectName").value="<%=request.getAttribute("submitSubject")%>"
		}
</script>	
</head>
<body onload="startTest();startTime();">
	<h1 >Question <a id="qNo">1</a></h1>
	<b id="txt"></b>
	<br>
	<div>
<h3 rows="34" cols="185" disabled="1" id="textSent"></h3>
<br>
  <input type="radio" name="ans" value="A" id="one"><a id="opone">A</a><br>
  <input type="radio" name="ans" value="B" id="two"><a id="optwo">B</a><br>
  <input type="radio" name="ans" value="C" id="three"><a id="opthree">C</a><br>
  <input type="radio" name="ans" value="D" id="four"><a id="opfour">D</a><br>
</div>
<br>
<br>
 <button name="prev" class="btn btn-primary" value="next" onclick="prevQ();quesNo();">Prev</button> &nbsp;
  <button id="saveAns" class="btn btn-success" onclick="saveIt()">Save</button> &nbsp;
  <button name="next"class="btn btn-primary" value="next" onclick="nextQ();quesNo();">Next</button>
<a id="checkme"></a>	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<form action="./Search" method="POST" id="finalSubmit">
	<input type="hidden" name="array" id="passValues"/>
	<input type="hidden" name="array1" id="passTest"/>
	<input type="hidden" name="scores" id="marks"/>
	<input type="hidden" name="subjectName">
	<input type="submit" class="btn btn-danger" value="Submit" id="position" onClick="transfer();">
</form>	
	<br>
	<br>
	<form action="./Logout">
		<button onclick="/Logout" class="btn btn-danger" id="position2">Logout</button>
	</form>

</body>
</html>