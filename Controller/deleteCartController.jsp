<%@include file="../Connection/connect.jsp"%>
<%@page import="java.util.ArrayList" %>

<%
	String cartid = request.getParameter("id");
	String query = "delete from mscart where cartid = " + cartid;
	st.executeUpdate(query);
	response.sendRedirect("../cart.jsp?errMsg=Success to delete the cart");
%>