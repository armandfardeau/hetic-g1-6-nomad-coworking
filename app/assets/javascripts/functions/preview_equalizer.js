<!-- Start of Preview Equalizer -->
document.addEventListener("DOMContentLoaded", function (e) {
    previewEqualizer();
});
window.addEventListener("resize", function (e) {
    previewEqualizer();
});

function previewEqualizer() {
    var previews = document.getElementsByClassName('preview__content');
    if (previews.length) {
        var previews_container = document.getElementsByClassName('preview__container');
        var preview_content_min_heights = previews[0].height;
        for (var i = 0; i < previews.length; i++) {
            if (previews[i].height < preview_content_min_heights) {
                preview_content_min_heights = previews[i].height;
            }
        }
        for (var j = 0; j < previews_container.length; j++) {
            previews_container[j].style.height = preview_content_min_heights + 'px';
        }
    }
}

<!-- End of Preview Equalizer -->