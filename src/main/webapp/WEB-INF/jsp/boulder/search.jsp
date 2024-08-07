<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/header.jsp" />

<style>
    .search-form {
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .search-input {
        border-radius: 0; /* 90-degree corners for input fields */
        border: 1px solid #000; /* Add border */
        padding: 10px; /* Add padding */
        flex: 1; /* Make the input field take up available space */
    }

    .search-button {
        border-radius: 0; /* 90-degree corners */
        background-color: black; /* Black background for the submit button */
        border: none; /* Remove border */
        color: white; /* White text */
        height: 46px; /* Match the height of the input field */
        padding: 10px 20px; /* Add padding */
        font-family: "Anonymous Pro";
        letter-spacing: 0.1em;
    }

    .search-button:hover {
        background-color: #333; /* Darker shade on hover */
    }

    .form-outline {
        width: 1000px; /* Widen the input field */
    }

    .results-table {
        width: 100%;
        margin-bottom: 50px; /* Add margin to the bottom of the tables */
    }

    .table th, .table td {
        text-align: center; /* Center align table content */
    }

    .search-title {
        font-family: "Anonymous Pro";
        letter-spacing: 0.1em;
    }
</style>

<section>
    <div class="container">
        <h1 class="text-center mt-4 mb-0 search-title">SEARCH THE DATABASE</h1>
    </div>
</section>

<!-- a search form -->
<section>
    <div class="container">
        <div class="row justify-content-center pt-5 pb-3 mb-4">
            <div class="col-8 text-center">
                <form action="/boulder/search" class="search-form">
                    <input type="search" id="search" name="search" class="form-control form-outline search-input" value="${search}" placeholder="search for a boulder problem or user by name" aria-label="Search" />
                    <button type="submit" class="btn search-button">SEARCH</button>
                </form>
            </div>
        </div>
    </div>
</section>

<c:if test="${not empty boulderProblems}">
    <section>
        <div class="container">
            <div class="row pt-5">
                <div class="col-12">
                    <h2 class="text-center">Boulders Found (${boulderProblems.size()})</h2>
                </div>
            </div>
            <div class="row pt-3">
                <div class="col-12">
                    <table class="table">
                        <tr>
                            <th>ZONE</th>
                            <th>BOULDER PROBLEM</th>
                            <th>LOCATED ON</th>
                            <th>RATING</th>
                            <th>FIRST ASCENSIONIST</th>
                        </tr>
                        <c:forEach items="${boulderProblems}" var="boulderProblem">
                            <tr>
                                <td>${boulderProblem.zoneName}</td>
                                <td><a href="/boulder/boulder-page?id=${boulderProblem.id}">${boulderProblem.boulderProblemName}</a></td>
                                <td>${boulderProblem.boulderName}</td>
                                <td>${boulderProblem.rating} stars</td>
                                <td>${boulderProblem.firstAscensionist}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </section>
</c:if>

<c:if test="${not empty users}">
    <section>
        <div class="container">
            <div class="row pt-5">
                <div class="col-12">
                    <h2 class="text-center">Users Found (${users.size()})</h2>
                </div>
            </div>
            <div class="row pt-3">
                <div class="col-12">
                    <table class="table results-table">
                        <tr>
                            <th>NAME</th>
                            <th>AGE</th>
                            <th>APE INDEX</th>
                            <th>HEIGHT</th>
                            <th>GENDER</th>
                            <th>STYLE</th>
                        </tr>
                        <c:forEach items="${users}" var="user">
                            <tr>
                                <td><a href="/account/profile?id=${user.id}">${user.name}</a></td>
                                <td>${user.age}</td>
                                <td>${user.apeIndex}</td>
                                <td>${user.height}</td>
                                <td>${user.gender}</td>
                                <td>${user.style}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </section>
</c:if>

<jsp:include page="../include/footer.jsp" />