$(function () {
    $('#welcome-today').highcharts({
        chart: {
            type: 'pie'
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
                    y: 82,
                    sliced: true,
                    selected: true
                },
              ['Incomplete', 18]
            ]
        }]
    });
});
