<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Java Belt Exam - Login Page</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <div class="container">
    <div>
    	<h1>Login/Register</h1>
    </div>
    <c:if test="${user != null}">
    	<div>Welcome back ${user.name} ---><a href="/shows">home</a></div>
    </c:if>
    <div>
    	<div>
    		<div>
    			<div id="formHead">Register:</div>
    				<div>
    				<form:form action="register" method="post"
    			modelAttribute="registerringUser">
			<div>
				<label>Name</label>
				<form:input path="name"/>
				<form:errors path="name"/>
			</div>
    		
			<div>
				<label>Email</label>
				<form:input path="email"/>
				<form:errors path="email"/>
			</div>
			<div>
				<div>
					<label>password</label>
					<form:input type="password" path="password"/>
					<form:errors  path="password"/>
				</div>
				<div>
					<label>Confirm Password</label>
					<form:input type="password" path="confirmPassword"/>
					<form:errors path="confirmPassword"/>
				</div>
    		</div>
			<input  type="submit" value="Register"/>
		 </form:form> 
    				</div>
    		</div>
    	</div>
    	<div>
    		<div>
    			<div id="formHead">Login:</div>
    				<div>
					   <form:form action="/login" method="post"
			    			modelAttribute="loginUser">
						<div>
							<label>Email</label>
							<form:input path="email" />
							<form:errors path="email" />
						</div>
						<div>
							<label>password</label>
							<form:input type="password" path="password"/>
							<form:errors  path="password"/>
						</div>
						<input type="submit" value="login"/>
					   </form:form> 
    				</div>
    			</div>
		   	</div>
		   </div>
    </div>
</body>
</html>