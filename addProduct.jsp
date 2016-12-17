<%@include file="master-page/header.jsp"%>

<div class="container">
        <div class="row">
        	<h3>Add New Product</h3>

        	<form method="POST" action="Controller/addProductController.jsp" class="form-horizontal col-md-offset-1 col-md-10">       		
        		<div class="form-group">        			
					<label class="control-label col-sm-2">Product Name </label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="txtProductName" placeholder="Product Name">
					</div>
        		</div>

        		<div class="form-group">        			
					<label class="control-label col-sm-2">Product Price</label>
					<div class="col-sm-10">
						<input type="number" min="1" class="form-control" name="txtProductPrice" placeholder="Product Price">
					</div>
        		</div>

        		<div class="form-group">        			
					<label class="control-label col-sm-2">Product Weight</label>
					<div class="col-sm-10">
						<input type="number" min="1" class="form-control" name="txtProductWeight" placeholder="Product Weight">
					</div>
        		</div>

        		<div class="form-group">        			
					<label class="control-label col-sm-2">Product Stock</label>
					<div class="col-sm-10">
						<input type="number" min="1" class="form-control" name="txtProductStock" placeholder="Product Stock">
					</div>
        		</div>

        		<div class="form-group">        			
					<label class="control-label col-sm-2">Image</label>
					<div class="col-sm-10">
						<input type="file" name="fileImage">
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
						<input type="submit" class="form-control btn btn-primary" value="Insert">
					</div>
        		</div>
        	</form>
        </div>
    </div>



<%@include file="master-page/footer.jsp"%>