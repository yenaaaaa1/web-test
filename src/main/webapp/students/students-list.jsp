<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>




<table border="1">
	<tr>
		<th>이름</th>
		<th>생년월일</th>
		<th>학년</th>
		<th>연락처</th>
		<th>주소</th>
		<th>Email</th>
	</tr>
	
</table>

<button onclick="goSchoolInsert()">등록</button>

<script>
	function goSchoolInsert(){
		location.href='/students/students-insert.jsp';
	}
</script>

</body>
</html>