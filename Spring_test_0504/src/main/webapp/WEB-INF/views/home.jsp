<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<div id="d1">
<form action="/memebr/test1.do">
id1<input type="text" name="id1"><br>
pw1<input type="text" name="pw1"><br>
<input type="submit" value="M&V"><br>
</form>
</div>

<div id="d2">
<form action="/memebr/test2.do">
id2<input type="text" name="id2"><br>
pw2<input type="text" name="pw2"><br>
<input type="submit"><br>
</form>
</div>

<div id="d3">
<form action="/memebr/test3.do">
id3<input type="text" name="id3"><br>
pw3<input type="text" name="pw3"><br>
<input type="submit"><br>
</form>
</div>


<div id="d4">
<form action="/memebr/test4.do">
id4<input type="text" name="id4"><br>
pw4<input type="text" name="pw4"><br>
<input type="submit"><br>
</form>
</div>


<div id="d5">
<form action="/memebr/test5.do">
id5<input type="text" name="id5"><br>
pw5<input type="text" name="pw5"><br>
<input type="submit" value="redirect"><br>
</form>
</div>


<a href="/member/test5.do">test2</a>
<a href="test.do">json test</a>


</body>
</html>
