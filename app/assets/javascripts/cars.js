var ready;
ready = function() {
  var carType;
  var carTypes;  

  $("#car_type").change(function() {
    carType = $(this).val();    
    $(".CarType").hide();
    $("." + carType).show();
  });
}
$(document).ready(ready);
$(document).on('turbolinks:load',ready);
