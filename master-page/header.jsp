<%@page import="java.util.ArrayList"%>

<%
    ArrayList userSession = (ArrayList)session.getAttribute("userSession");
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>BluejackStore</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">


    <script src="Assets/js/jquery-3.1.1.js"></script>
    <script src="Assets/js/jquery-3.1.1.min.js"></script>
    <script src="Assets/bootstrap/js/bootstrap.js"></script>
    <script src="Assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="Assets/bootstrap/js/datepicker.js"></script>
    <script src="Assets/bootstrap/js/bootstrap-phone.js"></script>

    <!-- Bootstrap Core CSS -->
    <link href="Assets/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="Assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="Assets/bootstrap/css/custom-style.css" rel="stylesheet">
</head>

<body>   
    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Bluejack Store</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->          
            <% if(userSession == null){  %>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="index.jsp">Home </a>
                        </li>
                    </ul>

                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a>Hi, Guest </a>
                        </li>
                        <li>
                            <a href="register.jsp">Register</a>
                        </li> 
                        <li>
                            <a href="login.jsp">Login</a>
                        </li>                                   
                    </ul>
                </div>   
            <%} else{ %> 
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="index.jsp">Home </a>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="product.jsp">Product </a>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav">  
                        <li>
                            <a href="member.jsp">Member </a>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav">
                         <% if(userSession.get(10).equals("admin")){ %>      
                            <li>
                                <a href="transactionadmin.jsp">Transaction </a>
                            </li>
                        <%}else{%>
                            <li>
                                <a href="transaction.jsp">Transaction </a>
                            </li>
                        <%}%>
                    </ul>

                    <ul class="nav navbar-nav navbar-right">
                        <% if(userSession.get(10).equals("member")){ %>                        
                            <li>
                                <a href="cart.jsp">Cart <span class="badge"> <%= userSession.get(11) != null ? userSession.get(11) : "0" %></span></a>
                            </li>
                        <%}%>
                        <li>
                            <a href="profile.jsp">Profile</a>
                        </li>
                        <li>
                            <a href="Controller/logoutController.jsp">Log Out</a>
                        </li>                                
                    </ul>
                </div>   



            <%}%>        
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>