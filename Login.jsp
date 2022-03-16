	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" 
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>
            Login
        </title>
        <script src="valid.js"></script>
        <style>
            body{
                font-family:Arial, Helvetica, sans-serif;
                background-color: cadetblue;
            }
            input[type=text], input[type=password]{
                width: 15%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid rgb(207, 196, 196);
                /* border-radius: 10% 10%; */
                box-sizing: border-box;
            }
            input[type=text]:focus, input[type=password]:focus{
                outline: 0;
            }
            .modal input[type=text]:focus, input[type=password]:hover{
                cursor: text;
            }
            input[type=submit]{
                background-color: darkblue;
                width: 10%;
                color: honeydew;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                cursor: pointer;

            }
            /* button{
                background-color: green;
                color: honeydew;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                cursor: pointer;
                width: 10%;
            }
            button:hover{
                opacity: 0.8;
            } */
            .imgcontainer{
                /* text-align: 
                ; */
                width: 60%;
                top: 18%;
                left: 33%;
                transform: translate(-50%,-50%);
                margin: 40px 0 40px 0;
                position: fixed;
                padding: 1px 1px;
                border-radius: 20px;
            }
            img.login{
                
                width: 30%;
                border-radius: 100%;
            }
            .modal{
                background-image: url("images/1638121389096.jpg");
                background-repeat: no-repeat;
                background-size: 100% 100%;
                overflow: auto;
                padding-top: 0px;
                width: 100%;
                height: 100%;
                top: 0%;
                left: 0%;
                z-index: 1;
                position: fixed;
            }
            .modal-content{
                margin: 10% auto 100% auto;
                width: 100%;
            }
            .container{
                text-align: left;
                padding: 10px;
                position: relative;
            }
            span.psw{
                float: right;
                padding-top: 16px;
            }
            /* .registerbtn{
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
            } */

            #error{
                color: red;
                text-align: center;
            }
            
		</style>
</head>
<body>
	<div class="modal">
		<form action="Login" method="post">
        	<h1>LOGIN to LUXURY GOWNS</h1>
        	<%
	String alertMessage=request.getParameter("alertMessage");
	if("success".equals(alertMessage)){
	%>
	<h3 class="alert">Logout Successfully!</h3>
	<%} %>
            <div class="container">
            	<label>Username</label><br>
	            <input type="text" id="name" placeholder="Enter your Name" name="username"/>
                <br>
                <label>Password</label><br>
                <input type="password" id="pwd" placeholder="Enter your password" name="password"/>
                <br>
                <input type="submit" value="Login" onclick="myfunction()">
                <label>
                    <p><a href="forget.jsp">Forget password</a></p>
                </label>
                <label>
                    <p>No account?<a href="Signup.jsp">Sign UP</a></p>
                </label>
             </div>
         </form>
	</div>
    <script type="text/javascript" src="valid.js"></script> 
</body>
</html>