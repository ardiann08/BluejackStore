<%@include file="../Connection/connect.jsp"%>
<%@page import="java.util.ArrayList" %>

<%
	String transactionid = request.getParameter("id");
	String query = "update trtransaction set status = 2 where transactionid = " + transactionid;
	st.executeUpdate(query);
	response.sendRedirect("../transactionadmin.jsp");
%>