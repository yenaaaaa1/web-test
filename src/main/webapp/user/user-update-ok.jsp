<%@page import="test.web.common.DBCon"%>
<%@page import="java.sql.Statement"%>
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
	String uiNum = request.getParameter("uiNum");
	String uiId = request.getParameter("uiId");
	String uiPwd = request.getParameter("uiPwd");
	String uiName = request.getParameter("uiName");
	
	Connection con = DBCon.getCon();
	Statement stmt = con.createStatement();
	
	String sql = "UPDATE USER_INFO\r\n"
			+ "SET UI_NAME='" + uiName + "',\r\n"
			+ "UI_ID= '" + uiId + "',\r\n"
			+ "UI_PWD='" + uiPwd + "',\r\n"
			+ "WHERE UI_NUM" + uiNum;
	
	int result = stmt.executeUpdate(sql);
	
	if(result==1){
%>
<script>
	alert('정상적으로 업데이트 되었습니다.');
	location.href = '/user/user-view.jsp?uiNum=<%=uiNum%>';
</script>
<%
	}else{
%>
<script>
	alert('오류가 발생하였습니다.');
	location.href = '/user/user-view.jsp?uiNum=<%=uiNum%>';
</script>
<% 
	}
%>

	

</body>
</html>