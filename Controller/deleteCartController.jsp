<%@include file="../Connection/connect.jsp"%>
<%@page import="java.util.ArrayList" %>

<%
	ArrayList userSession = (ArrayList)session.getAttribute("userSession");
	String cartid = request.getParameter("id");
	String query = "select qty, productid from mscart where cartid = " + cartid;
	ResultSet rs = st.executeQuery(query); rs.next();
	Integer qty = Integer.parseInt(rs.getString(1));
	String productid = rs.getString(2);

	query = "update msproduct set stock = stock + " + qty + " where productid = " + productid;
	st.executeUpdate(query);

	query = "delete from mscart where cartid = " + cartid;
	st.executeUpdate(query);

	query = "select count(*) from mscart where userid = " + userSession.get(0);
	rs = st.executeQuery(query);
	if(rs.next()){
		userSession.set(11, rs.getString(1));
	}else{
		userSession.set(11, "0");
	}


	response.sendRedirect("../cart.jsp?errMsg=Success to delete the cart");
%>