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
	href="<c:url value="/resources/css/styleForNavbar.css" />" />

<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script src="<c:url value="/resources/js/angular.js"/>"></script>
</head>
<div class="container" id="main">
<%@ include file="/WEB-INF/views/PagePlugIns/Navbar.jsp" %>
<br><br><br><br><br><br><br><br>
<body>
<h1>Add a Supplier</h1>

		<c:url var="addAction" value="/supplier/add"></c:url>

		<form:form action="${pageContext.request.contextPath}/admin/supplier/add"
			commandName="supplierCommand" enctype="multipart/form-data">
			<table>

				<tr>
					<td><label for="supplier_id"> Supplier ID</label></td>
					<c:choose>
						<c:when test="${!empty supplierCommand.supplier_id}">
							<td><form:input path="supplier_id" id="supplier_id" readonly="true" /></td>
						</c:when>
						<c:otherwise>
							<td><form:input path="supplier_id" id="supplier_id" required="true"
									title="id should contains 6 to 7 characters" /></td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<td>Supplier Name</td>
					<td><form:input path="supplier_name" id="supplier_name" /></td>
					<td><form:errors path="supplier_name" cssClass="error">Name</form:errors></td>
				</tr>
				<tr>
					<td>Email</td>
					<td><form:input path="supplier_email" /></td>
					<td><form:errors path="supplier_email" cssClass="error"></form:errors></td>
				</tr>
				
				<tr>
					<td>Mobile Number</td>
					<td><form:input path="supplier_mobile_no" /></td>
					<td><form:errors path="supplier_mobile_no" cssClass="error"></form:errors></td>
				</tr>
				
				<tr>
					<td><form:label path="image">Image</form:label></td>
					<td><form:input type="file" path="image" /></td>
				</tr>
				
				<tr>
					<td colspan="2"><c:if test="${!empty supplierCommand.supplier_name}">
							<input type="submit" value="Edit" />
						</c:if> <c:if test="${empty supplierCommand.supplier_name}">
							<input type="submit" value="Submit" />
						</c:if></td>
				</tr>
			</table>
		</form:form>
		
			<c:if test="${!empty supplier}">
			<h3>Supplier List</h3>
			<table class="table table-bordered table-striped" id="suppliertable">
				<tr>
					<th width="80">Supplier ID</th>
					<th width="120">Supplier Name</th>
					<th width="80">Supplier Email</th>
					<th width="80">Supplier Mobile</th>
					<th>Image </th>
					<th width="80">Edit</th>
					<th width="80">Delete</th>
				</tr>
				<tbody>
					<c:forEach var="pro" items="${supplier}">
						<tr>
							<td>${pro.supplier_id}</td>
							<td>${pro.supplier_name}</td>
							<td>${pro.supplier_email}</td>
							<td>${pro.supplier_mobile_no}</td>
							<td><img src="<c:url value="/resources/images${pro.supplier_id}.png"/>"></td>
							<td><a href="<c:url value="/admin/supplier/edit/${pro.supplier_id}" />"><span class="glyphicon glyphicon-pencil"></span> Edit</a></td>
							<td><a href="<c:url value="/admin/supplier/remove/${pro.supplier_id}" />"><span class="glyphicon glyphicon-trash"></span> Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>


</body>
</div>

<%@ include file="/WEB-INF/views/PagePlugIns/Footer.jsp" %>
</html>