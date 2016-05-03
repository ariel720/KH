<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page errorPage="error.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>
<%
Cookie []c=request.getCookies();

for(int i=0;i<c.length;i++ ){%>
	
	Cookie name=<%=c[i].getName() %>
	Cookie value=<%=c[i].getValue() %>
<%}%>
<!-- 
아용 아이디, 비밀번호 저장,(로그인 유지) 11번가(관심상품 목록) 등에 이용됨. -->
</h2>

</body>
</html>