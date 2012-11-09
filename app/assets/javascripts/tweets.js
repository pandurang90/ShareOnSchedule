$(document).ready(function(){   
    $('#date_time').datetimepicker({dateFormat : 'dd/mm/yyyy'});

});


$('.compose_new_tweet').click(function(event){
  event.preventDefault();
  $('#myModal').modal('show') ;
});


$('.container').delegate('.submit-btn', 'submit', function(event){
  event.preventDefault();
  $('.container').find('.submit-btn').disableButton('Saving...');
  

  $.ajax({
    url: $('.new-tweet-form').attr('action'),
    type: 'post',
    data: $('.new-tweet-form').serialize()
        }).done(function(response) {
          if(response.status == 'success'){ 
            $('#myModal').hide();
          }

          else{
            var errorMessage = '<div class="alert alert-error error-message">' + response.errors + '</div>';
            $('.new-tweet-form').before(errorMessage)  
            window.setTimeout(function(){
              $('.new-tweet-form').parent().find('.error-message').remove();
            }, 5000);
          }  

  });
});

