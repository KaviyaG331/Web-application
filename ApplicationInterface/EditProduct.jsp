<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="dataBase.dataConnection"%>
<%@page import="java.sql.*"%>
<%@page import="Dao.ProductDaoImplement"%>
<%@page import="UserInterface.Product" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit product</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style type="text/css">
.back
{
  color: black;
  margin-left: 2.5%;
}
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: sans-serif;
}
body{
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  background: #4070f4;
}
.wrapper{
  position: relative;
  max-width: 430px;
  width: 100%;
  background: #fff;
  padding: 34px;
  border-radius: 6px;
  box-shadow: 0 5px 10px rgba(0,0,0,0.2);
}
.wrapper h2{
  align-items:center;
  position: relative;
  font-size: 30px;
  font-weight: 600;
  color: #333;
}
.wrapper h2::before{
  content: '';
  position: absolute;
  left: 0;
  bottom: 0;
  height: 3px;
  width: 28px;
  border-radius: 12px;
  background: #4070f4;
}
.wrapper form{
  margin-top: 30px;
}
.wrapper form .input-box{
  height: 52px;
  margin: 18px 0;
  margin-top:10%;
}
.wrapper form .input-box label{
  display: inline-block;
  margin-bottom:5px;
}
form .input-box input{
  height: 100%;
  width: 100%;
  outline: none;
  padding: 0 13px;
  font-size: 17px;
  font-weight: 400;
  color: #333;
  border: 1px solid #C7BEBE;
  border-radius: 4px;
  transition: all 0.3s ease;
}
form .input-box select{
  height: 100%;
  width: 100%;
  outline: none;
  padding: 0 13px;
  font-size: 17px;
  font-weight: 400;
  color: #333;
  border: 1px solid blue;
  border-radius: 4px;
  transition: all 0.3s ease;
}
.input-box input:focus,
.input-box input:valid{
  border-color: #4070f4;
}
form .policy{
  display: flex;
  align-items: center;
}
form h3{
  color: #707070;
  font-size: 14px;
  font-weight: 500;
  margin-left: 10px;
}
form .text h3{
 color: #333;
 width: 100%;
 text-align: center;
}
form .text h3 a{
  color: #4070f4;
  text-decoration: none;
}
form .text h3 a:hover{
  text-decoration: underline;
}
form .btn{
                margin-top: 1rem;
                display: inline-block;
                padding: .5rem 1rem;
                font-size: 1.5rem;
                align-items: center;
                border-radius: .5rem;
                border: .2rem solid white;
                color:white;
                cursor: pointer;
                background: blue;
            }
            .btn:hover{
                background: #666;
                color: #fff;
            }
.alert
{
	color:black;
	font-size:25px;
}
</style>
</head>
<body>
  <div class="wrapper">
    <h2>Edit Product</h2>
    <form action="../EditProduct" method="post">
	<%
	int id=Integer.parseInt(request.getParameter("id"));
	ProductDaoImplement productDAO=new ProductDaoImplement(dataConnection.databaseConnection());
	Product product=productDAO.getProductById(id);
	%>
	<h3 style="color: black; font-size:20px; margin-top:2%;">Product ID: <%out.println(id); %></h3>
	<input type="hidden" name="id" value="<%out.println(id); %>">
      <div class="input-box">
      	<label for=inputState>Product Name</label>
        <input type="text" name="productName" value="<%=product.getProductName() %>">
      </div>
      <div class="input-box">
      <label for=inputState>Product Price</label>
        <input type="number" name="productPrice" value="<%=product.getProductPrice() %>">
      </div>
      <div class="input-box">
      <label for=inputState>Product Status</label>
      <select id="inputState" name="status" >
      <% 
      if("Active".equals(product.getStatus())){
      %>
      <option value="Active">Active</option>
      <option value="Inactive">Inactive</option>
      <%
      }
      else{%>
      <option value="Inactive">Inactive</option>
      <option value="Active">Active</option>
      <%}%>
        </select>
      </div>
      <button type="submit" class="btn">Update</button>
    </form>
  </div>
</body>
</html>