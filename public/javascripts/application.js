$(function() {
  $('#contact').contactable({
    subject: 'A Feeback Message'
  });
});

$(document).ready(function() {
  $('.inside ul li:last-child').css('border-bottom', '0px'); // remove last border-bottom from list in tab content

  $('.wooTabs li a:first').addClass('selected'); // Add .selected class to first tab on load

  $('.inside > *').hide();
  $('.inside > *:first-child').show();

  $('.wooTabs li a').click(function(evt) { // Init Click funtion on Tabs

    var clicked_tab_ref = $(this).attr('href'); // Strore Href value


    load_data(clicked_tab_ref);

    $(this).parent().parent().children('li').children('a').removeClass('selected'); //Remove selected from all tabs
    $(this).addClass('selected');
    $(this).parent().parent().parent().children('.inside').children('*').hide();

    $('.inside ' + clicked_tab_ref).fadeIn(500);

    evt.preventDefault();

  })
});

function load_data(clicked_id) {

}



