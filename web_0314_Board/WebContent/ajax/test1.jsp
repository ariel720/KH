<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(function () {
	$("#d1").blur(function () {
		var id=$(this).val();
		$.ajax({url : "test1_r.jsp",type : "GET",data : { id : "test"},success : function (result) {$("#d1").html(result);}});
	});
});

</script>
</head>
<body>

<input type="text" id="id">
<input type="submit" >
<div id="d1"></div>





</body>
</html>