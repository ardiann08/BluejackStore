<%@include file ="Connection/connect.jsp"%>
<%@include file="master-page/header.jsp"%>
    <%
        String query = "select * from msproduct where productid = "+request.getParameter("id");
        ResultSet rs = st.executeQuery(query);
        if(rs.next()){
    %>
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2" style="box-shadow: 0 0 10px #aaa;padding: 15px;">
                <div class="col-md-4 col-md-offset-4" style="display: block;" >
                    <img src="Assets/img/product/<%=rs.getString("image")%>" alt="" class="img-circle" style="width:100%;border:1px solid black">
                </div>
                <div class="col-md-12">
                    <h1 style="text-align: center;"><%=rs.getString("name")%></h1>
                </div>
                <hr class="col-md-10 col-md-offset-1" style="border-color: black">
                <div class="col-md-12" style="text-align: center;">
                    <%
                        String query2= "select * from mscomment where productid = '"+rs.getString("productid")+"'";
                        ResultSet rs2 = stmt.executeQuery(query2);
                        int rowcount = 0;                                   
                        int total=0;
                        int average=0;
                        while(rs2.next()){
                            total += Integer.parseInt(rs2.getString("star"));
                            rowcount++;
                        }
                        if(rowcount !=0){
                            average = total / rowcount;
                        }
                        for(int i=0;i<5;i++){
                            if(i<average){
                                %><span class="glyphicon glyphicon-star" style="font-size: 25px;color: gold"></span><%}
                            else{
                                %><span class="glyphicon glyphicon glyphicon-star-empty" style="font-size: 25px;"></span><%
                            }                                       
                        }
                    %>
                </div>    
            </div>
            <div class="col-md-12">
                <h1 style="text-align: center;">Comment</h1>
            </div>
            <%
                query2="select * from mscomment mc , msuser mu where mc.userid = mu.userid and mc.productid = "+rs.getString("productid");
                rs2 = stmt.executeQuery(query2);
                while(rs2.next()){
            %>
            <div id="comment_<%=rs2.getString("commentid")%>" class="col-md-8 col-md-offset-2" style="box-shadow: 0 0 5px #aaa;padding: 10px;margin-bottom: 30px;">
                <div class="col-md-12">
                    <div class="col-md-2">
                        <img src="Assets/img/user/<%=rs2.getString("Photo")%>" alt="" class="img-circle" style="width:100%;border:1px solid black">
                    </div>
                    <div class="col-md-8">
                        <label for=""><%=rs2.getString("fullname")%></label>
                        <p><%=rs2.getString("content")%></p>
                        <%
                            for(int i=0;i<5;i++){
                                if(i<Integer.parseInt(rs2.getString("star"))){
                                    %><span class="glyphicon glyphicon-star" style="font-size: 15px;color: gold"></span><%}
                                else{
                                    %><span class="glyphicon glyphicon glyphicon-star-empty" style="font-size: 15px;"></span><%
                                }                                       
                            }
                        %>
                    </div>
                    <%if(userSession.get(0).equals(rs2.getString("userid"))){%>
                    <div class="col-md-2">
                       <a class="btn btn-primary" style="margin-bottom: 10px;" href="updatecomment.jsp?id=<%=rs2.getString("commentid")%>">Update</a>
                    <button class="btn btn-danger" onclick="deletecomment('<%=rs2.getString("commentid")%>')">Delete</button>
                    </div>
                    <%}%>
                </div>
            </div>
            <%}%>
            <div class="col-md-8 col-md-offset-2" style="box-shadow: 0 0 5px #aaa;padding: 20px;margin-bottom:30px;">
                <form action="Controller/doInsertComment.jsp" method="POST">
                    <input type="hidden" name="txtUserId" value="<%=userSession.get(0)%>">
                    <input type="hidden" name="txtProductId" value="<%=rs.getString("productid")%>">
                    <textarea name="txtContent" id="" rows="3" placeholder="Add your comment here..." style="width: 100%;resize: none;"></textarea>
                    <select name="ddlRating">
                        <option value="" selected disabled hidden>Rating</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                    <button class="btn btn-success" type="submit" style="float: right;">Add Comment...</button>
                </form>
            </div>
        </div>
    </div>
    <%}%>
    <div id="confirm" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Are you sure?</h4>
                    </div>
                    <div class="modal-body">
                        <p>Are you sure want to remove this comment?</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                        <button id="okConfirm" type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
                    </div>
            </div>
        </div>
    </div>
    <script>
        function deletecomment(idComment){
                $("#confirm").modal();
                $("#okConfirm").click(function(){
                    $.ajax({
                        url:"Controller/doRemoveComment.jsp",
                        type:"POST",
                        data :{id : idComment},
                        success:function(result){
                            $("#comment_"+idComment).remove();
                        }
                    })
                });
        }
    </script>
<%@include file="master-page/footer.jsp"%>

