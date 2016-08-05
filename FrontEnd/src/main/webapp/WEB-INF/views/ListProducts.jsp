<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="container" id="main">
<%@ include file="/WEB-INF/views/PagePlugIns/Navbar.jsp" %>

<script>
    $(document).ready(function(){
        var searchCondition = '${searchCondition}';

        $('.table').DataTable({
            "lengthMenu": [[1,2,3,5,10, -1], [1,2,3,5,10, "All"]],
            "oSearch" : {"sSearch": searchCondition}
        });
    });
</script>
<br><br><br><br><br><br>
<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>All Products</h1>

            <p class="lead">Checkout all the products available now!</p>
        </div>

        <table class="table table-striped table-hover">
            <thead>
                <tr class="bg-success">
                    <th>Image</th>
                    <th>Product Name</th>
                    <th>Brand</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <c:forEach items="${products}" var="products">
                <tr>
                    <td><img src="<c:url value="/resources/images${products.pid}.png" />" alt="image" style="width:100%"/></td>
                    <td>${products.name}</td>
                    <td>${products.brand}</td>
                    <td>${products.category.category_name}</td>
                    <td>Rs ${products.price}</td>
                    <td><a href="<spring:url value="/product/viewProducts/${products.pid}" />"><span class="glyphicon glyphicon-info-sign"></span></a>
                    <td><a href="<spring:url value="/product/favorite/${products.pid }" />"><span class="glyphicon glyphicon-heart"></span></a></td>
                </tr>
            </c:forEach>
        </table>
</div>
</div>
</div>

<%@ include file="/WEB-INF/views/PagePlugIns/Footer.jsp" %>
