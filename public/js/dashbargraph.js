var x = location.href;
var x = x + ".json"

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
                      showInLegend: false,
                      name: "Points",
                      data: [ datax["Sunday"], datax["Monday"], datax["Tuesday"], datax["Wednesday"], datax["Thursday"], datax["Friday"], datax["Saturday"]],
                  }]

              });
          });
});
