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
<title>Java Belt Exam - Edit show</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
     <div>    
        <h1>Edit ${someShow.title}</h1>
	       <div>
	       		<a href="/logout">logout</a>
		       	<a href="/shows">Home</a>
		       
	       </div>
        <div>
           <div>
               <form:form action="/show/update/${someShow.id}" method="post" modelAttribute="someShow">
                   <div class="form-group">
                       <label>Title</label>
                       <form:input path="title" placeholder="${someShow.title}"/>
                       <form:errors path="title" />
                   </div>
                   <div class="form-group">
                       <label>Network</label>
                       <form:input path="network" placeholder="${someShow.network}"/>
                       <form:errors path="network" />
                   </div>
                   <input type="submit" value="edit Show" />
               </form:form> 
                   <form action="/shows/destroy/${someShow.id}" method="post">
		    		<input type="hidden" name="_method" value="delete">
		    		<input type="submit" value="Delete">
				</form>
           </div>
        </div>
    </div>
</body>
</html>