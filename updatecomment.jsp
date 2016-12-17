<%@include file ="Connection/connect.jsp"%>
<%@include file="master-page/header.jsp"%>

	<div class="container">
		<div class="row">
			<%
				String query="select * from mscomment where commentid = "+request.getParameter("id");
				ResultSet rs = st.executeQuery(query);
				if(rs.next()){
					if(rs.getString("userid").equals(userSession.get(0))){
			%>
				<div class="col-md-8 col-md-offset-2">
					<form action="Controller/doUpdateComment.jsp" method="POST">
						<input type="hidden" name="txtCommentId" value="<%=rs.getString("commentid")%>">
						<textarea name="txtContent" id="" rows="3" placeholder="Add your comment here..." style="width: 100%;resize: none;"><%=rs.getString("content")%></textarea>
	                    <select name="ddlRating">
	                        <option value="" disabled hidden>Rating</option>
	                        <option value="1" <%if(rs.getString("star").equals("1"))out.print("selected");%>>1</option>
	                        <option value="2"<%if(rs.getString("star").equals("2"))out.print("selected");%>>2</option>
	                        <option value="3"<%if(rs.getString("star").equals("3"))out.print("selected");%>>3</option>
	                        <option value="4"<%if(rs.getString("star").equals("4"))out.print("selected");%>>4</option>
	                        <option value="5" <%if(rs.getString("star").equals("5"))out.print("selected");%>>5</option>
	                    </select>
                    	<button class="btn btn-success" type="submit" style="float: right;">Update Comment...</button>
					</form>
					
				</div>
			<%}else{
				out.println("You are cannot access this comment");
			}}%>
		</div>
	</div>
<%@include file="master-page/footer.jsp"%>
