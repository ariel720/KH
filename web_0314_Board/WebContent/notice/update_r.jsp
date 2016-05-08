<%@page import="util.NtDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="ndto" class="util.NtDTO"></jsp:useBean>
<jsp:setProperty property="*" name="ndto"/>

<%

NtDAO ndao=new NtDAO();
int result=ndao.update(ndto);

if(result>0){%>

<script type="text/javascript">
alert("수정완료");
location.href="list.jsp"
</script>

<%}else{ %>

<script type="text/javascript">
alert("수정실패");
history.go(-1);
</script>

<%} %>
</body>
</html>