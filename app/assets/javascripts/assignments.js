$(document).ready(function(){
  $('#assignments form').submit(function(event){
    event.preventDefault();
    var form = $(this)
    $.ajax({type: "post",
      url: form.attr("action"),
      data: form.serialize(),
      success: function(response){
        debugger
        $('.table-striped tbody').prepend(response)
      }
    })
  });

  $('#assignments .table-striped tbody').on('click', '.delete_button', function(){
    var deleteButton = $(this)
    $.ajax({type: "delete",
      url: deleteButton.data('url'),
      success: function(){
        deleteButton.closest('tr').remove()
      }
    })
  });

});
