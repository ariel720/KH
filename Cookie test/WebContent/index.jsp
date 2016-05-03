<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%Cookie [] cs=request.getCookies(); 
//쿠키안에 몇개의 정보가 있는지 모르니까 배열로 가져오기
String id="";

for(int i=0;i<cs.length;i++){
	
	if(cs[i].getName().equals("id")){ //키값이 id인것을 찾아
		id=cs[i].getValue(); //그것의 value를 가져와 변수에 담아라.
		break;
	}	
}
%>

<form action="test.jsp">
id<input type="text" name="id" value="<%=id%>">
pw<input type="text" name="pw">
<input type="submit" >
</form>


</body>
</html>