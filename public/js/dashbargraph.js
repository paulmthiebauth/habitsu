
var x = location.href;
var x = x + ".json"

$.getJSON(x, function(datax) {
          $(function () {
              $('#container2').highcharts({
                  chart: {
                      type: 'bar'
                  },
                  title: {
                      text: 'Daily Points'
                  },
                  xAxis: {
                      categories: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
                  },
                  yAxis: {
                      max: 100,
                      title: {
                          text: 'Points Earned'
                      }
                  },
                  series: [{
                      showInLegend: false,
                      name: "",
                      data: [datax["Monday"], datax["Tuesday"], datax["Wednesday"], datax["Thursday"], datax["Friday"], datax["Saturday"], datax["Sunday"]]
                  }]

              });
          });
});
