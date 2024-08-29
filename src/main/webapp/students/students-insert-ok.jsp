<%@page import="java.sql.PreparedStatement"%>
<%@page import="test.web.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
request.setCharacterEncoding("UTF-8");

String miName = request.getParameter("miName");
String miDate = request.getParameter("miDate");
String miSchoolYear = request.getParameter("miSchoolYear");
String miPhNum = request.getParameter("miPhNum");
String miAdress = request.getParameter("miAdress");
String miEmail = request.getParameter("miEmail");

Connection con = DBCon.getCon();

String sql = "INSERT INTO STUDENTS_INFO(MI_NAME, MI_DATE, MI_SCHOOLYEAR, MI_PHNUM, MI_ADRESS, MI_EMAIL)";
sql += "VALUES(?,?,?,?,?,?)";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, miName);
ps.setString(2, miDate);
ps.setString(3, miSchoolYear);
ps.setString(4, miPhNum);
ps.setString(5, miAdress);
ps.setString(6, miEmail);

int result = ps.executeUpdate();

if(result==1){
%>
<script>
	alert('저장성공!');
	location.href='/menu/menu-list.jsp';
</script>
<% 
}
%>
