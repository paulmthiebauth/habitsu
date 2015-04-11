$(function () {
    $('#welcome').highcharts({
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
                    y: 74,
                    sliced: true,
                    selected: true
                },
              ['Incomplete', 26]
            ]
        }]
    });
});
