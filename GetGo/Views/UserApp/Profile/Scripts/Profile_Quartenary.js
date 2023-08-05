//const params = new Proxy(new URLSearchParams(window.location.search), {
//    get: (searchParams, prop) => searchParams.get(prop),
//});

//const userId = params.UserId;

const userId = 'B012128'; //temporary

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
    var formData = new FormData();
    for (var i = 0; i < 3; i++) {
        formData.append("file", files[i].files[0]);
    }
    upload(formData);
});

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
            alert('success');
        },
        error: function (err) {
            console.log(err);
        }
    })
}


