var selectedMonth = Date.today().add(-1).month();

$messages = $('#messages');

function changeButtonsCaptions() {
    $('#current').html("Messages for " + getCaptionFromDate(selectedMonth));
    $('#previous').html(getCaptionFromDate(new Date(selectedMonth).add(-1).month()));
    $('#next').html(getCaptionFromDate(new Date(selectedMonth).add(1).month()));
}

function postQueryParams(params) {
    var urlVars = getUrlVars();
    var author = urlVars['author'];
    params.currentDate = selectedMonth.toString("yyyy-MM-dd HH:mm");
    params.author = author;
    return params;
}

function getAuthorDetails(author) {
    $.ajax({
        url: "/Home/GetAuthorDetails/",
        type: "POST",
        data: { author: author },
        dataType: "html",
        success: function (result, status, xhr) {
            var json = $.parseJSON(result);
            if (json.FullName != undefined) {
                $('#h2Title').text("Messages of " + json.FullName);
            }
            if (json.SkypeID != undefined) {
                $('#h5participants').text("Skype ID: " + json.SkypeID);
            }
            else {
                $('#h5participants').text("Skype ID: " + author);
            }
        },
        error: function (xhr, status, error) {
            $('#h5participants').text("Skype ID: " + author);
        }
    });
}

function setUrlVars() {
    if (history.pushState) {
        var options = $messages.bootstrapTable('getOptions');
        params = postQueryParams(options);
        var author = '';
        if (params.author != undefined) {
            author = 'author=' + params.author + '&';
        }
        var query = author
            + 'month=' + params.currentDate.substring(0, 7)
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

    validateAndSetTableOptions($messages, page, size, sort, order);
}

function setParticipantsByUrlVars() {
    var urlVars = getUrlVars();
    var author = urlVars['author'];
    if (author != undefined) {
        getAuthorDetails(author);
    }
}

function textFormatter(value, row, index) {
    var authorName = row.Author.FullName;
    if (authorName == " ") {
        authorName = row.Author.SkypeID;
    }
    var author = '<a data-toggle="popover" data-trigger="hover" onclick="onAuthorClick(\'' + encode(row.Author.SkypeID) + '\')" data-content="'
        + row.Author.SkypeNames + '" title= "Skype Name" data-html="true" class="" >' + authorName + '</a>';
    var message = '<div class="messagesText">' + row.text + '</div>';
    return author + '<br/>' + message;
}

function dateFormatter(value) {
    if (value === null) return null;
    var date = new Date(parseInt(value.substr(6)));
    return date.toString("dd/MM/yy HH:mm");
}

$(document).ready(function () {
    $messages
        .on('all.bs.table', function (e, name, args) {
            $('[data-toggle="tooltip"]').tooltip();
            $('[data-toggle="popover"]').popover();
        })
        .on('load-success.bs.table', function (e, data) {
            if ($('#participants').length == 1) {
                $('#participants').html(numberFormatter(data.participants));
            }
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
        $messages.bootstrapTable('refresh');
    });

    $('#next').click(function () {
        selectedMonth = new Date(selectedMonth).add(1).month();
        $messages.bootstrapTable('refresh');
    });

    setParticipantsByUrlVars();
    setTableOptionsByUrlVars();
    changeButtonsCaptions();

    $messages.bootstrapTable('refresh', { url: "/Home/GetMessages" });
});