
$(document).ready(function(){
	
    $("#a1").live('click', function (e) {
        e.preventDefault();
        var page = $(this).attr("href")
        var pagetitle = $(this).attr("title")
        var $dialog = $('<div></div>')
        .html('<iframe style="border: 0px; " src="' + page + '" width="100%" height="100%"></iframe>')
        .dialog({
            autoOpen: false,
            modal: true,
            title: pagetitle,
            height: 720,
            width: 920
        });
        $dialog.dialog('open');
        
    })
});


function loadAdd() {
 alert("added Successfully!");	
}
function loadDelete() {
	 alert("deleted Successfully!");	
	}
function loadEdit() {
	 alert("updated Successfully!");	
	}
function confirmGo(m,u) {
    if ( confirm(m) ) {
        window.location = u;
    }
}
