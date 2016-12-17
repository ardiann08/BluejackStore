<%@include file="../Connection/connect.jsp"%>

<%
	String username = request.getParameter("txtUsername");
	String fullname = request.getParameter("txtFullname");
	String phonenumber = request.getParameter("txtPhonenumber");
	String email = request.getParameter("txtEmail");
	String password = request.getParameter("txtPassword");
	String cpassword = request.getParameter("txtConfirmPassword");
	String gender = request.getParameter("rbGender");
	String dob = request.getParameter("txtBOD");
	String address = request.getParameter("txtAddress");
	String photo = request.getParameter("filePhoto");



	String errMsg = "";
	boolean error = false;

	if(username.equals("")  ){
		errMsg += "username must be filled <br/>";
		error = true;
	}	


	if(fullname.equals("") || fullname.indexOf(" ") < 0 ){
		errMsg += "Full name must alphabet and have a space <br/>";
		error = true;
	}

	if(phonenumber.length() < 10){
		errMsg += "Invalid phone number format <br/>";
		error = true;
	}

	if(password.equals("") || cpassword.equals("")){
		errMsg += "Password or Confirm Password must be filled <br/>";
		error = true;
	}


	if(!password.equals(cpassword)){
		errMsg += "Password and Confirm Password must same<br/>";
		error = true;
	}
	if(gender == null){
		errMsg += "Gender Must be Choose <br/>";
		error = true;
	}

	if(dob == null){
		errMsg += "Date of Birth must be filled <br/>";
		error = true;
	}

	if(address.equals("") ){
		errMsg += "Address must be filled <br/>";
		error = true;
	}	

	if(!photo.endsWith(".jpg") && !photo.endsWith(".png")){
		errMsg += "Photo extensions is not valid <br/>" ;
		error = true;
	}


	if(error){
		response.sendRedirect("../register.jsp?errMsg=" + errMsg);
	}else{	

		String query = "insert into msuser values(null, '"+ username +"', '"+ fullname +"','"+ phonenumber +"', '"+ email +"', '"+ password +"', '"+ gender +"', '"+ dob +"', '"+ address +"', 'user-default.jpg', 'member')";

		st.executeUpdate(query);
		response.sendRedirect("../register.jsp?errMsg=Succuess to register! Let's Login");
	}




%>