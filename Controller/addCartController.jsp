<%@include file="../Connection/connect.jsp"%>
<%@page import="java.util.ArrayList" %>

<%
	ArrayList userSession = (ArrayList)session.getAttribute("userSession");
	String productid = request.getParameter("txtProductid");
	Integer quantity = Integer.parseInt(request.getParameter("txtQty"));

	String query = "select price from msproduct where productid = " + productid;
	ResultSet rs = st.executeQuery(query);
	if(rs.next()){
		Integer price = Integer.parseInt(rs.getString(1));

		query = "insert into mscart values(null, "+ userSession.get(0) +", "+ productid +", "+ quantity +", "+ (quantity*price) +")";
		st.executeUpdate(query);
		response.sendRedirect("../product.jsp?errMsg=Success add to Cart");
	}else{
		response.sendRedirect("../product.jsp?errMsg=Product id not valid");
	}
%>