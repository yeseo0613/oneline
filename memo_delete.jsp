<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no");
	String url = "jdbc:mysql://localhost/world?characterEncoding=UTF-8&serverTimezone=UTC"; 
	String user = "root"; 
	String passwd = "537200218"; 
	Connection con = null;
	String sql = "delete from oneline where no=("+ no +")";
	PreparedStatement pstmt = null;
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection(url, user, passwd); 
	
	pstmt = con.prepareStatement(sql);
	pstmt.executeUpdate();
	
	pstmt.close();
	con.close();
	out.println("데이터 삭제 성공");
	response.sendRedirect("memo_list.jsp");
%>
</body>
</html>