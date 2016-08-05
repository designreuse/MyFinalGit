<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title> </title>
<meta name="description" content=" " >
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
<script src="<c:url value="https://code.angularjs.org/1.3.0-beta.5/angular.js"/>"></script>   
<script src="<c:url value="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js" />"></script> 
<script src="<c:url value="/resources/js/jquery-1.12.4.min.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/js/script.js"/>"></script>

</head>
<div class="container" id="main">
<body>

<%@ include file="/WEB-INF/views/PagePlugIns/Navbar.jsp" %>
<div class="container" id="main">

	<%@ include file="/WEB-INF/views/PagePlugIns/Carousel.jsp" %>
	
	
	<!-- <div class="row" id="myrow1">
		
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
		 -->
</div>
</div>
<%@ include file="/WEB-INF/views/PagePlugIns/Footer.jsp" %>
</body>

</html>
