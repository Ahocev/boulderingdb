function onSubmit() {
    console.log("on submit function called");

    let email = document.getElementById("exampleInputEmail1");
    let emailValue = email.value;
    let emailPattern = /^\w+@[\w.]+$/;

    if (emailValue == '') {
        console.log("Email Required");

        email.classList.add("is-invalid");

        document.getElementById("emailHelp").textContent = "Email is required";
        document.getElementById("emailHelp").classList.add("invalid-feedback");
    } else if (!emailPattern.test(emailValue)) {
        console.log("Invalid Email Format");

        email.classList.add("is-invalid");

        document.getElementById("emailHelp").textContent = "Invalid email format";
        document.getElementById("emailHelp").classList.add("invalid-feedback");
    } else {
        email.classList.remove("is-invalid");
        email.classList.add("is-valid");
    }

    let password = document.getElementById("password");
    let passwordValue = password.value;

    if (passwordValue == '') {
        console.log("Password Required");

        password.classList.add("is-invalid");

        document.getElementById("passwordHelp").textContent = "Password is required";
        document.getElementById("passwordHelp").classList.add("invalid-feedback");
    } else {
        password.classList.remove("is-invalid");
        password.classList.add("is-valid");
    }

    return false;
}