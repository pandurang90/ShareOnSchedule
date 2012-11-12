$(document).ready(function(){   

  $('#date-time').datetimepicker();
  jQuery.each($('.modal-body #date-time'), function() {
      $(this).datetimepicker();
   });
  
});


