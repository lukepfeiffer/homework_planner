$(document).ready(function(){
  $('#assignments #new').submit(function(event){
    event.preventDefault();
    var form = $(this)
    $.ajax({type: "post",
      url: form.attr("action"),
      data: form.serialize(),
      success: function(response){
        $('.assignment_container').append(response)
      }
    })
  });

  $('.assignment_names').on('click', 'a', function(){
    var assignmentId = $(this).attr('id')
    $('#' + assignmentId + '_assignment').toggle(50);
  });

  $('#assignments .assignment_details').on('click', '.delete_button', function(){
    var deleteButton = $(this)
    $.ajax({type: "delete",
      url: deleteButton.data('url'),
      success: function(){
        deleteButton.closest('.assignment_li').remove()
      }
    })
  });

  $('#assignments').on('click', '.edit_assignment', function(event){
    event.preventDefault();
    $(this).closest('li').find('.field, .text, .save_button, .edit_assignment, .cancel_button, .delete_button').toggle();
  });

  $('#assignments').on('click', '.cancel_button', function(event){
    event.preventDefault();
    $(this).closest('li').find('.field, .text, .save_button, .edit_assignment, .cancel_button, .delete_button').toggle();
  });


  $('#assignments').on('submit', '.edit_form', function(event){
    event.preventDefault();
    var form = $(this)
    $.ajax({type: "patch",
      url: form.attr("action"),
      data: form.serialize(),
      success: function(response){
        form.closest('tr').replaceWith(response)
      }
    })
  });


});
