<%@include file="../Connection/connect.jsp"%>
<%@page import="java.util.ArrayList" %>

<%
	ArrayList userSession = (ArrayList)session.getAttribute("userSession");
	String productid = request.getParameter("txtProductid");
	Integer quantity = Integer.parseInt(request.getParameter("txtQty"));

	String query = "select price from msproduct where productid = " + productid;
	ResultSet rs = st.executeQuery(query);
	if(rs.next()){

		query = "select * from mscart where productid = " + productid;
		ResultSet rs2 = stmt.executeQuery(query);
		if(rs2.next()){
			query = "update mscart set qty = qty + "+ quantity +" where productid = " + productid;
			st.executeUpdate(query);
		}else{
			Integer price = Integer.parseInt(rs.getString(1));
			query = "insert into mscart values(null, "+ userSession.get(0) +", "+ productid +", "+ quantity +", "+ (quantity*price) +")";
			st.executeUpdate(query);
			
		}
		query = "update msproduct set stock = stock - " + quantity +" where productid =" + productid;
		st.executeUpdate(query);

		query = "select count(*) from mscart where userid = " + userSession.get(0);
		rs = st.executeQuery(query);
		if(rs.next()){
			userSession.set(11, rs.getString(1));
		}

		response.sendRedirect("../product.jsp?errMsg=Success add to Cart");
	}else{
		response.sendRedirect("../product.jsp?errMsg=Product id not valid");
	}
%>