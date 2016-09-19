AlertV2 = function(icon, msg, jns) {
    var i = "<i class='fa fa-" + icon + "'></i> ";
    //console.log(alertify);
    alertify.log(i+msg, jns);
    return i;
    //alertify.success( 'Hi' );
}
ShowOverlay = function(id) {
    $(id).attr("disabled", true);
    $(id).attr("value", "Loading....");
}
prosesLoad = function(TYPE) {
    if (TYPE == "Y") {
        window.onbeforeunload = function (e) {
            e = e || window.event;

            // For IE and Firefox prior to version 4
            if (e) {
                e.returnValue = 'Sedang melakukan proses...';
            }

            // For Safari
            return 'Sedang melakukan proses...';
        };
    } else if (TYPE == "N") {
        window.onbeforeunload = null;
    }
}
IsLoading = function(id,tipe) {
    if (tipe == "show") {
        $(id).show();
    } else {
        $(id).hide();
    }
}
ActiveButton = function (ID,TEXT) {
    $(ID).attr("disabled", false);
    $(ID).attr("value", TEXT);

}
numOnly = function (id) {
    $(id).keydown(function (e) {
        // Allow: backspace, delete, tab, escape, enter and .
        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
            // Allow: Ctrl+A
            (e.keyCode == 65 && e.ctrlKey === true) ||
            // Allow: home, end, left, right
            (e.keyCode >= 35 && e.keyCode <= 39)) {
            // let it happen, don't do anything
            return;
        }
        // Ensure that it is a number and stop the keypress
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        }
    });
}
modal_fixed = function (id) {
    $(id).bind("show", function () {
        $(id + " a.btn").click(function (e) {
            //console.log("button pressed: " + $(this).html());
            $(id).modal('hide');
        });
    });

    $(id).bind("hide", function () {
        $(id + " a.btn").unbind();
    });

    $(id).modal({
        "backdrop": "static",
        "keyboard": false,
        "show": true
    });
}
IsEmail = function (email) {
    var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    return regex.test(email);
}
IsIp = function (ip) {
    var setx = /^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/;
    return setx.test(ip);
}
MyObj = function (key) {
    for (var key in id) {
        if (id.hasOwnProperty(key)) {
            $("#"+key).val(id[key]);
            //alert(key + " -> " + p[key]);
        }
    }
}
MyBr = function (id) {
    $('#'+id).keypress(function (e) {
        if (e.keyCode == 13) {
            $('#' + id).val($('#' + id).val() + "<br />");
        }
    });
}
OnFocus = function (id) {
    var $txtControl = $('#'+id),
    $clearBtn = $('.tarea-wrap .clear-btn');

    $txtControl.
                on('focus keyup click', function () {
                    if ($(this).val()) {
                        $clearBtn.show();
                    }
                    else {
                        $clearBtn.fadeOut('fast');
                    }
                }).
                on('blur', function () {
                    $clearBtn.fadeOut('fast');
                });

    $clearBtn.on('click', function (event) {
        event.preventDefault();
        $txtControl.val('');
    });
}
SelectedMenuItem = function (menuName) {
    $('.sidebar-menu li').removeClass('active');
    if (menuName) {
        $('.' + menuName).addClass('active');
    }
}
SelectedToogleItem = function (menuName) {

    $('.treeview-menu').removeClass('active menu-open').attr('style','display:none;');
    if (menuName) {
        $('.' + menuName).addClass('active menu-open').attr('style','display:block;');
    }
}
RemoveAppend = function(name) {
    $("#"+name).remove();
}
SelectedSideBarSettings = function (menuName) {
    $('#nav-sidebar-settings li').removeClass('active');
    if (menuName) {
        $('.' + menuName).addClass('active');
    }
}
Select2Val = function(id,val) {
    $.each($("#"+id), function () {
        $(this).select2('val', val);
    });

}
Select2ValMulti = function(data,id,val) {
    $.each(data, function (index, item) {
        $("#"+id).select2("val", $("#"+id).select2("val").concat(item.id));
    });

}
SelectedDropdown = function(id,value) {
    $("#"+id+ " option[value=" + value + "]").attr('selected', 'selected');
}
Logout = function () {

    $('#logout').click(function () {
        swal({
            title: "Yakin ingin keluar aplikasi?",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#2071c5",
            confirmButtonText: "Keluar",
            closeOnConfirm: true
        },
        function (isConfirm)
        {
            if (isConfirm) {
                store.remove('cid');
                // Clear all keys
                store.clear();
                window.location.href = '/Login/Logout';
            }
        });

    });

    // on top
    $('#logout-top').click(function () {
        swal({
            title: "Yakin ingin keluar aplikasi?",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#2071c5",
            confirmButtonText: "Keluar",
            closeOnConfirm: false
        },
       function () {
           window.location.href = '/Login/Logout';
       });

    });
}
DateFormatDefault = function(date) {
    return moment(date).format('DD/MM/YYYY');
},
DateFormatA = function(date) {
    return moment(date).format('MM/DD/YYYY');
}
DateFormatB = function(date) {
    return moment(date).format('YYYY-MM-DD');
}
DateFormatC = function (date) {
    // moment.locale('id');
    return moment(date).locale('id').format('dddd, MMMM Do YYYY, h:mm:ss');
}
DateFormatD = function (date) {
    moment.locale('id');
    return moment(date).locale('id').format('dddd, DD MMMM YYYY');
}
DateFormatE = function (date) {
    return moment(date).format();
}
disableSpecificDaysAndWeekends = function(date) {
    var disabledSpecificDays = ["9-21-2014", "9-24-2014", "9-25-2014", "10-01-2014"];
    var m = date.getMonth();
    var d = date.getDate();
    var y = date.getFullYear();

    for (var i = 0; i < disabledSpecificDays.length; i++) {
        if ($.inArray((m + 1) + '-' + d + '-' + y, disabledSpecificDays) != -1 || new Date() > date) {
            return [false];
        }
    }

    var noWeekend = $.datepicker.noWeekends(date);
    return !noWeekend[0] ? noWeekend : [true];
}
GetAge = function(date) {
    var age = moment().diff(date, 'years', true);
    return Math.floor(age);
}
HtmlEncode = function (value) {
    var encodedValue = $('<div />').text(value).html();
    return encodedValue;
}
Replace = function (value) {
    return value.replace("-"," ");
}
ReplaceDash = function (value) {
    var v1 = value.replace(" ","-");
    var v2 = v1.replace("(","");
    var v3 = v2.replace(")","");
    return v3;
}
parseQueryString = function(queryString){
    var params = {};
    if(queryString){
        _.each(
            _.map(decodeURI(queryString).split(/&/g),function(el,i){
                var aux = el.split('='), o = {};
                if(aux.length >= 1){
                    var val = undefined;
                    if(aux.length == 2)
                        val = aux[1];
                    o[aux[0]] = val;
                }
                return o;
            }),
            function(o){
                _.extend(params,o);
            }
        );
    }
    return params;
    console.log(params);
}
ToTime = function(str) {
    if (str == "0") {
        return "00";
    } else {
        return str;
    }
}
