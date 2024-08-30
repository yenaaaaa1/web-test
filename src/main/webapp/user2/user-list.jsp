<%@page import="java.sql.PreparedStatement"%>
<%@page import="test.web.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
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
String uiName = request.getParameter("uiName") == null ? "" : request.getParameter("uiName");
String uiGender = request.getParameter("uiGender") == null ? "" : request.getParameter("uiGender");
%>
<form>
	<select name="uiGender">
		<option value="">선택</option>
		<option value="1" <%=uiGender.equals("1") ?"selected" : "" %>>남자</option>
		<option value="2" <%=uiGender.equals("2") ?"selected" : "" %>>여자</option>
	</select>
	<input type="text" name="uiName" value="<%=uiName%>" placeholder="이름"><button>검색</button>
</form>

<table border="1">
	<tr>
		<th>이름</th>
		<th>아이디</th>
		<th>비밀번호</th>
		<th>성별</th>
		<th>생일</th>
		<th>취미</th>
		<th>자기소개</th>
		<th>삭제</th>
	</tr>
<%
Connection con = DBCon.getCon();
String sql = "SELECT UI_NUM, UI_NAME, UI_ID, UI_PWD, UI_GENDER, UI_BIRTH, UI_HOBBY, UI_DESC FROM USER_INFO";
if(!uiName.equals("")){
	sql += " WHERE UI_NAME LIKE ?";
	if(!uiGender.equals("")){
		sql += " AND UI_GENDER = ?";
	}
}else if(!uiGender.equals("")){
	sql += " WHERE UI_GENDER = ?";
}

PreparedStatement ps = con.prepareStatement(sql);

if(!uiName.equals("")){
	ps.setString(1, "%" + uiName + "%");
	if(!uiGender.equals("")){
		ps.setString(2, "%" + uiGender + "%");
	}
}else if(!uiGender.equals("")){
	ps.setString(2, "%" + uiGender + "%");
}

ResultSet rs = ps.executeQuery();

while(rs.next()){	
%>
	<tr style="cursor:pointer" 
	onclick="goPage(event, this, <%=rs.getString("UI_NUM") %>)" 
	onmouseover="this.style.backgroundColor='gray'" 
	onmouseout="this.style.backgroundColor=''">
		<th>
			<a href="/user2/user-view.jsp?uiNum=<%=rs.getString("UI_NUM") %>"><%=rs.getString("UI_NAME") %></a>
		</th>
		<th><%=rs.getString("UI_ID") %></th>
		<th><%=rs.getString("UI_PWD") %></th>
		<th><%=rs.getString("UI_GENDER").equals("1") ? "남자" : "여자" %></th>
		<th><%=rs.getString("UI_BIRTH") %></th>
		<th><%=rs.getString("UI_HOBBY") %></th>
		<th><%=rs.getString("UI_DESC") %></th>
		<th><button>삭제</button></th>
	</tr>
<% 
}
%>
	
</table>

<script>
	function goPage(evt, obj){
		if(evt.target.tagName==='BUTTON'){
			return;
		}
		location.href='/user2/user-view.jsp?uiNum=' + uiNum;
	}
</script>

<br>

<button onclick="goMenu2Insert()">회원가입</button>

<script>
	function goMenu2Insert(){
		location.href='/user2/user-insert.jsp';
	}
</script>

</body>
</html>