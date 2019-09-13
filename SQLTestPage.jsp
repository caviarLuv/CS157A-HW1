<%@ page language="java" contentType="text/html; charset= UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<html>
<head>
<title>JDBC Connection example</title>
</head>
<body>
<h1>JDBC Connection example</h1>
<%
//String db = request.getParameter("cs157a");
String db = "cs157a";
String user = "root"; // assumes database name is the same as username
try {
java.sql.Connection con;
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost/"+db+ "?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", user, "tree8018");
out.println (db+ " database successfully opened.");

Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery("select * from cs157a.emp");
while(rs.next())
	out.println("<br>"+rs.getInt(1)+" "+rs.getString(2)+" "+rs.getInt(3));

con.close();

}
catch(SQLException e) {
out.println("SQLException caught: " +e.getMessage());
}
%>
</body>
</html> 