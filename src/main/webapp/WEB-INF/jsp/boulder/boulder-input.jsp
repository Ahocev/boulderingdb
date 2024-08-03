<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp" />

<link href="/pub/css/global.css" rel="stylesheet">

<div class="form-container">
    <form action="/boulder/submit" method="post">
        <div class="formTag">
            <h1>Add Boulder Problem</h1>
            <h6 class="text-muted">Please enter as much info as possible so that we can create a great database together.</h6>
        </div>

        <div class="row">
            <!-- Boulder Problem Name -->
            <div class="col-md-6 mb-3">
                <label for="boulderProblemName" class="form-label">Boulder Problem Name*</label>
                <input type="text" id="boulderProblemName" name="boulder_problem_name" class="form-control" value="${form.boulder_problem_name}">
                <c:if test="${bindingResult.hasFieldErrors('boulder_problem_name')}">
                    <div class="text-danger">
                        <c:forEach items="${bindingResult.getFieldErrors('boulder_problem_name')}" var="error">
                            ${error.defaultMessage}<br>
                        </c:forEach>
                    </div>
                </c:if>
            </div>

            <!-- Country -->
            <div class="col-md-6 mb-3">
                <label for="country" class="form-label">Country</label>
                <input type="text" id="country" name="country" class="form-control" value="${form.country}">
            </div>
        </div>

        <div class="row">
            <!-- Climbing Area -->
            <div class="col-md-6 mb-3">
                <label for="climbingArea" class="form-label">Climbing Area</label>
                <input type="text" id="climbingArea" name="climbing_area" class="form-control" value="${form.climbing_area}">
            </div>

            <!-- State -->
            <div class="col-md-6 mb-3">
                <label for="state" class="form-label">State</label>
                <select class="form-select" id="state" name="state">
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
            </div>
        </div>

        <div class="row">
            <!-- Zone Name -->
            <div class="col-md-6 mb-3">
                <label for="zoneName" class="form-label">Zone Name</label>
                <input type="text" id="zoneName" name="zone_name" class="form-control" value="${form.zone_name}">
            </div>

            <!-- Boulder Name -->
            <div class="col-md-6 mb-3">
                <label for="boulderName" class="form-label">Boulder Name</label>
                <input type="text" id="boulderName" name="boulder_name" class="form-control" value="${form.boulder_name}">
            </div>
        </div>

        <div class="row">
            <!-- First Ascensionist -->
            <div class="col-md-6 mb-3">
                <label for="firstAscensionist" class="form-label">First Ascensionist</label>
                <input type="text" id="firstAscensionist" name="first_ascensionist" class="form-control" value="${form.first_ascensionist}">
            </div>

            <!-- Grade -->
            <div class="col-md-6 mb-3">
                <label for="grade" class="form-label">Grade</label>
                <input type="text" id="grade" name="grade" class="form-control" value="${form.grade}">
            </div>
        </div>

        <div class="row">
            <!-- Rating -->
            <div class="col-md-6 mb-3">
                <label for="rating" class="form-label">Rating (Stars)</label>
                <div>
                    <input type="radio" id="rating1" name="rating" value="1" ${form.rating == 1 ? 'checked' : ''}>
                    <label for="rating1">1</label>
                    <input type="radio" id="rating2" name="rating" value="2" ${form.rating == 2 ? 'checked' : ''}>
                    <label for="rating2">2</label>
                    <input type="radio" id="rating3" name="rating" value="3" ${form.rating == 3 ? 'checked' : ''}>
                    <label for="rating3">3</label>
                    <input type="radio" id="rating4" name="rating" value="4" ${form.rating == 4 ? 'checked' : ''}>
                    <label for="rating4">4</label>
                    <input type="radio" id="rating5" name="rating" value="5" ${form.rating == 5 ? 'checked' : ''}>
                    <label for="rating5">5</label>
                </div>
            </div>

            <!-- Repeated -->
            <div class="col-md-6 mb-3">
                <label for="repeated" class="form-label">Repeated</label>
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="repeated" name="repeated" value="1" ${form.repeated == 1 ? 'checked' : ''}>
                    <label class="form-check-label" for="repeated"></label>
                </div>
            </div>
        </div>

        <!-- History -->
        <div class="row">
            <div class="col-md-12 mb-3">
                <label for="history" class="form-label">History</label>
                <textarea class="form-control" id="history" name="history" aria-describedby="historyHelp" rows="3">${form.history}</textarea>
                <div id="historyHelp" class="form-text"></div>
            </div>
        </div>

        <!-- Showcase Image URL -->
        <div class="row mb-3">
            <div class="col-md-12">
                <label for="showcaseImgUrl" class="form-label">Showcase Image URL</label>
                <input type="file" id="showcaseImgUrl" name="showcase_img_url" class="form-control">
            </div>
        </div>

        <!-- Submit Form -->
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>

<jsp:include page="../include/footer.jsp" />