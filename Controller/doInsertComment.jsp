<%@include file ="/Connection/connect.jsp"%>

<%	
	String userid = request.getParameter("txtUserId");
	String productid = request.getParameter("txtProductId");
	String content = request.getParameter("txtContent");
	String rating = request.getParameter("ddlRating");


	String query = "insert into mscomment values(NULL,"+userid+","+productid+",'"+content+"',"+rating+")";
	st.executeUpdate(query);
	response.sendRedirect("../product.jsp");
%>