<%@page import="util.freeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<jsp:useBean id="fb" class="util.freeDTO"></jsp:useBean>
<jsp:setProperty property="*" name="fb"/>
<body>
<%
freeDAO fdao= new freeDAO();
int result=fdao.delete(fb);

if(result>0){
response.sendRedirect("list.jsp?cp=1");
	
}else{%>

<script type="text/javascript">
alert("삭제실패");
location.href="list.jsp?cp=1";
</script>

<%} %>
</body>
</html>