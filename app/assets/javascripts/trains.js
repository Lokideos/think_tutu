$(document).ready(function() {
  $("a.edit_train").click(function(e){
    e.preventDefault();

    var train_id;
    var form;
    var name;
    var number;
    var current_route;

    train_id = $(this).data('trainId');
    form = $("#edit_train_" + train_id);
    name = $("#train_name_" + train_id);
    number = $("#train_number_" + train_id);
    current_route = $("#train_route_" + train_id);

    if (!$(this).hasClass('cancel')) {
      $(this).html('Cancel');
      $(this).addClass('cancel');
    } else {
      $(this).html('Edit');
      $(this).removeClass('cancel');
    }
    form.toggle();
    name.toggle();
    number.toggle();    
    current_route.toggle();
  });
});
