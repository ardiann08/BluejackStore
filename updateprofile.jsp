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
				<h1 style="text-align: center;">Update Profile</h1>
				<div class="col-md-4 col-md-offset-4">
					<img src="Assets/images/user/<%=rs.getString("photo")%>" alt="" class="img-circle" style="width:100%;border:1px solid black">
				</div>
				<div class="col-md-12">
					<hr style="border: 1px solid black">
				</div>
				<div class="col-md-12">
					<form action="Controller/doUpdateProfile.jsp" class="form-horizontal" method="post">
						<div class="form-group">
							<label for="" class="col-sm-3 control-label">Old Password</label>
							<div class="col-sm-9">
						    	<input type="password" name="txtOldPassword" class="form-control" placeholder="Old Password">
						    </div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-3 control-label">New Password</label>
							<div class="col-sm-9">
								<input type="password" name="txtNewPassword" class="form-control" placeholder="New Password">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-3 control-label">Confirm New Password</label>
							<div class="col-sm-9">
								<input type="password" name="txtConfirm" class="form-control" placeholder="Confirm New Password">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-3 control-label">Phone</label>
							<div class="col-sm-9">
								<input type="text" name="txtPhone" class="form-control" placeholder="Phone Number" value="<%=rs.getString("phone")%>">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-3 control-label">Address</label>
							<div class="col-sm-9">
								<input type="text" name="txtAddress" class="form-control" placeholder="Address" value="<%=rs.getString("address")%>">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-3 control-label">Photo</label>
							<div class="col-sm-9">
								<input type="file" name="filePhoto" value="<%=rs.getString("photo")%>">
							</div>
						</div>
						<div class="form-group">        			
							<label class="control-label col-sm-3"></label>
							<div class="col-sm-9">
								<span style="color: red">
									<%= request.getParameter("errMsg") != null ? request.getParameter("errMsg") : "" %>
								</span>
							</div>
		        		</div>
						<div class="form-group" style="margin-top: 30px;">
							<button class="btn btn-default col-sm-12" type="submit">Confirm</button>
						</div>

					</form>
				</div>
			</div>
			<%}%>
		</div>
	</div>
<%@include file="master-page/footer.jsp"%>
