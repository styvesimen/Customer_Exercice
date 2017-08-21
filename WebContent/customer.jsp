
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
		<h1 id="head">Customer Information</h1>
		<ul id="navigation">
			
			<li><span class="inactive"><a href="index.jsp">Customer</a></span></li>
		</ul>
		
			<div id="content" class="container_16 clearfix">
				<div class="grid_6">
				<div class="box">

					<table>	
							
							<tr>
								<td><label>ID</label></td>
							</tr>
							<tr>
								<td><input type="text" id="id" disabled/></td>
							</tr>
							<tr>
								<td><label>First Name</label></td>
							</tr>
							<tr>
								<td><input type="text" id="firstname"/></td>
							</tr>
							<tr>
								<td><label>Name</label></td>
							</tr>
							<tr>
								<td><input type="text" id="name"/></td>
							</tr>
							<tr>
								<td><label>Date of Birth</label></td>
							</tr>
							<tr>
								<td><input type="text" id="dob"/></td>
							</tr>
							<tr>
								<td><label>Email</label></td>
							</tr>
							<tr>
								<td><input type="text" id="email"/></td>
							</tr>
							
							
					</table>

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
									<td><a href='customer.jsp?id=<%=c.getCustomer_id() %>'><%=c.getFirstName()%></a></td>
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
				
				</div>
			</div>
		<div id="foot">
					<a href="#">Contact Me</a>
				
		</div>
	</body>
    
</html>