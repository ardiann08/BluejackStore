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
				<form action="">
					<img src="Assets/img/product/<%=rs.getString("image")%>" alt="" style="width:100%;">
					<div class="form-group">
						Name :
						<input type="text" class="form-control" value="<%=rs.getString("name")%>">
					</div>
					<div class="form-group">
						Price :
						<input type="number" class="form-control" value="<%=rs.getString("price")%>">
					</div>
					<div class="form-group">
						Weight :
						<input type="number" class="form-control" value="<%=rs.getString("weight")%>">
					</div>
					<div class="form-group">
						Stock :
						<input type="number" class="form-control" value="<%=rs.getString("stock")%>">
					</div>
					<div class="form-group">
						Image<input type="file">
					</div>
					<button type="submit" class="btn btn-success" style="float: right;">Submit</button>
				</form>
			</div>
		</div>
	</div>
	<%}%>
<%@include file="master-page/footer.jsp"%>

