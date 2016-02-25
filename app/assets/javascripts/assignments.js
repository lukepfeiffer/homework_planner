$(document).ready(function(){
  $('#assignments form').submit(function(event){
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
        oeleteButton.closest('.assignment_li').remove()
      }
    })
  });

});
