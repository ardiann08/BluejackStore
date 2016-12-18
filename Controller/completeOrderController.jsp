<%@include file="../Connection/connect.jsp"%>
<%@page import="java.util.ArrayList" %>

<%
	ArrayList userSession = (ArrayList)session.getAttribute("userSession");

	String query = "select * from mscart where userid = " + userSession.get(0);
	ResultSet rs = st.executeQuery(query);
	Integer finalprice = 0;
	Integer transactionid = 0;
	
	while(rs.next()){
		finalprice += Integer.parseInt(rs.getString(5));
	}	
	rs.beforeFirst();

	query = "insert into trtransaction values(null, "+ userSession.get(0) +", "+ finalprice +", 1, null)";
	stmt.executeUpdate(query);


	query = "SELECT transactionid FROM trtransaction order by transactionid desc limit 1";
	ResultSet rs2 = stmt.executeQuery(query);
	if(rs2.next()){
		transactionid = Integer.parseInt(rs2.getString(1));
	}
	while(rs.next()){
		query = "insert into trdetailtransaction values(null, "+ transactionid +", "+ rs.getString(3) +", "+ rs.getString(4) +", "+ rs.getString(5) +")";
		stmt.executeUpdate(query);
	}	
	query = "delete from mscart where userid = " + userSession.get(0);
	st.executeUpdate(query);
	userSession.set(11, "0");


	response.sendRedirect("../cart.jsp?errMsg=Success to Complete Your Order");


%>