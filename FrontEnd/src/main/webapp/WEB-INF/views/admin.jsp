<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Admin Page</title>
<meta name="description" content=" ">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
<script
	src="<c:url value="https://code.angularjs.org/1.3.0-beta.5/angular.js"/>"></script>
<script
	src="<c:url value="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js" />"></script>
</head>
<div class="container" id="main">
<body>
	<script src="<c:url value="/resources/js/jquery-1.12.4.min.js"/>"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/resources/js/script.js"/>"></script>

	<div class="container" id="main">
		<%@ include file="/WEB-INF/views/PagePlugIns/Navbar.jsp"%>
		
	 <%@ include file="/WEB-INF/views/PagePlugIns/Carousel.jsp"%>
		
		<br><br>

<div class="row">
  <div class="col-md-4">
    <div class="thumbnail">
    <center>
      <img class= "img-responsive" src="<c:url value="/resources/images/supplier.jpg"/>" height= 100px width=100px alt="MY LOGO" id="imageSupplier">
      <div class="caption">
        <h3> Add A Supplier </h3> 
        <p>Click here so that you can add a new Supplier to your website who will be then authorised to sell products on your domain.</p>
        <p><a href="<c:url value="admin/addSupplier"/>" class="btn btn-danger" role="button" aria-haspopup="true" aria-expanded="false"> Add Now</a> </p> </center>
      </div>
    </div>
  <div class="col-md-4">
    <div class="thumbnail">
    <center>
      <img class= "img-responsive" src="<c:url value="/resources/images/category.png"/>" height= 100px width=100px alt="MY LOGO" id="imageCategory">
      <div class="caption">
        <h3> Add A Category </h3> 
        <p>Click here so that you can add a new Category to your website which will be then available as a part of the variety you provide</p>
        <p><a href="<c:url value="admin/addCategory"/>" class="btn btn-danger" role="button" aria-haspopup="true" aria-expanded="false"> Add Now</a> </p> </center>
      </div>
    </div>
 
  <div class="col-md-4">
    <div class="thumbnail">
    <center>
      <img class= "img-responsive" src="<c:url value="/resources/images/product.png"/>" height= 100px width=100px alt="MY LOGO" id="imageSupplier">
      <div class="caption">
        <h3> Add A Product </h3> 
        <p>Click here so that you can add a new Product to your website corresponding to a category and a supplier which can be then visible to the users.</p>
        <p><a href="<c:url value="admin/addProduct"/>" class="btn btn-danger" role="button" aria-haspopup="true" aria-expanded="false"> Add Now</a> </p> </center>
      </div>
    </div>
</div>
  </div>
   </div>

</body>
		<%@ include file="/WEB-INF/views/PagePlugIns/Footer.jsp"%>
</html>