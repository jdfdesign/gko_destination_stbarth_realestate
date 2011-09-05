jQuery(document).ready(function() {

    //<![cdata[
    init_slideshow = function() {
			    return $('#diaporama .images:first').galleria({
			        transition: 'slide',
			        thumbCrop:  'height',
							height:450,
							width:712,
							image_crop: "width",
              image_pan: true,
					// set this to false if you want to show the caption all the time:
			        _toggleInfo: true,
			    extend: function(options) {

			        // cache some stuff
			        var touch = Galleria.TOUCH,
			            click = touch ? 'touchstart' : 'click';

			        // show loader & counter with opacity
			        this.$('loader,counter').show().css('opacity', 0.4);

			        // some stuff for non-touch browsers
			        if (! touch ) {
			            this.addIdleState( this.get('image-nav-left'), { left:-50 });
			            this.addIdleState( this.get('image-nav-right'), { right:-50 });
			            this.addIdleState( this.get('counter'), { opacity:0 });
			        }


			        // bind some stuff
			        this.bind('thumbnail', function(e) {

			            if (! touch ) {
			                // fade thumbnails
			                $(e.thumbTarget).css('opacity', 0.6).parent().hover(function() {
			                    $(this).not('.active').children().stop().fadeTo(100, 1);
			                }, function() {
			                    $(this).not('.active').children().stop().fadeTo(400, 0.6);
			                });

			                if ( e.index === options.show ) {
			                    $(e.thumbTarget).css('opacity',1);
			                }
			            }
			        });

			        this.bind('loadstart', function(e) {
			            if (!e.cached) {
			                this.$('loader').show().fadeTo(200, 0.4);
			            }

			            $(e.thumbTarget).css('opacity',1).parent().siblings().children().css('opacity', 0.6);
			        });

			        this.bind('loadfinish', function(e) {
			            this.$('loader').fadeOut(200);
			        });
			    }
			});

    }

    ///////////////////////////////////
    // INIT INTERFACE
    ///////////////////////////////////
    gallery = init_slideshow();
    $("#wrapper").css("display", "none");
    $('#wrapper').fadeIn(2000);
    //$("#tabs").tabs();
		//$("select:not('.datetime,.date')").selectmenu();
    //-------------------------------------------------
    //-- DATE PICKERS
    // Define the dateFormat for the datepicker.
    // "day month year" is the default CMS format whatever the language used in forms.
    // If you change the default format or want have different format per language,
    // you have to change the datepicker dateFormat
    $.datepicker._defaults.dateFormat = 'd M yy';
    // Sets the date for each select with the date selected with datepicker
    $('input.ui-date-text').live("change",
    function() {
        var sels = $(this).siblings("select:lt(3)");
        var val = $(this).val();
        if (val != '') {
            var d = $.datepicker.parseDate($.datepicker._defaults.dateFormat, val);
            $(sels[0]).val(d.getDate());
            $(sels[1]).val(d.getMonth() + 1);
            $(sels[2]).val(d.getFullYear());
        }
        else {
            $(sels[0]).val('');
            $(sels[1]).val('');
            $(sels[2]).val('');
        }
    });
    // Replaces the date or datetime field with jquey-ui datepicker
    $('.ui-field-contain.date, .ui-field-contain.datetime').each(function(i, el) {
        var input = document.createElement('input');
        $(input).attr({
            'type': 'text',
            'class': 'ui-date-text'
        });
        // Insert the input:text after the label and before the first select
        l = $(el).find("label:first")
        if (l.length > 0) {
            l.after(input);
        } else {
            // else insert before the first select
            $(el).find("select:first").before(input);
            $(input).css('margin-left', '20%');
        }
        $(el).find("select:lt(3)").hide();
        // Set the input with the value of the selects
        var values = [];
        $(input).siblings("select:lt(3)").each(function(i, el) {
            var val = $(el).val();
            if (val != '') {
                values.push(val);
            };
        });
        if (values.length > 1) {
            values.reverse();
            // reverse the result as default js date is in EN and we use FR in cms
            d = new Date(values[0], parseInt(values[1]) - 1, values[2]);
            $("p#after").text("after " + values[0] + " " + values[1] + " " + values[2]);
            if (d) {
                d = $.datepicker.formatDate($.datepicker._defaults.dateFormat, d);
            }
            $(input).val(d);
        }
        $(input).datepicker();
    });
    


});