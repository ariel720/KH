<%@page import="util.freeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
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
int p_ref=fb.getNum();//나 객체 안에있는 부모의 번호를 헷갈리지않게 꺼내요.

freeDAO fdao= new freeDAO();
int result=fdao.setreply(fb,p_ref); //매개변수로 나 객체(새로운 내용들),부모의 번호를 보내자.
if(result>0){
	response.sendRedirect("list.jsp?cp=1");
}else{ %>

<script type="text/javascript">
alert("저장실패");
history.go(-1);
</script>
<%} %>
</body>
</html>