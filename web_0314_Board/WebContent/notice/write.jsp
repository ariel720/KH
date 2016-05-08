<%@page import="util.MbDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script type="text/javascript">
window.onload=function(){ //이름이 없는 익명함수: 한번쓰고 안쓰임.

CKEDITOR.replace('d1');
}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
if(session.getAttribute("mb")==null){
	/* response.sendRedirect("../index.jsp"); */
%>
<script type="text/javascript">
alert("로그인하세요.");
location.href="../index.jsp";
</script>

<% }else{
	if(!((MbDTO)session.getAttribute("mb")).getId().equals("admin")){
		%>
		<script type="text/javascript">
		alert("관리자가 아닙니다.");
		location.href="../index.jsp";
		</script>
			<%
	}
}
%>
<style type="text/css">

div{
width:1000px;
margin: 0 auto;
}

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

<div>
<form action="write_r.jsp" method="post">
<table>

<tr><td>작성자</td><td><input type="text" name="writer" readonly="readonly" value="<%=((MbDTO)session.getAttribute("mb")).getId()%>"></td></tr>
<tr><td>제목</td><td><input type="text" name="title"></td></tr>
<tr><td>내용</td><td><textarea id="d1" rows="20" cols="75" name="contents"></textarea></td></tr>
<tr><td colspan="2"><input type="submit" value="확인"><input type="reset" value="초기화"></td></tr>
</table>

</form>
</div>

</body>
</html>