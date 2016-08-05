<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="/WEB-INF/views/PagePlugIns/Navbar.jsp" %>

<div class="container-wrapper">
    <div class="container">
        <section>
            <div class="jumbotron">
                <div class="container">
                    <h1>CartPoint is a brand new E-Commerce website!</h1>

           		<p> Owned and Administered by Rishab Himmatramka, the website aims to provide its Users with the best
           		quality of products at competitive prices. <b> The site is however under construction and is yet to be fully 
           		functional. We hope to be working at full functionality soon! Thank you for visiting Us!!</b></p>
                </div>
            </div>
        </section>

        <section class="container">
            <p><a href="<spring:url value="/" />" class="btn btn-default"> Home Page</a></p>
        </section>

<%@ include file="/WEB-INF/views/PagePlugIns/Footer.jsp" %>