$(document).ready(function(){
  $('#homeworks form').submit(function(event){
    event.preventDefault();
    var form = $(this)
    $.ajax({type: "post",
      url: form.attr("action"),
      data: form.serialize(),
      success: function(response){
        ('.table-striped').html(response)
        form.find('textfield').val('');
      }
    })
  });

  $('.delete_button').click(function(){
    deleteButton = $(this)
    id = deleteButton.attr('id')
    $.ajax({type: "delete",
      method: "DELETE",
      url: "/homeworks/" + id,
      success: function(){
        deleteButton.closest('.table_row').hide(100)
      }
    })
  });

});
