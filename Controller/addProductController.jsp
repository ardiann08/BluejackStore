<%@include file="../Connection/connect.jsp"%>
<%@page import="java.util.ArrayList" %>

<%
	ArrayList userSession = (ArrayList)session.getAttribute("userSession");
	String productname = request.getParameter("txtProductName");
	Integer price = request.getParameter("txtProductPrice") != "" ? Integer.parseInt(request.getParameter("txtProductPrice")) : 0;
	Integer weight = request.getParameter("txtProductWeight") != "" ? Integer.parseInt(request.getParameter("txtProductWeight")) : 0;
	Integer stock = request.getParameter("txtProductStock") != "" ? Integer.parseInt(request.getParameter("txtProductStock")) : 0;

	String fileimage = request.getParameter("fileImage");

	String errMsg = "";
	boolean error = false;

	if(productname.equals("")){
		errMsg += "Product name must be filled <br/>";
		error = true;
	}

	if(price == 0){
		errMsg += "Price must be filled <br/>";
		error = true;
	}

	if(weight == 0){
		errMsg += "Weight must be filled <br/>";
		error = true;
	}

	if(stock == 0){
		errMsg += "Price must be filled and more than 0 <br/>";
		error = true;
	}


	if(!fileimage.endsWith(".jpg") && !fileimage.endsWith(".png")){
		errMsg += "Image exstension not valid <br/>";
		error = true;
	}

	if(error){
		response.sendRedirect("../addProduct.jsp?errMsg=" + errMsg);
	}else{
		String query = "insert into msproduct values(null, '"+ productname +"', "+ price +", "+ weight +", "+ stock +", 'keyboard.png', "+ userSession.get(0) +" )";
		st.executeUpdate(query);
		response.sendRedirect("../addProduct.jsp?errMsg=Success to add new product");
	}






%>