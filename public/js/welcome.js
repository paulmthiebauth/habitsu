$(function () {
    $('#welcome-yesterday').highcharts({
        chart: {
            type: 'pie'
        },
        title: {
            text: 'Yesterdays Score'
        },
        yAxis: {
            title: {
                text: 'Yesterdays Score'
            }
        },
        series: [{
            name: 'Paul',
            data: [
              {
                    name: 'Completed',
                    y: 21,
                    sliced: true,
                    selected: true
                },
              ['Incomplete', 79]
            ]
        }]
    });
});
