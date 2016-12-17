<%@include file ="Connection/connect.jsp"%>
<%@include file="master-page/header.jsp"%>

    <!-- Page Content -->
    <div class="container">
        <div class="row">
            <label style="color: red"> <%= request.getParameter("errMsg") != null ? request.getParameter("errMsg") : "" %>  </label>
        	<h2 style="text-align: center">Member List</h2>
        	<div class="col-md-4 col-md-offset-4" style="margin-bottom: 30px;">
        		<form action="member.jsp" method="get">
        			<input type="text" style="width: 80%;padding: 10px;" placeholder="Search Member" name="search"><button type="submit"  class="btn btn-primary" style="height: 42px;""><span class="glyphicon glyphicon-search"></span></button>
        		</form>		
        	</div>
        	<%
        		String search="";
        		if(request.getParameter("search")!=null){
					search= request.getParameter("search");
        		}
        	%>
        	<%	
        		String query ="select * from msuser where fullname like '%"+search+"%'";
        		ResultSet rs = st.executeQuery(query);
        		while(rs.next()){
        	%>
        	<div class="col-md-12" style="margin-bottom: 30px; box-shadow: 0 0 10px #aaa;padding: 10px;">
        		<div class="col-md-2">
        			<img src="Assets/img/user/<%=rs.getString("photo")%>" alt="" style="width: 100%;" class="img-circle">
        		</div>
        		<div class="col-md-8" style="margin:20px 0;">
        			<label for="" style="display: block;">Name : <%=rs.getString("fullname")%></label>
        			<label for="" style="display: block;">Phone : <%=rs.getString("phone")%></label>
        			<label for="" style="display: block;">Email : <%=rs.getString("email")%></label>
        			<label for="" style="display: block;">Birthdate : <%=rs.getString("dateofbirth")%></label>
        		</div>
            </div>
            <%}%>
        </div>
    </div>
		
<%@include file="master-page/footer.jsp"%>
