<%@page import="util.NtDAO"%>
<%@page import="util.MbDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
div {
	width: 800px;
	margin: 0 auto;
}

table {
	border: 1px solid gray;
	border-spacing: 0px;
	border-collapse: collapse;
}

table td {
	border: 1px solid gray;
	width: 600px;
}

td:FIRST-CHILD {
	width: 100px;
	text-align: center;
}

input[type=text] { /* input중에[type이 text인것] */
	width: 550px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	MbDTO mb = (MbDTO) session.getAttribute("mb");
	if (mb == null || !mb.getId().equals("admin")) {
%>
<!-- 로그인이 필요한 페이지에는 꼭 이렇게 앞에서 접근불가능한 사람을 걸러줘야함 -->
<script type="text/javascript">
	alert("잘못된 접근입니다.");
	location.href = "../index.jsp";
</script>
<%}%>
</head>
<body>
	<jsp:useBean id="ndto" class="util.NtDTO"></jsp:useBean>
	<jsp:setProperty property="*" name="ndto" />

	<%
		NtDAO ndao = new NtDAO();
		ndto = ndao.getcont(ndto);
	%>
	<div>
		<form action="update_r.jsp" method="post">
			<table>

				<tr>
					<td>작성자</td>
					<td><input type="text" name="writer" readonly="readonly" value="<%=ndto.getWriter()%>">
						<input type="hidden" name="num" value="<%=ndto.getNum()%>">
						
						
						</td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="title"
						value="<%=ndto.getTitle()%>"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea rows="20" cols="75" name="contents"><%=ndto.getContents()%></textarea></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="수정확인"><input
						type="reset" value="다시쓰기"></td>
				</tr>
			</table>

		</form>
	</div>

</body>
</html>