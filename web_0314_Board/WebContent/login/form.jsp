<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
 <%= request.getParameter("msg") %> <!-- (login_r)에서 파라미터로 보내줬으니까 파라미터로 받기 -->

<%-- <%= session.getAttribute("msg") %> --%>

<form action="login_r.jsp" method="post">
ID<input type="text" name="id"><br>
PW<input type="text" name="pw">
<input type="submit" value="Login">
</form></div>
</body>
</html>