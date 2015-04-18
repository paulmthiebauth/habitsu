var x = location.href;
var x = x + ".json"
debugger;

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
                      categories: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday']
                  },
                  yAxis: {
                      title: {
                          text: 'Points Earned'
                      }
                  },
                  series: [{
                      name: 'Paul',
                      data: datax
                  }]
              });
          });
});
