$(function() {
  $('#commentformlink').click(function() {
    $("#respond").slideToggle("slow");
    return false;
  });
});

$(function() {
  $('a[rel="color"]').colorbox();
});