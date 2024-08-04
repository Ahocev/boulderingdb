<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp"/>

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
        width: 105%; /* Fixed width */
        margin-left: 25px;
    }

    .btn-primary:hover {
        background-color: #333; /* Darker shade on hover */
    }

</style>


<div class="form-container">
    <form action="/boulder/submit" method="post" enctype="multipart/form-data">
        <div class="formTag">
            <h1>Add Boulder Problem</h1>
            <h6 class="text-muted">Please enter as much info as possible so that we can create a great database
                together.</h6>
        </div>

        <div class="row">
            <!-- Boulder Problem Name -->
            <div class="col-md-6 mb-3">
                <label for="boulderProblemName" class="form-label">Boulder Problem Name*</label>
                <input type="text" id="boulderProblemName" name="boulderProblemName"
                       class="form-control <c:if test="${bindingResult.hasFieldErrors('boulderProblemName')}">is-invalid</c:if>"
                       value="${form.boulderProblemName}">
                <c:if test="${bindingResult.hasFieldErrors('boulderProblemName')}">
                    <div class="text-danger">
                        <c:forEach items="${bindingResult.getFieldErrors('boulderProblemName')}" var="error">
                            ${error.defaultMessage}<br>
                        </c:forEach>
                    </div>
                </c:if>
            </div>

            <!-- Country -->
            <div class="col-md-6 mb-3">
                <label for="country" class="form-label">Country</label>
                <input type="text" id="country" name="country"
                       class="form-control <c:if test="${bindingResult.hasFieldErrors('country')}">is-invalid</c:if>"
                       value="${form.country}">
                <c:if test="${bindingResult.hasFieldErrors('country')}">
                    <div class="text-danger">
                        <c:forEach items="${bindingResult.getFieldErrors('country')}" var="error">
                            ${error.defaultMessage}<br>
                        </c:forEach>
                    </div>
                </c:if>
            </div>
        </div>

        <div class="row">
            <!-- State -->
            <div class="col-md-6 mb-3">
                <label for="state" class="form-label">State</label>
                <select class="form-select <c:if test="${bindingResult.hasFieldErrors('state')}">is-invalid</c:if>"
                        id="state" name="state">
                    <option value="">--select your state--</option>
                    <option value="AL" <c:if test="${form.state == 'AL'}">selected</c:if>>AL</option>
                    <option value="AK" <c:if test="${form.state == 'AK'}">selected</c:if>>AK</option>
                    <option value="AZ" <c:if test="${form.state == 'AZ'}">selected</c:if>>AZ</option>
                    <option value="AR" <c:if test="${form.state == 'AR'}">selected</c:if>>AR</option>
                    <option value="CA" <c:if test="${form.state == 'CA'}">selected</c:if>>CA</option>
                    <option value="CO" <c:if test="${form.state == 'CO'}">selected</c:if>>CO</option>
                    <option value="CT" <c:if test="${form.state == 'CT'}">selected</c:if>>CT</option>
                    <option value="DE" <c:if test="${form.state == 'DE'}">selected</c:if>>DE</option>
                    <option value="FL" <c:if test="${form.state == 'FL'}">selected</c:if>>FL</option>
                    <option value="GA" <c:if test="${form.state == 'GA'}">selected</c:if>>GA</option>
                    <option value="HI" <c:if test="${form.state == 'HI'}">selected</c:if>>HI</option>
                    <option value="ID" <c:if test="${form.state == 'ID'}">selected</c:if>>ID</option>
                    <option value="IL" <c:if test="${form.state == 'IL'}">selected</c:if>>IL</option>
                    <option value="IN" <c:if test="${form.state == 'IN'}">selected</c:if>>IN</option>
                    <option value="IA" <c:if test="${form.state == 'IA'}">selected</c:if>>IA</option>
                    <option value="KS" <c:if test="${form.state == 'KS'}">selected</c:if>>KS</option>
                    <option value="KY" <c:if test="${form.state == 'KY'}">selected</c:if>>KY</option>
                    <option value="LA" <c:if test="${form.state == 'LA'}">selected</c:if>>LA</option>
                    <option value="ME" <c:if test="${form.state == 'ME'}">selected</c:if>>ME</option>
                    <option value="MD" <c:if test="${form.state == 'MD'}">selected</c:if>>MD</option>
                    <option value="MA" <c:if test="${form.state == 'MA'}">selected</c:if>>MA</option>
                    <option value="MI" <c:if test="${form.state == 'MI'}">selected</c:if>>MI</option>
                    <option value="MN" <c:if test="${form.state == 'MN'}">selected</c:if>>MN</option>
                    <option value="MS" <c:if test="${form.state == 'MS'}">selected</c:if>>MS</option>
                    <option value="MO" <c:if test="${form.state == 'MO'}">selected</c:if>>MO</option>
                    <option value="MT" <c:if test="${form.state == 'MT'}">selected</c:if>>MT</option>
                    <option value="NE" <c:if test="${form.state == 'NE'}">selected</c:if>>NE</option>
                    <option value="NV" <c:if test="${form.state == 'NV'}">selected</c:if>>NV</option>
                    <option value="NH" <c:if test="${form.state == 'NH'}">selected</c:if>>NH</option>
                    <option value="NJ" <c:if test="${form.state == 'NJ'}">selected</c:if>>NJ</option>
                    <option value="NM" <c:if test="${form.state == 'NM'}">selected</c:if>>NM</option>
                    <option value="NY" <c:if test="${form.state == 'NY'}">selected</c:if>>NY</option>
                    <option value="NC" <c:if test="${form.state == 'NC'}">selected</c:if>>NC</option>
                    <option value="ND" <c:if test="${form.state == 'ND'}">selected</c:if>>ND</option>
                    <option value="OH" <c:if test="${form.state == 'OH'}">selected</c:if>>OH</option>
                    <option value="OK" <c:if test="${form.state == 'OK'}">selected</c:if>>OK</option>
                    <option value="OR" <c:if test="${form.state == 'OR'}">selected</c:if>>OR</option>
                    <option value="PA" <c:if test="${form.state == 'PA'}">selected</c:if>>PA</option>
                    <option value="RI" <c:if test="${form.state == 'RI'}">selected</c:if>>RI</option>
                    <option value="SC" <c:if test="${form.state == 'SC'}">selected</c:if>>SC</option>
                    <option value="SD" <c:if test="${form.state == 'SD'}">selected</c:if>>SD</option>
                    <option value="TN" <c:if test="${form.state == 'TN'}">selected</c:if>>TN</option>
                    <option value="TN" <c:if test="${form.state == 'TX'}">selected</c:if>>TN</option>
                    <option value="TN" <c:if test="${form.state == 'UT'}">selected</c:if>>TN</option>
                    <option value="TN" <c:if test="${form.state == 'VT'}">selected</c:if>>TN</option>
                    <option value="TN" <c:if test="${form.state == 'VA'}">selected</c:if>>TN</option>
                    <option value="TN" <c:if test="${form.state == 'WA'}">selected</c:if>>TN</option>
                    <option value="TN" <c:if test="${form.state == 'WV'}">selected</c:if>>TN</option>
                    <option value="TN" <c:if test="${form.state == 'WI'}">selected</c:if>>TN</option>
                    <option value="TN" <c:if test="${form.state == 'WY'}">selected</c:if>>TN</option>
                </select>
            </div>

            <!-- Nearest City -->
            <div class="col-md-6 mb-3">
                <label for="nearestCity" class="form-label">Nearest City</label>
                <input type="text" id="nearestCity" name="nearestCity"
                       class="form-control <c:if test="${bindingResult.hasFieldErrors('nearestCity')}">is-invalid</c:if>"
                       value="${form.nearestCity}">
                <c:if test="${bindingResult.hasFieldErrors('nearestCity')}">
                    <div class="text-danger">
                        <c:forEach items="${bindingResult.getFieldErrors('nearestCity')}" var="error">
                            ${error.defaultMessage}<br>
                        </c:forEach>
                    </div>
                </c:if>
            </div>
        </div>

        <div class="row">
            <!-- Zone Name -->
            <div class="col-md-6 mb-3">
                <label for="zoneName" class="form-label">Zone Name</label>
                <input type="text" id="zoneName" name="zoneName"
                       class="form-control <c:if test="${bindingResult.hasFieldErrors('zoneName')}">is-invalid</c:if>"
                       value="${form.zoneName}">
                <c:if test="${bindingResult.hasFieldErrors('zoneName')}">
                    <div class="text-danger">
                        <c:forEach items="${bindingResult.getFieldErrors('zoneName')}" var="error">
                            ${error.defaultMessage}<br>
                        </c:forEach>
                    </div>
                </c:if>
            </div>

            <!-- Boulder Name -->
            <div class="col-md-6 mb-3">
                <label for="boulderName" class="form-label">Boulder Name</label>
                <input type="text" id="boulderName" name="boulderName" placeholder="what boulder is this problem on?"
                       class="form-control <c:if test="${bindingResult.hasFieldErrors('boulderName')}">is-invalid</c:if>"
                       value="${form.boulderName}">
                <c:if test="${bindingResult.hasFieldErrors('boulderName')}">
                    <div class="text-danger">
                        <c:forEach items="${bindingResult.getFieldErrors('boulderName')}" var="error">
                            ${error.defaultMessage}<br>
                        </c:forEach>
                    </div>
                </c:if>
            </div>

            <!-- First Ascensionist -->
            <div class="col-md-6 mb-3">
                <label for="firstAscensionist" class="form-label">First Ascensionist</label>
                <input type="text" id="firstAscensionist" name="firstAscensionist"
                       class="form-control <c:if test="${bindingResult.hasFieldErrors('firstAscensionist')}">is-invalid</c:if>"
                       value="${form.firstAscensionist}">
                <c:if test="${bindingResult.hasFieldErrors('firstAscensionist')}">
                    <div class="text-danger">
                        <c:forEach items="${bindingResult.getFieldErrors('firstAscensionist')}" var="error">
                            ${error.defaultMessage}<br>
                        </c:forEach>
                    </div>
                </c:if>
            </div>
        </div>

        <div class="row">

            <!-- Repeated -->
            <div class="col-md-2 mb-3">
                <label for="repeated" class="form-label">Repeated</label>
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="repeated" name="repeated" value="true" <c:if test="${form.repeated}">checked</c:if>>
                    <label class="form-check-label" for="repeated"></label>
                </div>
                <c:if test="${bindingResult.hasFieldErrors('repeated')}">
                    <div class="text-danger">
                        <c:forEach items="${bindingResult.getFieldErrors('repeated')}" var="error">
                            ${error.defaultMessage}<br>
                        </c:forEach>
                    </div>
                </c:if>
            </div>


            <!-- Grade -->
            <div class="col-md-4 mb-3">
                <label for="grade" class="form-label">Grade</label>
                <select class="form-select <c:if test="${bindingResult.hasFieldErrors('grade')}">is-invalid</c:if>"
                        id="grade" name="grade">
                    <option value="">--proposed grade--</option>
                    <option value="V0" <c:if test="${form.grade == 'V0'}">selected</c:if>>V0</option>
                    <option value="V1" <c:if test="${form.grade == 'V1'}">selected</c:if>>V1</option>
                    <option value="V2" <c:if test="${form.grade == 'V2'}">selected</c:if>>V2</option>
                    <option value="V3" <c:if test="${form.grade == 'V3'}">selected</c:if>>V3</option>
                    <option value="V4" <c:if test="${form.grade == 'V4'}">selected</c:if>>V4</option>
                    <option value="V5" <c:if test="${form.grade == 'V5'}">selected</c:if>>V5</option>
                    <option value="V6" <c:if test="${form.grade == 'V6'}">selected</c:if>>V6</option>
                    <option value="V7" <c:if test="${form.grade == 'V7'}">selected</c:if>>V7</option>
                    <option value="V8" <c:if test="${form.grade == 'V8'}">selected</c:if>>V8</option>
                    <option value="V9" <c:if test="${form.grade == 'V9'}">selected</c:if>>V9</option>
                    <option value="V10" <c:if test="${form.grade == 'V10'}">selected</c:if>>V10</option>
                    <option value="V11" <c:if test="${form.grade == 'V11'}">selected</c:if>>V11</option>
                    <option value="V12" <c:if test="${form.grade == 'V12'}">selected</c:if>>V12</option>
                    <option value="V13" <c:if test="${form.grade == 'V13'}">selected</c:if>>V13</option>
                    <option value="V14" <c:if test="${form.grade == 'V14'}">selected</c:if>>V14</option>
                    <option value="V15" <c:if test="${form.grade == 'V15'}">selected</c:if>>V15</option>
                    <option value="V16" <c:if test="${form.grade == 'V16'}">selected</c:if>>V16</option>
                    <option value="V17" <c:if test="${form.grade == 'V17'}">selected</c:if>>V17</option>
                </select>
                <c:if test="${bindingResult.hasFieldErrors('grade')}">
                    <div class="text-danger">
                        <c:forEach items="${bindingResult.getFieldErrors('grade')}" var="error">
                            ${error.defaultMessage}<br>
                        </c:forEach>
                    </div>
                </c:if>
            </div>

            <!-- Rating -->
            <div class="col-md-6 mb-3">
                <label for="rating" class="form-label">Rating (Stars)</label>
                <div>
                    <input type="radio" id="rating1" name="rating" value="1"
                           <c:if test="${form.rating == 1}">checked</c:if>>
                    <label for="rating1">1</label>
                    <input type="radio" id="rating2" name="rating" value="2"
                           <c:if test="${form.rating == 2}">checked</c:if>>
                    <label for="rating2">2</label>
                    <input type="radio" id="rating3" name="rating" value="3"
                           <c:if test="${form.rating == 3}">checked</c:if>>
                    <label for="rating3">3</label>
                    <input type="radio" id="rating4" name="rating" value="4"
                           <c:if test="${form.rating == 4}">checked</c:if>>
                    <label for="rating4">4</label>
                    <input type="radio" id="rating5" name="rating" value="5"
                           <c:if test="${form.rating == 5}">checked</c:if>>
                    <label for="rating5">5</label>
                </div>
                <c:if test="${bindingResult.hasFieldErrors('rating')}">
                    <div class="text-danger">
                        <c:forEach items="${bindingResult.getFieldErrors('rating')}" var="error">
                            ${error.defaultMessage}<br>
                        </c:forEach>
                    </div>
                </c:if>
            </div>
        </div>

        <div class="row">

            <!-- History -->
            <div class="row">
                <div class="col-md-12 mb-3">
                    <label for="history" class="form-label">History</label>
                    <textarea style="width: 104%;"
                            class="form-control <c:if test="${bindingResult.hasFieldErrors('history')}">is-invalid</c:if>"
                            id="history" name="history" aria-describedby="historyHelp"
                            rows="3">${form.history}</textarea>
                    <c:if test="${bindingResult.hasFieldErrors('history')}">
                        <div class="text-danger">
                            <c:forEach items="${bindingResult.getFieldErrors('history')}" var="error">
                                ${error.defaultMessage}<br>
                            </c:forEach>
                        </div>
                    </c:if>
                </div>
            </div>

            <!-- Showcase Image URL -->
            <div class="row mb-3">
                <div class="col-md-12">
                    <label for="showcaseImg" class="form-label">Showcase Image</label>
                    <input type="file" id="showcaseImg" name="showcaseImg" style="width: 104%;" class="form-control">
                </div>
            </div>

            <!-- Submit Form -->
            <div class="row">
                <div class="col-md-12 d-flex justify-content-center">
                    <button type="submit" class="btn btn-primary col-md-12">Submit</button>
                </div>
            </div>
        </div>
    </form>
</div>


<jsp:include page="../include/footer.jsp"/>
