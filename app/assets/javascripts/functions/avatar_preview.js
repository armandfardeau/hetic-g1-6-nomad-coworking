$(function () {
    $('#pictureInput').on('change', function (event) {
        var files = event.target.files;
        var image = files[0];
        var reader = new FileReader();
        reader.onload = function (file) {
            $('#target').attr('src', file.target.result);
        };
        reader.readAsDataURL(image);
    });
});