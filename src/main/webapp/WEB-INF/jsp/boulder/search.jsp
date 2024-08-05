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
    }

    .search-button:hover {
        background-color: #333; /* Darker shade on hover */
    }

    .form-outline {
        width: 1000px; /* Widen the input field */
    }
</style>

<section>
    <div class="container">
        <h1 class="text-center mt-4">Search the Database</h1>
    </div>
</section>

<!-- a search form -->
<section>
    <div class="container">
        <div class="row justify-content-center pt-5 pb-3">
            <div class="col-8 text-center">
                <form action="/boulder/search" class="search-form">
                    <input type="search" id="search" name="search" class="form-control form-outline search-input" value="${search}" placeholder="Enter search term" aria-label="Search" />
                    <button type="submit" class="btn search-button">Search</button>
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
                                <td>${boulderProblem.rating}</td>
                                <td>${boulderProblem.firstAscensionist}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </section>
</c:if>

<jsp:include page="../include/footer.jsp" />