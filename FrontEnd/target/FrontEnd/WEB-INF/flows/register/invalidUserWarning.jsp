<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="/WEB-INF/views/PagePlugIns/Navbar.jsp" %>

<div class="container-wrapper">
    <div class="container">
        <section>
            <div class="jumbotron">
                <div class="container">
                    <h1>Invalid UserId! Please Login Again :) </h1>
                </div>
            </div>
        </section>

        <section class="container">
            <p><a href="<spring:url value="/userLogin" />" class="btn btn-default"> Register Again</a></p>
        </section>

<%@ include file="/WEB-INF/views/PagePlugIns/Footer.jsp" %>