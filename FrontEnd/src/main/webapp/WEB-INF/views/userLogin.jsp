<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>User Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.min.css" />" />
<script src="<c:url value="/resources/js/jquery-1.12.4.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<link rel="stylesheet"
	href="<c:url value="/resources/css/styles.css" />" />

<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script src="<c:url value="/resources/js/angular.js"/>"></script>
</head>
<div class="container" id="main">
<body>

<%@ include file="/WEB-INF/views/PagePlugIns/Navbar.jsp"%>

	<br><br><br>

	<div class="container" id="userTable">

		<center><h1>Register Here</h1>

		<c:url var="addAction" value="/product/add"></c:url>

		<form:form action="${pageContext.request.contextPath}/user/add"
			commandName="userCommand" enctype="multipart/form-data">
			<table>

				<tr>
					<td><label for="user_id">ID</label></td>
					<c:choose>
						<c:when test="${!empty userCommand.user_id}">
							<td><form:input path="user_id" id="user_id" readonly="true" /></td>
						</c:when>
						<c:otherwise>
							<td><form:input path="user_id" id="user_id" required="true"
									title="id should contains 6 to 7 characters" /></td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<td>UserName</td>
					<td><form:input path="user_name" id="user_name" required="true" /></td>
					<td><form:errors path="user_name" cssClass="error">Name</form:errors></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><form:input path="password" type = "password" required="true" /></td>
					<td><form:errors path="password" cssClass="error"></form:errors></td>
				</tr>
				<tr>
					<td>Email ID</td>
					<td><form:input type="email" path="email_id" required="true" /></td>
					<td><form:errors path="email_id">price</form:errors></td>
				</tr>
				<tr>
					<td>Mobile Number</td>
					<td><form:input type="tel" path="mobile_no" required="true" /></td>
					<td><form:errors path="mobile_no" cssClass="error">
						</form:errors>
				</tr>
				<tr>
					<td><form:label path="image" >Image </form:label></td>
					<td><form:input type="file" path="image" required="true"/></td>
				</tr>	
				</table>
				<%-- <div class="form-group">
                <label class="control-label" for="image">Upload Picture</label>
                <br><br><br>
                <form:input id="image" path="image" type="file" class="form:input-large" size="50"/>
            </div>
 --%>
				<table>
				<h3> BILLING ADDRESS DETAILS </h3>
				<tr>
					<td>House Number</td>
					<td><form:input path="billingAddress.house_no" id="house_no" required="true"/></td>
				</tr>
				<tr>
					<td>Street Name/Number</td>
					<td><form:input path="billingAddress.street_name" id="street_name" required="true"/></td>
				</tr>
				<tr>
					<td>Society</td>
					<td><form:input path="billingAddress.society" type = "text" required="true"/></td>
				</tr>
				<tr>
					<td>City</td>
					<td><form:input path="billingAddress.city" required="true"/></td>
				</tr>
				<tr>
					<td>State</td>
					<td><form:input path="billingAddress.state" required="true"/></td>
				</tr>
				<tr>
					<td>Country</td>
					<td><form:input path="billingAddress.country" required="true"/></td>
				</tr>
				<tr>
					<td>Zip/Pin Code</td>
					<td><form:input path="billingAddress.zip_code" required="true"/></td>
				</tr>	
				</table>
			<hr color="black">
				<h3> SHIPPING ADDRESS DETAILS </h3>
					<table>			
				<tr>
					<td>House Number</td>
					<td><form:input path="shippingAddress.house_no" id="house_no" required="true"/></td>
				</tr>
				<tr>
					<td>Street Name/Number</td>
					<td><form:input path="shippingAddress.street_name" id="street_name" required="true"/></td>
				</tr>
				<tr>
					<td>Society</td>
					<td><form:input path="shippingAddress.society" type = "text" required="true"/></td>
				</tr>
				<tr>
					<td>City</td>
					<td><form:input path="shippingAddress.city" required="true"/></td>
				</tr>
				<tr>
					<td>State</td>
					<td><form:input path="shippingAddress.state" required="true"/></td>
				</tr>
				<tr>
					<td>Country</td>
					<td><form:input path="shippingAddress.country" required="true"/></td>
				</tr>
				<tr>
					<td>Zip/Pin Code</td>
					<td><form:input path="shippingAddress.zip_code" required="true"/></td>
				</tr>	
				</table>
				
				<br> <br> 
				<%-- <a href="<spring:url value="/registerStar/${user_id}"/>" class="btn btn-success pull-right"><span class="glyphicon glyphicon-shopping-plus"></span> Register </a>
				 --%>
				 <table>
				<tr>
					<td colspan="2"><c:if test="${!empty userCommand.user_name}">
							<input type="submit" value="Edit" />
						</c:if> <c:if test="${empty userCommand.user_name}">
							<input type="submit" value="Submit" /><span class="glyphicon glyphicon-shopping-plus"></span>
						</c:if></td>
				</tr>
			</table>
			
			
</center>			
		</form:form>
		
		<c:if test="${!empty user}">
			<h3>User List</h3>
			<table class="table table-bordered table-striped" id="categorytable">
				<tr>
					<th width="80">userID</th>
					<th width="120">UserName</th>
					<th width="80">Password</th>
					<th width="80">EmailID</th>
					<th width="80">Mobile Number</th>
					<th width="80">Image</th>
					<th width="80">Edit</th>
					<th width="80">Delete</th>
				</tr>
				<tbody>
					<c:forEach var="pro" items="${userList}">
					<c:choose>
					<c:when test="${pro.enabled == true}">
						<tr>
							<td>${pro.user_id}</td>
							<td>${pro.user_name}</td>
							<td>${pro.password}</td>
							<td>${pro.email_id}</td>
							<td>${pro.mobile_no}</td>
							<td><img src="<c:url value="/resources/images${pro.user_id}.png"/>"></td>
							<td><a href="<c:url value="/user/edit/${pro.user_id}" />">Edit</a></td>
							<td><a href="<c:url value="/user/remove/${pro.user_id}" />">Delete</a></td>
						</tr>
					</c:when>
					</c:choose>	
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	</div>


	<!--  </div> -->
	<br>
	<br>
	<br>


</body>
</div>

<%@ include file="/WEB-INF/views/PagePlugIns/Footer.jsp"%>
</html>