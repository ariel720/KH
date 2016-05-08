<%@page import="util.MbDTO"%>
<%@page import="util.NtDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

table{

border-spacing: 0px;
border-collapse: collapse;
width: 800px;

}

table td {
	border-bottom: 1px solid gray;
	color: gray;
	text-align: center;
}


#d1{
float: left;
width: 100px;


}


#d2,#d3 {
float: right;
width: 100px;

}

</style>

</head>
<body>
<jsp:useBean id="ndto" class="util.NtDTO"></jsp:useBean>
<jsp:setProperty property="*" name="ndto"/>

<%NtDAO ndao =new NtDAO();
ndto=ndao.getcont(ndto);
%>
<table>

<tr><td><div id="d1"><%=ndto.getWriter() %></div><div id="d2"><%=ndto.getReg_date() %></div><div id="d3"><%=ndto.getCounts() %></div></td></tr>
<tr><td><%=ndto.getTitle() %></td></tr>
<tr><td><%=ndto.getContents() %></td></tr>

</table>

<% MbDTO mb = (MbDTO)session.getAttribute("mb");
if(mb !=null && mb.getId().equals("admin")){%>
	
	<input type="button" value="수정" id="update" onclick="go(this)">
	<input type="button" value="삭제" id="delete" onclick="go(this)">
<%}%>

<script type="text/javascript">
function go(path) {
	location.href=path.id+".jsp?num="+<%=ndto.getNum() %>;
}
</script>
</body>
</html>