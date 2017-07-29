$(document).ready(function() {
  $(".search_form").submit(function() {
    var arrival_station;
    var departure_station;

    departure_station = $(this).find('#departure_station_id');
    arrival_station = $(this).find('#arrival_station_id');

    console.log("123");

    if (arrival_station.val() === departure_station.val()) {
      alert("Please choose correct arrival station.");
      return false;
    }
  });
});