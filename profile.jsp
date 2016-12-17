<%@include file ="Connection/connect.jsp"%>
<%@include file="master-page/header.jsp"%>
	<div class="container">
		<div class="row">
			<%
				String query="select * from msuser where userid = "+userSession.get(0);
				ResultSet rs = st.executeQuery(query);
				if(rs.next()){
			%>
			<div class="col-md-8 col-md-offset-2">
				<h1 style="text-align: center;">Profile</h1>
				<div class="col-md-4 col-md-offset-4">
					<img src="Assets/img/user/<%=rs.getString("photo")%>" alt="" class="img-circle" style="width:100%;border:1px solid black">
				</div>
				<div class="col-md-12">
					<hr style="border: 1px solid black">
				</div>
				<div class="col-md-12" ">
					<div class="col-md-12" style="margin-bottom: 20px;">
						<div class="col-md-4"><label for="">Name</label></div>
						<div class="col-md-4"><label for="">:</label></div>
						<div class="col-md-4"><label for=""><%=rs.getString("fullname")%></label></div>		
					</div>
					<div class="col-md-12" style="margin-bottom: 20px;">
						<div class="col-md-4"><label for="">Phone</label></div>
						<div class="col-md-4"><label for="">:</label></div>
						<div class="col-md-4"><label for=""><%=rs.getString("phone")%></label></div>		
					</div>
					<div class="col-md-12" style="margin-bottom: 20px;">
						<div class="col-md-4"><label for="">Email</label></div>
						<div class="col-md-4"><label for="">:</label></div>
						<div class="col-md-4"><label for=""><%=rs.getString("email")%></label></div>		
					</div>
					<div class="col-md-12" style="margin-bottom: 20px;">
						<div class="col-md-4"><label for="">Gender</label></div>
						<div class="col-md-4"><label for="">:</label></div>
						<div class="col-md-4"><label for=""><%=rs.getString("gender")%></label></div>		
					</div>
					<div class="col-md-12" style="margin-bottom: 20px;">
						<div class="col-md-4"><label for="">Date of Birth</label></div>
						<div class="col-md-4"><label for="">:</label></div>
						<div class="col-md-4"><label for=""><%=rs.getString("dateofbirth")%></label></div>
					</div>
					<div class="col-md-12" style="margin-bottom: 20px;">
						<div class="col-md-4"><label for="">Address</label></div>
						<div class="col-md-4"><label for="">:</label></div>
						<div class="col-md-4"><label for=""><%=rs.getString("address")%></label></div>
					</div>
					<div class="col-md-12">
						<a href="updateprofile.jsp" class="btn btn-default" style="width: 100%;">Update Profile</a>
					</div>
				</div>
			</div>
			<%}%>
		</div>
	</div>
<%@include file="master-page/footer.jsp"%>
