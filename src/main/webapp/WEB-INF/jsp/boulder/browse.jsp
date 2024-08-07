<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp" />

<style>
    .browse-title {
        font-family: "Anonymous Pro";
        letter-spacing: 0.1em;
    }
</style>

<section>
    <div class="container">
        <h1 class="text-center mt-4 mb-4 browse-title">BROWSE BOULDER PROBLEMS</h1>
        <div class="columns">
            <c:forEach var="location" items="${locations}" varStatus="status">
                <div class="column">
                    <div class="location">
                        <h2 style="text-transform: uppercase;">${location.country}</h2>
                        <c:forEach var="zoneEntry" items="${location.zoneMap.entrySet()}">
                            <div class="zone">
                                <h3 style="text-transform: uppercase;">${zoneEntry.key}</h3>
                                <ul>
                                    <c:forEach var="bp" items="${zoneEntry.value}">
                                        <li>
                                            <a href="/boulder/boulder-page?id=${bp.id}">${bp.boulderProblemName}</a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>

<jsp:include page="../include/footer.jsp" />

<style>
    .columns {
        display: grid;
        grid-template-columns: 1fr 1fr 1fr;
        gap: 20px;
    }

    .column {
        break-inside: avoid;
    }

    .location {
        margin-bottom: 20px;
    }

    .zone {
        margin-left: 20px;
        margin-bottom: 20px;
    }
</style>