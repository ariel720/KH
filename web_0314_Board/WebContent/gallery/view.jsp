<%@page import="util.MbDTO"%>
<%@page import="util.gDAO"%>
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
<jsp:useBean id="gdto" class="util.gDTO"></jsp:useBean>
<jsp:setProperty property="*" name="gdto"/>
<%
gDAO gdao=new gDAO();
gdto=gdao.getgall(gdto);

%>

<table>
<tr><td><div id="d1"><%=gdto.getId() %></div><div id="d2"><%=gdto.getReg_date() %></div>
    <div id="d3"><%=gdto.getCounts() %></div></td></tr>
<tr><td><%=gdto.getTitle() %></td></tr>
<tr><td><img src="files/<%=gdto.getFile1()%>"><br><img src="files/<%=gdto.getFile2()%>"></td></tr>
</table>
<%if(session.getAttribute("mb") !=null){ %>
<input type="button" value="reply" onclick="go(this)">
<%} 
MbDTO mb=(MbDTO)session.getAttribute("mb");

if(gdto.getId().equals(mb.getId())){
%>
<input type="button" value="delete" onclick="go(this)">
<input type="button" value="update" onclick="go(this)">
<%} %>
<script type="text/javascript">
function go(path) {	
	location.href=path.value+".jsp?num="+<%=gdto.getNum()%>;		
	}
</script>
</body>
</html>