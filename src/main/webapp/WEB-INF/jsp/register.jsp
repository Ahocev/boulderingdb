<jsp:include page="include/header.jsp" />

<link href="/pub/css/global.css" rel="stylesheet">

<div class="form-container">
    <form onsubmit="return onSubmit()">
        <div class="formTag">
            <h1>Register</h1>
        </div>
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Email Address*</label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
            <div id="emailHelp" class="form-text">Please enter a valid email address</div>
        </div>
        <div class="mb-3">
            <label for="firstName" class="form-label">First Name*</label>
            <input type="text" class="form-control" id="firstName" aria-describedby="firstNameHelp">
            <div id="firstNameHelp" class="form-text"></div>
        </div>
        <div class="mb-3">
            <label for="lastName" class="form-label">Last Name</label>
            <input type="text" class="form-control" id="lastName" aria-describedby="lastNameHelp">
            <div id="lastNameHelp" class="form-text"></div>
        </div>
        <div class="mb-3">
            <label for="state" class="form-label">State</label>
            <select class="form-select" id="state">
                <option value="">Select your state</option>
                <option value="AL">AL</option>
                <option value="AK">AK</option>
                <option value="AZ">AZ</option>
                <option value="AR">AR</option>
                <option value="CA">CA</option>
                <option value="CO">CO</option>
                <option value="CT">CT</option>
                <option value="DE">DE</option>
                <option value="FL">FL</option>
                <option value="GA">GA</option>
                <option value="HI">HI</option>
                <option value="ID">ID</option>
                <option value="IL">IL</option>
                <option value="IN">IN</option>
                <option value="IA">IA</option>
                <option value="KS">KS</option>
                <option value="KY">KY</option>
                <option value="LA">LA</option>
                <option value="ME">ME</option>
                <option value="MD">MD</option>
                <option value="MA">MA</option>
                <option value="MI">MI</option>
                <option value="MN">MN</option>
                <option value="MS">MS</option>
                <option value="MO">MO</option>
                <option value="MT">MT</option>
                <option value="NE">NE</option>
                <option value="NV">NV</option>
                <option value="NH">NH</option>
                <option value="NJ">NJ</option>
                <option value="NM">NM</option>
                <option value="NY">NY</option>
                <option value="NC">NC</option>
                <option value="ND">ND</option>
                <option value="OH">OH</option>
                <option value="OK">OK</option>
                <option value="OR">OR</option>
                <option value="PA">PA</option>
                <option value="RI">RI</option>
                <option value="SC">SC</option>
                <option value="SD">SD</option>
                <option value="TN">TN</option>
                <option value="TX">TX</option>
                <option value="UT">UT</option>
                <option value="VT">VT</option>
                <option value="VA">VA</option>
                <option value="WA">WA</option>
                <option value="WV">WV</option>
                <option value="WI">WI</option>
                <option value="WY">WY</option>
            </select>
            <div id="stateHelp" class="form-text"></div>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password*</label>
            <input type="password" class="form-control" id="password" aria-describedby="passwordHelp">
            <div id="passwordHelp" class="form-text">Password must contain 8 characters, one number, and one special character</div>
        </div>
        <div class="mb-3">
            <label for="confirmPassword" class="form-label">Confirm Password*</label>
            <input type="password" class="form-control" id="confirmPassword" aria-describedby="passwordHelp">
            <div id="passwordHelp" class="form-text"></div>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
        <div class="already"> Already have an account?
            <a href="index.html">Login now</a>
        </div>
    </form>
</div>
</div>

<!-- Script for form validation -->
<script>
    function onSubmit() {
        console.log("on submit function called");

        let firstName = document.getElementById("firstName");
        let firstNameValue = firstName.value;

        if (firstNameValue == '') {
            console.log("First Name Required");

            firstName.classList.add("is-invalid");

            document.getElementById("firstNameHelp").textContent = "First name is required";
            document.getElementById("firstNameHelp").classList.add("invalid-feedback");
        } else {
            firstName.classList.remove("is-invalid");
            firstName.classList.add("is-valid");
        }

        let email = document.getElementById("exampleInputEmail1");
        let emailValue = email.value;
        let emailPattern = /^\w+@[\w.]+$/;

        if (emailValue == '') {
            console.log("Email Required");

            email.classList.add("is-invalid");

            document.getElementById("emailHelp").textContent = "Email is required";
            document.getElementById("emailHelp").classList.add("invalid-feedback");
        } else if (!emailPattern.test(emailValue)) {
            console.log("InvalidEmail Format");

            email.classList.add("is-invalid");

            document.getElementById("emailHelp").textContent = "Invalid email format";
            document.getElementById("emailHelp").classList.add("invalid-feedback");
        } else {
            email.classList.remove("is-invalid");
            email.classList.add("is-valid");
        }

        let password = document.getElementById("password");
        let confirmPassword = document.getElementById("confirmPassword");
        let passwordValue = password.value;
        let confirmPasswordValue = confirmPassword.value;
        let passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;

        if (passwordValue == '' || confirmPasswordValue == '') {
            console.log("Both Passwords Required");

            password.classList.add("is-invalid");
            confirmPassword.classList.add("is-invalid");

            document.getElementById("passwordHelp").textContent = "Both passwords are required";
            document.getElementById("passwordHelp").classList.add("invalid-feedback");
        } else if (passwordValue !== confirmPasswordValue) {
            console.log("Passwords do not match");

            password.classList.add("is-invalid");
            confirmPassword.classList.add("is-invalid");

            document.getElementById("passwordHelp").textContent = "Passwords do not match";
            document.getElementById("passwordHelp").classList.add("invalid-feedback");
        } else if (!passwordPattern.test(passwordValue)) {
            console.log("Invalid Password");

            password.classList.add("is-invalid");
            confirmPassword.classList.add("is-invalid");

            document.getElementById("passwordHelp").textContent = "Password must be at least 8 characters long and contain at least one letter and one number";
            document.getElementById("passwordHelp").classList.add("invalid-feedback");
        } else {
            password.classList.remove("is-invalid");
            password.classList.add("is-valid");
            confirmPassword.classList.remove("is-invalid");
            confirmPassword.classList.add("is-valid");
        }

        return false;
    }
</script>

<jsp:include page="include/footer.jsp" />
