<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/views/PagePlugIns/Navbar.jsp" %>


<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>User</h1>


            <p class="lead">User Details:</p>
        </div>

        <form:form commandName="login" class="form-horizontal">

        <h3>Basic Info:</h3>

        <div class="form-group">
            <label for="name">Name</label>
            <form:input path="user.user_name" id="name" class="form-Control" />
        </div>

        <div class="form-group">
            <label for="email">Email</label>
            <form:input path="user.email_id" id="email" class="form-Control" />
        </div>

        <div class="form-group">
            <label for="phone">Phone</label>
            <form:input path="user.mobile_no" id="phone" class="form-Control" />
        </div>

        <%-- <h3>Billing Address:</h3>

        <div class="form-group">
            <label for="street_name">Street Name</label>
            <form:input path="billingAddress.street_name" id="street_name" class="form-Control" />
        </div>

        <div class="form-group">
            <label for="billingApartmentNumber">Apartment Number</label>
            <form:input path="billingAddress.house_no" id="billingApartmentNumber" class="form-Control" />
        </div>0

        <div class="form-group">
            <label for="billingCity">City</label>
            <form:input path="billingAddress.city" id="billingCity" class="form-Control" />
        </div>

        <div class="form-group">
            <label for="billingState">State</label>
            <form:input path="billingAddress.state" id="billingState" class="form-Control" />
        </div>

        <div class="form-group">
            <label for="billingCountry">Country</label>
            <form:input path="billingAddress.country" id="billingCountry" class="form-Control" />
        </div>

        <div class="form-group">
            <label for="billingZip">Zipcode</label>
            <form:input path="billingAddress.zip_code" id="billingZip" class="form-Control" />
        </div>

        <input type="hidden" name="_flowExecutionKey" />
 --%>
        <br/><br/>

        <input type="submit" value="Next" class="btn btn-default" name="_eventId_userInfoCollected" />

        <button class="btn btn-default" name="_eventId_cancel"> Cancel</button>

        </form:form>
</div>
</div>

<%@ include file="/WEB-INF/views/PagePlugIns/Footer.jsp" %>