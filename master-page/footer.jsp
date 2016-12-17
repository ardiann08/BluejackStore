    <div class="container">

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Bluejack Store 2016</p>                    
                </div>
                <div class="pull-right">
                    <p>
                        <span class="glyphicon glyphicon-user"></span> User Online : <%= application.getAttribute("userOnline") != null ? application.getAttribute("userOnline") : 0 %>
                    </p>
                </div>
            </div>
        </footer>

    </div>


</body>

</html>