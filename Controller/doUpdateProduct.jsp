<%@include file ="../Connection/connect.jsp"%>
<%	
	String id = request.getParameter("txtId");
	String name = request.getParameter("txtName");
	String price = request.getParameter("txtPrice");
	String weight = request.getParameter("txtWeight");
	String stock = request.getParameter("txtStock");
	String image = request.getParameter("txtImage");

	String query="update msproduct set name = '"+name+"' , price = "+price+" , weight = "+weight+" , stock = "+stock+" ,image = '"+image+"' where productid = "+id;
	st.executeUpdate(query);
	response.sendRedirect("../product.jsp");
%>