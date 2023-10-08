document.querySelectorAll('.ph-number').forEach(input => {
    input.oninput = (event) => {
        let cleanedPhoneNumber = event.target.value.replace(/^0/, '63').replace(/[^0-9]/g, '');

        // Allow only 10 digits except for '63'
        if (cleanedPhoneNumber.length > 12) {
            event.target.value = cleanedPhoneNumber.slice(0, 12);
        } else {
            event.target.value = cleanedPhoneNumber;
        }
    };
});
$('.numeric-input').on('input', event => {
    let inputValue = $(event.target).val().replace(/\D/g, '');
    $(event.target).val(inputValue);
});
$('#txtWithdraw').on('input', event => {
    const input = $(event.target);
    let inputValue = input.val();

    // Remove non-numeric characters and convert to number
    inputValue = parseInt(inputValue.replace(/\D/g, ''));

    // Compare the input value with totalLoan
    if (inputValue > CreditLimit) {
        // If input value is greater than totalLoan, set input value to totalLoan
        inputValue = CreditLimit;
    }

    // Update the input value
    input.val(inputValue);
});
