//= require gko/jquery.elastidegallery
	
$(document).ready(function() { 
	var body = $("body");
	var sidebar = $("#sidebar");
	
	function setSidebar() {
		console.log("setSidebar");
		var winWidth = body.width(),
				cWidth = $("#content-container .row-fluid:first").width(),
				space = winWidth - cWidth,
				x = space > 300 ? (space / 2) : 0; 
				
		console.log(x);
		sidebar.css({ 'right': x });
	}
	function init() {
		if($('.images:first').length > 0) {
			Gallery.init($('.images:first'));
		} 

		$('.carousel').each(function(index) {
			var _self = $(this);
			if(_self.find('.item').length > 1) {
				_self.carousel();
			}
		}); 
		
		if(!body.hasClass('mobile')) {
			$(window).bind('resize', setSidebar);
			setSidebar();
		} 
    
	}

	init();

});