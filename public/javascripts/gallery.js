$(function() {
  $('#commentformlink').click(function() {
    $("#respond").slideToggle("slow");
    return false;
  });
});
//$(function() {
//  $(".image").click(function() {
//    var image = $(this).attr("rel");
//    var url = $(this).attr("href");
//
//    $('#image').hide();
//    $('#image').fadeIn('slow');
//    $('#image').html('<a href=' + url + '>' + ' <img src="' + image + '"/>' + '</a>');
//    return false;
//  });
//});

$(function() {
  $('a[rel="color"]').colorbox();
});