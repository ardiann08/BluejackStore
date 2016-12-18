<%@include file ="../Connection/connect.jsp"%>
<%	
	String id = request.getParameter("txtId");
	String name = request.getParameter("txtName");
	String price = request.getParameter("txtPrice");
	String weight = request.getParameter("txtWeight");
	String stock = request.getParameter("txtStock");
	String image = request.getParameter("txtImage");

	String errMsg = "";
	boolean error = false;

	if(name.equals("")){
		errMsg += "Name must be filled <br/>";
		error = true;
	}
	if(Integer.parseInt(stock) < 0){
		errMsg += "Stock must be greater than 0 <br/>";
		error = true;
	}
	if(Integer.parseInt(weight) < 0){
		errMsg += "weight must be greater than 0 <br/>";
		error = true;
	}
	if(!image.endsWith("jpg") && !image.endsWith("png")){
		errMsg += "File must be valid exstension <br/>";
		error = true;
	}

	if(error){
		response.sendRedirect("../updateproduct.jsp?id=" + id + "&errMsg=" + errMsg);
	}else{
		String query="update msproduct set name = '"+name+"' , price = "+price+" , weight = "+weight+" , stock = "+stock+" ,image = 'keyboard.png' where productid = "+id;
		st.executeUpdate(query);
		response.sendRedirect("../product.jsp?errMsg=success to update product");
	}
%>