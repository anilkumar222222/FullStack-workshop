function validatePassword(password) {
  const result = {
    isValid: false,
    score: 0,
    errors: [],
    suggestions: []
  };

  const commonPasswords = ["password", "123456", "qwerty", "abc123", "letmein"];

  const hasUpper = /[A-Z]/.test(password);
  const hasLower = /[a-z]/.test(password);
  const hasNumber = /\d/.test(password);
  const hasSpecial = /[!@#$%^&*()_+\-=]/.test(password);
  const isLong = password.length >= 8;
  const isNotCommon = !commonPasswords.includes(password.toLowerCase());

  if (isLong) result.score += 25;
  if (hasUpper) result.score += 15;
  if (hasLower) result.score += 15;
  if (hasNumber) result.score += 15;
  if (hasSpecial) result.score += 20;
  if (isNotCommon) result.score += 10;

  if (!isLong) result.errors.push("Minimum 8 characters");
  if (!hasUpper) result.errors.push("Add at least one uppercase letter");
  if (!hasLower) result.errors.push("Add at least one lowercase letter");
  if (!hasNumber) result.errors.push("Add at least one number");
  if (!hasSpecial) result.errors.push("Add at least one special character");
  if (!isNotCommon) result.errors.push("Password is too common");

  if (!isLong) result.suggestions.push("Use 8 or more characters");
  if (!hasUpper) result.suggestions.push("Add capital letters (A–Z)");
  if (!hasLower) result.suggestions.push("Include lowercase letters (a–z)");
  if (!hasNumber) result.suggestions.push("Include numbers (0–9)");
  if (!hasSpecial) result.suggestions.push("Add symbols (!@#$ etc.)");
  if (!isNotCommon) result.suggestions.push("Avoid common passwords");

  result.isValid = result.score >= 70 && result.errors.length === 0;

  return result;
}
console.log(validatePassword("abc"));