<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="dataBase.dataConnection"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add product</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style type="text/css">
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
  background: #062068;
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
  background: #094e92;
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
  border: 1px solid #094e92;
  border-radius: 4px;
  transition: all 0.3s ease;
}
.input-box input:focus,
.input-box input:valid{
  border-color: #094e92;
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
  color: #094e92;
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
                background: #094e92;
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
.back
{
  color: black;
  margin-left: 2.5%;
}
</style>
</head>
<body>
  <div class="wrapper">
    <h2>Add Product</h2>
    <form action="../AddProduct" method="post" enctype="multipart/form-data">
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
int id=1;
try{
	Connection connection=dataConnection.databaseConnection();
	Statement statement=connection.createStatement();
	ResultSet resultset=statement.executeQuery("select max(ProductId) from product");
	while(resultset.next()){
		id=resultset.getInt(1);
		id=id+1;
	}
}
catch(Exception e){
	
}
%>
<h3 style="color: black; font-size:20px; margin-top:2%;">Product ID: <%out.println(id); %></h3>
<input type="hidden" name="id" value="<%out.println(id); %>">
      <div class="input-box">
      	<label for=inputState>Product Name</label>
        <input type="text" name="productName">
      </div>
      <div class="input-box">
      <label for=inputState>Product Price</label>
        <input type="number" name="productPrice">
      </div>
      <div class="input-box">
      <label for=inputState>Product Category</label>
        <select id="inputState" name="category">
        <option value="select">Select</option>
        <option value="Kurti">Kurti</option>
        <option value="LongGown">LongGown</option>
        <option value="Saree">Saree</option>
        </select>
      </div>
      <div class="input-box">
      <label for=inputState>Product Status</label>
      <select id="inputState" name="status" >
      <option value="select">Select</option>
        <option value="Active">Active</option>
        <option value="Inactive">Inactive</option>
        </select>
      </div>
      <div class="input-box">
      <label for=image>Upload Photo</label>
        <input name="image" type="file" id="image" class="image-file">
      </div>
      <button type="submit" class="btn">Add</button>
    </form>
  </div>
</body>
</html>