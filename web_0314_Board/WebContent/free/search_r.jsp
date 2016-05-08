<%@page import="java.util.Hashtable"%>
<%@page import="util.freeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="util.freeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
width:800px;
border: 1px solid gray;	
border-spacing: 0px;
border-collapse: collapse;
}

table td{
border-bottom: 1px solid gray;	
text-align: center;
}

</style>
</head>
<%
freeDAO fdao=new freeDAO();
String s=request.getParameter("search");
String s2=request.getParameter("select");

ArrayList<freeDTO> al=fdao.search(s,s2);
%>
<table><tr>
			<td>글번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td></tr>

		<%for (int i = 0; i < al.size(); i++) {%>
		<tr><td><%=al.get(i).getNum()%></td>
			<td><a href="view.jsp?num=<%=al.get(i).getNum()%>"><%=al.get(i).getTitle()%></a></td>
			<td><%=al.get(i).getId()%></td>
			<td><%=al.get(i).getReg_date()%></td>
			<td><%=al.get(i).getCounts()%></td>
		</tr><%}%>
	</table>



<body>

</body>
</html>