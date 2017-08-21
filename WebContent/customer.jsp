
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="perso.simen.dao.*"%>
<%@page import="perso.simen.dao.impl.*"%>
<%@page import="perso.simen.entity.*"%>

<%
	Customer customer = (Customer)session.getAttribute("customer");
	List<Customer> listCustomer = new ArrayList<Customer>();
	CustomerDao customerDao = new CustomerImpl();
	listCustomer = customerDao.listAllCustomer();
%>
	<head>
		<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
		<title>Customer</title>
        <script src="js/jquery.js"></script>
		<link rel="stylesheet" href="css/960.css" type="text/css" media="screen" charset="utf-8"/>
		<!--<link rel="stylesheet" href="css/fluid.css" type="text/css" media="screen" charset="utf-8" />-->
		<link rel="stylesheet" href="css/template.css" type="text/css" media="screen" charset="utf-8" />
		<link rel="stylesheet" href="css/colour.css" type="text/css" media="screen" charset="utf-8" />
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	</head>
	<body>
		<h1 id="head">Customer Info</h1>
		<ul id="navigation">
			
			<li><span class="inactive"><a href="index.jsp">Information</a></span></li>
		</ul>
		
			<div id="content" class="container_16 clearfix">
				<div class="grid_6">
				<div class="box">

		

				</div>
				</div>
				<div class="grid_12">
				<div class="box">
					<table id="UserTbl">
						<thead>
							<tr>
                                <th style="display: none;">ID</th>
								<th>First Name</th>
								<th>Name</th>
								<th>Date of Birth</th>
								<th>Email</th>
								<th colspan="5" width="10%">Actions</th>
							</tr>
							<%for(Customer c: listCustomer){ %>
								<tr id="<%=c.getCustomer_id() %>">
									<td style="display:none;"><%=c.getCustomer_id() %></td>
									<td><a href="customer.jsp" class='link'><%=c.getFirstName()%></a></td>
									<td><%=c.getName()%></td>
									<td><%=c.getDob()%></td>
									<td><%=c.getEmail()%></td>
									<td><a href='#' class='edit'>Edit</a></td>
                            		<td><a href='#' class='delete'>Delete</a></td>
								</tr>
							<%} %>
						</thead>
						<tbody>
                        
						</tbody>
					</table>
				</div>
				
				
				<div class="grid_12">
						<p align="right"><button id="create">Create New Customer</button></p>
				</div> <!--end div button-->
				
				
				<table>	
							<tr>
								<td><label>ID</label></td>
							</tr>
							<tr>
								<td><input type="text" id="id1" disabled/></td>
							</tr>
							<tr>
								<td><label>First Name</label></td>
							</tr>
							<tr>
								<td><input type="text" id="firstname1"/></td>
							</tr>
							<tr>
								<td><label>Name</label></td>
							</tr>
							<tr>
								<td><input type="text" id="name1"/></td>
							</tr>
							<tr>
								<td><label>Date of Birth</label></td>
							</tr>
							<tr>
								<td><input type="text" id="dob1"/></td>
							</tr>
							<tr>
								<td><label>Email</label></td>
							</tr>
							<tr>
								<td><input type="text" id="email1"/></td>
							</tr>
				</table>
				
				
				
				</div>
			</div>
		<div id="foot">
					<a href="#">Contact Me</a>
				
		</div>
	</body>
    <script>
        $(document).ready(function() {
            var action = "create";

           
            
            //When user click on the link 
            $(".link").click(function(){
                var row = $(this).parent().parent().attr('id');
                $("#id1").val($("#"+row).find('td:eq(0)').text());
                $("#firstname1").val($("#"+row).find('td:eq(1)').text());
                $("#name1").val($("#"+row).find('td:eq(2)').text());
                $("#dob1").val($("#"+row).find('td:eq(3)').text());
                $("#email1").val($("#"+row).find('td:eq(4)').text());
                
                action = "read";
            });

          

            //This function will send data to page CustomerHandler to process data, depends on action = update, add or delete
            function customerServlet(id, firstname, name, dob, email, action)
            {
                $.ajax({
					  type: "POST",
					  url: "CustomerServlet",
					  data: "customer_id=" + id + "&firstname=" + firstname +  "&name=" + name +  "&dob=" + dob + "&email=" + email + "&action=" + action,
					  success: function(result){
						  //alert('the operation '+action+' has been successful');
						  //window.location.reload();
					  },
					  dataType: "text"
					});
            }
			
        });
    </script>
</html>