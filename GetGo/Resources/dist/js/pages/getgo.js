function validateNumericInput(inputElement) {
    const input = inputElement.value;

    // Remove any non-numeric characters from the input
    const numericInput = input.replace(/[^0-9.]/g, '');

    if (input !== numericInput) {
        // If the input contains non-numeric characters, update the input value
        inputElement.value = numericInput;
    }
}

// Get all elements with class "detect-no" and attach the validation function
const numericInputs = document.querySelectorAll('.only-numbers');
numericInputs.forEach(input => {
    input.addEventListener('input', () => validateNumericInput(input));
});