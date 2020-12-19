<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Java Belt Exam</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
     <div class="container">  
      	<div>
			<a href="/logout">logout</a>
	    </div>  
        <h1>Welcome, <c:out value="${user.name}"></c:out></h1>
        <div>
               <table>
                   <tr>
                       <th>Title</th>
                       <th>Networks</th>
                       <th>Added by</th>
                       <th>Average rating</th>
                   </tr>
                   <c:forEach items="${allShows}" var="show">
                      <tr>
                          <td><a href="/show/${show.id}">${show.title}</a></td>
                          <td>${show.network}</td>
                          <td>${show.user.name}</td>
                          <td>${show.getAverageRating()}</td>
                      </tr>
                   </c:forEach>
                </table>
        </div>
        <a href="/shows/new">Add a show</a>
    </div>
    
</body>
</html>