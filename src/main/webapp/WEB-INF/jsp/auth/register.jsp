<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp" />

<link href="/pub/css/global.css" rel="stylesheet">

<div class="form-container">
    <form action="/account/register" method="post">
        <div class="formTag">
            <h1>Register</h1>
            <h6 class="text-muted">Please enter as much info as possible so that we can create a great database together.</h6>
        </div>

        <div class="row">
            <!-- Email -->
            <div class="col-md-6 mb-3">
                <label for="emailId" class="form-label">Email*</label>
                <input type="text" id="emailId" name="email"
                       class="form-control <c:if test="${bindingResult.hasFieldErrors('email')}">is-invalid</c:if>"
                       value="${form.email}">
                <c:if test="${bindingResult.hasFieldErrors('email')}">
                    <div class="text-danger">
                        <c:forEach items="${bindingResult.getFieldErrors('email')}" var="error">
                            ${error.defaultMessage}<br>
                        </c:forEach>
                    </div>
                </c:if>
            </div>

            <!-- Name -->
            <div class="col-md-6 mb-3">
                <label for="name" class="form-label">Name*</label>
                <input type="text" class="form-control" id="name" aria-describedby="nameHelp">
                <div id="nameHelp" class="form-text"></div>
            </div>
        </div>

        <div class="row">
            <!-- Password -->
            <div class="col-md-6 mb-3">
                <label for="passwordId" class="form-label">Password*</label>
                <input type="text"
                       id="passwordId"
                       name="password"
                       class="form-control <c:if test="${bindingResult.hasFieldErrors('password')}">is-invalid</c:if>"
                       value="${form.password}">
                <c:if test="${bindingResult.hasFieldErrors('password')}">
                    <div class="text-danger">
                        <c:forEach items="${bindingResult.getFieldErrors('password')}" var="error">
                            ${error.defaultMessage}<br>
                        </c:forEach>
                    </div>
                </c:if>
            </div>

            <!-- Age -->
            <div class="col-md-6 mb-3">
                <label for="age" class="form-label">Age</label>
                <input type="text" class="form-control" id="age" aria-describedby="ageHelp">
                <div id="ageHelp" class="form-text"></div>
            </div>
        </div>

        <div class="row">
            <!-- Ape Index -->
            <div class="col-md-6 mb-3">
                <label for="apeIndex" class="form-label">Ape Index</label>
                <select class="form-select" id="apeIndex">
                    <option value="">select your ape index</option>
                    <option value="-5">-5</option>
                    <option value="-4">-4</option>
                    <option value="-3">-3</option>
                    <option value="-2">-2</option>
                    <option value="-1">-1</option>
                    <option value="0">0</option>
                    <option value="+1">+1</option>
                    <option value="+2">+2</option>
                    <option value="+3">+3</option>
                    <option value="+4">+4</option>
                    <option value="+5">+5</option>
                    <option value="+6">+6</option>
                    <option value="+7">+7</option>
                    <option value="+8">+8</option>
                </select>
                <div id="apeHelp" class="form-text"></div>
            </div>

            <!-- Gender -->
            <div class="col-md-6 mb-3">
                <label for="gender" class="form-label">Gender</label>
                <select class="form-select" id="gender">
                    <option value="">select your gender</option>
                    <option value="Non-binary">Non-binary</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                </select>
                <div id="genderHelp" class="form-text"></div>
            </div>
        </div>

        <div class="row">
            <!-- Height -->
            <div class="col-md-6 mb-3">
                <label for="height" class="form-label">Height</label>
                <input type="text" class="form-control" id="height" aria-describedby="heightHelp">
                <div id="heightHelp" class="form-text"></div>
            </div>

            <!-- Style -->
            <div class="col-md-6 mb-3">
                <label for="style" class="form-label">Style</label>
                <input type="text" class="form-control" id="style" aria-describedby="styleHelp">
                <div id="styleHelp" class="form-text"></div>
            </div>
        </div>

        <div class="row">
            <!-- Favorite Area -->
            <div class="col-md-6 mb-3">
                <label for="favoriteArea" class="form-label">Favorite Area</label>
                <input type="text" class="form-control" id="favoriteArea" aria-describedby="favoriteAreaHelp">
                <div id="favoriteAreaHelp" class="form-text"></div>
            </div>

            <!-- Favorite Boulder Problem -->
            <div class="col-md-6 mb-3">
                <label for="favoriteBoulderProblem" class="form-label">Favorite Boulder Problem</label>
                <input type="text" class="form-control" id="favoriteBoulderProblem" aria-describedby="favoriteBoulderProblemHelp">
                <div id="favoriteBoulderProblemHelp" class="form-text"></div>
            </div>
        </div>

        <!-- About -->
        <div class="row">
            <div class="col-md-12 mb-3">
                <label for="about" class="form-label">About</label>
                <textarea class="form-control" id="about" aria-describedby="aboutHelp" rows="3"></textarea>
                <div id="aboutHelp" class="form-text"></div>
            </div>
        </div>

        <!-- Profile Picture Upload -->
        <div class="row mb-3">
            <div class="col-md-12">
                <label for="profilePic" class="form-label">Profile Picture</label>
                <input type="file" id="profilePic" name="file" class="form-control">
            </div>
        </div>

        <!-- Submit Form -->
        <button type="submit" class="btn btn-primary">Submit</button>
        <div class="already"> Already have an account?
            <a href="/account/login">Login</a>
        </div>
    </form>
</div>

<jsp:include page="../include/footer.jsp" />