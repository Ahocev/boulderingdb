<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="include/header.jsp" />

<style>
    .boulderDetails {
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 8; /* Change this to the desired number of lines */
        overflow: hidden;
        text-overflow: ellipsis;
    }

    .popular-section {
        display: flex;
        flex-direction: column;
        align-items: start;
    }

</style>

<img id="main-image" src="/pub/media/TheMandala.jpeg" alt="The Mandala" class="responsive-image" onclick="changeImage()">
</div>
<div class="popular-section">
    <div class="popular-title">FEATURED</div>
    <div class="row gx-3">
        <c:forEach var="boulderProblem" items="${featuredBoulders}">
            <div class="col-md-3">
                <div class="flex-box">

                    <a href="/boulder/boulder-page?id=${boulderProblem.id}"></a>
                    <div class="flex-box-title">${boulderProblem.boulderProblemName}</div>
                    <img src="${boulderProblem.showcaseImgUrl}" alt="${boulderProblem.boulderProblemName}">
                    <div class="flex-box-subtitle">${boulderProblem.location.nearestCity} ${boulderProblem.location.state}</div>
                    <div class="flex-box-subtitle">${boulderProblem.grade}</div>
                    <p class="boulderDetails">${boulderProblem.history}</p>

                </div>
            </div>
        </c:forEach>
    </div>
</div>
<script>
    let images = ["/pub/media/TheMandala.jpeg", "/pub/media/HighPlains.jpeg", "/pub/media/Queen.jpeg", "/pub/media/Swarm.jpeg"];
    let currentIndex = 0;

    function changeImage() {
        currentIndex = (currentIndex + 1) % images.length;
        document.getElementById("main-image").src = images[currentIndex];
    }
</script>

<jsp:include page="include/footer.jsp" />