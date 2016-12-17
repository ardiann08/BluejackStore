<%@include file="master-page/header.jsp"%>


    <!-- Page Content -->
    <div class="container">
        <div class="row">
        	<h3>REGISTER</h3>

        	<form method="POST" action="Controller/registerController.jsp" class="form-horizontal col-md-offset-1 col-md-10">       		
        		<div class="form-group">        			
					<label class="control-label col-sm-2">Username</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="txtUsername" placeholder="Enter Username">
					</div>
        		</div>

        		<div class="form-group">        			
					<label class="control-label col-sm-2">Full Name</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="txtFullname" placeholder="Enter Full Name">
					</div>
        		</div>

        		<div class="form-group">        			
					<label class="control-label col-sm-2">Phone Number</label>
					<div class="col-sm-10">
						<input type="number" class="form-control" name="txtPhonenumber" placeholder="Enter phone number">
					</div>
        		</div>

        		<div class="form-group">        			
					<label class="control-label col-sm-2">Email</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="txtEmail" placeholder="Enter Email">
					</div>
        		</div>

        		<div class="form-group">        			
					<label class="control-label col-sm-2">Password</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" name="txtPassword" placeholder="Enter Password">
					</div>
        		</div>

        		<div class="form-group">        			
					<label class="control-label col-sm-2">Confirm Password</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" name="txtConfirmPassword" placeholder="Enter Confrim Password">
					</div>
        		</div>

        		<div class="form-group">        			
					<label class="control-label col-sm-2">Gender</label>
					<div class="col-sm-10">
						<label><input type="radio" name="rbGender" value="male">Male</label>
						<label><input type="radio" name="rbGender" value="female">Female</label>
					</div>
        		</div>

        		<div class="form-group">        			
					<label class="control-label col-sm-2">Data of Birth</label>
					<div class="col-sm-10">
						<input type="date"  class="form-control" name="txtBOD">
					</div>
        		</div>

        		<div class="form-group">        			
					<label class="control-label col-sm-2">Address</label>
					<div class="col-sm-10">
						<textarea class="form-control" name="txtAddress" rows="5" placeholder="Enter Address"></textarea>						
					</div>
        		</div>

        		<div class="form-group">        			
					<label class="control-label col-sm-2">Photo</label>
					<div class="col-sm-10">
						<input type="file" name="filePhoto">
					</div>
        		</div>

        		<div class="form-group">        			
					<label class="control-label col-sm-2"></label>
					<div class="col-sm-10">
						<span style="color: red">
							<%= request.getParameter("errMsg") != null ? request.getParameter("errMsg") : "" %>

						</span>
					</div>
        		</div>

        		<div class="form-group">        			
					<label class="control-label col-sm-2"></label>
					<div class="col-sm-10">
						<input type="submit" class="form-control btn btn-primary" value="REGISTER">
					</div>
        		</div>
        	</form>
        </div>
    </div>


<%@include file="master-page/footer.jsp"%>
