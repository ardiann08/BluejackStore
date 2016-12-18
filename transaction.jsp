<%@include file="master-page/header.jsp"%>
<%@include file="../Connection/connect.jsp"%>

<style type="text/css">
	.lbl{
		display: block;
	}
</style>

<div class="container">
	<h2 class="col-md-offset-5">Transaction</h2>	
	<div class="panel-group">
	<%
		String query = "select * from trtransaction where userid = " +userSession.get(0);
		ResultSet rs = st.executeQuery(query);
		while(rs.next()){
	%>
		<div class="panel panel-default">
			<div class="panel-heading">
				<label>Transaction ID :  <%= rs.getString(1) %> </label>
				<label class="col-md-offset-3">Transaction Date : <%= rs.getString(5) %> </label>
				<label class="pull-right">By :<%= userSession.get(2) %> </label>
			</div>

			<%= rs.getString(4).equals("1") ? "" : "<img src='Assets/img/user/app.png' width='200' height='100' style='float: right'>" %>
			<div class="panel-body">
			<%
				query = "SELECT name, totalprice, price, qty  FROM trdetailtransaction a join msproduct b on a.productid = b.productid where transactionid =  " + rs.getString(1);
				ResultSet rs2 = stmt.executeQuery(query);
				int count = 1;
				while(rs2.next()){
			%>
				<label class="lbl"><%= count++%>. <%= rs2.getString(1) %> - Rp. <%= rs2.getString(2) %>,- (Rp. <%= rs2.getString(3) %>,- x <%= rs2.getString(4)%> pcs)</label>				
			<%}%>
			</div>
			<div class="panel-heading">&nbsp
				<span>Status : <%= rs.getString(4).equals("1") ? "Waiting for Approval" : "Order Completed" %></span>
				<span class="pull-right">Total Payment : Rp.<%= rs.getString(3) %>,-</span>
			</div>

		</div>	
	<%}%>
	<% if(!rs.next()){%>
		<div class="panel panel-default">
			<div class="panel-heading">No Transaction</div>
		</div>
	<%}%>
	</div>
</div>

<%@include file="master-page/footer.jsp"%>
