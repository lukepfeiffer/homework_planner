$(document).ready(function(){
  $('#courses form').submit(function(event){
    event.preventDefault();
    var form = $(this)
    $.ajax({type: "post",
      url: form.attr("action"),
      data: form.serialize(),
      success: function(response){
        debugger
        $('.table-striped').html(response)
        form.find('textfield').val('');
      }
    })
  });
});
