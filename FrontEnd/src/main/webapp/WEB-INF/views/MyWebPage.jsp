<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head>
<title>Insert title here</title>
<meta name="description" content=" " >
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/resources/css/style.css"/>">
<script src="<c:url value="https://code.angularjs.org/1.3.0-beta.5/angular.js"/>"></script>  
<script src="<c:url value="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.0rc1/angular-route.min.js"/>"></script>  
<script src="<c:url value="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"/>"></script>
<script src="<c:url value="JavaScript1.js"/>"></script>
</head>
<body onload= "load();">
<script src="<c:url value="/resources/js/jquery-1.12.4.min.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/js/script.js"/>"></script>

<div class="container" id="main">
		
	<div class="navbar navbar-inverse navbar-fixed-top">
		  <div class="container">
		  	<div class="navbar-header">
		  	  <button class="navbar-toggle" data-target="#myNavbar" data-toggle="collapse" type="button">
		  	      <span class="icon-bar"></span>
				  <span class="icon-bar"></span>
				  <span class="icon-bar"></span>
		  </button>
		  
		  	<a class="navbar-brand" href="#"><img src="<c:url value="/resources/images/musichub-logo-text-01.png"/>" height=20px width=75px alt="YOUR LOGO"></a>
		  	</div>
		  	<div class="collapse navbar-collapse" id="myNavbar">
		  		<ul class="nav navbar-nav">
		  			
		  			<li class="active">
		  			<a href="<c:url value="/"/>">Home</a>
		  			</li>
		  			
		  			<li class="dropdown">
		  			<a href="#" class="dropdown-toggle" data-toggle="dropdown">Services<strong class="caret"></strong></a>
		  				<ul class="dropdown-menu">
		  					<li>
		  					<a href="#">Home Delivery</a>
		  					</li>
		  					<li>
		  					<a href="#">PickUp Yourself</a>
		  					</li>
		  					<li class="divider"> </li>
		  					<li class="dropdown-header" >
		  					<a ><em>Payment Methods</em></a>
		  					</li>	
		  					<li>
		  					<a href="#">Cash On Delivery</a>
		  					</li>
		  					<li>
		  					<a href="#">Pay Online</a>
		  					</li>
		  				</ul>
		  			</li>
		  			
		  		</ul>
		  		
		  		<form class="navbar-form pull-left">
		  			<input type="text" class="form-control" placeholder="Search this site..." id="SearchInput">
		  			<button type="submit" class="btn btn-default"><img src="<c:url value="/resources/images/glyphicons-28-search.png"/>" height=20px width=14px alt= " hi "></button>
		  		</form>
		  		
		  		<ul class="nav navbar-nav pull-right">
		  			
		  			<li class="dropdown">
		  				<a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="/WEB-INF/resources/images/glyphicons-4-user.png" height=12px> My Account<strong class="caret"></strong></a>
		  				<ul class="dropdown-menu">
		  					<li>
		  						<a href="#"> <img src= "<c:url value="/resources/images/glyphicons-44-group.png"/>" height =12px width=16px>  SignUp </a>
		  					</li>
		  					
		  					<li>
		  						<a href="#"><img src="<c:url value="/resources/images/glyphicons-387-log-in.png"/>" height =12px width=16px>  Login </a>
		  					</li>
		  			
		  					<li>
		  						<a href="#"><img src="<c:url value="/resources/images/glyphicons-281-settings.png"/>" height =12px width=16px>  Settings </a>
		  					</li>	
		  				</ul>
		  			</li>
		  			
		  		</ul>
		  		
		  	</div>
		  </div>
	</div>
	
	<div class="container" id="categoryTable">
	<h1> Hello </h1>
	<c:url var="addAction" value="/SaveOrUpdate"> </c:url>
	
	<form:form action="${pageContext.request.contextPath}/product/add" commandName= "user" >
	<table>
	<tr>
	<td> <label for="pid"> ID</label> </td>
	<c:choose>
	<c:when test="$(!empty user.pid)">
	<td> <form:input path="pid" id="pid" readonly="true"/></td>
	</c:when>
	<c:otherwise>
	<td> <form:input path="pid" id="pid" required="true" title="id should contains 6 to 7 characters"/></td>
	</c:otherwise>
	</c:choose>
	</tr>
	<tr>
		<td> Name </td>
		<td><form:input path="name" id="name" /></td>
		<td><form:errors path="name" cssClass="error"> Name </form:errors></td> 
	</tr>
	<tr>
		<td> EMAIL </td>
		<td><form:input path="email" id="email" /></td>
		<td><form:errors path="email" cssClass="error"> Email </form:errors></td>
	</tr>
	<tr>
		<td colspan="2"><c:if test="${!empty user.pid}"><input type="submit" value="Edit" /> </c:if>
		<c:if test="${empty user.pid}"><input type="submit" value="submit" /> </c:if>
	</tr> 	
	</table>
	</form:form>
	
	<input type="text" ng-model="searchtype" placeholder=" I want..." class="inputText pull-right"><br>
	
	<c:if test="${!empty user}">
	
	<table class="table table-bordered table-striped" id="categorytable">
	<tr>
	<th> ID </th>
	<th> Name </th>
	<th> Email </th>
	</tr>
	<tbody>
	<c:forEach var="pro" items="${user}">
	<tr>
	<td> ${pro.pid}</td>
	<td> ${pro.name}</td>
	<td> ${pro.email}</td>
	<td><a href="<c:url value="product/edit/${pro.pid}" />"> Edit </a> </td>
	<td><a href="<c:url value="product/remove/${pro.pid}" />"> Delete </a> </td>
	</tr>
	</c:forEach>
	</tbody>
	</table>
	
	</c:if>
	</div>	
  
   <br><br><br><br><br><br><br><br><br>	
	<div class="carousel slide" id="mycarousel">
		
		<ol class="carousel-indicators">
			<li class="active" data-slide-to="0" data-target="mycarousel"></li>
			<li data-slide-to="1" data-target="mycarousel"></li>
			<li data-slide-to="2" data-target="mycarousel"></li>
		</ol>
		
		<div class="carousel-inner" >
		
			<div class="item active" id="slide1">
				<div class="carousel-caption">
				<h4>Welcome To Music World</h4>
				<p> Know Everything about music and find @ anything </p>
				</div>
			</div>	
		
			<div class="item" id="slide2">
					<div class="carousel-caption">
					<h4>Music World</h4>
					<p> Know Everything about music and find @ anything </p>
					</div>
			</div>	
		
			<div class="item" id="slide3">
				<div class="carousel-caption">
				<h4>Music Ki Duniya mein Aapka Swaagat hai</h4>
				<p> Know Everything about music and find @ anything </p>
				</div>
			</div>	
			
		</div>
		<a class="left carousel-control" data-slide="prev" href="#mycarousel"><span class="icon-prev"></span></a>
		<a class="right carousel-control" data-slide="next" href="#mycarousel"><span class="icon-next"></span></a>
	</div>	
	<div class="row" id="myrow1">
		
		<div class="col-sm-4 feature">
			<div class=" panel" id="panel1">
				<div class="panel-heading" >
					<h3 class="panel-title"> Hi Download Songs Here</h3>
				</div>
				<p>This is the place you can download music from</p>
				<a href= "#" target="blank" class="btn btn-warning btn-block"> Download Music </a>
			</div>
		</div>
		
		<div class="col-sm-4 feature" >
			<div class=" panel" id= "panel2">
				<div class="panel-heading" >
					<h3 class="panel-title"> Listen to Songs here</h3>
				</div>
				<p>This is the place you can listen to your music from</p>
				<a href= "#" target="blank" class="btn btn-warning btn-block"> Listen To Music </a>
			</div>
		
		</div>
		
		<div class="col-sm-4 feature">
			<div class=" panel" id="panel3">
				<div class="panel-heading">
					<h3 class="panel-title"> Watch Movies Here</h3>
				</div>
				<p>This is the place you can Watch Movies From</p>
				<a href= "#" target="blank" class="btn btn-warning btn-block"> Watch Movies </a>
			</div>
		
		</div>
		
	</div>


 </div>
<%@ include file="/WEB-INF/views/PagePlugIns/Footer.jsp"%>
 
</body>
</html>