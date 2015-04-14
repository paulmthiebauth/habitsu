$(function () {
    $('#welcome-today').highcharts({
        chart: {
            type: 'pie'
        },
        title: {
            text: 'Todays Total'
        },
        yAxis: {
            title: {
                text: 'Todays Total'
            }
        },
              color: {
          linearGradient: { x1: 0, x2: 0, y1: 0, y2: 1 },
          stops: [
              [0, '#003399'],
              [1, '#3366AA']
          ]
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
