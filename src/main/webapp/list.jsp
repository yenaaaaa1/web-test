<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
List<String> list = new ArrayList<String>();
list.add("홍길동");
list.add("임꺽정");
list.add("유관순");
list.add("이순신");

for(int i=0; i<list.size(); i++){
	out.println(list.get(i) + "<br>");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%=list %>
</body>
</html>