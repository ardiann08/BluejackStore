<%@include file ="../Connection/connect.jsp"%>
<%@page import="java.util.ArrayList" %>

<%
    ArrayList userSession = (ArrayList)session.getAttribute("userSession");
%>
<%	
	String oldpassword = request.getParameter("txtOldPassword");
	String newpassword = request.getParameter("txtNewPassword");
	String confirm = request.getParameter("txtConfirm");
	String phone = request.getParameter("txtPhone");
	String address = request.getParameter("txtAddress");
	String photo = request.getParameter("filePhoto");

	String errMsg = "";

	String query ="select * from msuser where userid = "+userSession.get(0);
	ResultSet rs = st.executeQuery(query);
	if(rs.next()){
		if(oldpassword.equals("")==true ||oldpassword.equals(rs.getString("password"))==false){
			errMsg += "old password must be filled and match with your current password <br/>";
		}
		if(newpassword.equals("")){
			errMsg+="new password must be filled <br/>";
		}
		if(confirm.equals("")==true||confirm.equals(newpassword)==false){
			errMsg+="confirm password must be filled and match with your new password <br/>";
		}
		if(address.equals("")){
			errMsg+="address must be filled <br/>";
		}
		if(photo.endsWith(".png")==false&&photo.endsWith(".jpg")==false){
			errMsg+="photo must be selected and extension must be .jpg or .png<br/>";
		}

		if(errMsg.equals("")){
			String query2="update msuser set password = '"+newpassword+"' , phone = '"+phone+"' , address = '"+address+"' , photo = '"+photo+"' where userid = "+rs.getString("userid");
			stmt.executeUpdate(query2);
			response.sendRedirect("../profile.jsp");
		}else{	
			response.sendRedirect("../updateprofile.jsp?errMsg="+errMsg);
		}
	}
	
%>