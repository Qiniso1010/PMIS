// Pagination
Handlebars.registerHelper('pagination', function (currentPage, totalPage, size, options) {
    var startPage, endPage, context;

    if (arguments.length === 3) {
        options = size;
        size = 5;
    }

    startPage = currentPage - Math.floor(size / 2);
    endPage = currentPage + Math.floor(size / 2);

    if (startPage <= 0) {
        endPage -= (startPage - 1);
        startPage = 1;
    }

    if (endPage > totalPage) {
        endPage = totalPage;
        if (endPage - size + 1 > 0) {
            startPage = endPage - size + 1;
        } else {
            startPage = 1;
        }
    }

    context = {
        startFromFirstPage: false,
        pages: [],
        endAtLastPage: false,
    };
    if (startPage === 1) {
        context.startFromFirstPage = true;
    }
    for (var i = startPage; i <= endPage; i++) {
        context.pages.push({
            page: i,
            isCurrent: i === currentPage,
        });
    }
    if (endPage === totalPage) {
        context.endAtLastPage = true;
    }

    return options.fn(context);
});

Handlebars.registerHelper('ToMinute', function (str) {
    if (str == "0") {
        return "00";
    } else {
        return str;
    }
});

Handlebars.registerHelper("select", function (value, options) {
    return options.fn(this)
      .split('\n')
      .map(function (v) {
          var t = 'value="' + value + '"'
          return !RegExp(t).test(v) ? v : v.replace(t, t + ' selected="selected"')
      })
      .join('\n')
});

// Get Age
Handlebars.registerHelper("age", function (value, options) {
    if (value) {
        var age = moment().diff(value, 'years', true);
        return Math.floor(age);
    } else {
        return '';
    }

});

// REPLACE STRING 
Handlebars.registerHelper("replace", function (value, options) {
    if (value) {
        return new Handlebars.SafeString(Replace(value));
    } else {
        return 'string not valid';
    }
});

Handlebars.registerHelper("replaceToDash", function (value, options) {
    if (value) {
        return new Handlebars.SafeString(ReplaceDash(value));
    } else {
        return 'string not valid';
    }
});

// DATE FORMAT
Handlebars.registerHelper('DateFormatDefault', function (tanggal, options) {
    if (tanggal) {
        return new Handlebars.SafeString(DateFormatDefault(tanggal));
    } else {
        return 'Date Not Valid';
    }
});

Handlebars.registerHelper('DateFormatD', function (tanggal, options) {
    if (tanggal) {
        return new Handlebars.SafeString(DateFormatD(tanggal));
    } else {
        return 'Date Not Valid';
    }
});

Handlebars.registerHelper('DateFormatC', function (tanggal, options) {
    if (tanggal) {
        return new Handlebars.SafeString(DateFormatC(tanggal));
    } else {
        return 'Date Not Valid';
    }
});

Handlebars.registerHelper('DateFormatB', function (tanggal, options) {
    if (tanggal) {
        return new Handlebars.SafeString(DateFormatB(tanggal));
    } else {
        return 'Date Not Valid';
    }
});

// Numbering Format
Handlebars.registerHelper('Numbering', function (Number, options) {
    if (Number) {
        return new Handlebars.SafeString(numeral(Number).format('0,0'));
    } else {
        return 0;
    }
});

//Html Encode
Handlebars.registerHelper('HtmlEncode', function (str, options) {
    if (str) {
        return new Handlebars.SafeString(HtmlEncode(str));
    } else {
        return "String Not Valid";
    }
});




Handlebars.registerHelper("check", function (value, options) {
    return options.fn(this)
      .split('\n')
      .map(function (v) {
          var t = 'value="' + value + '"'
          return !RegExp(t).test(v) ? v : v.replace(t, t + ' check')
      })
      .join('\n')
});

Handlebars.registerHelper('if', function (v1, v2, options) {
    if (v1 === v2) {
        return options.fn(this);
    }
    return options.inverse(this);
});

Handlebars.registerHelper("ifNull", function (val, options) {
    if (val === null || val === undefined) {
        return options.fn(this);
    }
    return options.inverse(this);
});

Handlebars.registerHelper('ifx', function (v1, options) {
    if (v1.length === 0) {
        return options.fn(this);
    }
    return options.inverse(this);
});

