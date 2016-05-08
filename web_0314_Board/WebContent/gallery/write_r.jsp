<%@page import="util.gDTO"%>
<%@page import="util.gDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%String upload=application.getRealPath("gallery/files");
int max=1024*1024*10;
String encoding="UTF-8";

MultipartRequest mpr =new MultipartRequest(request,upload,max,encoding, new DefaultFileRenamePolicy());

gDTO gdto=new gDTO();
gdto.setId(mpr.getParameter("id"));
gdto.setTitle(mpr.getParameter("title"));
gdto.setFile1(mpr.getFilesystemName("f1"));
gdto.setFile2(mpr.getFilesystemName("f2"));

gDAO gdao=new gDAO();
int result=gdao.setgall(gdto);

if(result>0){
	response.sendRedirect("list.jsp?cp=1");
}else{
%>
<script type="text/javascript">
alert("저장실패");
location.href="list.jsp?cp=1"
</script> <%} %>
<body></body>
</html>