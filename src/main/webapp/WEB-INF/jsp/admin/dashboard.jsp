<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp" />

<h1>Admin Dashboard</h1>

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

<jsp:include page="../include/footer.jsp" />