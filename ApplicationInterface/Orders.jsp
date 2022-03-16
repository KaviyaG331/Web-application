<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Orders</title>
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
#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
  font-size:1.7rem;
   margin-top:1.5%;
}

#customers td, #customers th {
  border: 0.5px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background:#094e92;
  color: white;
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
<table id="customers">
          <tr>
          <th>Order Id</th>
            <th scope="col">Name</th>
            <th scope="col">Email Id</th>
            <th>Address</th>
             <th>City</th>
            <th>State</th>
            <th>Country</th>
            <th scope="col">Phone Number</th>
             <th scope="col">Product Name</th>
             <th scope="col">Price</th>
              <th scope="col">Payment</th>
          </tr>
          
          <tr>
          <td>1</td>
            <td>Kaviya</td>
            <td>kaviya@gmail.com</td>
                <td>add</td>
                <td>city</td>
                <td>state</td>
                <td>country</td>
               <td>8838415100</td>
                <td>black saree</td>
                 <td>1500</td>
             <td>Paid</td>
            </tr>
         
        </table>
      <br>
      <br>
      <br>
</body>
</html>