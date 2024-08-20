<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp" />

<h1 class="admin-title mt-4">Admin Dashboard</h1>

<style>
    table {
        width: 100%;
        border-collapse: collapse;
    }
    th, td {
        padding: 10px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    th {
        background-color: #f2f2f2;
    }
    th, td {
        padding: 15px;
    }
    .admin-title {
        text-transform: uppercase;
        font-family: "Anonymous Pro";
        letter-spacing: 0.1em;
    }
</style>

<table class="col-4 mt-4 mb-4">
    <thead>
    <tr>
        <th>Id</th>
        <th>Problem Name</th>
        <th>Grade</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="boulderProblem" items="${boulderProblems}">
        <tr>
            <td>${boulderProblem.id}</td>
            <td>${boulderProblem.boulderProblemName}</td>
            <td>${boulderProblem.grade}</td>
            <td>
                <form action="${pageContext.request.contextPath}/admin/deleteBoulder" method="post">
                    <input type="hidden" name="id" value="${boulderProblem.id}" />
                    <input type="submit" value="Delete" />
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<table class="col-4 mt-4 mb-4">
    <thead>
    <tr>
        <th>Id</th>
        <th>Country</th>
        <th>State</th>
        <th>Nearest City</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="location" items="${locations}">
        <tr>
            <td>${location.id}</td>
            <td>${location.country}</td>
            <td>${location.state}</td>
            <td>${location.nearestCity}</td>
            <td>
                <form action="${pageContext.request.contextPath}/admin/deleteLocation" method="post">
                    <input type="hidden" name="id" value="${location.id}" />
                    <input type="submit" value="Delete" />
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<table class="col-4 mt-4 mb-4">
    <thead>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Email</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="user" items="${users}">
        <tr>
            <td>${user.id}</td>
            <td>${user.name}</td>
            <td>${user.email}</td>
            <td>
                <form action="${pageContext.request.contextPath}/admin/deleteUser" method="post">
                    <input type="hidden" name="id" value="${user.id}" />
                    <input type="submit" value="Delete" />
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<table class="col-4 mt-4 mb-4">
    <thead>
    <tr>
        <th>Image Id</th>
        <th>Boulder Problem Id</th>
        <th>Image URL</th>
        <th>User Id</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="additionalImage" items="${additionalImages}">
        <tr>
            <td>${additionalImage.id}</td>
            <td>${additionalImage.boulderProblemId}</td>
            <td>${additionalImage.imageUrl}</td>
            <td>${additionalImage.userId}</td>

            <td>
                <form action="${pageContext.request.contextPath}/admin/deleteAdditionalImages" method="post">
                    <input type="hidden" name="id" value="${additionalImage.id}" />
                    <input type="submit" value="Delete" />
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<jsp:include page="../include/footer.jsp" />