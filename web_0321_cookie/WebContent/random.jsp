<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function go() {
	var num=Math.floor(Math.random()*7+1);
	
	alert(num);
}
</script>
</head>
<body>

<input type="button" onclick="go()" value="조추첨">
</body>
</html>