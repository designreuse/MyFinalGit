 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/PagePlugIns/Navbar.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />

<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>User</h1>

            <p class="lead">User confirmation</p>
        </div>

        <div class="container">

            <div class="row">

                <form:form commandName="login" class="form-horizontal">

                    <div class="well col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">

                       <div class="txt-center">
                            <h1>Details</h1>
                       </div>
                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <address>
                                    <strong>Shipping Address</strong><br/>
                                    ${login.shippingAddress.house_no}, ${login.shippingAddress.street_name}
                                <br/>
                                   ${login.shippingAddress.city}, ${login.shippingAddress.state}
                                <br/>
                                     ${login.shippingAddress.country}, ${login.shippingAddress.zip_code}
                                </address>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                                <p>Registration Date: <fmt:formatDate type="date" value="${now}" /></p>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <address>
                                    <strong>Billing Address</strong><br/>
                                       ${login.billingAddress.house_no}, ${login.billingAddress.street_name}
                                    <br/>
                                        ${login.billingAddress.city}, ${login.billingAddress.state}
                                    <br/>
                                        ${login.billingAddress.country}, ${login.billingAddress.zip_code}
                                </address>
                            </div>
                        </div>

                        <div class="row">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <td>User</td>
                                        <td>#</td>
                                        <td class="text-center">Name</td>
                                        <td class="text-center">E-Mail</td>
                                        <td class="text-center">Mobile</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="col-md-6"><em>${login.user_name}</em></td>
                                        <td class="col-md-5" style="text-align: center">${login.email_id}</td>
                                        <td class="col-md-1" style="text-align: center">${login.mobile_no}</td>
                                    </tr>

                                <tr>
                                    <td></td>
                                    <td></td>
                                    <%-- <td class="text-right">
                                        <h4><strong>Grand Total:</strong></h4>
                                    </td>
                                    <td class="text-center text-danger">
                                        <h4><strong>$ ${order.cart.grandTotal}</strong></h4>
                                    </td> --%>
                                </tr>

                                </tbody>
                            </table>
                        </div>


                        <input type="hidden" name="_flowExecutionKey" />

                        <br/><br/>

                        <button class="btn btn-default" name="_eventId_backToCollectShippingDetail">Back</button>

                        <input type="submit" value="Confirm Registration" class="btn btn-default" name="_eventId_userConfirmed" />

                        <button class="btn btn-default" name="_eventId_cancel">Cancel</button>
                    </div>
                </form:form>
            </div>
        </div>

<%@ include file="/WEB-INF/views/PagePlugIns/Footer.jsp" %>