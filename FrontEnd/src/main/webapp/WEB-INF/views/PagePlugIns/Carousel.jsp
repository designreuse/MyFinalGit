<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta name="description" content=" ">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/styleForNavbar.css"/>">
<script
	src="<c:url value="https://code.angularjs.org/1.3.0-beta.5/angular.js"/>"></script>
<script
	src="<c:url value="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js" />"></script>
	<script src="<c:url value="/resources/js/jquery-1.12.4.min.js"/>"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
	<script src="<c:url value="/resources/js/script.js"/>"></script>
	<title>Sample Page</title>
</head>


<div class="carousel slide" id="myCarousel" data-ride="carousel">
<ol class="carousel-indicators">
	<li class="active" data-slide-to="0" data-target="#myCarousel"></li>
	<li data-slide-to="1" data-target="#myCarousel"></li>
	<li data-slide-to="2" data-target="#myCarousel"></li>
	<li data-slide-to="3" data-target="#myCarousel"></li>
	<li data-slide-to="4" data-target="#myCarousel"></li>
	<li data-slide-to="5" data-target="#myCarousel"></li>
</ol>
	<div class="carousel-inner" role= "listbox">
		<div class="item active" id= "slide1">
		<div class="carousel-caption">
				<H4>Your Brand New Online Shopping Cart</H4>
				<p> Welcome to E-Kart, A whole new online shopping Bazaar! </p>
			</div>
		</div>
		<div class="item" id= "slide2">
			<div class="carousel-caption">
				<H4> Get The Best Products At Best Prices</H4>
			</div>
		</div>
		<div class="item" id= "slide3">
			<div class="carousel-caption">
				<H4>Best Customer Facilities</H4>
			</div>
		</div>
		<div class="item" id= "slide4">
			<div class="carousel-caption">
				<H4>Home Delivery &amp; Cash On Delivery! </H4>
			</div>
		</div>
		<div class="item" id= "slide5">
			<div class="carousel-caption">
				<H4>All International Brands Just One Click Away</H4>
			</div>
		</div>
		<div class="item" id= "slide6">
			<div class="carousel-caption">
				<H4>Daily Offers You Can't Ignore</H4>
			</div>
		</div>	
		
		<a class="left carousel-control" data-slide="prev" href="#myCarousel" ><span class="icon-prev"></span> </a>
	<a class="right carousel-control" data-slide="next" href="#myCarousel" ><span class="icon-next"></span> </a>
	</div>
	
	
</div>
