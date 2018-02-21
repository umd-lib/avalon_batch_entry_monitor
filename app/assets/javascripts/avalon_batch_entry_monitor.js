//= require moment
//= require bootstrap-datetimepicker
//


$(function () {

  $('#startDateTime, #endDateTime').each( function() { 
    let $this = $(this);
    let val = $this.find('input').data('input') || "";
    $this.datetimepicker({ 
      useCurrent: false, //Important! See issue #1075
      defaultDate: moment(val),
      format: moment.defaultFormat
     });
  });

  $("#startDateTime").on("dp.change", function (e) {
      $('#endDateTime').data("DateTimePicker").minDate(e.date);
  });
  
  $("#endDateTime").on("dp.change", function (e) {
      $('#startDateTime').data("DateTimePicker").maxDate(e.date);
  });

  $('.batch-entry-all').change( function(e) {
    let checkbox = e.target;
    if ( checkbox.checked ){
      $('.batch-entry:not(checked)').click();
    } else {
      $('.batch-entry:checked').click();
    }
  });

  $('#batch-entry-cancel').click( function(e) {
    e.preventDefault();
    let ids = $('.batch-entry:checked').map( function() { return this.value; } ).get();
    let params = { "ids[]": ids };
    $.post( location.pathname + '/cancel', params, function() {
        location.reload(true) 
    }).fail(function() { alert("There was a problem updating the status!") }) 
  
  });

});
