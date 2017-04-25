function getCaptionFromDate(date) {
    return date.getMonthName(true) + " " + date.getFullYear();
}

function encode(value) {
    return value.replace(/"/g, '\\"').replace(/'/g, "\\'");
}

function formatSelectedMonth() {
    return selectedMonth.toString("yyyy-MM-dd HH:mm");
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

function numberFormatter(value) {
    if (value === null) return null;
    return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function validateAndSetTableOptions(table, page, size, sort, order) {
    // check that pageNumber is valid
    if (page != undefined && $.isNumeric(page)) {
        // pageNumber has to be numeric to be highlighted by bootstrap table
        table.bootstrapTable('refreshOptions', { pageNumber: parseInt(page) });
    }

    // check that pageSize is valid
    if (size != undefined && $.isNumeric(size)) {
        table.bootstrapTable('refreshOptions', { pageSize: size });
    }

    // can the table be sorted by specified fields
    if (sort != undefined) {
        sort = sort.toLowerCase();
        $.each(table.bootstrapTable('getOptions').columns[0], function (index, column) {
            if (column.sortable && column.field.toLowerCase() == sort) {
                table.bootstrapTable('refreshOptions', { sortName: sort });
            }
        });
    }

    // is sort order valid
    if (order != undefined) {
        order = order.toLowerCase();
        if (order == "asc" || order == "desc") {
            table.bootstrapTable('refreshOptions', { sortOrder: order });
        }
    }
}

function onAuthorClick(author) {
    var url = "/Home/Messages?author=" + author;
    var month = formatSelectedMonth();
    url += '&month=' + month.substring(0, 7);
    window.open(url, "_self")
    return false;
}


