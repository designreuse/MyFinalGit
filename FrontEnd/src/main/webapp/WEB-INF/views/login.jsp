<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Login</title>
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

<%@ include file="/WEB-INF/views/PagePlugIns/Navbar.jsp" %>

	<br><br><br><br><br><br><br><br><br><br>

<div class="container">
<div id="login-box">

<p><a href="<c:url value="https://accounts.google.com/o/oauth2/auth?
 scope=email&
 redirect_uri=http://localhost:9002/FrontEnd&
 response_type=code&
 client_id=1043425508145-of9vqebtu543cv380m1kc2mrgdr8l49b.apps.googleusercontent.com&
 approval_prompt=force"/>" 
 class="btn btn-danger" role="button" aria-haspopup="true" aria-expanded="false"> Login With Google </a> </p>

<h2> Login with Username and Password</h2>
<c:if test="${not empty msg}">
<div class="msg">${msg}</div>
</c:if>
<form name="loginForm" action="<c:url value="/j_spring_security_check"/>" method="post">
<c:if test="${not empty error}">
<div class="error" style="color:#ff0000;">${error}</div>
</c:if>
<div class="form-group">
<label for="username"> User: </label>
<input type="text" id="username" name="username" class="form-control"/>
</div>
<div class="form-group">
<label for="password"> Password: </label>
<input type="password" id="password" name="password" class="form-control"/>
</div>
<input type="submit" value="Submit" class="btn btn-default">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

</form>


</div>
</div>


</div>
<br> <br> <br>
<%@ include file="/WEB-INF/views/PagePlugIns/Footer.jsp"%>
</html>