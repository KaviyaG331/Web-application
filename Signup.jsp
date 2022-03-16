<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Sign up</title>
        <style>
            body{
                background-image: url("Pictures/piqsels.com-id-zbfdf.jpg");
                background-repeat: no-repeat;
                background-size: 100% 100%;
            }
            /* Body{
                font-family: Arial, Helvetica, sans-serif;
                background-color: darkgray;
            } */
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }
            .container{
                padding: 16px;
                text-align: left;
            }
            .whysign {
  				float: left;
  				border-radius: 0 5px 5px 0;
  				padding-top: 10px;
  				padding-right: 50px;
			}
			.h1{
				float: top;
				text-align: right;
			}
			
      		input[type=text],input[type=email],input[type=password]{
                width: 15%;
                padding: 0.5%;
                margin: 5px 0 22px 0;
                display: inline-block;
                border: none;
                outline: none;
                background: whitesmoke;
            }
            input[type=text]:focus,input[type=email]:focus,input[type=password]:focus{
                background-color: rgb(154, 197, 204);
                outline: none;
            }
            .registerbtn{
                background-color: rgb(111, 224, 217);
                color: black;
                padding: 16px 20px;
                margin: 8px;
                cursor: pointer;
                width: 15%;
                opacity: 0.9;
            }
            .registerbtn:hover{

                opacity: 1;
            }
            a{
                color: cadetblue;
            }
        </style>
	</head>
	<body>
		<div class="container">
            <form action="Signup" method="post" >
                <h1>Register</h1> 
                <p>Create a New Account</p>
                <label>User Name</label><br>
                <input type="text" name="name" placeholder="Enter your Name" id="username" required>
                <br />
                <label>Email</label><br>
                <input type="email" name="email" placeholder="Enter your Mail Id" id="emailid"required>
                <br />
                <label>Phone Number</label><br>
                <input type="text" name="phonenumber" placeholder="Enter your Phone Number" id="phonenumber" required>
                <br />
                <label>Password</label><br>
                <input type="password" name="password" placeholder="Enter your password" id="pass" required>
                <br />
                <label>Re-Password</label><br>
                <input type="password" name="repassword" placeholder="Re-enter your password" id="re-pass" required>
                <p>By creating an account you agree to our <a href="#">Terms and Conditions</a> </p>
                <input type="submit" value="Sign Up" onclick="myfunctionSignup()"> 
                <p>Already have Account?<a href="Login.jsp">Login</a></p>
            </form>
        </div>
        <div class='whysign'>
<% 
String msg=request.getParameter("msg");
if("valid".equals(msg))
{
%> <h1>Successfully Created an Account Please Login to Continue</h1>
<%} %>
<%
if("invalid".equals(msg))
{
%>
<h1>Some thing Went Wrong! Try Again !</h1>
<%} %>
    </div>
        <script type="text/javascript" src="valid.js"></script>
	</body>
</html>