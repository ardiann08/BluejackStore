<%@include file ="/Connection/connect.jsp"%>
<%
	String query ="delete from msproduct where productid = "+request.getParameter("id");
	st.executeUpdate(query);
	
%>