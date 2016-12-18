<%@include file ="Connection/connect.jsp"%>
<%@include file="master-page/header.jsp"%>
	<%
		String query = "select * from msproduct where productid = "+request.getParameter("id");
		ResultSet rs = st.executeQuery(query);
		if(rs.next()){
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4" style="box-shadow: 0 0 10px #aaa;padding: 15px;">
				<form action="Controller/doUpdateProduct.jsp">
					<input type="hidden" value="<%=rs.getString("productid")%>" name="txtId">
					<img src="Assets/img/product/<%=rs.getString("image")%>" alt="" style="width:100%;">
					<div class="form-group">
						Name :
						<input type="text" name="txtName" class="form-control" value="<%=rs.getString("name")%>">
					</div>
					<div class="form-group">
						Price :
						<input type="number" name="txtPrice" min="1" class="form-control" value="<%=rs.getString("price")%>">
					</div>
					<div class="form-group">
						Weight :
						<input type="number" name="txtWeight" min="1" class="form-control" value="<%=rs.getString("weight")%>">
					</div>
					<div class="form-group">
						Stock :
						<input type="number" name="txtStock" min="1" class="form-control" value="<%=rs.getString("stock")%>">
					</div>
					<div class="form-group">
						Image<input type="file" name="txtImage">
					</div>
					<div class="form-group">
						<span style="color: red">
							<%= request.getParameter("errMsg") != null ? request.getParameter("errMsg") : "" %>
						</span>
					</div>
					<button type="submit" class="btn btn-success" style="float: right;">Submit</button>
				</form>
			</div>
		</div>
	</div>
	<%}%>
<%@include file="master-page/footer.jsp"%>

