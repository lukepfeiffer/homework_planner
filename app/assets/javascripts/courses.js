$(document).ready(function(){
  $('#courses form').submit(function(event){
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

  $('.table-striped tbody').on('click', '.delete_button', function(){
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

});
