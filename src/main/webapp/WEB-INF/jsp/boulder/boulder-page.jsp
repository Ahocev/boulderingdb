<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp" />

<link href="/pub/css/global.css" rel="stylesheet">

<div class="container my-4 boulder-profile" style="max-width: 90%;">
    <div class="row">
        <!-- Top left box with the large image -->
        <div class="col-md-6 d-flex flex-column">
            <img id="mainImage" src="/pub/media/TheMandala.jpeg" alt="The Mandala" class="img-fluid boulder-image">
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
            <div id="placeholderContainer" class="d-flex position-absolute" style="top: 0; width: 95%; overflow: hidden;">
                <div class="boulder-placeholder-container">
                    <img src="/pub/media/HighPlains.jpeg" alt="Placeholder 1" class="img-fluid boulder-placeholder" onclick="swapImages(this)">
                </div>
                <div class="boulder-placeholder-container">
                    <img src="/pub/media/Queen.jpeg" alt="Placeholder 2" class="img-fluid boulder-placeholder" onclick="swapImages(this)">
                </div>
                <div class="boulder-placeholder-container hidden">
                    <img src="/pub/media/Swarm.jpeg" alt="Placeholder 3" class="img-fluid boulder-placeholder" onclick="swapImages(this)">
                </div>
            </div>
            <div class="scroll-button left" onclick="scrollLeftCustom()">&#9664;</div>
            <div class="scroll-button right" onclick="scrollRight()">&#9654;</div>
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
<div id="imageOverlay" class="overlay hidden">
    <span class="closebtn" onclick="closeOverlay()">&times;</span>
    <img class="overlay-content" id="overlayImage">
</div>

<jsp:include page="../include/footer.jsp" />

<script>
    document.addEventListener('DOMContentLoaded', function() {
        adjustPlaceholderDisplay();
        document.getElementById('mainImage').addEventListener('click', function() {
            showOverlay(this.src);
        });
    });

    function adjustPlaceholderDisplay() {
        var placeholders = document.querySelectorAll('.boulder-placeholder');
        var nativeSizes = [];

        placeholders.forEach(function(img) {
            var imgObj = new Image();
            imgObj.src = img.src;
            imgObj.onload = function() {
                nativeSizes.push({ width: imgObj.width, height: imgObj.height });
                if (nativeSizes.length === placeholders.length) {
                    var allSameSize = nativeSizes.every(function(size) {
                        return size.width === nativeSizes[0].width && size.height === nativeSizes[0].height;
                    });

                    if (!allSameSize) {
                        placeholders[2].parentElement.classList.add('hidden');
                    } else {
                        placeholders.forEach(function(img) {
                            img.parentElement.style.flex = '1';
                        });
                    }
                }
            };
        });
    }

    function swapImages(placeholder) {
        var mainImage = document.getElementById('mainImage');
        var tempSrc = mainImage.src;
        mainImage.src = placeholder.src;
        placeholder.src = tempSrc;
    }

    function scrollLeftCustom() {
        var container = document.getElementById('placeholderContainer');
        var visiblePlaceholders = container.querySelectorAll('.boulder-placeholder-container:not(.hidden)');
        var hiddenPlaceholder = container.querySelector('.hidden');

        if (visiblePlaceholders.length > 1) {
            // Hide the first visible placeholder and move it to the hidden state
            visiblePlaceholders[0].classList.add('hidden');

            // Move the hidden image to the first position and make it visible
            hiddenPlaceholder.classList.remove('hidden');
            container.appendChild(hiddenPlaceholder);
        }
    }

    function scrollRight() {
        var container = document.getElementById('placeholderContainer');
        var visiblePlaceholders = container.querySelectorAll('.boulder-placeholder-container:not(.hidden)');
        var hiddenPlaceholder = container.querySelector('.hidden');

        if (visiblePlaceholders.length > 1) {
            // Hide the first visible placeholder and move it to the hidden state
            visiblePlaceholders[0].classList.add('hidden');

            // Move the hidden image to the last position and make it visible
            hiddenPlaceholder.classList.remove('hidden');
            container.appendChild(hiddenPlaceholder);
        }
    }

    function showOverlay(src) {
        var overlay = document.getElementById('imageOverlay');
        var overlayImage = document.getElementById('overlayImage');
        overlayImage.src = src;
        overlay.classList.remove('hidden');
        overlay.style.display = 'flex';
    }

    function closeOverlay() {
        var overlay = document.getElementById('imageOverlay');
        overlay.classList.add('hidden');
        overlay.style.display = 'none';
    }
</script>