<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>All Products</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css" />" />
<script src="<c:url value="/resources/js/jquery-1.12.4.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/styles.css" />" />

<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script src="<c:url value="/resources/js/angular.js"/>"></script>
</head>
<div class="container" id="main">

<%@ include file="/WEB-INF/views/PagePlugIns/Navbar.jsp" %>
<div class="container" id="nameTable">
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

<div ng-app="myApp" ng-controller="mainController">
<input type="text" ng-model="searchtype" placeholder="lets find..." class="inputText pull-right"><br>
<table class="table table-bordered table-striped" id="nametable">
<tr>
<th>first name</th>
<th>last name</th>
<th>points</th>
</tr>
<tbody>
<tr ng-repeat="type in student | filter:searchtype">
<td>{{ type.firstname }}</td>
<td>{{ type.lastname }}</td>
<td>{{ type.points }}</td>
</tr>
</tbody>
</table>

</div>


</div>
<br>
<br>
<br>


</body>
</div>
<%@ include file="/WEB-INF/views/PagePlugIns/Footer.jsp" %>
</html>