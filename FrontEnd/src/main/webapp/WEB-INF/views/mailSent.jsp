<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="/WEB-INF/views/PagePlugIns/Navbar.jsp" %>

<div class="container-wrapper">
    <div class="container">
        <section>
            <div class="jumbotron">
                <div class="container">
                    <h1>Mail Has Been Successfully sent! </h1>

           		<p> We hope your friend likes the Product too! :) </p>
                </div>
            </div>
        </section>

        <section class="container">
            <p><a href="<spring:url value="/" />" class="btn btn-primary"> Home Page</a></p>
        </section>

<%@ include file="/WEB-INF/views/PagePlugIns/Footer.jsp" %>