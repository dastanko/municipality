$(function() {
  $('#commentformlink').click(function() {
    $("#respond").slideToggle("slow");
    return false;
  });
});
$(function() {
  $(".image").click(function() {
    var image = $(this).attr("rel");
    $('#image').hide();
    $('#image').fadeIn('slow');
    $('#image').html('<img src="' + image + '"/>');
    return false;
  });
});
