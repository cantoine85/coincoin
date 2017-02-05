$(document).ready(function() {

    $('.panel-slot').on('click', function(){
      var $defaultStartTime = $(this).data('start');
      var $roomId = $(this).data('room-id');
      $( "#booking_start_time_4i option[value='" + $defaultStartTime + "']" ).prop("selected", "selected");
      $( "#booking_end_time_4i option[value='" + $defaultStartTime + "']" ).next().prop("selected", "selected");
      $("#booking_room_id").val($roomId);
    })
});
