$(function () {
    $('#welcome-average').highcharts({
        chart: {
            type: 'pie'
        },
        title: {
            text: 'Average Score'
        },
        yAxis: {
            title: {
                text: 'Average Score'
            }
        },
        series: [{
            name: 'Paul',
            data: [
              {
                    name: 'Completed',
                    y: 87,
                    sliced: true,

                },
              ['Incomplete', 13]
            ]
        }]
    });
});
