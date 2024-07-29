<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp" />

<link href="/pub/css/global.css" rel="stylesheet">

<div class="form-container">
    <form action="/account/loginProcessingURL" method="post">
        <div class="formTag">
            <h1>Login</h1>
        </div>

        <!--Email-->
        <div class="mb-3 text-start">
            <label for="emailId" class="form-label">Email</label>
            <input type="text" id="emailId" name="username"
                   class="form-control <c:if test="${bindingResult.hasFieldErrors('email')}">is-invalid</c:if>"
                   value="${form.email}">
        </div>
        <c:if test="${bindingResult.hasFieldErrors('email')}">
            <div class="row align-items-center justify-content-center">
                <div class="mb-3">
                    <div class="text-danger">
                        <c:forEach items="${bindingResult.getFieldErrors('email')}" var="error">
                            ${error.defaultMessage}<br>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </c:if>

        <!--Password-->
        <div class="mb-3 text-start">
            <label for="passwordId" class="form-label">Password</label>
            <input type="text"
                   id="passwordId"
                   name="password"
                   class="form-control <c:if test="${bindingResult.hasFieldErrors('password')}">is-invalid</c:if>"
                   value="${form.password}">
        </div>
        <c:if test="${bindingResult.hasFieldErrors('password')}">
            <div class="row align-items-center justify-content-center">
                <div class="mb-3">
                    <div style="color:red">
                        <c:forEach items="${bindingResult.getFieldErrors('password')}" var="error">
                            ${error.defaultMessage}<br>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </c:if>

        <!--Submit Form-->
        <button type="submit" class="btn btn-primary">Login</button>
        <div class="already">Don't have an account?
            <a href="/account/register">Register</a>
        </div>
    </form>
</div>

<jsp:include page="../include/footer.jsp" />