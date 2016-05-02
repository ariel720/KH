<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>
<img src="./resources/img_map2.jpg"> <!-- 굳이 서버로 가지않아도되는 자원을 resources 폴더안으로 넣어준다. -->
<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
