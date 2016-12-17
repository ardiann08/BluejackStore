<%@include file ="Connection/connect.jsp"%>
<%@include file="master-page/header.jsp"%>

    <!-- Page Content -->
    <div class="container">
        <div class="row">
            <label style="color: red"> <%= request.getParameter("errMsg") != null ? request.getParameter("errMsg") : "" %>  </label>
        	<h2 style="text-align: center">Product List</h2>
        	<div class="col-md-4 col-md-offset-4" style="margin-bottom: 30px;">
        		<form action="searchproduct.jsp">
        			<input type="text" style="width: 80%;padding: 10px;" placeholder="Search Product ex. Sepatu Bola" name="txtsearch"><button type="submit"  class="btn btn-primary" style="height: 42px;""><span class="glyphicon glyphicon-search"></span></button>
        		</form>		
        	</div>
        	<%
        		String search="";
        		if(request.getParameter("search")!=null){
					search= request.getParameter("search");
        		}
        	%>
        	<%	
        		String query ="select *,concat('PR', productid) as idprod from msproduct p , msuser u where u.userid = p.insertby and name like '%"+search+"%'";
        		ResultSet rs = st.executeQuery(query);
        		while(rs.next()){
        	%>
        	<div class="col-md-12" style="margin-bottom: 30px; box-shadow: 0 0 10px #aaa;padding: 10px;" id="product_<%=rs.getString("productid")%>">
        		<div class="col-md-2" style="position: relative;">
        			<div style="position: relative;top: 0px;background-color: lightblue;display: inline-block;">
        				<%=rs.getString("idprod")%>
        			</div>
        			<img src="Assets/img/product/<%=rs.getString("image")%>" alt="" style="width: 100%;">
        		</div>
        		<div class="col-md-8">
        			<label for="" style="display: block;">Name : <%=rs.getString("name")%></label>
        			<label for="" style="display: block;">Price : Rp.<%=rs.getString("price")%>,-</label>
        			<label for="" style="display: block;">Weight : <%=rs.getString("weight")%>kg</label>
        			<label for="" style="display: block;">Stock : <%=rs.getString("stock")%>pcs</label>
        			<em>Inserted by <%=rs.getString("fullname")%></em>
        		</div>
                <%
                if(userSession.get(10).equals("member")==true){%>
        		<div class="col-md-2" style="position: relative;height: 120px;display: block;">
        			<form action="Controller/addCartController.jsp" method="POST">
        				<div class="form-group">       				
        					<label >Qty : </label>
                            <input type="hidden" name="txtPrice" value="<%=rs.getString("price")%>" />
                            <input type="hidden" name="txtProductid" value="<%= rs.getString("productid") %>" />
        					<input type="number" class="form-control" name="txtQty" min="0" style="width: 100px;display: inline;">
        				</div>
        				<button class="btn btn-success" style="position: absolute;bottom: 0px;">Add to Cart <span class="glyphicon glyphicon-shopping-cart"></span></button>
        			</form>		
        		</div>
                <%}else if(userSession.get(10).equals("admin")==true){%>
        		<div class="col-md-2"> 
        			<a class="btn btn-success" href="updateproduct.jsp?id=<%=rs.getString("productid")%>">Update</a>
					<button class="btn btn-danger" onclick="deleteproduct('<%=rs.getString("productid")%>')">Delete</button>
        		</div>
                <%}%>
        	</div>
        	<%}%>
        	
        </div>
    </div>
	<div id="confirm" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Are you sure?</h4>
					</div>
					<div class="modal-body">
						<p>Are you sure want to remove this product?</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
						<button id="okConfirm" type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
					</div>
			</div>
		</div>
	</div>
	<script>
		function deleteproduct(idProducts){
				$("#confirm").modal();
				$("#okConfirm").click(function(){
					$.ajax({
						url:"controller/doRemoveProduct.jsp",
						url:"Controller/doRemoveProduct.jsp",
						type:"POST",
						data :{id : idProducts},
						success:function(result){
							$("#product_"+idProducts).remove();
						}
					})
				});
		}
	</script>
<%@include file="master-page/footer.jsp"%>
