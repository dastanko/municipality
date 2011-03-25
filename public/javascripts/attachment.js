$(document).ready(function() {

  //ajax for removing the file from the list of attachments
  $('.remove_file')
          .live("ajax:beforeSend", function(evt, xhr, settings) {
    var $form = $('.attachable_form');
    var $submitButton = $form.find('input[name="commit"]');

    $submitButton.data('origText', $submitButton.attr('value'));
    $submitButton.attr('value', "Waiting...");
    $submitButton.attr("disabled", true);
  })
          .live("ajax:success", function(evt, data, status, xhr) {
    $('#pending_files').html(xhr.responseText);
    $('#attachment_fields input:first-child').removeAttr('disabled');
  })
          .live("ajax:complete", function(evt, xhr, status) {
    //always set form class to 'attachable_form' when they have an asset
    var $form = $('.attachable_form');
    var $submitButton = $form.find('input[name="commit"]');

    $submitButton.attr('value', $submitButton.data('origText'));
    $submitButton.attr("disabled", false);
  })
          .live("ajax:error", function(evt, xhr, status, error) {
    var $form = $('.attachable_form'),
            errors,
            errorText;

    try {
      // Populate errorText with the comment errors
      errors = $.parseJSON(xhr.responseText);
    } catch(err) {
      // If the responseText is not valid JSON (like if a 500 exception was thrown), populate errors with a generic error message.
      errors = {message: "Please reload the page and try again"};
    }

    // Build an unordered list from the list of errors
    errorText = "There were errors with the submission: \n<ul>";

    for (error in errors) {
      errorText += "<li>" + error + ': ' + errors[error] + "</li> ";
    }

    errorText += "</ul>";

    // Insert error list into form
    $('div#errorExplanation').html(errorText);
  });
  $('input:file').live('change', function() {
    if (valid()) {
      var index = $('#pending_files').children().size();
      var totalAssets = index + $('#attachment_list').children().size() + 1;
      if (totalAssets < 4) {
        $('#attachment_fields').prepend('<input class="file optional" id="report_assets_attributes_2_asset" name="report[assets_attributes][2][asset]" type="file">');
      }
      else {
        $('#attachment_fields').prepend('<input class="file optional" id="report_assets_attributes_2_asset" name="report[assets_attributes][2][asset]" type="file" disabled>');
      }
      $(this).css('position', 'absolute');
      $(this).css('left', '-1000px');
      $(this).attr('name', 'report[assets_attributes][' + index + '][asset]');
      var fileText = "<li>" + $(this).val() + " <a href='#' class='remove_pending' title='Remove this attachment'>Remove</a></li>";
      $('#pending_files').prepend(fileText);
    }
  });
  $('.remove_pending').live('click', function() {
    var thisIndex = $('#pending_files').index($(this).parent());
    var position = thisIndex++;
    $('#attachment_fields').children().eq(position).remove();
    $(this).parent().remove();
    var totalAssets = $('#pending_files').children().size() + $('#attachment_list').children().size();
    if (totalAssets < 4) {
      $('#attachment_fields input:first-child').removeAttr('disabled');
    }
    return false;
  });

  function valid() {
    var imgpath = $("input:file").val();
    if (imgpath != "") {

      var arr1 = new Array;
      arr1 = imgpath.split("\\");
      var len = arr1.length;
      var img1 = arr1[len - 1];
      var filext = img1.substring(img1.lastIndexOf(".") + 1);

      if (filext == "jpg" || filext == "jpeg" || filext == "gif" || filext == "bmp" || filext == "png") {
        return true;
      }
      else {
        alert("Invalid File Format Selected");
        $("input:file").val("");
        return false;
      }
    }
  }
});

