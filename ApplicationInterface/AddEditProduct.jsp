<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="dataBase.dataConnection"%>
<%@page import="java.sql.*"%>
<%@page import="Dao.ProductDaoImplement"%>
<%@page import="java.util.*"%>
<%@page import="UserInterface.Product" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AddEditproduct</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style type="text/css">
.text h3{
margin-top:1%;
text-align: center;
color:black;
font-size:35px;
}
:root{
                --green:green;
                --orange:orange;
                --pink:pink;
                --skyblue:skyblue;
                --black:#130f40;
                --light-color:#666;
                --box-shadow:0 .5rem 1rem rgba(0,0,0,.1);
                --border:2rem solid rgba(0,0,0,.1);
                --outline:.1rem solid rgba(0,0,0,.1);
                --outline-hover:.2rem solid var(--black);
            }
*{
                font-family: sans-serif;
                margin: 0; padding: 0;
                box-sizing: border-box;
                text-transform: capitalize;
                outline: none;
                border: none;
                text-decoration:none;
                transition: all .2s linear;
            }
            *::selection{
                background: var(--green);
                color: #fff;
            }
            html{
                font-size: 62.5%;
                overflow-x: hidden;
                scroll-behavior: smooth;
                scroll-padding-top: 7rem;
            }
            section{
                padding: 2rem 9%;
            }
.header,.header1{
                display: flex;
                font-size: 1.5rem;
                align-items: center;
                justify-content: space-between;
                padding: 2rem 9%;
                background: whitesmoke;
            }
            .header1{
                background-color:#094e92;
                box-shadow: 0 .4rem 1rem rgba(0, 0, 0, .1);
                position: relative;
                z-index: 10000;
            }
            .header .logo{
                font-weight:bolder;
                font-size: 3rem;
                color: black;
            }
            .header .logo p{
                color: #fff;
                font-size: 3rem;
                font-family: sans-serif;
            }
            .header1 .navbar a{
				color: white;
				border-radius:15px;
                font-size: 2.5rem;
                margin-right: 2rem;
            }
            table {
  border: 1px solid #ccc;
  border-collapse: collapse;
  margin-top:1.5%;
  padding: 0;
  width: 100%;
  table-layout: fixed;
}

table caption {
  font-size: 1.5em;
  margin: .5em 0 .75em;
}
table tr th {
  background-color:#094e92;
  padding: .35em;
}

table tr {
  background-color: white;
  padding: .35rem;
}

table th,
table td {
  padding: .625em;
  font-size: 2rem;
  text-align: center;
  font-weight: bolder;
}

table th {
  font-size: 2rem;
  letter-spacing: .1em;
  text-transform: uppercase;
  color:white;
}
table td .editbtn{
margin-top: 1rem;
                display: inline-block;
                padding: 1rem;
                font-size: 1.7rem;
                align-items: center;
                border-radius: .5rem;
                border: .2rem solid white;
                color:white;
                cursor: pointer;
                background: #094e92;
}
table td .deletebtn{
margin-top: 1rem;
                display: inline-block;
                padding: 1rem;
                margin-top:2%;
                font-size: 1.7rem;
                align-items: center;
                border-radius: .5rem;
                border: .2rem solid white;
                color:white;
                cursor: pointer;
                background: red;
}
.alert
{
	color:red;
	text-align:center;
	margin-top:1%;
	font-size:20px;
}

@media screen and (max-width: 600px) {
  table {
    border: 0;
  }

  table caption {
    font-size: 1.3em;
  }
  table tr th {
  background-color:white;
  border: 1px solid black;
  padding: 35rem;
}
  table thead {
    border: none;
    clip: rect(0 0 0 0);
    height: 2px;
    margin: -1px;
    overflow: hidden;
    padding: 0;
    position: absolute;
    width: 1px;
  }
  table tr {
    border-bottom: 3px solid #ddd;
    display: block;
    margin-bottom: .625em;
  }
  table td {
    border-bottom: 1px solid #ddd;
    display: block;
    font-size: .8em;
    text-align: right;
  }
  table td::before {
    content: attr(data-label);
    float: left;
    font-weight: bold;
    text-transform: uppercase;
  }
  table td:last-child {
    border-bottom: 0;
  }
}
</style>
</head>
<body>
<header>
		<div class="header">
			<a href="#" class="logo"><i class="fas fa-shop" id="demo"></i> Kurti's and Luxury Gowns Boutique</a>
		</div>
		<div class="header1">
			<nav class="navbar">
				<a href="Admin.jsp"><i class="fas fa-home"></i> home</a>
			</nav>
		</div>
</header>
<div class="text">
	<h3>Hello Admin!</h3>
</div>
<%
	String message=request.getParameter("message");
	if("done".equals(message)){
	%>
	<h3 class="alert">Product Added Successfully!</h3>
	<%} %>
	<%
	if("wrong".equals(message)){
	%>
	<h3 class="alert">Some thing went wrong! Try Again!</h3>
	<%} %>
	
	<%
	String alertMessage=request.getParameter("message");
	if("success".equals(message)){
	%>
	<h3 class="alert">Product Deleted Successfully!</h3>
	<%} %>
	<%
	if("error".equals(message)){
	%>
	<h3 class="alert">Some thing went wrong! Try Again!</h3>
	<%} %>
<table>
        <thead>
          <tr>
          	<th scope="col">Id</th>
            <th scope="col">Image</th>
            <th scope="col">Name</th>
            <th scope="col">Price</th>
            <th scope="col">Category</th>
            <th>Status</th>
            <th scope="col">Action</th>
          </tr>
        </thead>
        <tbody>
        <%
        	ProductDaoImplement productDAO=new ProductDaoImplement(dataConnection.databaseConnection());
        	List<Product> list=productDAO.getAllProduct();
        	for(Product product:list){
        %>
        <tr>
        	<td><%=product.getProductId() %></td>
        	<td><img src="../images/<%=product.getProductImage() %>" style="width:50px; height:50px;"></td>
        	<td><%=product.getProductName() %></td>
        	<td><%=product.getProductPrice() %></td>
        	<td><%=product.getCategory() %></td>
        	<td><%=product.getStatus() %></td>
        	<td><a href="EditProduct.jsp?id=<%=product.getProductId() %>" class="editbtn"><i class="fas fa-edit"></i></a><a href="../Delete?id=<%=product.getProductId() %>" class="deletebtn"><i class="fas fa-trash-alt"></i></a></td>
        	</tr>
        <%} %>
        </tbody>
      </table>
      <br>
      <br>
      <br>
</body>
</html>