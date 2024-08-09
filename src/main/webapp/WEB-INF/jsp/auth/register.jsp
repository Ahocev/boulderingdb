<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp" />

<link href="/pub/css/global.css" rel="stylesheet">

<style>
    .form-container {
        background: rgba(255, 255, 255, 0.9);
        padding: 20px;
        margin-top: 50px;
        margin-bottom: 50px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        max-width: 700px;
        width: 100%;
        border: 1px solid black;
        border-radius: 0; /* 90-degree corners */
        display: flex;
        flex-direction: column;
        align-items: center; /* Center child elements horizontally */
    }

    .form-control {
        border-radius: 0; /* 90-degree corners for input fields */
    }

    .btn-primary {
        background-color: black; /* Black background for the submit button */
        border: none;
        border-radius: 0; /* 90-degree corners */
    }

    .btn-primary:hover {
        background-color: #333; /* Darker shade on hover */
    }
</style>

<div class="form-container">
    <form action="/account/register" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${form.id}">
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
                    <div class="text-danger mt-1">
                        <c:forEach items="${bindingResult.getFieldErrors('email')}" var="error">
                            ${error.defaultMessage}<br>
                        </c:forEach>
                    </div>
                </c:if>
            </div>

            <!-- Name -->
            <div class="col-md-6 mb-3">
                <label for="name" class="form-label">Name*</label>
                <input type="text" id="name" name="name"
                       class="form-control <c:if test="${bindingResult.hasFieldErrors('name')}">is-invalid</c:if>"
                       value="${form.name}">
                <c:if test="${bindingResult.hasFieldErrors('name')}">
                    <div class="text-danger mt-1">
                        <c:forEach items="${bindingResult.getFieldErrors('name')}" var="error">
                            ${error.defaultMessage}<br>
                        </c:forEach>
                    </div>
                </c:if>
            </div>
        </div>

        <div class="row">
            <!-- Password -->
            <div class="col-md-6 mb-3">
                <label for="passwordId" class="form-label">Password*</label>
                <input type="text" id="passwordId" name="password"
                       class="form-control <c:if test="${bindingResult.hasFieldErrors('password')}">is-invalid</c:if>"
                       value="${form.password}">
                <c:if test="${bindingResult.hasFieldErrors('password')}">
                    <div class="text-danger mt-1">
                        <c:forEach items="${bindingResult.getFieldErrors('password')}" var="error">
                            ${error.defaultMessage}<br>
                        </c:forEach>
                    </div>
                </c:if>
            </div>

            <!-- Age -->
            <div class="col-md-6 mb-3">
                <label for="age" class="form-label">Age</label>
                <input type="number" id="age" name="age" min="1"
                       class="form-control <c:if test="${bindingResult.hasFieldErrors('age')}">is-invalid</c:if>"
                       value="${form.age}">
                <c:if test="${bindingResult.hasFieldErrors('age')}">
                    <div class="text-danger mt-1">
                        <c:forEach items="${bindingResult.getFieldErrors('age')}" var="error">
                            ${error.defaultMessage}<br>
                        </c:forEach>
                    </div>
                </c:if>
            </div>
        </div>

        <div class="row">
            <!-- Ape Index -->
            <div class="col-md-6 mb-3">
                <label for="apeIndex" class="form-label">Ape Index</label>
                <select class="form-select <c:if test="${bindingResult.hasFieldErrors('apeIndex')}">is-invalid</c:if>" id="apeIndex" name="apeIndex">
                    <option value="">select your ape index</option>
                    <option value="-5" <c:if test="${form.apeIndex == '-5'}">selected</c:if>>-5</option>
                    <option value="-4" <c:if test="${form.apeIndex == '-4'}">selected</c:if>>-4</option>
                    <option value="-3" <c:if test="${form.apeIndex == '-3'}">selected</c:if>>-3</option>
                    <option value="-2" <c:if test="${form.apeIndex == '-2'}">selected</c:if>>-2</option>
                    <option value="-1" <c:if test="${form.apeIndex == '-1'}">selected</c:if>>-1</option>
                    <option value="0" <c:if test="${form.apeIndex == '0'}">selected</c:if>>0</option>
                    <option value="+1" <c:if test="${form.apeIndex == '+1'}">selected</c:if>>+1</option>
                    <option value="+2" <c:if test="${form.apeIndex == '+2'}">selected</c:if>>+2</option>
                    <option value="+3" <c:if test="${form.apeIndex == '+3'}">selected</c:if>>+3</option>
                    <option value="+4" <c:if test="${form.apeIndex == '+4'}">selected</c:if>>+4</option>
                    <option value="+5" <c:if test="${form.apeIndex == '+5'}">selected</c:if>>+5</option>
                    <option value="+6" <c:if test="${form.apeIndex == '+6'}">selected</c:if>>+6</option>
                    <option value="+7" <c:if test="${form.apeIndex == '+7'}">selected</c:if>>+7</option>
                    <option value="+8" <c:if test="${form.apeIndex == '+8'}">selected</c:if>>+8</option>
                </select>
                <c:if test="${bindingResult.hasFieldErrors('apeIndex')}">
                    <div class="text-danger mt-1" >
                        <c:forEach items="${bindingResult.getFieldErrors('apeIndex')}" var="error">
                            ${error.defaultMessage}<br>
                        </c:forEach>
                    </div>
                </c:if>
                <div id="apeHelp" class="form-text"></div>
            </div>

            <!-- Gender -->
            <div class="col-md-6 mb-3">
                <label for="gender" class="form-label">Gender</label>
                <select class="form-select <c:if test="${bindingResult.hasFieldErrors('gender')}">is-invalid</c:if>" id="gender" name="gender">
                    <option value="">select your gender</option>
                    <option value="Non-binary" <c:if test="${form.gender == 'Non-binary'}">selected</c:if>>Non-binary</option>
                    <option value="Male" <c:if test="${form.gender == 'Male'}">selected</c:if>>Male</option>
                    <option value="Female" <c:if test="${form.gender == 'Female'}">selected</c:if>>Female</option>
                </select>
                <c:if test="${bindingResult.hasFieldErrors('gender')}">
                    <div class="text-danger mt-1">
                        <c:forEach items="${bindingResult.getFieldErrors('gender')}" var="error">
                            ${error.defaultMessage}<br>
                        </c:forEach>
                    </div>
                </c:if>
                <div id="genderHelp" class="form-text"></div>
            </div>
        </div>
        <div class="row">
            <!-- Height -->
            <div class="col-md-6 mb-3">
                <label for="height" class="form-label">Height</label>
                <input type="number" id="height" name="height" min="1"
                       class="form-control <c:if test="${bindingResult.hasFieldErrors('height')}">is-invalid</c:if>"
                       value="${form.height}">
                <c:if test="${bindingResult.hasFieldErrors('height')}">
                    <div class="text-danger mt-1">
                        <c:forEach items="${bindingResult.getFieldErrors('height')}" var="error">
                            ${error.defaultMessage}<br>
                        </c:forEach>
                    </div>
                </c:if>
            </div>

            <!-- Style -->
            <div class="col-md-6 mb-3">
                <label for="style" class="form-label">Style</label>
                <input type="text" id="style" name="style"
                       class="form-control <c:if test="${bindingResult.hasFieldErrors('style')}">is-invalid</c:if>"
                       value="${form.style}">
                <c:if test="${bindingResult.hasFieldErrors('style')}">
                    <div class="text-danger mt-1">
                        <c:forEach items="${bindingResult.getFieldErrors('style')}" var="error">
                            ${error.defaultMessage}<br>
                        </c:forEach>
                    </div>
                </c:if>
            </div>
        </div>

        <div class="row">
            <!-- Favorite Area -->
            <div class="col-md-6 mb-3">
                <label for="favoriteArea" class="form-label">Favorite Area</label>
                <input type="text" id="favoriteArea" name="favoriteArea"
                       class="form-control <c:if test="${bindingResult.hasFieldErrors('favoriteArea')}">is-invalid</c:if>"
                       value="${form.favoriteArea}">
                <c:if test="${bindingResult.hasFieldErrors('favoriteArea')}">
                    <div class="text-danger mt-1">
                        <c:forEach items="${bindingResult.getFieldErrors('favoriteArea')}" var="error">
                            ${error.defaultMessage}<br>
                        </c:forEach>
                    </div>
                </c:if>
            </div>

            <!-- Favorite Boulder Problem -->
            <div class="col-md-6 mb-3">
                <label for="favoriteBoulderProblem" class="form-label">Favorite Boulder Problem</label>
                <input type="text" id="favoriteBoulderProblem" name="favoriteBoulderProblem"
                       class="form-control <c:if test="${bindingResult.hasFieldErrors('favoriteBoulderProblem')}">is-invalid</c:if>"
                       value="${form.favoriteBoulderProblem}">
                <c:if test="${bindingResult.hasFieldErrors('favoriteBoulderProblem')}">
                    <div class="text-danger mt-1">
                        <c:forEach items="${bindingResult.getFieldErrors('favoriteBoulderProblem')}" var="error">
                            ${error.defaultMessage}<br>
                        </c:forEach>
                    </div>
                </c:if>
            </div>
        </div>

        <!-- About -->
        <div class="row">
            <div class="col-md-12 mb-3">
                <label for="about" class="form-label">About</label>
                <textarea id="about" name="about" class="form-control <c:if test="${bindingResult.hasFieldErrors('about')}">is-invalid</c:if>" rows="3">${form.about}</textarea>
                <c:if test="${bindingResult.hasFieldErrors('about')}">
                    <div class="text-danger mt-1">
                        <c:forEach items="${bindingResult.getFieldErrors('about')}" var="error">
                            ${error.defaultMessage}<br>
                        </c:forEach>
                    </div>
                </c:if>
            </div>
        </div>

        <!-- Profile Picture Upload -->
        <div class="row mb-3">
            <div class="col-md-12">
                <label for="profileImg" class="form-label">Profile Picture</label>
                <input type="file" id="profileImg" name="profileImg" class="form-control">
            </div>
        </div>

        <!-- Submit Form -->
        <button type="submit" class="btn btn-primary">Submit</button>
        <div class="already"> Already have an account?
            <a href="/account/login">Login</a>
        </div>
    </form>
</div>


<jsp:include page="../include/footer.jsp"/>