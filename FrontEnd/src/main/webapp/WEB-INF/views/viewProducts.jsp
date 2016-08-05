<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="<c:url value="/resources/js/angular.min.js"/>"></script>
<script src="/FrontEnd/resources/js/controller.js"></script>
<div class="container" id="main">
<%@ include file="/WEB-INF/views/PagePlugIns/Navbar.jsp" %>


<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
        <br>
            <h1>Product Detail</h1>

            <p class="lead">Here is the detail information of the product:</p>
        </div>

        <div class="container" ng-app ="cartApp">
            <div class="row">
                <div class="col-md-5">
                    <img src="<c:url value="/resources/images${product.pid}.png" />" alt="image" style="width:100%"/>
                </div>
                <div class="col-md-5">
                    <h3>${product.name}</h3>
                    <p><strong>Brand</strong>: ${product.brand}</p>
                    <p><strong>Category</strong>: ${product.category.category_name}</p>
                    <p>Rs ${product.price}</p>

                    <br/>

                    <c:set var = "role" scope="page" value="${param.role}" />
                    <c:set var = "url" scope="page" value="/product/ListProducts" />
                    <c:if test="${role='admin'}">
                        <c:set var="url" scope="page" value="/admin/addProduct" />
                    </c:if>

                    <p ng-controller="cartCtrl">
                        <a href="<c:url value = "${url}" />" class="btn btn-default">Back</a>    
                       <a href="#" class="btn btn-warning btn-large" ng-click="addToCart('${product.pid}')"><span class="glyphicon glyphicon-shopping-cart"></span> Add To Cart</a>  
                        <a href="<spring:url value="/Cart" />" class="btn btn-default"><span class="glyphicon glyphicon-hand-right"></span> View Cart</a>
                    </p>

                </div>
            </div>
        </div>


</div>
</div>
</div>

<%@ include file="/WEB-INF/views/PagePlugIns/Footer.jsp" %>
