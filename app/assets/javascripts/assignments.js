$(document).ready(function(){
  $('#assignments form').submit(function(event){
    event.preventDefault();
    var form = $(this)
    $.ajax({type: "post",
      url: form.attr("action"),
      data: form.serialize(),
      success: function(response){
        $('.table-striped tbody').prepend(response)
      }
    })
  });

  $('.assignment_names').on('click', 'a', function(){
    assignmentId = $(this).attr('id')
    $('#' + assignmentId + '_assignment').toggle();
  });

  // $('#assignments .table-striped tbody').on('click', '.delete_button', function(){
  //   var deleteButton = $(this)
  //   $.ajax({type: "delete",
  //     url: deleteButton.data('url'),
  //     success: function(){
  //       deleteButton.closest('tr').remove()
  //     }
  //   })
  // });

});
