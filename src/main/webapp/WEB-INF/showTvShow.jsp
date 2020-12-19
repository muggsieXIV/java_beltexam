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
<title>Show Tv Shows Page</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <div class="container">  
		<div>
			<a href="/logout">logout</a>
			<a href="/shows">Home</a>      
		</div>  
        <div class="row">
            <div>
                <div>
                    <div><h2>${someShow.title}</h2></div>
                    <div>
                        <h3>Network: ${someShow.network}</h3>
                    </div>
                </div>
            </div>
            <div>
                <ul>
                    <li>Reviews:</li>
                    <c:forEach items="${someShow.reviews}" var="review">
                        <li>
                            <strong>${review.user.name}: ${review.rating} out of 5</strong><br>
                        </li>
                    </c:forEach>
                </ul>
           </div>
           <div>
				<div><h2>Leave a Review</h2></div>
                    <div>
                        <form:form action="/shows/${someShow.id}/review" method="post" modelAttribute="newReview">
                            <div>
 			           			<div>
                                	<label>Rating</label>
                                	<select name="rating">
                                  	  <option>5</option>
                                  	  <option>4</option>
                                   	  <option>3</option>
                                      <option>2</option>
                                	  <option selected>1</option>
                                    </select>
								    <form:errors path="rating"/>	
								</div>
                        	</div>
							<br>
						<input type="submit" value="Review ${someShow.title}" />
					</form:form>
				</div>
			</div>
			<br>
			<a href="/edit/show/${someShow.id}"> Edit ${someShow.title}</a>
        </div>
    </div>
</body>
</html>