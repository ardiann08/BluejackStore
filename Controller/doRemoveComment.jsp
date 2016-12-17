<%@include file ="/Connection/connect.jsp"%>
<%
	String query ="delete from mscomment where commentid = "+request.getParameter("id");
	st.executeUpdate(query);
	
%>