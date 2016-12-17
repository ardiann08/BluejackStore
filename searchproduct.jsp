<%@include file ="Connection/connect.jsp"%>
<%
	response.sendRedirect("product.jsp?search="+request.getParameter("txtsearch"));
%>