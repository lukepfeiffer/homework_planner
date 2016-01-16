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
});
