<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>쿠키만들기</h2>
<%
Cookie c=new Cookie("aoa","choa");
response.addCookie(c); //response : 서버->클라이언트   
//일단 현재 클라이언트가 서버에 처음 접근하면서 Session아이디를 받아 쿠키에 저장되어있는 상태이므로 새로 만든 쿠키는 두번째부터 들어감.(1번 배열에 들어감)

c.setMaxAge(60);  //(시간) : 초단위 
%>

<a href="../index.jsp">메인가기</a>

</body>
</html>