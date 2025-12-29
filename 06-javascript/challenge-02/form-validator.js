const form = document.getElementById("reg-form");
const submitBtn = document.getElementById("submit-btn");

const username = document.getElementById("username");
const email = document.getElementById("email");
const password = document.getElementById("password");
const confirmPw = document.getElementById("confirm");

const uErr = document.getElementById("username-error");
const eErr = document.getElementById("email-error");
const pErr = document.getElementById("password-error");
const cErr = document.getElementById("confirm-error");

const uOK = document.getElementById("username-ok");
const eOK = document.getElementById("email-ok");
const pOK = document.getElementById("password-ok");
const cOK = document.getElementById("confirm-ok");

function toggleUI(input, okSpan, errorSpan, valid, message="") {
  if (valid) {
    input.classList.remove("invalid");
    input.classList.add("valid");
    errorSpan.textContent = "";
    okSpan.style.display = "inline";
  } else {
    input.classList.add("invalid");
    input.classList.remove("valid");
    errorSpan.textContent = message;
    okSpan.style.display = "none";
  }
  updateSubmitButton();
}

function validateUsername() {
  const val = username.value.trim();
  const regex = /^[a-z0-9]{3,15}$/i;
  const valid = regex.test(val);
  toggleUI(username, uOK, uErr, valid, "3-15 letters or numbers only");
}

function validateEmail() {
  const val = email.value.trim();
  const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  const valid = regex.test(val);
  toggleUI(email, eOK, eErr, valid, "Invalid email format");
}

function validatePassword() {
  const val = password.value;
  const regex = /^(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$/;
  const valid = regex.test(val);
  toggleUI(password, pOK, pErr, valid, "Min 8 chars, 1 uppercase, 1 number, 1 special char");
}

function validateConfirm() {
  const valid = confirmPw.value === password.value && confirmPw.value !== "";
  toggleUI(confirmPw, cOK, cErr, valid, "Passwords must match");
}

username.addEventListener("blur", validateUsername);
email.addEventListener("blur", validateEmail);
password.addEventListener("blur", validatePassword);
confirmPw.addEventListener("blur", validateConfirm);

function updateSubmitButton() {
  const allValid =
    username.classList.contains("valid") &&
    email.classList.contains("valid") &&
    password.classList.contains("valid") &&
    confirmPw.classList.contains("valid");

  submitBtn.disabled = !allValid;
}

form.addEventListener("submit", e => {
  e.preventDefault();
  if (!submitBtn.disabled) {
    alert("Registration Successful!");
  }
});