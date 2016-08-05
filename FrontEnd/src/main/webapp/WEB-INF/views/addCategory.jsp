<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>All Category</title>
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
<div class="container" id="main"><%@ include file="/WEB-INF/views/PagePlugIns/Navbar.jsp" %>
<br><br><br><br><br>
<body>
<h1>Add a Category</h1>

		<c:url var="addAction" value="/category/add"></c:url>

		<form:form action="${pageContext.request.contextPath}/admin/category/add"
			commandName="categoryCommand" enctype="multipart/form-data">
			<table>

				<tr>
					<td><label for="category_id">ID</label></td>
					<c:choose>
						<c:when test="${!empty categoryCommand.category_id && categoryCommand.category_id != null}">
							<td><form:input path="category_id" id="category_id" readonly="true" /></td>
						</c:when>
						<c:otherwise>
							<td><form:input path="category_id" id="category_id" required="true"
									title="id should contains 6 to 7 characters" /></td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<td>Category Name</td>
					<td><form:input required="true" path="category_name" id="category_name" /></td>
					<td><form:errors path="category_name" cssClass="error">Name</form:errors></td>
				</tr>
				<tr>
					<td>Description</td>
					<td><form:input required="true" path="description" /></td>
					<td><form:errors path="description" cssClass="error"></form:errors></td>
				</tr>
				
				<tr>
					<td colspan="2"><c:if test="${!empty categoryCommand.category_name}">
							<input type="submit" value="Edit" />
						</c:if> <c:if test="${empty categoryCommand.category_name}">
							<input type="submit" value="Submit" />
						</c:if></td>
				</tr>
			</table>
		</form:form>
		
		
			<c:if test="${!empty category}">
			<h3>Category List</h3>
			<table class="table table-bordered table-striped" id="categorytable">
				<tr>
					<th width="80">ID</th>
					<th width="120">Name</th>
					<th width="80">Description</th>
					<th width="80">Edit</th>
					<th width="80">Delete</th>
				</tr>
				<tbody>
					<c:forEach var="pro" items="${category}">
						<tr>
							<td>${pro.category_id}</td>
							<td>${pro.category_name}</td>
							<td>${pro.description}</td>
							<td><a href="<c:url value="/admin/category/edit/${pro.category_id}" />"><span class="glyphicon glyphicon-pencil"></span> Edit</a></td>
							<td><a href="<c:url value="/admin/category/remove/${pro.category_id}" />"><span class="glyphicon glyphicon-trash"></span> Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	

</body>
</div>
<%@ include file="/WEB-INF/views/PagePlugIns/Footer.jsp" %>
