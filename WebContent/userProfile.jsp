<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="style.css">
<link rel="stylesheet" type="text/css" href="style2.css">
<%@ page import="java.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<style type="text/css">
	#title {
		color:#078898;
		font-size:19px;
	}
	tr.spaceUnder>td {
		padding-bottom: 1em;
	}
	.bt{
		height:40px;	
		width:100px;
		background-color:#078898;
		border:0;
		color:white;
	}
	.btn:hover,.bt:hover{
		background-color:silver;
		color:#078898;
	}
	hr.split {
       display: block;
       position: relative;
       padding: 0;
       margin: 8px auto;
       height: 0;
       width: 100%;
       max-height: 0;
       font-size: 1px;
       line-height: 0;
       clear: both;
       border: none;
       border-top: 1px solid #aaaaaa;
       border-bottom: 1px solid #ffffff;
    }
    td{
    	text-align:left;
    }
    table{
    	background-color:#EBEBEB;
    }
</style>
<title>User Profile</title>
</head>
<body>
	<%
	response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
	String logStatus = (String)session.getAttribute("logStatus");
	if(logStatus=="false"||logStatus==""||logStatus==null){
		response.sendRedirect("login.jsp");
	}else{
	String firstName = (String)session.getAttribute("firstName");
	if(firstName=="null"||firstName=="na"||firstName==""){
		System.out.println(firstName);
	}
	%>
	<div id="navbar">	
	</div>
		<div class="container">		
			<ul class="navigationBar">
				<div id="logoArea">
					<li class="logo"><a href="index.jsp" style="font-family:logo;font-size:33px;">4Cknowledge</a></li>
				</div>
				<div id="navArea">
					<li class="nav"><a class="active" href="index.jsp">Home</a></li>
						<%String role = (String)session.getAttribute("role");
						String Cemail= (String)session.getAttribute("email");
						if(firstName==null||firstName==""){
							%><li class="nav"><a href="register.jsp">Login/Register</a></li><%
						}else if(role.equals("Admin")){
							%><li class="nav"><a href="adminPanel.jsp"><%=firstName%></a></li><%
						}else {
							%><li class="nav"><a href="searchMember?to=userProfile&email=<%= Cemail%>"><%=firstName%></a></li><%
						}%>
					<li class="nav"><a href="viewBooks.jsp">Books</a></li>
					<li class="nav"><a href="aboutUs.jsp">About Us</a></li>
					<li class="nav"><a href="contactUs.jsp">Contact Us</a></li>	
				</div>
			</ul>
		
			
			<br><br><br>
			<img class="header" src="header/header.jpg" alt="Norway" width="1000" height="300">
		
			<br>
		
			<div id="basicSidebar">
				<img src="gif/giphy.gif" width="360px" style="text-align:center;"><br>
				<img src="gif/gifs.gif" width="360px" style="text-align:center;"><br>
				<img src="gif/gif3.gif" width="360px" style="text-align:center;">
				
			</div>
			<div id="main">
			<br>
			<h3>Member details.</h3>
			<hr>	
			<br>
			<%//Saving data that recieving from the servlet to variables
				String msg = (String)request.getAttribute("msg"); 
		  		if(msg != null && !msg.isEmpty()){
		  			if(msg.equals("updated"))
						out.println("<p  style=\"color:green;font-size:13px;\"> Your details updated.</p>");
		  		}
		  	%>
			<%//Saving data that recieving from the servlet to variables
				String userFirstName = (String)request.getAttribute("firstName");
				String	lastName  = (String)request.getAttribute("lastName");
				String dob = (String)request.getAttribute("dob");
				String email = (String)request.getAttribute("email");
				String pAddress = (String)request.getAttribute("pAddress");
				String cAddress = (String)request.getAttribute("cAddress");
				String mobile = (String)request.getAttribute("mobile");
				String telephone = (String)request.getAttribute("telephone");
				String userRole = (String)request.getAttribute("role");
				String interest = (String)request.getAttribute("interest");
		  	%>	  		
			<table>
			<tr>
				<td><p id="title"><b><%=userFirstName%></b></p></td>
				<td style="text-align:left;'"><p id="title"><b><%=lastName%></b></p></td>
			</tr>
			<tr>
				<td>Email :</td>
				<td><b><%=email%></b></td>
			</tr>
			<tr >
				<td>Mobile :</td>
				<td style="text-align:left;"><b><%=mobile %></b></td>
				<td>Birth Date :</td>
				<td><b><%=dob%></b></td>
			</tr>
			<tr >
				<td>Telephone :</td>
				<td style="text-align:left;"><b><%=telephone%></b></td>
				<td>Role :</td>
				<td><b><%=userRole%></b></td>
			</tr>
			<tr >
		</table>
		<table>
				<td>Current Address :</td>
				<td style="text-align:left;"><b><%=cAddress%></b></td>
			</tr>
			<tr >
				<td>Perm. Address :</td>
				<td style="text-align:left;"><b><%=pAddress%></b></td>
			</tr>
			<tr >
				<td>Interest :</td>
				<td style="text-align:left;"><b><%=interest%></b></td>
			</tr>
		</table>
		<table>
			<tr>
			<%if(role.equals("cAdmin")){%>
				<td><a href = "adminMemberView.jsp"><input type="button" class="bt" value="View Members"></td><%
			}if(!role.equals("Admin")){%>
				<td><a href = "searchMember?to=editProfile&email=<%=email%>"><input type="button" class="bt" value="Edit Profile"></td><%
			}%>
				<td><a href = "logout"><input type="button" class="bt" value="Logout"></td>
			</tr>
		</table>  
		</div>
	</div>
		
	<footer id="footer" style="float:right; width:100%;">
		<div class="container">
			<br><br>
			<p class="foot" style="margin-left:350px;">Copyright  © </p><p class="foot" style="font-family:'logo';"> 4Cknowledge</p><p class="foot"> , 2018 - All Right Reserved.</p>
		</div>
	</footer>
	<%} %>
</body>
</html>