<%@page import="util.MbDAO"%>
<%@page import="util.MbDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="mb" class="util.MbDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mb"/>

<%
request.setCharacterEncoding("UTF-8");

MbDAO mbdao=new MbDAO();
mb=mbdao.login(mb);
if(mb != null){	
session.setAttribute("mb", mb);
response.sendRedirect("../index.jsp");	

}else{ 	%>

 <jsp:forward page="form.jsp">
	<jsp:param value="ID나 PW를 다시 확인해주세요" name="msg"/>
</jsp:forward>

<!-- 파라미터를 보내줬으니까 (form에서)받을때도 get파라미터로 받기 -->
<%
} %>
<!-- /* String msg="다시확인하세요";

session.setAttribute("msg", msg);
response.sendRedirect("form.jsp"); */ -->
	
	
</body>
</html>