<%@page import="util.gDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	width: 800px;
	border: 1px solid gray;
	border-spacing: 0px;
	border-collapse: collapse;
}

table td {
	border-bottom: 1px solid gray;
	text-align: center;
}
</style>
</head>
<body>
	<%
		int cp = Integer.parseInt(request.getParameter("cp"));
	%>

	<table>
		<tr>
			<td>글번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
		
		
		<%
		gDAO gdao=new gDAO();
		
		
		%>
		
		
		
	</table>







	<%
		if (session.getAttribute("mb") != null) {
	%>
	<input type="button" value="write" onclick="go()">
	<script type="text/javascript">
		function go() {
			location.href = "write.jsp";
		}
	<%}%>
		
	</script>
</body>
</html>