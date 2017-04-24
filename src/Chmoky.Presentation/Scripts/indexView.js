var selectedMonth = Date.today().add(-1).month();

$topGodel = $('#topGodel');

function getCaptionFromDate(date) {
    return date.getMonthName(true) + " " + date.getFullYear();
}

function changeButtonsCaptions() {
    $('#current').html("Statistics for " + getCaptionFromDate(selectedMonth));

    $('#previous').html(getCaptionFromDate(new Date(selectedMonth).add(-1).month()));

    $('#next').html(getCaptionFromDate(new Date(selectedMonth).add(1).month()));
}

function postQueryParams(params) {
    params.currentDate = selectedMonth.toString("yyyy-MM-dd HH:mm");
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

function getUrlVars() {
    var vars = [], hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for (var i = 0; i < hashes.length; i++) {
        hash = hashes[i].split('=');
        vars.push(hash[0]);
        vars[hash[0]] = hash[1];
    }
    return vars;
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

    // check that pageNumber is valid
    if (page != undefined && $.isNumeric(page)) {
        // pageNumber has to be numeric to be highlighted by bootstrap table
        $topGodel.bootstrapTable('refreshOptions', { pageNumber: parseInt(page) });
    }

    // check that pageSize is valid
    if (size != undefined && $.isNumeric(size)) {
        $topGodel.bootstrapTable('refreshOptions', { pageSize: size });
    }

    // can the table be sorted by specified fields
    if (sort != undefined) {
        sort = sort.toLowerCase();
        $.each($topGodel.bootstrapTable('getOptions').columns[0], function (index, column) {
            if (column.sortable && column.field.toLowerCase() == sort) {
                $topGodel.bootstrapTable('refreshOptions', { sortName: sort });
            }
        });
    }

    // is sort order valid
    if (order != undefined) {
        order = order.toLowerCase();
        if (order == "asc" || order == "desc") {
            $topGodel.bootstrapTable('refreshOptions', { sortOrder: order });
        }
    }
}

$(document).ready(function () {
    $topGodel
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

    $topGodel.bootstrapTable('refresh', { url: "/Home/GetTop" })
});
