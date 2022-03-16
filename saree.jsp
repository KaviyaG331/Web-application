<%@page import="dataBase.dataConnection"%>
<%@page import="Dao.ProductDaoImplement"%>
<%@page import="UserInterface.Product" %>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Saree product</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            :root{
                --green:skyblue;
                --orange:aliceblue;
                --pink:pink;
                --skyblue:cadetblue;
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
            .section-header {
                color: black;
                font-weight: bolder;
                text-align: center;
                font-size: 3rem;
            }
            .section-header span{
                background: var(--orange);
                color: #fff;
                display: inline-block;
                padding: .5rem 3rem;
                clip-path: polygon(100% 0,93% 50%,100% 99%,0% 100%,7% 50%,0% 0%);
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
            .heading{
                text-align: center;
                font-size: 3rem;
                padding-bottom: 3rem;
                color: black;
            }
            .heading span{
                background: var(--orange);
                color: #fff;
                display: inline-block;
                padding: .5rem 3rem;
                clip-path: polygon(100% 0,93% 50%,100% 99%,0% 100%,7% 50%,0% 0%);
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
                background: cadetblue;
                color: #fff;
            }
            .btn-login{
                margin-top: 1rem;
                margin-left:2%;
                display: inline-block;
                padding: 1rem 1.4rem;
                font-size: 1.5rem;
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
                padding: 1.2rem 1.4rem;
                font-size: 1.5rem;
                align-items: center;
                border-radius: .5rem;
                border: .2rem solid black;
                color: black;
                cursor: pointer;
                background: #fff;
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
                padding: 2rem 10%;
                background: var(--green);
            }
            .header1{
                background: var(--orange);
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
                width: 30rem;
                padding: 1.5rem;
                background: aliceblue;
                border-radius: .5rem;
                margin-left:20%;
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
                color:cadetblue;
            }
            .header1 .navbar a{
                color:#333;
                font-size: 2rem;
                margin-right: 2rem;
            }
            .header1 .icons a{
                color: #666;
                font-size: 2.5rem;
                margin-left: 2rem;
            }
            .header1 a:hover{
                color: cadetblue;
            }
            .form-popup {
                display: none;
                position: fixed;
                top: 200px;
                right: 15px;
                border: 3px solid #f1f1f1;
                z-index: 9;
            }
            .form-container {
                max-width: 300px;
                padding: 10px;
                background-color: white;
            }
            .form-container input[type=text], .form-container input[type=password] {
                width: 100%;
                padding: 15px;
                margin: 5px 0 22px 0;
                border: none;
                background: #f1f1f1;
            }
            .form-container input[type=text]:focus, .form-container input[type=password]:focus {
                background-color: #ddd;
                outline: none;
            }
            .form-container .btn {
                height: 5.5rem;
                display: inline-block;
                align-items: center;
                margin-top: 1rem;
                border: .2rem solid var(--black);
                background: none;
                color: var(--black);
                padding: 2rem 3rem;
                cursor: pointer;
                font-size: 1.7rem;
            }
            .form-container .btn:hover{
                background: var(--orange);
                color: #fff;
            }
            .form-container .cancel {
                background-color: none;
            }
            .form-container .btn:hover, .open-button:hover {
                opacity: 1;
            }
            #menu-bar{
                font-size:3rem;
                color:#666;
                border:.1rem solid #666;
                border-radius: .5rem;
                padding: .5rem 1.5rem;
                cursor: pointer;
                display: none;
            }
            .modal-logout {
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
            .modal-content-logout {
                background-color: #fefefe;
                margin: 15% auto; 
                padding: 100px;
                border: 1px solid #888;
                width: 50%;
            }
            .modal-content-logout h2{
            	text-align:center;
            	font-size:40px;
            	margin-top:-2%;
            }
            .modal-content-logout .btn{
            	align-items: center;
            	margin: 40px auto 80px auto;
            }
            .close-logout {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }
            .close-logout:hover,.close-logout:focus {
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
            .btn-close:hover{
                background: cadetblue;
                color: black;
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
            .btn-logout:hover{
                background: var(--orange);
                color: #fff;
            }
            .shop-item {
                margin: 30px;
            }
            .shop-item-title {
                display: block;
                width: 100%;
                text-align: center;
                font-weight: bold;
                font-size: 2.3rem;
                color: #333;
                margin-bottom: 15px;
            }
            .shop-item-image {
                height: 250px;
            }
            .shop-item-details {
                display: flex;
                align-items: center;
                padding: 5px;
            }
            .shop-item-category{
            	display: block;
                width: 100%;
                text-align: center;
                font-size: 1.5rem;
                color: #333;
                margin-bottom: 15px;
            }
            .shop-item-price {
                flex-grow: 1;
                font-size: 2rem;
                color: #333;
            }
            .shop-item-price span{
                font-size: 1.1rem;
            }
            .shop-items {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-around;
            }
            .cart-header {
                font-weight: bold;
                font-size: 1.25em;
                color: #333;
            }
            .cart-column {
                display: flex;
                align-items: center;
                border-bottom: 1px solid black;
                margin-right: 1.5em;
                padding-bottom: 10px;
                margin-top: 10px;
            }
            .cart-row {
                display: flex;
            }
            .cart-row span i{
                font-size: 3rem;
                color: crimson;
            }
            .cart-row span{
                font-size: 2.3rem;
                color: darkcyan;
            }
            .cart-item {
                font-size: 2rem;
                width: 45%;
            }
            .cart-price {
                width: 20%;
                font-size: 2rem;
                color: #333;
            }
            .cart-quantity {
                font-size: 2rem;
                width: 35%;
            }
            .cart-item-title {
                color: #333;
                margin-left: .5em;
                font-size: 1.2em;
            }
            .cart-item-image {
                width: 75px;
                height: auto;
                border-radius: 10px;
            }
            .btn-danger {
                color: white;
                background-color: #EB5757;
                border: none;
                border-radius: .3em;
                font-weight: bold;
            }
            .btn-danger:hover {
                background-color: #CC4C4C;
            }
            .cart-quantity-input {
                height: 34px;
                width: 50px;
                border-radius: 5px;
                border: 1px solid #56CCF2;
                background-color: #eee;
                color: #333;
                padding: 0;
                text-align: center;
                font-size: 1.4rem;
                margin-right: 25px;
            }
            .cart-row:last-child {
                border-bottom: 1px solid black;
            }
            .cart-row:last-child .cart-column {
                border: none;
            }
            .cart-total {
                text-align: end;
                margin-top: 10px;
                margin-right: 10px;
            }
            .cart-total-title {
                font-weight: bold;
                font-size: 2rem;
                color: black;
                margin-right: 20px;
            }
            .cart-total-price {
                color: #333;
                font-size: 2rem;
            }
            .btn-purchase {
                display: block;
                margin: 40px auto 80px auto;
                font-size: 1.75em;
            }
            .cart {
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
            .cart-content {
                background-color: #fefefe;
                margin: 15% auto; 
                padding: 20px;
                border: 1px solid #888;
                width: 80%;
            }
            .cart-close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }
            .cart-close:hover,.cart-close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
            
/* media queries */
            @media(max-width:1200px){
                html{
                    font-size: 55%;
                }
            }
            @media(max-width:991px){
                .header,.header1{
                    padding: 2rem;
                }
                section{
                    padding: 2rem 9%;
                }
            }
            @media(max-width:768px) {
                #menu-bar{
                    display: initial;
                }
                .header1 .navbar{
                    position: absolute;
                    top: 100%; left: 0; right: 0;
                    background: #eee;
                    padding: 1rem 2rem;
                    border-top: .1rem solid rgba(0, 0, 0, .3);
                    clip-path: polygon(0 0, 100% 0,100% 0,0 0);
                }
                .header .navbar .active{
                    clip-path: polygon(0 0, 100% 0,100% 100%,0% 100%);
                }
                .header1 .navbar a{
                    display: block;
                    margin: 1.5rem 0;
                    padding: 1.5rem;
                    border-radius: .5rem;
                    border: .1rem solid rgba(0, 0, 0, .3);
                    background: #fff;
                    text-align: center;
                }
                .header{
                    flex-flow: column;
                }
                .header .search-bar-container{
                    width: 100%;
                    margin-top: 2rem;
                }
            }
            @media(max-width:450px){
                html{
                    font-size: 50%;
                }
                .heading{
                    font-size: 2.5rem;
                }
            }
        </style>
        <script type="text/javascript" src="Valid.js"></script>
</head>
<body>
<header>
            <%String user=(String)session.getAttribute("username"); %>
            <div class="header">                       
                <a href="#" class="logo"><i class="fas fa-user" id="demo"></i> Welcome <%out.println(user); %>!</a>
                <form action="" class="search-bar-container">
                    <input type="search" id="search-bar" placeholder="search here...">
                    <label for="search-bar" class="fas fa-search"></label>
                </form>
                <%
					if(user!=null){
					%>
					<a href="#" class="btn-login"><i class="fas fa-user"></i> <%out.println(user); %></a>
					<a href="logout" class="btn-signup" id="myBtn" onclick="logout()"><i class="fas fa-sign-out-alt"></i> Logout</a>
					<% }%>
					<%
					if(user==null){
						%>
						<a href="Login.jsp" class="btn-login"><i class="fas fa-sign-in-alt"></i> Login</a>
						<a href="Signup.jsp" class="btn-signup"><i class="fas fa-user-plus"></i> SignUp</a>
						<% }%>
               </div>
               <div id="modal-logout" class="modal-logout">
	            <div class="modal-content-logout">
	                <span class="close-logout">&times;</span>
	                    <h2>You want to Logout</h2>
	                    <button class="btn-close" type="button">Close</button>
	                    <a href="logout" type="button" class="btn-logout">Logout</a>
	            </div>
	            </div>

            <div class="header1">
                <div id="menu-bar" class="fas fa-bars"></div>
                <nav class="navbar">
                    <a href="welcome.jsp"><i class="fas fa-home"></i> home</a>
                </nav>
                <div class="icons">
                	<a href="#" class="fas fa-heart"></a>
                    <a href="#" class="fas fa-shopping-cart" id="cartBtn" onclick="cart()"></a>
                    <a href="#" class="fas fa-user" onclick="openForm()"></a>
                </div>
                <div class="form-popup" id="myForm">
                    <form action="" class="form-container">
                        <h1>Login</h1>
                        <label for="email"><b>Email</b></label>
                        <input type="text" placeholder="Enter Email" name="email" required>
                        <label for="psw"><b>Password</b></label>
                        <input type="password" placeholder="Enter Password" name="psw" required>
                        <button type="submit" class="btn">Login</button>
                        <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
                    </form>
                </div>
            </div>
        </header>
<!-- product section part-->
        <section class="container content-section" id="product">
            <h2 class="section-header">Saree Products</h2>
            <div class="shop-items">
                <%
        	ProductDaoImplement productDAO=new ProductDaoImplement(dataConnection.databaseConnection());
            List<Product> list=productDAO.getAllSareeProduct();
            for(Product product:list){%>
            <div class="shop-item">
                    <span class="shop-item-title"><%=product.getProductName()%></span>
                    <img class="shop-item-image" src="images/<%=product.getProductImage() %>" alt="">
                    <span class="shop-item-category">Category:<%=product.getCategory()%></span>
                    <div class="shop-item-details">
                        <span class="shop-item-price">Rs.<%=product.getProductPrice() %> </span>
                        <%if(user==null){ %>
                        <a href="Login.jsp" ><button class="btn btn-primary shop-item-button" type="button">ADD TO CART</button></a>
                        <%}else{ %>
                        <a href="cart?productId=<%=product.getProductId() %>" class="btn btn-primary shop-item-button" type="button">ADD TO CART</a>
                        <%} %>
                    </div>
             </div>
          <%} %>
            </div>
        </section>
        <div id="cartModel" class="cart">
            <div class="cart-content">
                <span class="cart-close">&times;</span>
                <section class="container content-section" id="cart">
                    <h2 class="section-header"><span>Cart</span></h2>
                    <div class="cart-row">
                        <span class="cart-item cart-header cart-column"><i class="fas fa-list-alt"></i> ITEM</span>
                        <span class="cart-price cart-header cart-column"><i class="fas fa-money-check-alt"></i> PRICE</span>
                        <span class="cart-quantity cart-header cart-column"><i class="fas fa-sort-amount-up"></i> QUANTITY</span>
                    </div>
                    <div class="cart-items"></div>
                    <div class="cart-total">
                        <strong class="cart-total-title">Total</strong>
                        <span class="cart-total-price">Rs.0</span>
                    </div>
                    <button class="btn btn-primary btn-purchase" type="button" onclick="checkout()">checkout</button>
                </section>
            </div>
        </div>
</body>
</html>