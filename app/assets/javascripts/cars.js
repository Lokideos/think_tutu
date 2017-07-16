$(document).ready(function() {
  var carType;
  var carTypes;  

  $("#car_type").change(function() {
    carType = $(this).val();    
    $(".CarType").hide();
    $("." + carType).show();
  });

});