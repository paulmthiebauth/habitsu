var x = location.href;
var x = x + ".json"

$.getJSON('/users.json', function(datax) {

$(function () {
    $('#welcome-yesterday').highcharts({
        chart: {
            type: 'pie',
            style: {
                  fontFamily: 'Quicksand'
              },
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
            text: 'Yesterdays Score'
        },
        yAxis: {
            title: {
                text: 'Yesterdays Score'
            }
        },
        series: [{
            name: 'Points',
            data: [
              {
                    name: 'Completed',
                    y: datax["Yesterday-Complete"],
                    sliced: true,
                    selected: true
                },
              ['Incomplete', datax["Yesterday-Incomplete"]],

            ]
        }]
    });
});
});

var x = location.href;
var x = x + ".json"

$.getJSON('/users.json', function(datax) {

$(function () {
    $('#welcome-average').highcharts({
        chart: {
            type: 'pie',
            style: {
                  fontFamily: 'Quicksand'
              },
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

var x = location.href;
var x = x + ".json"

$.getJSON('/users.json', function(datax) {

$(function () {
    $('#welcome-today').highcharts({
        chart: {
            type: 'pie',
            style: {
                  fontFamily: 'Quicksand'
              },
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
            name: 'Points',
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
