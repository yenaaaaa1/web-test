<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="/menu/menu-insert-ok.jsp" method="POST">
	메뉴명 : <input type="text" name="miName"><br>
	가격 : <input type="text" name="miPrice"><br>
	설명 : <textarea name="miDesc"></textarea><br>
	<button>메뉴등록</button>
</form>

</body>
</html>