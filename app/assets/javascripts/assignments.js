$(document).ready(function(){
  $('#assignments #new').submit(function(event){
    event.preventDefault();
    var form = $(this)
    $.ajax({type: "post",
      url: form.attr("action"),
      data: form.serialize(),
      success: function(response){
        $('.assignment_container').append(response)
        $('#no_assignments').hide();
      }
    })
  });

  $('.assignment_container').on('click', 'dt', function(){
    var assignmentId = $(this).data('id')
    $('dd[data-id=' + assignmentId + ']').toggle();
  });

  $('#assignments').on('click', '.unarchive_button, .delete_button', function(){
    var button = $(this)
    var assignmentId = $(this).closest('dd').data('id')
    $.ajax({type: "delete",
      url: button.data('url'),
      success: function(){
        $('[data-id=' + assignmentId + ']').remove();
      }
    })
  });

  $('#assignments').on('click', '.edit_assignment, .cancel_button', function(event){
    event.preventDefault();
    $(this).closest('dd').find('form, .content').toggle();
  });

  $('#assignments').on('submit', '.edit_form', function(event){
    event.preventDefault();
    var form = $(this)
    $.ajax({type: "patch",
      url: form.attr("action"),
      data: form.serialize(),
      success: function(response){
        var response = $(response)
        form
          .closest('dl')
          .replaceWith(response)
        response
          .find('dd')
          .toggle();
      }
    })
  });


});
