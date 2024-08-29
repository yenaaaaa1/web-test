<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
String miNum = request.getParameter("miNum"); 
Connection con = DBCon.getCon(); 
String sql = "SELECT MI_NUM, MI_NAME, MI_PRICE, MI_DESC FROM MENU_INFO WHERE MI_NUM=?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,miNum);

// 1. statement 객체 더이상 사용 금지 ( preparedStatement로 대체)
// 2. executeQuery() 이걸 호출
ResultSet rs = ps.executeQuery();

if(rs.next()){
%>
<form action="/menu/menu-update-ok.jsp" method="POST" id="frm">
	메뉴명 : <input type="text" name="miName" value="<%=rs.getString("MI_NAME") %>"><br>
	가격 : <input type="text" name="miPrice" value="<%=rs.getString("MI_PRICE") %>"><br>
	설명 : <textarea name="uiDesc"><%=rs.getString("MI_DESC") %></textarea><br>
	<input type="hidden" name="miNum" value="<%=rs.getString("MI_NUM") %>">
	<button>메뉴 수정</button>
	<button onclick="deleteMenu()">삭제</button>
</form> 

<script>
	function deleteMenu(){
		const frm = document.querySelector('#frm');
		frm.action = '/menu/menu-delete-ok.jsp';
		frm.submit();
	}
</script>
<%
}else{
%>
이미 삭제된 데이터입니다.<br>
<a href="/menu/menu-list.jsp">메뉴리스트</a>
<% 
}
%>



</body>
</html>