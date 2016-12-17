<%
	session.removeAttribute("userSession");	
	Integer userOnline = (Integer)application.getAttribute("userOnline");
	if( userOnline != 0){
		userOnline -= 1;
		application.setAttribute("userOnline", userOnline);
	}
	response.sendRedirect("/BluejackStore/");
%>