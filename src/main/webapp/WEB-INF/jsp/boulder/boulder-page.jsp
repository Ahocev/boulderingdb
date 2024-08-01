<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp" />

<link href="/pub/css/global.css" rel="stylesheet">

<div class="container my-4 boulder-profile">
    <div class="row mb-4 boulder-header">
        <div class="col-md-4">
            <img src="placeholder.jpg" alt="Boulder Image" class="img-fluid boulder-image">
        </div>
        <div class="col-md-8 d-flex flex-column justify-content-center">
            <h2 class="boulder-name">The Mandala</h2>
            <p class="boulder-grade text-muted">v12</p>
        </div>
    </div>
    <div class="divider"></div>
    <div class="boulder-details mb-4">
        <p>
            Stats and names and stuff about it. First ascensionist, boulder history, and other things you might want to know about a big ol' rock.
        </p>
        <p>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus imperdiet, nulla et dictum interdum, nisi lorem egestas odio.
        </p>
    </div>
    <div class="divider"></div>
    <div class="beta-section mt-4">
        <h3 class="beta-header" data-bs-toggle="collapse" href="#betaContent" role="button" aria-expanded="false" aria-controls="betaContent">
            BETA ↓
        </h3>
        <div class="collapse" id="betaContent">
            <p class="mt-3">Detailed beta information goes here...</p>
        </div>
    </div>
</div>
<script>
    document.querySelector('.beta-section h3').addEventListener('click', function() {
        // Toggle the visibility of beta information here
        alert('Beta information clicked!');
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-ZMlGA6M6Q8sV8AuBSAN1F+DhfY16BS1O5quL6pRTlbp0zYmHeE7m6+oX+1r1FJQj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhG81r8mPUdAms7UKvF8KzYv49WykH1uyL9eZ6pFoap4ROzcrMNo0D21X6k6" crossorigin="anonymous"></script>