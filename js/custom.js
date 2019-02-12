function activeURL(url) {
	var array = url.split("/");
	if (array[2] != '')
		$('.nav-link.'+array[2]).parent().addClass('active bold');
	else
		$('.nav-link.home').parent().addClass('active bold');
}

function validate() {
	if ($('#Password1').val() == $('#Password2').val())
		return true;
	else {
		alert("Passwords don't match! Password and Confirm Password must be same!");
		return false;
	}
}

$(document).ready(function() {

	activeURL(window.location.pathname);

	$(".video-element").bind("contextmenu",function(){
	    return false;
	});

});