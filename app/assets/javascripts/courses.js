$(document).ready(function(){
  $('#courses #new').submit(function(event){
    event.preventDefault();
    var form = $(this)
    $.ajax({type: "post",
      url: form.attr("action"),
      data: form.serialize(),
      success: function(response){
        $('.table-striped tbody').append(response)
      }
    })
  });

  $('#courses .table-striped tbody').on('click', '.delete_button', function(){
    var deleteButton = $(this)
    if (confirm('Are you sure? Deleting this course will delete all assignments associated with this course as well.')) {
      $.ajax({type: "delete",
        url: deleteButton.data('url'),
        success: function(){
          deleteButton.closest('tr').remove()
        }
      })
    }
  });

  $('#courses').on('click', '.edit_course', function(event){
    event.preventDefault();
    $(this).closest('tr').find('.field, .text, .save_button, .edit_course').toggle();
  });

  $('#courses').on('submit', '.edit_form', function(event){
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
