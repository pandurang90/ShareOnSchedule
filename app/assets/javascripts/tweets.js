$(document).ready(function(){   
    $('#date_time').datetimepicker();
});


$('.compose_new_tweet').click(function(event){
  event.preventDefault();
  $('#myModal').modal('show') ;
});


$('.container').delegate('.submit-button', 'submit', function(event){
  event.preventDefault();
  $('.container').find('.submit-button').disableButton('Saving...');
    var ajaxOptions = {
          url: $('.new-tweet-form').attr('action'),
          type: 'post',
          data: $('.new-tweet-form').serialize()
        };

  $.ajax({
    url: $('.new-tweet-form').attr('action'),
    type: 'post',
    data: $('.new-tweet-form').serialize()
        }).done(function(response) { 
    $('#myModal').modal('hide') ;
  });
});

