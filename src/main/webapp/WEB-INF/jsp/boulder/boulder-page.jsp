<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp" />

<link href="/pub/css/global.css" rel="stylesheet">

<div class="container my-4 boulder-profile" style="max-width: 90%;">
    <div class="row">
        <!-- Top left box with the large image -->
        <div class="col-md-6 d-flex flex-column">
            <img src="/pub/media/TheMandala.jpeg" alt="The Mandala" class="img-fluid boulder-image">
        </div>
        <!-- Top right box with the boulder details -->
        <div class="col-md-6 d-flex flex-column">
            <h2 class="boulder-name">The Mandala</h2>
            <p class="boulder-grade text-muted">v12</p>
            <div class="divider"></div>
            <div class="boulder-details mb-4">
                <p>
                    Stats and names and stuff about it. First ascensionist, boulder history, and other things you might want to know about a big ol' rock.
                </p>
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus imperdiet, nulla et dictum interdum, nisi lorem egestas odio.
                </p>
            </div>
        </div>
    </div>
    <div class="row mt-4 position-relative">
        <!-- Bottom left box with the three placeholder images within flex boxes -->
        <div class="col-md-6 d-flex flex-column position-relative" style="height: 200px;">
            <div class="d-flex position-absolute" style="top: 0; width: 95%;">
                <div class="flex-fill">
                    <img src="/pub/media/TheMandala.jpeg" alt="Placeholder 1" class="img-fluid boulder-placeholder">
                </div>
                <div class="flex-fill">
                    <img src="/pub/media/TheMandala.jpeg" alt="Placeholder 2" class="img-fluid boulder-placeholder">
                </div>
                <div class="flex-fill">
                    <img src="/pub/media/TheMandala.jpeg" alt="Placeholder 3" class="img-fluid boulder-placeholder">
                </div>
            </div>
        </div>
        <!-- Bottom right box with the BETA section -->
        <div class="col-md-6 d-flex flex-column">
            <div class="divider"></div>
            <div class="beta-section mt-2">
                <h3 class="beta-header" data-bs-toggle="collapse" data-bs-target="#betaContent" aria-expanded="false" aria-controls="betaContent">
                    BETA <img src="/pub/media/down-arrow.png" alt="Down Arrow" class="img-fluid" style="width: 27px; height: 27px;">
                </h3>
                <div class="collapse" id="betaContent">
                    <p class="mt-3">Detailed beta information goes here...</p>
                    <p class="mt-3">Additional beta information...</p>
                    <p class="mt-3">Even more beta information...</p>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../include/footer.jsp" />