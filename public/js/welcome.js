$(function () {
    $('#welcome-yesterday').highcharts({
        chart: {
            type: 'pie'
        },
        title: {
            text: 'Yesterdays Total'
        },
        yAxis: {
            title: {
                text: 'Yesterdays Total'
            }
        },
        series: [{
            name: 'Paul',
            data: [
              {
                    name: 'Completed',
                    y: 81,
                    sliced: true,
                    selected: true
                },
              ['Incomplete', 19]
            ]
        }]
    });
});