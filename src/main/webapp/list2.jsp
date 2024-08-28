<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
List<Map<String, String>> boards = new ArrayList<>();

Map<String, String> board = new HashMap<>();
board.put("num", "1");
board.put("title", "안녕 첫번째 게시물이야");
board.put("writer", "홍길동");

boards.add(board);

board = new HashMap<>();
board.put("num", "2");
board.put("title", "안녕 두번째 게시물이야");
board.put("writer", "임길동");

boards.add(board);

board = new HashMap<>();
board.put("num", "3");
board.put("title", "여보세요");
board.put("writer", "임창정");

boards.add(board);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>글쓴이</th>
		</tr>
<% 
		for(int i=0; i<board.size();i++){
			Map<String, String> b = boards.get(i);
			out.println("<tr>");
			out.println("<td>" + b.get("num") + "</td>");
			out.println("<td>" + b.get("title") + "</td>");
			out.println("<td>" + b.get("writer") + "</td>");
			out.println("</tr>");
		}
%>
		
		
	</table>
</body>
</html>