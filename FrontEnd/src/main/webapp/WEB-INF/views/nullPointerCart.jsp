<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="/WEB-INF/views/PagePlugIns/Navbar.jsp" %>

<div class="container-wrapper">
    <div class="container">
        <section>
            <div class="jumbotron">
                <div class="container">
                    <h1>Oops! Your Cart is currently Empty.</h1>

           		<p> Check Out our Products and add them to cart in order to View the cart!</p>
                </div>
            </div>
        </section>

        <section class="container">
            <p><a href="<spring:url value="/" />" class="btn btn-default"> Home Page</a></p>
        </section>

<%@ include file="/WEB-INF/views/PagePlugIns/Footer.jsp" %>