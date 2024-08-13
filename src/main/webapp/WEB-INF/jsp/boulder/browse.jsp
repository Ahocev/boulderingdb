<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp" />

<style>
    .browse-title {
        font-family: "Anonymous Pro";
        letter-spacing: 0.1em;
    }

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

    .nearest-city {
        margin-left: 10px;
        cursor: pointer;
    }

    .collapsible-header {
        cursor: pointer;
    }

    .collapsible-content {
        display: none;
        margin-top: 10px;
    }

    .collapsible-content.active {
        display: block;
    }
</style>

<section>
    <div class="container">
        <h1 class="text-center mt-4 mb-4 browse-title">BROWSE BOULDER PROBLEMS</h1>
        <div class="columns">
            <c:forEach var="location" items="${locations}" varStatus="status">
                <div class="column">
                    <div class="location">
                        <h2 class="collapsible-header" style="text-transform: uppercase;">${location.country}</h2>
                        <div class="collapsible-content">
                            <h3 class="nearest-city collapsible-header" style="text-transform: uppercase;">${location.nearestCity}</h3>
                            <div class="collapsible-content">
                                <c:forEach var="zoneEntry" items="${location.zoneMap.entrySet()}">
                                    <div class="zone">
                                        <h4 class="collapsible-header" style="text-transform: uppercase;">${zoneEntry.key}</h4>
                                        <div class="collapsible-content">
                                            <ul>
                                                <c:forEach var="bp" items="${zoneEntry.value}">
                                                    <li>
                                                        <a href="/boulder/boulder-page?id=${bp.id}">${bp.boulderProblemName}</a>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>

<jsp:include page="../include/footer.jsp" />

<script>
    document.querySelectorAll('.collapsible-header').forEach(function(header) {
        header.addEventListener('click', function() {
            const content = this.nextElementSibling;
            if (content.classList.contains('active')) {
                content.classList.remove('active');
            } else {
                content.classList.add('active');
            }
        });
    });
</script>