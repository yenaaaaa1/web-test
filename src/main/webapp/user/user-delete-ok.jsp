<%@page import="test.web.common.DBCon"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String uiNum = request.getParameter("uiNum");
Connection con = DBCon.getCon();
Statement stmt = con.createStatement();
String sql = "DELETE FROM USER_INFO WHERE UI_NUM="+ uiNum;

int result = stmt.executeUpdate(sql);
if(result == 1){
%>
	<script>
		alert('삭제완료');
		location.href='/user/user-list.jsp';
	</script>
	<%
}else{
	%>

<script>
		alert('이미 삭제된 유저입니다.');
		location.href='/user/user-list.jsp';
</script>
<% 
}
%>

