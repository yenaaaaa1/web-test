<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="/students/students-insert-ok.jsp" method="POST">
	이름 : <input type="text" name="miName"><br>
	생년월일 : <input type="date" name="miDate"><br>
	학년 : <input type="text" name="miSchoolYear"><br>
	연락처 : <input type="text" name="miPhNum"><br>
	주소 : <textarea name="miAdress"></textarea><br>
	Email : <input type="text" name="miEmail"><br>
	<button>등록</button>
</form>

</body>
</html>