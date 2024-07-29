<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp" />

<link href="/pub/css/global.css" rel="stylesheet">

<div class="form-container">
    <form action="/account/register" method="post">
        <div class="formTag">
            <h1>Register</h1>
        </div>

        <!--Email-->
        <div class="mb-3">
            <label for="emailId" class="form-label">Email*</label>
            <input type="text" id="emailId" name="email"
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


        <div class="mb-3">
            <label for="firstName" class="form-label">First Name*</label>
            <input type="text" class="form-control" id="firstName" aria-describedby="firstNameHelp">
            <div id="firstNameHelp" class="form-text"></div>
        </div>
        <div class="mb-3">
            <label for="lastName" class="form-label">Last Name</label>
            <input type="text" class="form-control" id="lastName" aria-describedby="lastNameHelp">
            <div id="lastNameHelp" class="form-text"></div>
        </div>
        <div class="mb-3">
            <label for="state" class="form-label">State</label>
            <select class="form-select" id="state">
                <option value="">Select your state</option>
                <option value="AL">AL</option>
                <option value="AK">AK</option>
                <option value="AZ">AZ</option>
                <option value="AR">AR</option>
                <option value="CA">CA</option>
                <option value="CO">CO</option>
                <option value="CT">CT</option>
                <option value="DE">DE</option>
                <option value="FL">FL</option>
                <option value="GA">GA</option>
                <option value="HI">HI</option>
                <option value="ID">ID</option>
                <option value="IL">IL</option>
                <option value="IN">IN</option>
                <option value="IA">IA</option>
                <option value="KS">KS</option>
                <option value="KY">KY</option>
                <option value="LA">LA</option>
                <option value="ME">ME</option>
                <option value="MD">MD</option>
                <option value="MA">MA</option>
                <option value="MI">MI</option>
                <option value="MN">MN</option>
                <option value="MS">MS</option>
                <option value="MO">MO</option>
                <option value="MT">MT</option>
                <option value="NE">NE</option>
                <option value="NV">NV</option>
                <option value="NH">NH</option>
                <option value="NJ">NJ</option>
                <option value="NM">NM</option>
                <option value="NY">NY</option>
                <option value="NC">NC</option>
                <option value="ND">ND</option>
                <option value="OH">OH</option>
                <option value="OK">OK</option>
                <option value="OR">OR</option>
                <option value="PA">PA</option>
                <option value="RI">RI</option>
                <option value="SC">SC</option>
                <option value="SD">SD</option>
                <option value="TN">TN</option>
                <option value="TX">TX</option>
                <option value="UT">UT</option>
                <option value="VT">VT</option>
                <option value="VA">VA</option>
                <option value="WA">WA</option>
                <option value="WV">WV</option>
                <option value="WI">WI</option>
                <option value="WY">WY</option>
            </select>
            <div id="stateHelp" class="form-text"></div>
        </div>

        <!-- password input field -->
        <div class="row align-items-center justify-content-center pt-3">
            <div class="mb-3">
                <label for="passwordId" class="col-form-label">Password</label>
                <input type="text"
                       id="passwordId"
                       name="password"
                       class="form-control <c:if test="${bindingResult.hasFieldErrors('password')}">is-invalid</c:if>"
                       value="${form.password}">
            </div>
        </div>
        <c:if test="${bindingResult.hasFieldErrors('password')}">
            <div class="row align-items-center justify-content-center">
                <div class="mb-3">
                    <div class="text-danger">
                        <c:forEach items="${bindingResult.getFieldErrors('password')}" var="error">
                            ${error.defaultMessage}<br>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </c:if>

        <!--Submit Form-->
        <button type="submit" class="btn btn-primary">Submit</button>
        <div class="already"> Already have an account?
            <a href="/account/login">Login</a>
        </div>

    </form>
</div>
</div>

<jsp:include page="../include/footer.jsp" />
