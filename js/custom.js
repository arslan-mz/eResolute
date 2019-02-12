function activeURL(url) {
	var array = url.split("/");
	if (array[2] != '')
		$('.nav-link.'+array[2]).parent().addClass('active');
	else
		$('.nav-link.home').parent().addClass('active');
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
});