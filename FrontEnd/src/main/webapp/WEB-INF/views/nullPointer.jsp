<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="/WEB-INF/views/PagePlugIns/Navbar.jsp" %>

<div class="container-wrapper">
    <div class="container">
        <section>
            <div class="jumbotron">
                <div class="container">
                    <h1>Please Check the Values Of the Fields Again</h1>

           		<p> All fields are Compulsory in order to Proceed </p>
                </div>
            </div>
        </section>

        <section class="container">
            <p><a href="<spring:url value="/" />" class="btn btn-default"> Home Page</a></p>
        </section>

<%@ include file="/WEB-INF/views/PagePlugIns/Footer.jsp" %>