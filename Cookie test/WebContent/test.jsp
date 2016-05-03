<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

String name=request.getParameter("id"); //id라는 이름의 파라미터를 가져와
Cookie c=new Cookie("id",name); //쿠키에 저장
c.setMaxAge(60*60*24); //지속시간저장 (초)
response.addCookie(c); //쿠키 정보가 필요한 페이지로 쿠키를 보내줌.

%>
<a href="index.jsp">index</a>

</body>
</html>