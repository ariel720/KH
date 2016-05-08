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
	
	border: 1px solid gray;
	border-spacing: 0px;
	border-collapse: collapse;
	
}

table td {
	border: 1px solid gray;
	width: 1000px;
}

td:FIRST-CHILD {
	width: 100px;
	text-align: center;
}

input[type=text] { /* input중에[type이 text인것] */
	width: 550px;
}

</style>
</head>
<body>
<form action="write_r.jsp">
<table>

<tr><td>작성자</td><td><input type="text" name="id" readonly="readonly" value="<%=((MbDTO)session.getAttribute("mb")).getId()%>"></td></tr>
<tr><td>제목</td><td><input type="text" name="title"></td></tr>
<tr><td>내용</td><td><textarea id="d1" rows="20" cols="75" name="contents"></textarea></td></tr>
<tr><td colspan="2"><input type="submit" value="확인"><input type="reset" value="초기화"></td></tr>
</table>

</form>



</body>
</html>