<%@include file="master-page/header.jsp"%>


<div class="container">
	<div class="row col-md-offset-2 col-md-8">
		<form class="form-horizontal" method="POST" action="Controller/loginController.jsp">
			<div class="panel panel-primary">
				<div class="panel-heading">LOGIN</div>
				<div class="panel-body">
					<div class="form-group">        			
						<label class="control-label col-sm-3">Username</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="txtUsername" placeholder="Username">
						</div>
	        		</div>
	        		<div class="form-group">        			
						<label class="control-label col-sm-3">Password</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" name="txtPassword" placeholder="Password">
						</div>
	        		</div>
	        		<div class="form-group">        			
						<label class="control-label col-sm-3"></label>
						<div class="col-sm-6">
							<label><input type="checkbox"name="cbCookie"> Remember Me</label>
						</div>
	        		</div>
	        		<div class="form-group">        			
						<label class="control-label col-sm-3"></label>
						<div class="col-sm-6">
							<span style="color: red">
								<%= request.getParameter("errMsg") != null ? request.getParameter("errMsg") : "" %>

							</span>
						</div>
	        		</div>
	        		<div class="form-group">        			
						<label class="control-label col-sm-3"></label>
						<div class="col-sm-6">
							<input type="submit" class="form-control btn btn-primary" value="Login">
						</div>
	        		</div>
				</div>
			</div>
		</form>
	</div>
</div>





<%@include file="master-page/footer.jsp"%>