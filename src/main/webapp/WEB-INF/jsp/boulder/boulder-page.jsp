<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp" />

<link href="/pub/css/global.css" rel="stylesheet">

<div class="container my-4 boulder-profile" style="max-width: 90%;">
    <div class="row">
        <div class="col-md-6 d-flex flex-column">
            <img src="/pub/media/TheMandala.jpeg" alt="The Mandala" class="img-fluid boulder-image">
        </div>
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
    <div class="row mt-4">
        <div class="col-md-6 d-flex">
            <div class="d-flex flex-column justify-content-center align-items-center">
                <img src="/pub/media/TheMandala.jpeg" alt="Placeholder 1" class="img-fluid boulder-placeholder">
            </div>
            <div class="d-flex flex-column justify-content-center align-items-center">
                <img src="/pub/media/TheMandala.jpeg" alt="Placeholder 2" class="img-fluid boulder-placeholder">
            </div>
            <div class="d-flex flex-column justify-content-center align-items-center">
                <img src="/pub/media/TheMandala.jpeg" alt="Placeholder 3" class="img-fluid boulder-placeholder">
            </div>
        </div>
        <div class="col-md-6">
            <div class="divider"></div>
            <div class="beta-section mt-4">
                <h3 class="beta-header" data-bs-toggle="collapse" data-bs-target="#betaContent" aria-expanded="false" aria-controls="betaContent">
                    BETA <img src="/pub/media/down-arrow.png" alt="Down Arrow" class="img-fluid" style="width: 27px; height: 27px;">
                </h3>
                <div class="collapse" id="betaContent">
                    <p class="mt-3">Detailed beta information goes here...</p>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../include/footer.jsp" />