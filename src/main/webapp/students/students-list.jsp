<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="test.web.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
String miName = request.getParameter("uiName") == null ? "" : request.getParameter("uiName");
%>
<table border="1">
	<tr>
		<th>번호</th>
		<th>이름</th>
		<th>생년월일</th>
		<th>학년</th>
		<th>연락처</th>
		<th>주소</th>
		<th>Email</th>
	</tr>
	
<%
Connection con = DBCon.getCon();
String sql = "SELECT MI_NUM, MI_NAME, MI_DATE, MI_SCHOOLYEAR, MI_PHNUM, MI_ADRESS, MI_EMAIL FROM STUDENTS_INFO";
PreparedStatement ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery();

while(rs.next()){	
%>
<tr>
	<th><%=rs.getString("MI_NUM") %></th>
	<th>
		<a href="/students/students-view.jsp?miNum=<%=rs.getString("MI_NUM") %>"><%=rs.getString("MI_NAME") %></a>
	</th>
	<th><%=rs.getString("MI_DATE") %></th>
	<th><%=rs.getString("MI_SCHOOLYEAR") %></th>
	<th><%=rs.getString("MI_PHNUM") %></th>
	<th><%=rs.getString("MI_ADRESS") %></th>
	<th><%=rs.getString("MI_EMAIL") %></th>
</tr>
<% 
}
%>
	
</table>

<button onclick="goSchoolInsert()">등록</button>

<script>
	function goSchoolInsert(){
		location.href='/students/students-insert.jsp';
	}
</script>

</body>
</html>