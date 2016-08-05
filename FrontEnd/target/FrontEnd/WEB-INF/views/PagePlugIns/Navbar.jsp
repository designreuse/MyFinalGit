<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title> </title>
<meta name="description" content=" " >
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/styleForNavbar.css"/>">
<script src="<c:url value="https://code.angularjs.org/1.3.0-beta.5/angular.js"/>"></script>   
<script src="<c:url value="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js" />"></script>
<script src="<c:url value="/resources/js/angular.min.js"/>"></script> 
<script src="<c:url value="/resources/js/controller.js" />"></script>
</head>
<body>
<script src="<c:url value="/resources/js/jquery-1.12.4.min.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>



	<div class= "navbar navbar-inverse navbar-fixed-top">
		<div class="container">
		<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#myNavbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>

		  	      <span class="icon-bar"></span>
				  <span class="icon-bar"></span>
				  <span class="icon-bar"></span>
		  </button>
		  
		<a class="navbar-brand" href="<c:url value="/"/>"></a> <img src="<c:url value="/resources/images/cart.jpg"/>"  alt="MY LOGO" id="image"></a>
		   </div>
		   <div class="navbar-collapse collapse navbar-responsive-collapse" id="myNavbar">   
			<ul class="nav navbar-nav pull-left">
				<li>
				<a href="<c:url value="/" />"><span class="glyphicon glyphicon-home"></span> Home</a>	
				</li>
				
				<li>
				<a href="<c:url value="/contactUs" />"><span class="glyphicon glyphicon-phone-alt"></span> Contact Us</a>
				</li>
			</ul>
			<ul class="nav navbar-nav pull-right">
			
			<c:if test="${pageContext.request.userPrincipal.name != null}">
			<li>
			<a><span class="glyphicon glyphicon-user">
						</span> Welcome: ${pageContext.request.userPrincipal.name}</a>
			</li>
			<li> 
			<a href="<c:url value="/j_spring_security_logout"/>"><span class="glyphicon glyphicon-off"></span> Logout </a>
			</li>
			<li>
					<a href="<c:url value="/product/ListProducts"/>"><span class="glyphicon glyphicon-th"></span> All Products </a>
			</li>
			<li>
			<a href="<c:url value="/Cart" />"><span class="glyphicon glyphicon-shopping-cart"></span> User Cart </a> 
			</li>
			</c:if>
			<c:if test="${pageContext.request.userPrincipal.name ==  'admin'}">
			<li>
			<a href="<c:url value="/admin"/>"><span class="glyphicon glyphicon-cog"></span> Administrator Services </a> 
			</li>
			</c:if>
			<c:if test="${pageContext.request.userPrincipal.name == null }">
			<li>
			<a href="<c:url value="/login" />"> <span class="glyphicon glyphicon-user"></span> Login </a>
			</li>
			<li>
			<a href="<c:url value="/userLogin" />"><span class="glyphicon glyphicon-plus"></span> Sign Up </a>
			</li>
			<li>
					<a href="product/UserListProducts"><span class="glyphicon glyphicon-th"></span> All Products </a>
			</li>
			</c:if>
			
				
			</ul>
			</div>
		</div>
	</div>

	</body>
	</html>
	