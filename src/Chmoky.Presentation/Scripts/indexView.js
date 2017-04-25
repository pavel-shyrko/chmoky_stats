var selectedMonth = Date.today().add(-1).month();

$topGodel = $('#topGodel');

function changeButtonsCaptions() {
    $('#current').html("Statistics for " + getCaptionFromDate(selectedMonth));
    $('#previous').html(getCaptionFromDate(new Date(selectedMonth).add(-1).month()));
    $('#next').html(getCaptionFromDate(new Date(selectedMonth).add(1).month()));
}

function postQueryParams(params) {
    params.currentDate = formatSelectedMonth();
    return params;
}

function setUrlVars() {
    if (history.pushState) {
        var options = $topGodel.bootstrapTable('getOptions');
        params = postQueryParams(options);
        var query = 'month=' + params.currentDate.substring(0, 7)
            + '&sortName=' + params.sortName
            + '&sortOrder=' + params.sortOrder
            + '&page=' + params.pageNumber
            + '&size=' + params.pageSize;
        var newurl = window.location.protocol + "//" + window.location.host + window.location.pathname + '?' + query;
        window.history.pushState({ path: newurl }, '', newurl);
    }
}

function setTableOptionsByUrlVars() {
    var urlVars = getUrlVars();
    var month = urlVars['month'];
    var page = urlVars['page'];
    var size = urlVars['size'];
    var sort = urlVars['sortName'];
    var order = urlVars['sortOrder'];

    if (month != undefined) {
        var currentMonth = new Date(month + "-01");
        if (!isNaN(currentMonth)) selectedMonth = currentMonth;
    }

    validateAndSetTableOptions($topGodel, page, size, sort, order);
}

$(document).ready(function () {
    $topGodel
        .on('all.bs.table', function (e, name, args) {
            $('[data-toggle="tooltip"]').tooltip();
            $('[data-toggle="popover"]').popover();
        })
        .on('load-success.bs.table', function (e, data) {
            $('#participants').html(numberFormatter(data.participants));
            $('#length').html(numberFormatter(data.textLength));
            $('#count').html(numberFormatter(data.count));
            $('#min').html(numberFormatter(data.min));
            $('#max').html(numberFormatter(data.max));
            $('#avg').html(numberFormatter(data.avg));
            setUrlVars();
            changeButtonsCaptions();
        });

    $('#previous').click(function () {
        selectedMonth = new Date(selectedMonth).add(-1).month();
        $topGodel.bootstrapTable('refresh');
    });

    $('#next').click(function () {
        selectedMonth = new Date(selectedMonth).add(1).month();
        $topGodel.bootstrapTable('refresh');
    });

    setTableOptionsByUrlVars();

    changeButtonsCaptions();

    $topGodel.bootstrapTable('refresh', { url: "/Home/GetTop" });
});