<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp"/>

<link href="/pub/css/global.css" rel="stylesheet">

<style>

    .boulder-placeholder-container {
        margin: 8px; /* Add margin for padding between images */
        position: relative;
        height: auto;
        box-sizing: border-box; /* Ensures padding and border are included in the element's total width and height */
    }

    .boulder-placeholder {
        width: 100%;
        height: auto;
        object-fit: cover;
    }

    .beta-section .collapse {
        display: none;
    }

    .beta-section .collapse.show {
        display: block;
    }

    .scroll-button {
        position: absolute;
        top: 50%; /* Start at the middle */
        transform: translateY(-50%);
        background-color: transparent;
        color: black;
        border: none;
        font-size: 20px; /* Adjust size as needed */
        cursor: pointer;
        z-index: 1;
        display: flex;
        align-items: center;
        justify-content: center;
        width: 40px; /* Adjust size as needed */
        height: 40px; /* Adjust size as needed */
    }

    .scroll-button.left {
        left: -25px; /* Adjust to ensure it's clickable */
    }

    .hidden {
        display: none;
    }

    .overlay {
        position: fixed;
        display: none;
        width: 100%;
        height: 100%;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: rgba(0, 0, 0, 0.9);
        z-index: 1000;
        justify-content: center;
        align-items: center;
    }

    #placeholderContainer {
        overflow: visible; /* Allow content to bleed out */
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .boulder-profile .divider {
        border-bottom: 1px solid black;
        margin: 20px 0;
        width: 100%;
        margin-left: auto;
        margin-right: auto;
    }

    .btn-black {
        background-color: black !important;
        color: white !important;
        border: none !important;
        border-radius: 0 !important; /* 90-degree corners */
        font-family: Helvetica !important; /* Helvetica font */
        font-size: 1.25rem !important; /* Same size as <h3> */
        padding: 0.25rem 0.75rem !important; /* Padding for the button */
    }

    .btn-black:hover {
        background-color: #333 !important;
        color: white !important;
    }

    .boulder-image {
        width: 100%;
        height: auto;
        object-fit: cover;
        margin-bottom: 8px !important;
    }

    .boulder-details {
        margin-top: 0px;
        width: 100%;
    }

    .boulder-profile .row {
        max-width: 100%;
        margin-left: auto;
        margin-right: auto;
    }

    .overlay-content {
        max-width: 90%;
        max-height: 90%;
        margin: auto;
        display: block;
    }

    .closebtn {
        position: absolute;
        top: 20px;
        right: 35px;
        color: #fff;
        font-size: 40px;
        cursor: pointer;
    }

    .container {
        overflow: visible; /* Ensure parent container allows overflow */
    }

    .circular-border {
        border-radius: 50%;
        overflow: hidden;
    }

    .circular-overlay {
        border-radius: 50%;
    }

    header {
        margin-top: 28px !important; /* Adjust the value as needed */
    }

</style>

<div class="container my-4 boulder-profile" style="max-width: 90%;">
    <div class="row">
        <!-- Left column with the large image and placeholder images -->
        <div class="col-md-6 d-flex flex-column">
            <img id="profileImgUrl" src="${user.profileImgUrl}" alt="${user.name}"
                 class="img-fluid boulder-image mb-4 circular-border">
            <div id="placeholderContainer" class="d-flex position-relative" style="overflow: visible;">
                <div class="scroll-button left" onclick="scrollLeftCustom()">&#9664;</div>
                <div class="boulder-placeholder-container">
                    <img src="/pub/media/josh-climbing1.jpeg" alt="Placeholder 1" class="img-fluid boulder-placeholder"
                         onclick="swapImages(this)">
                </div>
                <div class="boulder-placeholder-container">
                    <img src="/pub/media/Queen.jpeg" alt="Placeholder 2" class="img-fluid boulder-placeholder"
                         onclick="swapImages(this)">
                </div>
                <div class="boulder-placeholder-container hidden">
                    <img src="/pub/media/Swarm.jpeg" alt="Placeholder 3" class="img-fluid boulder-placeholder"
                         onclick="swapImages(this)">
                </div>
            </div>
        </div>
        <!-- Right column with the boulder details and BETA section -->
        <div class="col-md-6 d-flex flex-column">
            <h2 class="name">${user.name}</h2>
            <div class="divider"></div>
            <div class="boulder-details">
                <p class="age">
                    Age: ${user.age}
                </p>
                <p class="height">
                    Height: ${user.height}
                </p>
                <p class="gender">
                    Gender: ${user.gender}
                </p>
                <p class="ape-index">
                    Ape Index: ${user.apeIndex}
                </p>
                <p class="style">
                    Style: ${user.style}
                </p>
                <p class="favorite-area">
                    Favorite Area: ${user.favoriteArea}
                </p>
                <p class="favorite-boulder-problem">
                    Favorite Boulder Problem: ${user.favoriteBoulderProblem}
                </p>
            </div>
            <div class="divider"></div>
            <div class="boulder-details">
                <p class="age">
                    About Me: ${user.about}
                </p>
            </div>
        </div>
    </div>
</div>

<div id="imageOverlay" class="overlay hidden">
    <span class="closebtn" onclick="closeOverlay()">&times;</span>
    <img class="overlay-content circular-overlay" id="overlayImage">
</div>

<jsp:include page="../include/footer.jsp"/>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        adjustPlaceholderDisplay();
        document.getElementById('profileImgUrl').addEventListener('click', function () {
            showOverlay(this.src);
        });
    });

    function adjustPlaceholderDisplay() {
        var placeholders = document.querySelectorAll('.boulder-placeholder');
        var nativeSizes = [];

        placeholders.forEach(function (img) {
            var imgObj = new Image();
            imgObj.src = img.src;
            imgObj.onload = function () {
                nativeSizes.push({width: imgObj.width, height: imgObj.height});
                if (nativeSizes.length === placeholders.length) {
                    var allSameSize = nativeSizes.every(function (size) {
                        return size.width === nativeSizes[0].width && size.height === nativeSizes[0].height;
                    });

                    if (!allSameSize) {
                        placeholders[2].parentElement.classList.add('hidden');
                    } else {
                        placeholders.forEach(function (img) {
                            img.parentElement.style.flex = '1';
                        });
                    }
                }
            };
        });
    }

    function swapImages(placeholder) {
        var profileImgUrl = document.getElementById('profileImgUrl');
        var tempSrc = profileImgUrl.src;
        profileImgUrl.src = placeholder.src;
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