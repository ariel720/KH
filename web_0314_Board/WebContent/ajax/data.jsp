<%@page import="util.MbDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String id=request.getParameter("id");

MbDAO dao=new MbDAO();
String msg=dao.idcheck(id);



%>

<%=msg %>
