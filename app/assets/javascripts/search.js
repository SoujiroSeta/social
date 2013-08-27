$(document).ready(function() {
	 $('#cari').on('submit', function(event) {

    var q = document.forms["cari"]["q"].value;
    if (q==null || q=="")
    {
	  alert("gk boleh kosong");
	  	return false;
	  }
	  else{
	  	return true;
	  }
	  
 });
})