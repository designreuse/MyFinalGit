<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="/WEB-INF/views/PagePlugIns/Navbar.jsp" %>

<div class="container-wrapper">
    <div class="container">
        <section>
            <div class="jumbotron">
                <div class="container">
                    <h1 class="alert alert-danger">Registration cancelled!</h1>

                    <p>Your Registration process is cancelled! You may continue to check our website as a guest.</p>
                </div>
            </div>
        </section>

        <section class="container">
            <p><a href="<spring:url value="/product/UserListProducts" />" class="btn btn-default">Products</a></p>
        </section>

<%@ include file="/WEB-INF/views/PagePlugIns/Footer.jsp" %>