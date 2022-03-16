<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
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
            .btn{
                margin-top: 1rem;
                display: inline-block;
                padding: 1.2rem 3.4rem;
                font-size: 1.7rem;
                align-items: center;
                border-radius: .5rem;
                border: .2rem solid var(--black);
                color: var(--black);
                cursor: pointer;
                background: none;
            }
            .btn:hover{
                background: var(--orange);
                color: #fff;
            }
            .btn-login{
                margin-top: 1rem; 
                display: inline-block;
                padding: 1rem 1.5rem;
                font-size: 1.7rem;
                align-items: center;
                border-radius: .5rem;
                border: .2rem solid black;
                color: black;
                cursor: pointer;
                background: white;
            }
            .btn-login:hover{
                background: #666;
                color: #fff;
            }
            .btn-signup{
            	margin-top: 1rem; 
                display: inline-block;
                padding: 1rem 1.7rem;
                font-size: 1.7rem;
                align-items: center;
                border-radius: .5rem;
                border: .2rem solid black;
                color: black;
                cursor: pointer;
                background: white;
            }
            .btn-signup:hover{
                background: #666;
                color: #fff;
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
                color: black;
                font-size: 3rem;
                font-family: sans-serif;
            }
            .header .search-bar-container{
                display: flex;
                align-items: center;
                width: 35rem;
                padding: 1.5rem;
                background: white;
                border-radius: .5rem;
                border: .2rem solid black;
            }
            .header .search-bar-container #search-bar{
                width: 100%;
                background: none;
                text-transform: none;
                color: black;
                font-size: 1.7rem;
            }
            .header .search-bar-container #search-bar::placeholder{
                text-transform: capitalize;
                color: black;
            }
            .header .search-bar-container label{
                color: black;
                cursor: pointer;
                font-size: 2rem;
                padding: 0 .5rem;
            }
            .header .search-bar-container label:hover{
                color:yellow;
            }
            .header1 .navbar a{
				color:white;
				border-radius:15px;
                font-size: 2.5rem;
                margin-right: 2rem;
            }
            .header1 .icons a{
                color: #666;
                font-size: 2.5rem;
                margin-left: 2rem;
            }
            .adding{
            	min-height:100vh;
            }
            .adding .box-container{
            	display:flex;
            	align-items:center;
            	justify-content:center;
            	flex-wrap:wrap;
            }
            .adding .box-container .box{
            	algin-items:center;
            	width:20%;
            	padding:1.5rem;
            	margin:2rem;
            	margin-top:10%;
            	border:.1rem solid rgba(0,0,0,.1);
            	box-shadow:0 0 2rem rgba(0,0,0,.1);
            	cursor:pointer;
            }
            .adding .box-container .box .text-primary i{
            	color:#094e92;
            }
            .adding .box-container .box .text-danger i{
            	color:#094e92;
            }
            .adding .box-container .box .text-warnings i{
            	color:#094e92;
            }
            .adding .box-container .box a{
            	text-decoration:none;
            	color:black;
            }
            .adding .box-container .box a:hover{
            	text-decoration:none;
            	color:black;
            }
            .adding .box-container .box i{
            	font-size:6rem;
            	padding:2rem 6rem;
            	color:black;
            }
            .adding .box-container .box h4{
            	text-align:center;
            	font-size:2.5rem;
            	color:black;
            }
            .modal {
                display: none;
                position: fixed;
                z-index: 1; 
                left: 0;
                top: 0;
                width: 100%;
                height: 100%; 
                overflow: auto;
                background-color: rgb(0,0,0); 
                background-color: rgba(0,0,0,0.4);
            }
            .modal-content {
                background-color: #fefefe;
                margin: 15% auto; 
                padding: 100px;
                border: 1px solid #888;
                width: 50%;
            }
            .modal-content h2{
            	text-align:center;
            }
            .modal-content .btn{
            	align-items: center;
            	margin: 40px auto 80px auto;
            }
            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }
            .close:hover,.close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
            .btn-close{
            	margin-top: 1%;
            	margin-left:24%;
                display: inline-block;
                padding: 1.2rem 3.4rem;
                font-size: 1.7rem;
                align-items: center;
                border-radius: .5rem;
                border: .2rem solid var(--black);
                color: var(--black);
                cursor: pointer;
                background: none;
            }
            .btn-logout{
            	margin-top: 1%;
                display: inline-block;
                padding: 1.2rem 3.4rem;
                font-size: 1.7rem;
                align-items: center;
                border-radius: .5rem;
                border: .2rem solid var(--black);
                color: var(--black);
                cursor: pointer;
                background: none;
            }
           
</style>
<script type="text/javascript" src="Form.js"></script>
</head>
<body>
	<header>
		<div class="header">
			<a href="#" class="logo"><i class="fas fa-shop" id="demo"></i> Luxury Gowns</a>
			<form action="" class="search-bar-container">
				<input type="search" id="search-bar" placeholder="search here...">
					<label for="search-bar" class="fas fa-search"></label>
			</form>
			<%
			String username=(String)session.getAttribute("username"); 
			if(username!=null){
			%>
			<a href="#" class="btn-login"><i class="fas fa-user"></i> <%out.println(username); %></a>
			<a href="#" class="btn-signup" id="myBtn" onclick="logout()"><i class="fas fa-sign-out-alt"></i> Logout</a>
			<% }%>
			<%
			if(username==null){
				%>
				<a href="../Login.jsp" class="btn-login"><i class="fas fa-sign-in-alt"></i> Login</a>
				<a href="../Signup.jsp" class="btn-signup"><i class="fas fa-user-plus"></i> SignUp</a>
				<% }%>
		</div>
		<div class="header1">
			<nav class="navbar">
				<a href="#home"><i class="fas fa-home"></i> home</a>
			</nav>
			<div id="myModal" class="modal">
	            <div class="modal-content">
	                <span class="close">&times;</span>
	                    <h2>You want to Logout</h2>
	                    <a href="" class="btn-close" type="button">Close</button>
	                    <a href="../logout" type="button" class="btn-logout">Logout</a>
	            </div>
            </div>
		</div>
	</header>
	<section class="adding">
		<div class="box-container">
			<div class="box">
				<div class="text-primary">
					<a href="AddProduct.jsp"><i class="fas fa-plus-square fa-3x"></i></a><br>
					<h4>Add Product</h4>
				</div>
			</div>
			<div class="box">
				<div class="text-danger">
					<a href="AddEditProduct.jsp"><i class="fas fa-edit fa-3x"></i></a><br>
					<h4>Add-Edit Product</h4>
				</div>
			</div>
			<div class="box">
				<div class="text-warnings">
					<a href="Orders.jsp"><i class="fas fa-box-open fa-3x"></i></a><br>
					<h4>Orders</h4>
				</div>
			</div>
			<div class="box">
				<div class="text-primary">
					<a href="../Login.jsp"><i class="fas fa-sign-out-alt fa-3x"></i></a><br>
					<h4>Logout</h4>
				</div>
				
			</div>
		</div>
	</section>
</body>
</html>