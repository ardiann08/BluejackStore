<%@ page import="java.sql.*" %>

<%
	//Class yang dipakai untuk mysql
	Class.forName("com.mysql.jdbc.Driver");

	try{
		/* jdbc:mysql://localhost:3306/nama_database, user_name, password  */
		Connection con = DriverManager.getConnection("jdbc:mysql://masterpiece6.lazeon.com:3306/teamsupp_jspproject", "teamsupp_dbuser", "admin123");
		//Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/aperture_shop", "root", "");
		out.print("Success");
		Statement st = con.createStatement();
		Statement stmt = con.createStatement();

	}catch(Exception e){
		e.printStackTrace();
		out.print(e);
	}
	
%>
