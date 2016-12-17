<%@include file ="../Connection/connect.jsp"%>
<%	
	String commentid = request.getParameter("txtCommentId");
	String content = request.getParameter("txtContent");
	String rating = request.getParameter("ddlRating");

	String query="update mscomment set content = '"+content+"' , star = "+rating+" where commentid = "+commentid;
	System.out.println(query);
	st.executeUpdate(query);
	response.sendRedirect("../product.jsp");
%>