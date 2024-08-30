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
String uiNum = request.getParameter("uiNum");
Connection con = DBCon.getCon();
String sql = "SELECT UI_NUM, UI_NAME, UI_ID, UI_PWD,\n"
			+ "UI_GENDER, STR_TO_DATE(UI_BIRTH,'%Y%m%d') AS UI_BIRTH, UI_HOBBY, UI_DESC,\n" 
			+ "CREDAT, CRETIM\n"
			+ "FROM user_info WHERE UI_NUM=?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, uiNum);
ResultSet rs = ps.executeQuery();

if(rs.next()){

%>
<form method="POST" action="/user2/user-update-ok.jsp">
	<input type="hidden" name="uiNum" value="<%=uiNum%>"></input>
	 <label for="uiName" >이름 : </label>
		<input type="text" name="uiName" id="uiName" value="<%=rs.getString("UI_NAME")%>"><br>
	 <br>
	 <label for="uiId">아이디 : </label>
 		<input type="text" name="uiId" id="uiId" value="<%=rs.getString("UI_ID")%>"><br>
	 <br>
	 <label for="uiPwd">비밀번호 : </label>
	 	<input type="password" name="uiPwd" id="uiPwd"><br>
	 	성별 : 
	 	<label for="male">남</label>
	 	<input type="radio" name="uiGender" id="male" value="1" <%=rs.getString("UI_GENDER").equals("1")?"checked":""%>>
	 	<label for="female">여</label>
	 	<input type="radio" name="uiGender" id="female" value="2" <%=rs.getString("UI_GENDER").equals("2")?"checked":""%>><br>
	 <label for="uiBirth">생일 : </label>
	 	<input type="date" name="uiBirth" id="uiBirth" value="<%=rs.getString("UI_BIRTH")%>">
	 <br>
	 <label for="uiHobby">취미 : </label>
	 	<label for="h1">자전거</label>
	    <input type="checkbox" name="uiHobby" value="자전거" id="h1" <%=rs.getString("UI_HOBBY").indexOf("자전거")!=-1?"checked":""%>>
	    <label for="h2">영화</label>
	    <input type="checkbox" name="uiHobby" value="영화" id="h2" <%=rs.getString("UI_HOBBY").indexOf("영화")!=-1?"checked":""%>>
	    <label for="h3">드라이브</label>
	    <input type="checkbox" name="uiHobby" value="드라이브" id="h3" <%=rs.getString("UI_HOBBY").indexOf("드라이브")!=-1?"checked":""%>>
	 <br>
	 <label for="uiDesc">자기소개 : </label>
	 	<textarea name="uiDesc" id="uiDesc"><%=rs.getString("UI_DESC")%></textarea>
	 <br>
	 <button>수정</button>
</form>
<%
}
%>
</body>
</html>