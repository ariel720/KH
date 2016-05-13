<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

table,td {
	border: 1px solid gray;
	border-spacing: 0px;
	border-collapse: collapse;
	width: 600px;
	font-size: large;
	text-align: center;
}

</style>
</head>
<body>

	<table>
		<tr>
			<td>팀</td>
			<td>이름</td>
			<td>등급</td>
		</tr>

		<c:forEach items="${al }" var="i" step="1">
<tr>
			<td>${i.team }</td>
			<td>${i.name }</td>
			<td>${i.grade }</td>
		</tr>


		</c:forEach>



	</table>


</body>
</html>