<%@page import="java.util.Hashtable"%>
<%@page import="util.freeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="util.freeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%int cp = Integer.parseInt(request.getParameter("cp"));%>
		
		<form action="search_r.jsp">
		
		검색<input type="text" name="search"><input type="submit" value="search">
		
		<select name="select">
		<option value="id">writer</option>
		<option value="title">title</option>
		<option value="contents">contents</option>  
		       <!--  select,search 두개의 값이 파라미터가 되어 search_r.jsp로 넘어간다. -->
		</select>
		
		</form>
		
		
	<%freeDAO fdao = new freeDAO();
		ArrayList<freeDTO> al = fdao.getconts(cp);%>
		
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
	
<% Hashtable<String, Integer> hs=fdao.pageing(cp);

if(hs.get("curblock")-1>0){ %>
<a href="list.jsp?cp=<%=hs.get("spage")-1 %>">[이전]</a>
<%} %>

<%for(int i=hs.get("spage");i<=hs.get("epage");i++){%>

<a href="list.jsp?cp=<%=i %>"><%=i %></a><%} %>

<%if(hs.get("curblock") != hs.get("totalblock")){ %>
<a href="list.jsp?cp=<%=hs.get("epage")+1 %>">[다음]</a>
<%} %>

	<%if (session.getAttribute("mb") != null) {%>
	<input type="button" value="write" onclick="go()">
	<script type="text/javascript">
		function go() {
			location.href = "write.jsp";
		}
	</script><%}%>
</body>
</html>