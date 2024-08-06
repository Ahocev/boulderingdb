<jsp:include page="include/header.jsp" />

<img id="main-image" src="/pub/media/TheMandala.jpeg" alt="The Mandala" class="responsive-image" onclick="changeImage()">
</div>
<div class="popular-section">
    <div class="popular-title">FEATURED</div>
    <div class="row gx-3">
        <div class="col-md-3">
            <div class="flex-box">
                <a href="#mandala-details"></a>
                <div class="flex-box-title">THE MANDALA</div>
                <img src="/pub/media/TheMandala.jpeg" alt="The Mandala">
                <div class="flex-box-subtitle">Bishop, CA</div>
                <div class="flex-box-subtitle">V12</div>
                <p class="boulderDetails">text goes here and here's what it says climb text goes here and here's what it says climb</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="flex-box">
                <a href="#orb-details"></a>
                <div class="flex-box-title">THE ORB</div>
                <img src="/pub/media/TheMandala.jpeg" alt="The Orb">
                <div class="flex-box-subtitle">Rocktown, Georgia</div>
                <div class="flex-box-subtitle">V8</div>
                <p class="boulderDetails">text goes here and here's what it says climb text goes here and here's what it says climb</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="flex-box">
                <a href="#midnight-details"></a>
                <div class="flex-box-title">MIDNIGHT</div>
                <img src="/pub/media/TheMandala.jpeg" alt="Midnight">
                <div class="flex-box-subtitle">Rocktown, Georgia</div>
                <div class="flex-box-subtitle">V8</div>
                <p class="boulderDetails">text goes here and here's what it says climb text goes here and here's what it says climb</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="flex-box">
                <a href="#meadowlark-details"></a>
                <div class="flex-box-title">MEADOWLARK</div>
                <img src="/pub/media/TheMandala.jpeg" alt="Meadowlark">
                <div class="flex-box-subtitle">Rocktown, Georgia</div>
                <div class="flex-box-subtitle">V8</div>
                <p class="boulderDetails">text goes here and here's what it says climb text goes here and here's what it says climb</p>
            </div>
        </div>
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