$(function () {
    $('#container').highcharts({
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
            data: [74, 21, 43, 61, 89]
        }]
    });
});