// Complete condition version {{#ifCond var1 '==' var2}}
Handlebars.registerHelper('ifCond', function (v1, operator, v2, options) {
    switch (operator) {
        case '==':
            return (v1 == v2) ? options.fn(this) : options.inverse(this);
        case '===':
            return (v1 === v2) ? options.fn(this) : options.inverse(this);
        case '!=':
            return (v1 != v2) ? options.fn(this) : options.inverse(this);
        case '<':
            return (v1 < v2) ? options.fn(this) : options.inverse(this);
        case '<=':
            return (v1 <= v2) ? options.fn(this) : options.inverse(this);
        case '>':
            return (v1 > v2) ? options.fn(this) : options.inverse(this);
        case '>=':
            return (v1 >= v2) ? options.fn(this) : options.inverse(this);
        case '&&':
            return (v1 && v2) ? options.fn(this) : options.inverse(this);
        case '||':
            return (v1 || v2) ? options.fn(this) : options.inverse(this);
        default:
            return options.inverse(this);
    }
});

Handlebars.registerHelper('link', function (text, options) {
    var attrs = [];

    for (var prop in options.hash) {
        attrs.push(
	        Handlebars.escapeExpression(prop) + '="'
	        + Handlebars.escapeExpression(options.hash[prop]) + '"');
    }

    return new Handlebars.SafeString(
      "<a " + attrs.join(" ") + ">" + Handlebars.escapeExpression(text) + "</a>"
    );
});

Handlebars.registerHelper('times', function (n, block) {
    var accum = '';
    for (var i = 0; i < n; ++i)
        accum += block.fn(i);
    return accum;
});
Handlebars.registerHelper('for', function (from, to, incr, block) {
    var accum = '';
    for (var i = from; i < to; i += incr)
        accum += block.fn(i);
    return accum;
});

Handlebars.registerHelper("math", function (lvalue, operator, rvalue, options) {
    lvalue = parseFloat(lvalue);
    rvalue = parseFloat(rvalue);

    return {
        "+": lvalue + rvalue,
        "-": lvalue - rvalue,
        "*": lvalue * rvalue,
        "/": lvalue / rvalue,
        "%": lvalue % rvalue
    }[operator];
});

Handlebars.registerHelper('toLowerCase', function (value) {
    if (value) {
        return new Handlebars.SafeString(value.toLowerCase());
    } else {
        return '';
    }
});

Handlebars.registerHelper('Upper', function (value) {
    if (value) {
        return new Handlebars.SafeString(value.toUpperCase());
    } else {
        return '';
    }
});

//Handlebars.registerHelper('list', function (context, options) {
//    var out = "<ul>", data;

//    if (options.data) {
//        data = Handlebars.createFrame(options.data);
//    }

//    for (var i = 0; i < context.length; i++) {
//        if (data) {
//            data.index = i;
//        }

//        out += "<li>" + options.fn(context[i], { data: data }) + "</li>";
//    }

//    out += "</ul>";
//    return out;
//});

//var rendered = Handlebars.compile(
//    '{{#each values}}' +
//    'i={{@index}}: ' +
//    'i+1 = {{math @index "+" 1}}, ' +
//    'i-0.5 = {{math @index "+" "-0.5"}}, ' +
//    'i/2 = {{math @index "*" 2}}, ' +
//    'i%2 = {{math @index "%" 2}}, ' +
//    'i*i = {{math @index "*" @index}}\n' +
//    '{{/each}}'
//)({
//    values: ['a', 'b', 'c', 'd', 'e']
//});

//$("#result").html(rendered);

Handlebars.registerHelper('list', function (context, options) {
    return "<ul>" + context.map(function (item) {
        return "<li>" + options.fn(item) + "</li>";
    }).join("\n") + "</ul>";
});

//Handlebars.registerHelper('list', function (context, options) {
//    var ret = "<ul>";

//    for (var i = 0, j = context.length; i < j; i++) {
//        ret = ret + "<li>" + options.fn(context[i]) + "</li>";
//    }

//    return ret + "</ul>";
//});

Handlebars.registerHelper('with', function (context, options) {
    return options.fn(context);
});
    
    

//Handlebars.registerHelper('each', function (context, options) {
//    var ret = "";

//    for (var i = 0, j = context.length; i < j; i++) {
//        ret = ret + options.fn(context[i]);
//    }

//    return ret;
//});
