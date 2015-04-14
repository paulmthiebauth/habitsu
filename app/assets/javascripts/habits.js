$(document).ready(function() {
  $('[data-habit-button="complete"]').on('submit', function(event) {
    var selected_habit_id = $('#11').attr('habit_name');
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
        var random = "#habit" + result.id
            $newForm = $('<form>').attr({
              action: action,
              method: 'PATCH',
              'data-habit-button': 'incomplete'
            });

            $incompleteButton = $('<input>').attr({type: 'submit', value: 'Incomplete'});

            $newForm.append($incompleteButton);

            var whatever = $(random)[0];
            $(random).replaceWith('<div class="complete-task"> COMPLETE! </div>');

            // $(random).replaceWith('<div class="complete-task"> COMPLETE! </div>');
        // $("#habitlist2").load('/users/1.html #habitlist2');
      }
    });
   });
});
