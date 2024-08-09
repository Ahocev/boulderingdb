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

    .circular-overlay {
        width: 100%;
        height: 100%;
        border-radius: 50%;
        overflow: hidden; /* Ensures that the image fits within the circular shape */
        position: relative;
        max-width: 90vw;  /* Constrain the overlay to 90% of the viewport width */
        max-height: 90vh; /* Constrain the overlay to 90% of the viewport height */
    }

    .circular-overlay img {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .img-fluid {
        width: 100%;
        height: auto;
        object-fit: cover; /* Ensures the image covers the area within the circular shape */
    }

    .circular-image {
        width: 100%;
        height: 0;
        padding-bottom: 100%; /* Makes the height equal to the width to create a square */
        border-radius: 50%;
        overflow: hidden; /* Ensures that the image fits within the circular shape */
        position: relative;
    }

    .circular-image img {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .overlay-content {
        width: 90vw;  /* Scale relative to viewport width */
        height: 90vh; /* Scale relative to viewport height */
        margin: auto;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .overlay {
        position: fixed;
        display: none;
        width: 100vw;
        height: 100vh;
        top: 0;
        left: 0;
        background-color: rgba(0, 0, 0, 0.9);
        z-index: 1000;
        justify-content: center;
        align-items: center;
    }


</style>

<div class="container my-4 boulder-profile" style="max-width: 90%;">
    <div class="row">
        <!-- Left column with the large image and placeholder images -->
        <div class="col-md-6 d-flex flex-column">
            <div class ="circular-image">
            <img id="profileImgUrl" src="${user.profileImgUrl}" alt="${user.name}"
                 class="img-fluid boulder-image mb-4">
            </div>
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
                    Height: ${user.height}'
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

<c:if test="${user.id == currentUserId}">
    <a href="/account/register" class="justify-content-center">EDIT</a>
</c:if>

<div id="imageOverlay" class="overlay hidden">
    <span class="closebtn" onclick="closeOverlay()">&times;</span>
    <div class="overlay-content">
        <div class="circular-overlay">
        <img id="overlayImage" src="" alt="" class="img-fluid">
        </div>
    </div>
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