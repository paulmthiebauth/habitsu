var x = location.href;
var x = x + ".json"


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

            $.getJSON(x, function(datax) {
                      $(function () {
                          $('#container2').highcharts({
                              chart: {
                                  type: 'bar',
                                  style: {
                                        fontFamily: 'Quicksand'
                                    },
                              },
                              title: {
                                  text: ''
                              },
                              xAxis: {
                                  categories: [ 'Sunday','Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
                              },
                              yAxis: {
                                  max: 100,
                                  title: {
                                      text: ''
                                  }
                              },
                              series: [{
                                  animation: false,
                                  showInLegend: false,
                                  name: "Points",
                                  data: [ datax["Sunday"], datax["Monday"], datax["Tuesday"], datax["Wednesday"], datax["Thursday"], datax["Friday"], datax["Saturday"]],
                              }]

                          });
                      });
            });

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

            $.getJSON(x, function(datax) {
                      $(function () {
                          $('#container2').highcharts({
                              chart: {
                                  type: 'bar',
                                  style: {
                                        fontFamily: 'Quicksand'
                                    },
                              },
                              title: {
                                  text: ''
                              },
                              xAxis: {
                                  categories: [ 'Sunday','Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
                              },
                              yAxis: {
                                  max: 100,
                                  title: {
                                      text: ''
                                  }
                              },
                              series: [{
                                  animation: false,
                                  showInLegend: false,
                                  name: "Points",
                                  data: [ datax["Sunday"], datax["Monday"], datax["Tuesday"], datax["Wednesday"], datax["Thursday"], datax["Friday"], datax["Saturday"]],
                              }]

                          });
                      });
            });
      }
    });
   });
});
