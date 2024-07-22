<jsp:include page="include/header.jsp" />

<link href="/pub/css/global.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/pub/javascript/login.js"></script>

<div class="form-container">
    <form onsubmit="return onSubmit()">
        <div class="formTag">
            <h1>Login</h1>
        </div>
        <div class="mb-3 text-start">
            <label for="exampleInputEmail1" class="form-label">Email Address</label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
            <div id="emailHelp" class="form-text">Please enter the email you registered with</div>
        </div>
        <div class="mb-3 text-start">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" aria-describedby="passwordHelp">
            <div id="passwordHelp" class="form-text"></div>
        </div>
        <button type="submit" class="btn btn-primary">Login</button>
        <div class="already">Don't have an account?
            <a href="/register">Register now</a>
        </div>
    </form>
</div>

<jsp:include page="include/footer.jsp" />