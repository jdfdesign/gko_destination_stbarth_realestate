//= require gko/jquery.elastidegallery
	
$(document).ready(function() { 
	var body = $("body");
	var sidebar = $("#sidebar");
	
	function setSidebar() {
		var winWidth = body.width(),
				cWidth = $("#content-container .row-fluid:first").width(),
				space = winWidth - cWidth,
				x = space > 300 ? (space / 2) : 0; 
		sidebar.css({ 'right': x - 20 });
	}
	function init() {
		if($('.images:first').length > 0) {
			Gallery.init($('.images:first'));
		} 

		$('.carousel').each(function(index) {
			var _self = $(this);
			if(_self.find('.item').length > 1) {
				_self.carousel();
			} else {
				_self.find('.carousel-control').each(function(index) {
					  $(this).css({display: 'none'})
				 });
			}
		}); 
		
		if(!body.hasClass('mobile')) {
			$(window).bind('resize', setSidebar);
			setSidebar();
		} 
    
	}

	init();

});