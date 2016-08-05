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
<div class="container" id="main">
<body>

<%@ include file="/WEB-INF/views/PagePlugIns/Navbar.jsp" %>

	<br><br><br><br><br><br><br><br><br><br>
	<div class="container" id="categoryTable">
		<style>
table, th, td {
	border: 1px solid grey;
	border-collapse: collapse;
	padding: 15px;
}

table tr:nth-child(odd) {
	background-color: #f1f1f1;
}

table tr:nth-child(even) {
	background-color: #ffffff;
}
</style>
		<h1>Add a Product</h1>

		<c:url var="addAction" value="/product/add"></c:url>

		<form:form action="${pageContext.request.contextPath}/admin/product/add"
			commandName="productcommand" enctype="multipart/form-data">
			<table>

		<%-- 		<tr>
					<td><label for="pid">ID</label></td>
					<c:choose>
						<c:when test="${!empty productcommand.pid}">
							<td><form:input path="pid" id="pid" readonly="true" /></td>
						</c:when>
						<c:otherwise>
							<td><form:input path="pid" id="pid" required="true"
									title="id should contains 6 to 7 characters" /></td>
						</c:otherwise>
					</c:choose>
				</tr> --%>
				<tr>
					<td>Name</td>
					<td><form:input path="name" id="name" /></td>
					<td><form:errors path="name" cssClass="error">Name</form:errors></td>
				</tr>
				<tr>
					<td>Price</td>
					<td><form:input path="price" /></td>
					<td><form:errors path="price">price</form:errors></td>
				</tr>
				
			<tr>	
			<td>Supplier</td>
				 <td><form:select path="supplier.supplier_name" items="${supplierList}" itemValue="supplier_name" itemLabel="supplier_name" /></td>
			</tr>
			
			<tr>
				<td>Category</td>
				<td><form:select path="category.category_name" items="${categoryList}" itemValue="category_name" itemLabel="category_name" /></td>
			</tr>

				<tr>
					<td>Brand</td>
					<td><form:input path="brand" /></td>
					<td><form:errors path="brand" cssClass="error">
						</form:errors>
				</tr>
				<tr>
					<td><form:label path="image">Image</form:label></td>
					<td><form:input type="file" path="image" /></td>
				</tr>
				<tr>
					<td colspan="2"><c:if test="${!empty productcommand.name}">
							<input type="submit" value="Edit" />
						</c:if> <c:if test="${empty productcommand.name}">
							<input type="submit" value="Submit" />
						</c:if></td>
				</tr>
			</table>
		</form:form>
		<br>
		
		<c:if test="${!empty product}">
		<h3> Product Table </h3>

			<table class="table table-bordered table-striped" id="categorytable">
				<tr>
					<th width="80">ID</th>
					<th width="120">Name</th>
					<th width="80">Brand</th>
					<th width="80">Price</th>
					<th width="80">Category Name</th>
					<th width="80">Supplier Name</th>
					<th >Image</th>
					<th width="80">Edit</th>
					<th width="80">Delete</th>
					<th width="80">View</th>
				</tr>
				<tbody>
					<c:forEach var="pro" items="${productList}">
						<tr>
							<td>${pro.pid}</td>
							<td>${pro.name}</td>
							<td>${pro.brand}</td>
							<td>${pro.price}</td>
							<td>${pro.category.category_name}</td>
							<td>${pro.supplier.supplier_name}</td>
							<td><img src="<c:url value="/resources/images${pro.pid}.png"/>"></td>
							<td><a href="<c:url value="/admin/product/edit/${pro.pid}" />"><span class="glyphicon glyphicon-pencil"></span> Edit</a></td>
							<td><a href="<c:url value="/admin/product/remove/${pro.pid}" />"><span class="glyphicon glyphicon-trash"></span> Delete</a></td>
							<td><a href="<c:url value="/product/viewProducts/${pro.pid}" />"><span class="glyphicon glyphicon-zoom-in"></span> View</a></td>
						</tr>
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
<%@ include file="/WEB-INF/views/PagePlugIns/Footer.jsp" %>
</html>
