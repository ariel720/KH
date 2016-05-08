<%@page import="util.NtDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="util.NtDAO"%>
<%@page import="util.MbDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	width: 500px; border : 1px gray solid;
	border-collapse: collapse;
	border-spacing: 0px;
	border: 1px gray solid;
}

table td {
	border: 1px gray solid;
	text-align: center;
}

td:FIRST-CHILD {
	width: 100px;
}
</style>
</head>
<body>
	<%
		if (session.getAttribute("mb") != null) {
	%>
	<%=((MbDTO) session.getAttribute("mb")).getName()%>님 환영합니다.
	<a href="./login/logout.jsp">로그아웃</a>

	<%
		} else {
	%>
	<a href="./login/form.jsp">로그인</a>

	<%
		}
	%>
	<a href="./notice/list.jsp?cp=1">공지사항</a>
	<a href="./free/list.jsp?cp=1">자유게시판</a>
	<a href="./gallery/list.jsp?cp=1">갤러리</a>
	<%
		NtDAO ndao = new NtDAO();
		ArrayList<NtDTO> al = ndao.getconts2();
	%>

	<div>
		<table>
			<tr>
				<td>번호</td>
				<td>제목</td>
			</tr>
			<%
				for (int i = 0; i < al.size(); i++) {
			%>

			<tr>
				<td><%=al.get(i).getNum()%></td>
				<td><a href="Vbook/view.jsp?num=<%=al.get(i).getNum()%>"><%=al.get(i).getTitle()%></a></td>
			</tr>
			<%
				}
			%>
		</table>

	</div>

</body>
</html>