<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp" />

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

    .comments-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    .comments-table th, .comments-table td {
        border: 1px solid black;
        padding: 8px;
        text-align: left;
    }

    .comments-table th {
        background-color: #f2f2f2;
    }

    .comments-table thead th {
        text-align: center;
        padding: 10px;
    }

    .comments-table td {
        text-align: center;
    }

    .comment-form {
        display: flex;
        flex-direction: column;
        align-items: flex-end; /* Align items to the right */
    }

    .button-wrapper {
        display: flex;
        justify-content: flex-end;
        margin-top: 10px; /* Add some space between the textarea and the button */
    }

    .button-wrapper .btn {
        justify-content: end;
    }

</style>

<div class="container my-4 boulder-profile" style="max-width: 90%;">
    <div class="row">
        <!-- Left column with the large image and placeholder images -->
        <div class="col-md-6 d-flex flex-column">
            <img id="showcaseImgUrl" src="${boulderProblem.showcaseImgUrl}" alt="${boulderProblem.boulderProblemName}" class="img-fluid boulder-image mb-4">
            <div id="placeholderContainer" class="d-flex position-relative" style="overflow: visible;">
                <div class="scroll-button left" onclick="scrollLeftCustom()">&#9664;</div>
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
        </div>
        <!-- Right column with the boulder details and BETA section -->
        <div class="col-md-6 d-flex flex-column">
            <h2 class="boulder-problem-name">${boulderProblem.boulderProblemName}</h2>
            <p class="grade text-muted">${boulderProblem.grade}</p>
            <p class="boulder-name">${boulderProblem.boulderName}</p>
            <p class="location-city">${boulderProblem.location.nearestCity}, ${boulderProblem.location.state}</p>
            <p class="rating">${boulderProblem.rating} stars</p>
            <p class="repeated">Repeated: ${boulderProblem.repeated ? 'Yes' : 'No'}</p>
            <p class="first-ascensionist">FA: ${boulderProblem.firstAscensionist}</p>
            <div class="divider"></div>
            <div class="boulder-details mb-4">
                <p>
                    ${boulderProblem.history}
                </p>
            </div>
            <div class="divider"></div>
            <div class="beta-section mt-0">
                <button class="btn btn-black" data-bs-toggle="collapse" data-bs-target="#betaContent" aria-expanded="false" aria-controls="betaContent">
                    BETA
                </button>
                <div class="collapse" id="betaContent">
                    <div class="comment-section">
                        <h3 class="mt-4">Leave a Comment</h3>
                        <form action="${pageContext.request.contextPath}/boulder/addComment" method="post">
                            <input type="hidden" name="boulderProblemId" value="${boulderProblem.id}">
                            <input type="hidden" name="userId" value="${session.user.id}">
                            <div class="mb-3">
                                <textarea class="form-control mt-4" id="comment" name="comment" rows="3" required></textarea>
                            </div>
                            <div class="button-wrapper">
                                <button type="submit" class="btn btn-black">submit</button>
                            </div>
                        </form>

                        <h3 class="mt-4">Comments</h3>
                        <table class="comments-table">
                            <thead>
                            <tr>
                                <th>User</th>
                                <th>Comment Date</th>
                                <th>Comment</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="comment" items="${comments}">
                                <tr>
                                    <td>${comment.user.name}</td>
                                    <td>${comment.date}</td>
                                    <td>${comment.comment}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div class="divider"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<sec:authorize access="isAuthenticated()">
    <a href="/boulder/edit-boulder?id=${boulderProblem.id}" class="justify-content-center">Edit</a>
</sec:authorize>
<div id="imageOverlay" class="overlay hidden">
    <span class="closebtn" onclick="closeOverlay()">&times;</span>
    <img class="overlay-content" id="overlayImage">
</div>

<jsp:include page="../include/footer.jsp" />

<script>
    document.addEventListener('DOMContentLoaded', function() {
        adjustPlaceholderDisplay();
        document.getElementById('showcaseImgUrl').addEventListener('click', function() {
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
        var showcaseImgUrl = document.getElementById('showcaseImgUrl');
        var tempSrc = showcaseImgUrl.src;
        showcaseImgUrl.src = placeholder.src;
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