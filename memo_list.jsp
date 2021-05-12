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
<%
	String url = "jdbc:mysql://localhost/world?characterEncoding=UTF-8&serverTimezone=UTC"; 
	String user = "root"; 
	String passwd = "537200218"; 
	Connection con = null;
	String sql = "select * from oneline";
	PreparedStatement pstmt = null;
	
	Class.forName("com.mysql.jdbc.Driver");	
	con = DriverManager.getConnection(url, user, passwd); 
	
	pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery(); //select
%>
<div id="container">
	<header>
		<div>
			<h1>My Memo</h1>
		</div>
	</header>
	<main>
		<form method="post" action="">
			<div class="int-area">
				<h2>메모할 내용을 <br>입력해 보세요.</h2>
				<label class="box1">입력</label>
				<input type="text" name="memo">
			</div>
			<div class="button">
				<input type="submit" value="등록">
			</div>
			<%while(rs.next()) {
				int no = rs.getInt(1);
				String memo = rs.getString("memo");
				String wdate = rs.getString(3);
				
				out.print("<p>"+ no + ": " + memo + ": (" + wdate + ")</p><br>");
				
			} 
			rs.close();
			pstmt.close();
			con.close();
			%>
		</form>			
	</main>
</div>
</body>
</html>