<%@include file="master-page/header.jsp"%>
<%@include file ="Connection/connect.jsp"%>

<style type="text/css">

.cart-content{
	margin-bottom: 30px; 
	box-shadow: 0 0 10px #aaa;
	padding: 10px;
}
/**/

.productid-content{
	position: relative;
	top: 0px;
	background-color: lightblue;
	display: inline-block;
}

label{
	display: block
}

</style>


<div class="container">
	<%
		String query = "select b.productid, b.image, name, qty, subtotal, a.cartid, price from mscart a join msproduct b on a.productid = b.productid  where userid = " + userSession.get(0);
		ResultSet rs = st.executeQuery(query);
		while(rs.next()){
	%>
	<div class="cart-content col-md-12" style="">
		<a href="Controller/deleteCartController.jsp?id=<%= rs.getString(6)%>"><span class="pull-right glyphicon glyphicon-remove"></span></a>
		<div class="col-md-2 productid-content" >			
			<img src="Assets/img/product/<%= rs.getString("image") %>" alt="" style="width: 100%;">
		</div>
		<div class="col-md-8">			
			<label></label>
			<label>Name : <%= rs.getString("name") %> </label>
			<label>Quantity : <%= rs.getString("qty") %> Pcs</label>
			<label>Subtotal Price : Rp. <%= rs.getString("subtotal")%>,- (Rp. <%= rs.getString("price")%> x <%= rs.getString("qty")%> pcs)</label>
		</div>
	</div>
	<%}%>
	

	<div class="cart-content col-md-12">
		<label>Total Payment 
			<%
				query = "SELECT sum(subtotal) FROM `mscart` WHERE userid = " + userSession.get(0);
				rs = st.executeQuery(query);
				if(rs.next()){
			%>
				<label class="pull-right">Rp. <%= rs.getString(1) != null ? rs.getString(1)  : "0" %>,-</label>
			<%}%>
		</label>
	</div>
	<label style="color: red"> <%= request.getParameter("errMsg") != null ? request.getParameter("errMsg") : "" %>  </label>

	<div class="form-group">        			
		<label class="control-label"></label>
		<div>
			<%if(rs.getString(1) != null ){%>
			<a href="Controller/completeOrderController.jsp">
				<input type="button" class="form-control btn btn-primary" value="Complete Order" >
			</a>
			<a href="#">
			<%}else{%>
				<input type="button" class="form-control btn btn-primary disabled" value="Complete Order" >
			<%}%>
			</a>

		</div>
	</div>
</div>

<%@include file="master-page/footer.jsp"%>