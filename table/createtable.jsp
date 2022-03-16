<%@page import="dataBase.dataConnection"%>
<%@page import="java.sql.*"%>
<%
try{
	Connection connection=dataConnection.databaseConnection();
	Statement statement=connection.createStatement();
	String query="create table user(name varchar(100)primary key,email varchar(100),phonenumber bigint,password varchar(100),repassword varchar(100))";
	String query1="create table product(ProductId int,ProductName varchar(500),ProductPrice int,Category varchar(200),Status varchar(10),ProductImage varchar(200))";
	//String query2="create table cart(CartId Int,ProductId Int,ProductName varchar(100),Category varchar(100),Price varchar(100),TotalPrice varchar(100))";
	System.out.println(query);
	System.out.println(query1);
	//System.out.println(query2);
	//statement.execute(query);
	//statement.execute(query1);
	//statement.execute(query2);
	System.out.println("Table created");
	connection.close();
}
catch(Exception e){
	System.out.println(e);
}
%>
