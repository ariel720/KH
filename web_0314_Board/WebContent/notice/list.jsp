<%@page import="java.util.Hashtable"%>
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
<body>
	<h2>List</h2>
	<%
	int cp=Integer.parseInt(request.getParameter("cp"));
		NtDAO ndao = new NtDAO();
		ArrayList<NtDTO> al = ndao.getconts3(cp);
		
		Hashtable<String, Integer> hs=ndao.getpage(cp);
	%>
	<table>
		<tr>
			<td>글번호</td><td>제목</td><td>작성자</td><td>작성일</td><td>조회수</td>
		</tr>
<%for(int i=0;i<al.size();i++){ %>
		<tr>
			<td><%=al.get(i).getNum() %></td>
			<td><a href="view.jsp?num=<%=al.get(i).getNum()%>"><%=al.get(i).getTitle() %></a></td>
			<td><%=al.get(i).getWriter() %></td>
			<td><%=al.get(i).getReg_date() %></td>
			<td><%=al.get(i).getCounts() %></td>
		</tr>
<%} %>
	</table>	
	
<div>

<% if(hs.get("curblock")>1){ %>
<a href="list.jsp?cp=<%=hs.get("startpage")-1%>">[preview]</a>
<%} %>

<% for(int i=hs.get("startpage");i<=hs.get("lastpage");i++){%>
<a href="list.jsp?cp=<%=i %>"><%=i %></a><%} %>

<%if(hs.get("curblock") != hs.get("totalblock")){ %>
<a href="list.jsp?cp=<%=hs.get("lastpage")+1%>">[next]</a><%} %>
</div>




	<%
	if(session.getAttribute("mb") !=null){
		if (((MbDTO) session.getAttribute("mb")).getId().equals("admin")) {
	%>
	<input type="button" value="글쓰기" onclick="go()">
	<%
		}}
	%>
<script type="text/javascript">
	function go() {
		location.href = "write.jsp";
	}
</script>
</body>
</html>