

function ShowOverlay(ID) {
	$(ID).attr("disabled", true);
	$(ID).attr("value", "Loading....");
	return false;
}

function ActiveButton(ID,TEXT) {
	$(ID).attr("disabled", false);
	$(ID).attr("value", TEXT);
	return false;
}

function prosesLoad(TYPE) {
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

// ----------- end proses

// numeric only
function numOnly(ID) {
    $(ID).keydown(function (e) {
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

// modal unbind
function modalZ(ID) {
    $(ID).bind("show", function () {
        $(ID + " a.btn").click(function (e) {
            console.log("button pressed: " + $(this).html());
            $(ID).modal('hide');
        });
    });

    $(ID).bind("hide", function () {
        $(ID + " a.btn").unbind();
    });

    $(ID).modal({
        "backdrop": "static",
        "keyboard": false,
        "show": true
    });

    return false;
}


// --
function IsEmail(email) {
    var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    return regex.test(email);
}

// loading
function IsLoading(id,tipe) {
    if (tipe == "show") {
        $(id).show();
    } else {
        $(id).hide();
    }

    return false;
}


// radio
function RadionButtonSelectedValueSet(name, SelectdValue) {
    $('input[name="' + name + '"][value="' + SelectdValue + '"]').prop('checked', true);
}

// alertify
function MyAlert(msg, jns) {
    alertify.log(msg, jns);
    return false;
}

// my alert v2
function MyAlertV2(icon, msg, jns) {
    var i = "<i class='icon-" + icon + "'></i> ";
    alertify.log(i+msg, jns);
    return false;
}

// get loop
// ex var set = { id:key };
function MyObj(id) {
    for (var key in id) {
        if (id.hasOwnProperty(key)) {
            $("#"+key).val(id[key]);
            //alert(key + " -> " + p[key]);
        }
    }
}
function MyObjHtml(id) {
    for (var key in id) {
        if (id.hasOwnProperty(key)) {
            $("#" + key).html(id[key]);
            //alert(key + " -> " + p[key]);
        }
    }
}

// insert br elestic
function MyBr(id) {
    $('#'+id).keypress(function (e) {
        if (e.keyCode == 13) {
            $('#' + id).val($('#' + id).val() + "<br />");
        }
    });
}

function onFocusControl(id) {
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

//function escapeRegExp(string) {
//    return string.replace(/([.*+?^=!:${}()|\[\]\/\\])/g, "\\$1");
//}

//function replaceAll(string, find, replace) {
//  return string.replace(new RegExp(escapeRegExp(find), 'g'), replace);
//}


