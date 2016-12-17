<%@include file="../Connection/connect.jsp"%>
<%@page import="java.util.ArrayList" %>

<%
	String username = request.getParameter("txtUsername");
	String password = request.getParameter("txtPassword");
	Integer userOnline =  (Integer)application.getAttribute("userOnline");
	String query = "select * from msuser where username = '" + username + "' and password = '"+ password +"'";
	ResultSet rs = st.executeQuery(query);

	if(rs.next()){
		//session.setAttribute("userSession", rs.getString(1));

		ArrayList userSession = new ArrayList();
		userSession.add(rs.getString(1));
		userSession.add(rs.getString(2));
		userSession.add(rs.getString(3));
		userSession.add(rs.getString(4));
		userSession.add(rs.getString(5));
		userSession.add(rs.getString(6));
		userSession.add(rs.getString(7));
		userSession.add(rs.getString(8));
		userSession.add(rs.getString(9));
		userSession.add(rs.getString(10));
		userSession.add(rs.getString(11));
		session.setAttribute("userSession", userSession);

		if(request.getParameter("cbCookies")!=null){
			Cookie user = new Cookie("username",username);
			Cookie pass = new Cookie("password",password);

			user.setMaxAge(60*60*24);
			pass.setMaxAge(60*60*24);

			user.setPath("/");
			pass.setPath("/");

			response.addCookie(user);
			response.addCookie(pass);
		}

		
		if(userOnline == null){
	        userOnline = 1;
	    }else{
	        userOnline+=1;
	    }
	    application.setAttribute("userOnline", userOnline);
		response.sendRedirect("../index.jsp");
	}else{
		response.sendRedirect("../login.jsp?errMsg=Username or Password Not valid");
	}


%>