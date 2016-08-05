<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="container" id="main">
<%@ include file="/WEB-INF/views/PagePlugIns/Navbar.jsp" %>
<br><br>
<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>Sending Favorite Product</h1>

            <p class="lead">Now Send Your Favorite Product to your Near and Dear Ones!!</p>
        </div>
        <form method="post" action="${pageContext.request.contextPath}/product/send">
			<table border="0" width="80%">
				<tr>
					<td>To:</td>
					<td><input type="text" name="recipient" size="65" /></td>
				</tr> 
				<tr>
					<td>Subject:</td>
					<td><input type="text" name="subject" value="${subject}" size="65" /></td>
				</tr> 
				<tr>
					<td>Message:</td>
					<td><input type="text" name="message" size=50 value="${msg}" size="65" /></td>
				</tr> 
		</table>
		<br>
		
			<button type="submit"  value="Send E-mail" class="btn btn-primary">Send E-mail</button>					
			
		
		</form>
		</div>
		</div>
		</div>
<%@ include file="/WEB-INF/views/PagePlugIns/Footer.jsp" %>