var x = location.href;
var x = x + ".json"

$.getJSON(x, function(datax) {

$(function () {
    $('#welcome-average').highcharts({
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
            text: 'Five Day Average'
        },
        yAxis: {
            title: {
                text: 'Five Day Average'
            }
        },
        series: [{
            name: 'Points',
            data: [
              {
                    name: 'Completed',
                    y: datax["Five-Day-Complete"],
                    sliced: true,

                },
              ['Incomplete', datax["Five-Day-Incomplete"]]
            ]
        }]
    });
});
});
