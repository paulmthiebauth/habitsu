$(document).ready(function() {
  $('[data-habit-button="complete"]').on('submit', function(event) {
    event.preventDefault();
     $form = $(event.currentTarget);
     $.ajax({
      type: "PATCH",
      beforeSend: function(xhr) {
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
        },
      url: $form.attr('action'),
      dataType: "json",
      success: function(result) {

        action = '/users/' + result.user_id + '/dailyhabits/' + result.id;
        var complete_div = "#habit-" + result.id + "-complete"
        var incomplete_div = "#habit-" + result.id + "-incomplete"

            $(complete_div).toggle();
            $(incomplete_div).fadeToggle();
      }
    });
   });
});

$(document).ready(function() {
  $('[data-habit-button="incomplete"]').on('submit', function(event) {
    event.preventDefault();
     $form = $(event.currentTarget);
     $.ajax({
      type: "PATCH",
      beforeSend: function(xhr) {
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
        },
      url: $form.attr('action'),
      dataType: "json",
      success: function(result) {

        action = '/users/' + result.user_id + '/dailyhabits/' + result.id;
        var complete_div = "#habit-" + result.id + "-complete"
        var incomplete_div = "#habit-" + result.id + "-incomplete"
            $(incomplete_div).toggle();
            $(complete_div).fadeToggle();
      }
    });
   });
});
