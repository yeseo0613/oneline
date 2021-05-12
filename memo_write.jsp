<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="memo.css">
</head>
<body>
<div id="container">
	<header>
		<div>
			<h1>My Memo</h1>
		</div>
	</header>
	<main>
		<form method="post" action="memo_list.jsp">
			<div class="int-area">
				<h2>메모 등록 완료</h2>
			</div>
			<div class="submit">
				<input type="submit" value="보기">
			</div>
		</form>			
	</main>
</div>
<%
	request.setCharacterEncoding("UTF-8");
	String memo = request.getParameter("memo");

	String url = "jdbc:mysql://localhost/world?characterEncoding=UTF-8&serverTimezone=UTC"; 
	String user = "root"; 
	String passwd = "537200218"; 
	Connection con = null;
	String sql = "insert into oneline(memo) values( ? )";
	PreparedStatement pstmt = null;
	
	Class.forName("com.mysql.jdbc.Driver");	
	con = DriverManager.getConnection(url, user, passwd); 
	
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, memo);
	pstmt.executeUpdate();
	pstmt.close();
	con.close();
%>
</body>
</html>