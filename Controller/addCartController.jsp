<%@include file="../Connection/connect.jsp"%>
<%@page import="java.util.ArrayList" %>

<%
	ArrayList userSession = (ArrayList)session.getAttribute("userSession");
	String productid = request.getParameter("txtProductid");
	String quantity = request.getParameter("txtQty");

	








%>