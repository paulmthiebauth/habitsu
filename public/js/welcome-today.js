var x = location.href;
var x = x + ".json"

$.getJSON(x, function(datax) {

$(function () {
    $('#welcome-today').highcharts({
        chart: {
            type: 'pie'
        },
        plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: false
                    },
                    showInLegend: false
                }
            },
        title: {
            text: 'Todays Score'
        },
        yAxis: {
            title: {
                text: 'Todays Score'
            }
        },
        series: [{
            name: 'Paul',
            data: [
              {
                    name: 'Completed',
                    y: datax["Today-Complete"],
                    sliced: true,
                    selected: true
                },
              ['Incomplete', datax["Today-Incomplete"]]
            ]
        }]
    });
});
});
