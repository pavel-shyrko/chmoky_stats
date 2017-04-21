var shortMonthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun",
    "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
];

var monthNames = ["January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"
];

var currentDate = Date.today().add(-1).month();

function getCaptionFromDate(date) {
    return shortMonthNames[date.getMonth()] + " " + date.getFullYear();
}

function changeButtonsCaptions() {
    $('#current').html("Statistics for " + getCaptionFromDate(currentDate));

    $('#previous').html(getCaptionFromDate(new Date(currentDate).add(-1).month()));

    $('#next').html(getCaptionFromDate(new Date(currentDate).add(1).month()));
}

function postQueryParams(params) {
    params.currentDate = currentDate.toJSON();
    return params;
}

function authorFormatter(value) {
    return '<a data-toggle="popover" data-trigger="hover" href="/Home/Messages?author=' + value.SkypeID + '" data-content="'
        + value.SkypeNames + '" title= "Skype Name" data-html="true" class="" >' + value.SkypeID + '</a>';
}

function numberFormatter(value) {
    if (value === null) return null;
    return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

$(document).ready(function () {
    $('[data-toggle="tooltip"]').tooltip();
    $('[data-toggle="popover"]').popover();

    $('#topGodel')
        .on('all.bs.table', function (e, name, args) {
            $('[data-toggle="tooltip"]').tooltip();
            $('[data-toggle="popover"]').popover();
        })
        .on('load-success.bs.table', function (e, data) {
            $('#participants').html(numberFormatter(data.total));
            $('#total').html(numberFormatter(data.textLength));
            $('#count').html(numberFormatter(data.count));
            $('#min').html(numberFormatter(data.min));
            $('#max').html(numberFormatter(data.max));
            $('#avg').html(numberFormatter(data.avg));
        });

    $('#previous').click(function () {
        currentDate = new Date(currentDate).add(-1).month();
        $('#topGodel').bootstrapTable('refresh');
        changeButtonsCaptions();
    });

    $('#next').click(function () {
        currentDate = new Date(currentDate).add(1).month();
        $('#topGodel').bootstrapTable('refresh');
        changeButtonsCaptions();
    });

    changeButtonsCaptions();
});