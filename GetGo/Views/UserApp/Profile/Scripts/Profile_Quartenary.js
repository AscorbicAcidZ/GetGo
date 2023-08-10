//const params = new Proxy(new URLSearchParams(window.location.search), {
//    get: (searchParams, prop) => searchParams.get(prop),
//});

//const userId = params.UserId;
const params = new Proxy(new URLSearchParams(window.location.search), {
    get: (searchParams, prop) => searchParams.get(prop),
});
const userId = params.USERID;
console.log(userId)
$(document).ready(function () {
    fetchUserDetails(userId);
});

function fetchUserDetails(input) {
    var items = {
        INPUT: input
    }
    // Make an AJAX request to fetch the user details
    $.ajax({
        url: 'Profile_Primary.aspx/GetUserDetails',
        type: "POST",
        data: JSON.stringify({ item: items }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (response) {
            var userDetails = response.d;
            // Populate the textboxes with the retrieved user details
            var userDetails = JSON.parse(response.d);
            var frontfaceImg = userDetails[0].FRONTFACE; // Assuming the property name in the response is "FRONTFACE"
            if (frontfaceImg) {
                var filename = frontfaceImg.split('/').pop();
                $('#frontface').siblings('.custom-file-label').text(filename);
            }

            var backfaceImg = userDetails[0].BACKFACE; // Assuming the property name in the response is "BACKFACE"
            if (backfaceImg) {
                var filename = backfaceImg.split('/').pop();
                $('#backface').siblings('.custom-file-label').text(filename);
            }

            var signatureImg = userDetails[0].SIGNATURE_; // Assuming the property name in the response is "SIGNATURE"
            if (signatureImg) {
                var filename = signatureImg.split('/').pop();
                $('#signature').siblings('.custom-file-label').text(filename);
            }
            console.log(userDetails);
        },
        error: function (error) {
            //alert(error,userId,userName,phoneNumber);
            // Handle the error response
            alert('ERROR');
            console.log(error);

        }
    });
}
const allowedExtension = ['image/jpeg', 'image/jpg', 'image/png'];

$('.custom-file-input').change(function () {
    if (!allowedExtension.includes(this.files[0]['type'])) {
        alert('Only (jpeg, jpg, png) file extensions can be uploaded!')
        $(this).val('');
        $('.custom-file-label').text('Attach photo here');
    }
});

$('#btnSave').click(function () {
    var files = $('.custom-file-input');
    files.each(function (index, fileInput) {
        var formData = new FormData();
        formData.append("file", fileInput.files[0]);
        formData.append("classification", fileInput.getAttribute("data-classification"));
        upload(formData);
        console.log(formData.append("classification", fileInput.getAttribute("data-classification")));

    });
});
//    var files = $('.custom-file-input');
//    var formData = new FormData();
//    for (var i = 0; i < 3; i++) {
//        formData.append("file", files[i].files[0]);
//    }
//    upload(formData);
//

function upload(files) {
    console.log(files);
    $.ajax({
        type: 'post',
        url: '../Profile/Handlers/FileUpload.ashx?USERID=' + userId,
        data: files,
        cache: false,
        processData: false,
        contentType: false,
        success: function (e) {
            console.log(e);
            //alert('success');
            fetchUserDetails(userId);
        },
        error: function (err) {
            console.log(err);
        }
    })
}


