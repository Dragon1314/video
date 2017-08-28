<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AJAX</title>
<script type="text/javascript">
window.onload=function(){
/* var car={"name":"QQ","price":2000}
var cars=[{"name":"QQ","price":2000},{"name":"ZZ","price":3000}]
var people1={"name":"x","age":13}
var people={"name":"Bob","cars":cars,"friend":people1}
alert(car.price);
alert(JSON.stringify(car));
alert(JSON.parse(JSON.stringify(car)));
alert(cars[1].name);
alert(JSON.stringify(people)); */



}



function send(){
	var xmlhttp=new XMLHttpRequest();
	var uname=document.getElementById("username").value;
	//alert(uname);
	
/*     xmlhttp.onreadystatechange=function(){
    if(xmlhttp.readyState==4 && xmlhttp.status==200){
           alert(xmlhttp.responseText);	
	document.getElementById("namespan").innerHTML=xmlhttp.responseText;
             }
         } */
/*     xmlhttp.onreadystatechange=function(){      
               alert(xmlhttp.readyState+'---'+xmlhttp.responseText+'---'+xmlhttp.status);	
    	document.getElementById("namespan").innerHTML=xmlhttp.responseText;
                 
             }   
	xmlhttp.open("GET","${pageContext.request.contextPath}/AJAX.action?username="+uname,true);
	xmlhttp.send();    */
/* 	     
 * 
 * 
    xmlhttp.onreadystatechange=function(){
    if(xmlhttp.readyState==4 && xmlhttp.status==200){
           alert(xmlhttp.responseText);	
	document.getElementById("namespan").innerHTML=xmlhttp.responseText;
             }
         } 	 
*/
/*
 *post请求 
 *
xmlhttp.open("POST","${pageContext.request.contextPath}/AJAX.action",true);
xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
xmlhttp.send("username="+uname);  */   




}


</script>
</head>
<body>
用户名:<input type="text" id="username" onblur="send()"><span id="namespan"></span>
<br>&nbsp;密码:<input type="password" id="password" name="pwd">





</body>
</html>