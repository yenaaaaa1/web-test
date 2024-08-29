<%@page import="java.sql.PreparedStatement"%>
<%@page import="test.web.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
String miNum = request.getParameter("miNum");

Connection con = DBCon.getCon();

String sql = "DELETE FROM MENU_INFO WHERE MI_NUM=?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,miNum);



int result = ps.executeUpdate();
if(result == 1){
%>
	<script>
		alert('삭제 완료');
		location.href='/menu/menu-list.jsp';
	</script>
<%
}
%>

