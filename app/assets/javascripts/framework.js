// JavaScript Document


$(document).ready(function(){
	"use strict"
	
	////////////////////////////////////////
	//Countdown Timer for Coming Soon Page//
	////////////////////////////////////////
	
	var endDate = "June 7, 2087 15:03:25";
	
	$('.countdown').countdown({
	  date: endDate,
	  render: function(data) {
		$(this.el).html(
		"<div class='countdown-box'><div class='countdown-years'>" + this.leadingZeros(data.years, 2) + 
		"</div><span>years</span></div><div class='countdown-box'><div class='countdown-days'>" + this.leadingZeros(data.days, 2) + 
		"</div><span>days</span></div><div class='countdown-box'><div class='countdown-hours'>" + this.leadingZeros(data.hours, 2) + 
		"</div><span>hrs</span></div><div class='countdown-box'><div class='countdown-minutes'>" + this.leadingZeros(data.min, 2) + 
		"</div><span>min</span></div><div class='countdown-box'><div class='countdown-seconds'>" + this.leadingZeros(data.sec, 2) + 
		"</div><span>sec</span></div>");
	  }
	});
	
	//////////////////////////////////////////////////
	//Framework Slider and Carousel Initializastions//
	//////////////////////////////////////////////////
	$(".homepage-slider").owlCarousel({
		navigation : false, // Show next and prev buttons
		pagination : false,
		slideSpeed : 500,
		paginationSpeed : 500,
		afterInit:progressBar,
		afterAction:moved,
		mouseDrag: false,
		touchDrag: true,
		startDragging : pauseOnDragging,
		singleItem:true,
		beforeMove: function(){
			// BEFORE going to the next slide (hide captions)
			$('.homepage-slider-caption').hide();
		}, 
		afterMove: function(){
			// AFTER going to next slide (show captions)
			$('.homepage-slider-caption').show(0);
			$('.slider-aligned-left-image').addClass('animated');
			$('.homepage-slider-caption h1').addClass('animated');
			$('.homepage-slider-caption h2').addClass('animated');
			$('.homepage-slider-caption h3').addClass('animated');
			$('.homepage-slider-caption h4').addClass('animated');
			$('.homepage-slider-caption h5').addClass('animated');
			$('.homepage-slider-caption h6').addClass('animated');
			$('.homepage-slider-caption p').addClass('animated');
			$('.homepage-slider-caption a').addClass('animated');
		}
	});
	
	$('.homepage-slider-caption').show(0);
	$('.slider-aligned-left-image').addClass('animated');
	$('.homepage-slider-caption h1').addClass('animated');
	$('.homepage-slider-caption h2').addClass('animated');
	$('.homepage-slider-caption h3').addClass('animated');
	$('.homepage-slider-caption h4').addClass('animated');
	$('.homepage-slider-caption h5').addClass('animated');
	$('.homepage-slider-caption h6').addClass('animated');
	$('.homepage-slider-caption p').addClass('animated');
	$('.homepage-slider-caption a').addClass('animated');
	
	$(".next-homepage").click(function(){
		console.log('Clicked');
		$(".homepage-slider").trigger('owl.prev');
		return false;
	});
	$(".prev-homepage").click(function(){
		console.log('Clicked');
		$(".homepage-slider").trigger('owl.next');
		return false;
	});	
	
	var time = 10; // Slider Time
	var size_slider = 0;
	var size_caption = 0;
	var desktop_header_offeset = 0;
	var size_screen = 0;
	var size_screen_width = 0;
	var align_image_slider_right = 0;
	var screen_size_width = 0;
	var desktop_header_offeset = 0;
	var no_adaptive_height_size = 0;
	var regular_slider_height_size = 0;
	var regular_slider_height_mobile_size = 0;
	var header_height = 0;
	var countdown_height = 0;

	function initiate_homepage_slider(){
		 size_slider = $('.homepage-slider-item').height();
		 size_caption = $('.homepage-slider-caption').height();	
		 desktop_header_offeset = $('.header-offset').height();
		 size_screen = $(window).height();
		 size_screen_width = $(window).width();
		 //align_image_slider_right = ($(window).width()-960)/2
		 align_image_slider_right = ($('.boxed').width()-960)/2
		 screen_size_width = $(window).width();
		 desktop_header_offeset = $('.header-offset').height();
		 header_height = $('.header').height();
		 no_adaptive_height_size = 700; // Size for Slider On Desktops When Adaptive Selected // 
		 regular_slider_height_size = 700; // Size for Slider On Desktop when Regular Selected // 
		 regular_slider_height_mobile_size = 500; // Size for Slider on Mobile when Regular Selected // 
		 countdown_height = $('.fullpage-wrapper').height();

		$('.fullscreen-page').animate({
			 height: size_screen +100,
			}, 0, 'easeInOutQuad', function () {
		});
		 
		$('.fullpage-wrapper').animate({
			 marginTop: (size_screen/2) - (countdown_height/2) -50 ,
			}, 0, 'easeInOutQuad', function () {
		});	
	
		//Set Captions On Screen//
		$('.homepage-slider-caption').animate({
			 marginTop: ((size_caption/2) * -1) - desktop_header_offeset ,
			}, 0, 'easeInOutQuad', function () {
		});
		$('.full-slider .homepage-slider-item').animate({
			 height: size_screen + (size_caption-30),
			}, 0, 'easeInOutQuad', function () {
		});	
		$('.regular-slider .homepage-slider-item').animate({
			 height: regular_slider_height_size,
			}, 0, 'easeInOutQuad', function () {
		});	
		
		//Adaptive Height Slider//
		if (screen_size_width < 1025){
			$('.adaptive-slider .homepage-slider-item').animate({
				 height: size_screen + $('.homepage-slider-caption').height(),
				}, 0, 'easeInOutQuad', function () {
			});	
			$('.homepage-slider-caption').animate({
				marginTop: ((size_caption/2) * -1) -100,
				}, 0, 'easeInOutQuad', function () {
			});
			$('.regular-slider .homepage-slider-item').animate({
				height:regular_slider_height_mobile_size,
				}, 0, 'easeInOutQuad',function(){
			});
			$('.adaptive-controls a').hide();
			$('.regular-controls a').hide();
			$('.full-controls a').hide();
		} else {
			$('.adaptive-controls a').show();
			$('.regular-controls a').show();
			$('.full-controls a').show();	
			$('.adaptive-slider .homepage-slider-item').animate({
				 height: no_adaptive_height_size,
				}, 0, 'easeInOutQuad', function () {
			});				
			//Setting Control Arrows
			$('.adaptive-controls a').animate({
				 marginTop: (no_adaptive_height_size/2) -50 ,
				}, 0, 'easeInOutQuad', function () {
			});
			$('.regular-controls a').animate({
				 marginTop: (regular_slider_height_size/2) - 100 ,
				}, 0, 'easeInOutQuad', function () {
			});	
			$('.full-controls a').animate({
				 marginTop: (size_screen/2),
				}, 0, 'easeInOutQuad', function () {
			});	
		}
		//Images Within Captions Alignment
		$(".slider-aligned-right-image").css( { right : align_image_slider_right } );
	};

	initiate_homepage_slider();

	$(window).resize(function(){
		initiate_homepage_slider();
	});
	
	/////////////////////////////////////////////////
	//Offset For Sticky Header Visibility On Scroll//
	/////////////////////////////////////////////////

	var menu = document.querySelector('.header');
	var origOffsetY = 100

	function scroll () {
	  if ($(window).scrollTop() >= origOffsetY) {
		$('.header').addClass('header-background');
	  } else {
		$('.header').removeClass('header-background');
	  }  
	}
	document.onscroll = scroll;	

	/////////////////////////////////////////////////
	//Setting and Detecting Mobile Browser Agents////
	/////////////////////////////////////////////////
	
	var isMobile = {
		Android: function() {
			return navigator.userAgent.match(/Android/i);
		},
		BlackBerry: function() {
			return navigator.userAgent.match(/BlackBerry/i);
		},
		iOS: function() {
			return navigator.userAgent.match(/iPhone|iPad|iPod/i);
		},
		Opera: function() {
			return navigator.userAgent.match(/Opera Mini/i);
		},
		Windows: function() {
			return navigator.userAgent.match(/IEMobile/i);
		},
		any: function() {
			return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows());
		}
	};
	
	///////////////////////////////
	//Mobile Naavigation Settings//
	///////////////////////////////

	if( !isMobile.any() ){
		$('.deploy-mobile-navigation').click(function(){
			$('.page-content').toggleClass('show-content-id');
		});
		
		$('.close-sidebar').click(function(){
			$('.page-content').removeClass('show-content-id');
		});
		
		$( window ).resize(function() {
			$('.page-content').removeClass('show-content-id');
		});
		
	} else {
		//activating swipe navigation
		var snapper = new Snap({
		  element: document.getElementById('content')
		});
		
		$( window ).resize(function() {
			snapper.close();
		});
		
		$('.close-sidebar').click(function(){
			snapper.close();
		});
		
		//Small Screen Navigation//
		
		$('.deploy-mobile-navigation').click(function(){
			if( snapper.state().state=="left" ){
				snapper.close();
			} else {
				snapper.open('left');
			}
			return false;
		});
	}	
		
	///////////////////////////
	//Large Screen Navigation//
	///////////////////////////
	
	$('.navigation li').hover(function(){
        $(this).find('ul').toggleClass('show-navigation');
        $(this).find('p i').toggleClass('rotate-navigation-icon');
    });
	
	$('.navigation li').click(function(){
		$(this).find('ul').toggleClass('show-navigation-mobile');
		$(this).find('p .fa-angle-down').toggleClass('rotate-navigation-icon-mobile');
	});
	
	//Activate Video Player//
		
	if( !isMobile.any() ){
		jQuery(function(){
			jQuery(".player").mb_YTPlayer();
			$('.strip-player-wrapper-small').addClass('disabled');
		});
	} else {
		$('.strip-player-wrapper .box-960, .strip-player-wrapper .overlay, .strip-player-box').hide();
		$('.strip-player-wrapper-small').show();
		$('.strip-player-wrapper-small').removeClass('disabled');
	}
	
	$('.strip-player-show-video').click(function(){
		$(this).parent().parent().find('.strip-player-text, .strip-player-controls').toggleClass('strip-player-text-inactive');
		$(this).toggle();
		$(this).parent().find('.strip-player-hide-video').toggle();
		return false;
	});
	
	$('.strip-player-hide-video').click(function(){
		$(this).parent().parent().find('.strip-player-text, .strip-player-controls').toggleClass('strip-player-text-inactive');
		$(this).toggle();
		$(this).parent().find('.strip-player-show-video').toggle();
		return false;
	});
	
	$('.strip-player-play').click(function(){
		$(this).toggle();
		$(this).parent().find('.strip-player-pause').toggle();
		return false;
	});
	
	$('.strip-player-pause').click(function(){
		$(this).toggle();
		$(this).parent().find('.strip-player-play').toggle();
		return false;
	});
	
	$('.strip-player-volume-down, .strip-player-volume-up').click(function(){
		return false;
	});
		
	
	///////////////////////////////////////////////////////////////
    //Detect Operatiing System and Enable Smooth Scrolling != Mac//
	///////////////////////////////////////////////////////////////
	
	var OSName="Unknown OS";
	if (navigator.appVersion.indexOf("Win")!=-1) OSName="Windows";
	else if (navigator.appVersion.indexOf("Mac")!=-1) OSName="MacOS";
	else if (navigator.appVersion.indexOf("X11")!=-1) OSName="UNIX";
	else if (navigator.appVersion.indexOf("Linux")!=-1) OSName="Linux";
	
	if (OSName!="MacOS"){
		$.srSmoothscroll();
	}
		
	///////////////////////////////
	//Scolling navigation system//
	///////////////////////////////
	
	$.scrollIt({
		upKey: 38,             // key code to navigate to the next section
	  	downKey: 40,           // key code to navigate to the previous section
		easing: 'easeInOutExpo',      // the easing function for animation
		scrollTime: 600,       // how long (in ms) the animation takes
		activeClass: 'active-navigation-item', // class given to the active nav element
		onPageChange: null,    // function(pageIndex) that is called when page is changed
		topOffset: -70           // offste (in px) for fixed top navigation
	});
		
		
	///////////////////////////////	
	//Activate Animations On Scroll
	///////////////////////////////
	
	var wow = new WOW(
	  {
		boxClass:     'animated',      // animated element css class (default is wow)
		animateClass: 'animated', // animation css class (default is animated)
		offset:       0,          // distance to the element when triggering the animation (default is 0)
		mobile:       false,        // trigger animations on mobile devices (true is default)
	  }
	);
	wow.init();

	/////////////
	//Lazy Load//
	/////////////
	
	$(function() {
		$("img.preload").show().lazyload({effect : "fadeIn", threshold : 200});
	});
	
	////////////////////////////////////
	//Detect if iOS WebApp engaged and//
	//permit navigation without Safari//
	////////////////////////////////////
	(function (a, b, c) {
	    if (c in b && b[c]) {
	        var d, e = a.location,
	            f = /^(a|html)$/i;
	        a.addEventListener("click", function (a) {
	            d = a.target;
	            while (!f.test(d.nodeName)) d = d.parentNode;
	            "href" in d && (d.href.indexOf("http") || ~d.href.indexOf(e.host)) && (a.preventDefault(), e.href = d.href)
	        }, !1)
	    }
	})(document, window.navigator, "standalone")
	

	/////////////////////////////////////////////////////
	//Initiating Parallax Effects if Non Mobile Browser//
	/////////////////////////////////////////////////////
	
	if( !isMobile.any() ){
		skrollr.init({
			forceHeight: false,
			smoothScrolling: false
		});
    }

	////////////////////////////
	//Thumbnail Slider Overlay//
	////////////////////////////
	$('.thumbnail-slider a, .thumbnail-overlay').hover(function(){
		$(this).parent().find('.thumbnail-overlay').stop(true,true).fadeIn(200);
	},function(){
		$(this).parent().find('.thumbnail-overlay').stop(true,true).fadeOut(200);
	});
	
	/////////////////////////////
	//Responsive Tabs/Accordion//
	/////////////////////////////
	$('.horizontalTab').responsiveTabs({
            startCollapsed: 'accordion',
            collapsible: true,
            rotate: false
	});
	
	/////////////////
	//Notifications//
	/////////////////
	$('.close-small-notification').click(function(){
		$(this).parent().parent().animate({
			height:0,
			marginBottom:'0!important',
			padding:0,
		  }, 150, 'easeInOutExpo', function () {;
		}).fadeOut(0);
		return false;
	});
	
	$('.close-contact-notification').click(function(){
		return false;	
	})

	
	$('.close-big-notification').click(function(){
		$(this).parent().animate({
			height:0,
			marginBottom:0,
			padding:0,
		  }, 300, 'easeInOutExpo', function () {;
		}).fadeOut(0);
		return false;
	});
	
	///////////////
	//Radio Stuff//
	///////////////
	$('.radio-class-1').click(function(){$(this).toggleClass('radio-unselected-1');	return false;});
	$('.radio-class-2').click(function(){$(this).toggleClass('radio-unselected-2');	return false;});
	$('.radio-class-3').click(function(){$(this).toggleClass('radio-unselected-3');	return false;});

	$('.checkbox-class-1').click(function(){$(this).toggleClass('checkbox-unselected-1');	return false;});
	$('.checkbox-class-2').click(function(){$(this).toggleClass('checkbox-unselected-2');	return false;});
	$('.checkbox-class-3').click(function(){$(this).toggleClass('checkbox-unselected-3');	return false;});
	$('.checkbox-class-4').click(function(){$(this).toggleClass('checkbox-unselected-4');	return false;});

	/////////////
	//Accordion//
	/////////////
	$('.accordion-header').toggleClass('inactive-header');
	$('.accordion-header').click(function () {
		if($(this).is('.inactive-header')) {
			$('.active-header').toggleClass('active-header').toggleClass('inactive-header').next().slideToggle(200).toggleClass('open-content');
			$(this).toggleClass('active-header').toggleClass('inactive-header');
			$(this).next().slideToggle(200).toggleClass('open-content');
		}
		else {
			$(this).toggleClass('active-header').toggleClass('inactive-header');
			$(this).next().slideToggle(200).toggleClass('open-content');
		}
		return false;	
	});

	//////////////////////////////////////////////////////////////////////////////
	//Adding Classes for CSS3 Animations, Instead of jquery.animte, we used css3//
	//it might be a little bit more complicated, but the effect is faster speeds//
	//on most mobile devices on the market! Your mobile users will love you///////
	//////////////////////////////////////////////////////////////////////////////
	
	$('.formats a').click(function(){
		return false;
	});

	$('.image-carousel .item').hover(function(){
		$(this).find('.image-carousel-controls .image-carousel-zoom').toggleClass('image-carousel-zoom-animated');
		$(this).find('.image-carousel-controls .image-carousel-href').toggleClass('image-carousel-href-animated');
	});
	
	$('.center-icon-column').hover(function(){
		$(this).parent().find('h1').toggleClass('animate-center-icon');
		$(this).parent().find('h5, h6').toggleClass('animate-center-icon-heading');
		$(this).parent().find('p').toggleClass('animate-center-icon-text');
		$(this).parent().find('a').toggleClass('animate-center-icon-href');
		$(this).parent().find('.center-column-icon-decoration').toggleClass('animate-center-icon-decoration');
	});
	
	$('.blue-center-icon-column').hover(function(){
		$(this).toggleClass('animate-center-icon-bg-blue');
	});
	
	$('.red-center-icon-column').hover(function(){
		$(this).toggleClass('animate-center-icon-bg-red');
	});
	
	$('.green-center-icon-column').hover(function(){
		$(this).toggleClass('animate-center-icon-bg-green');
	});
	
	$('.dark-center-icon-column').hover(function(){
		$(this).toggleClass('animate-center-icon-bg-dark')
	});
	
	$('.toggle-1-title').click(function(){
		$(this).find('span').toggleClass('toggle-1-active');
		$(this).parent().parent().find('.toggle-1-text').toggle(200);
		return false;
	});

	$('.toggle-2-title').click(function(){
		$(this).find('a span i').toggleClass('toggle-2-active');
		$(this).parent().parent().find('.toggle-2-text').toggle(200);
		return false;
	});	

	$('.toggle-3-title').click(function(){
		$(this).find('a span i').toggleClass('toggle-3-active');
		$(this).parent().parent().find('.toggle-3-text').toggle(200);
		return false;
	});
	
	
	//If Device is mobile then the gallery automatically is switched to SwipeBox//
	//If Device is latop / desktop the gallery is automatically switched to Colorbox//
	
	
	jQuery(document).ready(function(){
		if( !isMobile.any() ){
			$('.detect-gallery').colorbox({
				rel:'thumb-clickfolio',
				transition:"elastic",
				speed:350,
				scalePhotos:"true",
				maxWidth:"100%",
				maxHeight:"100%"
			});
		} else {
			$(".detect-gallery").swipebox({
				useCSS : true, // false will force the use of jQuery for animations
				hideBarsDelay : 3000 // 0 to always show caption and action bar
			});	
		};
	});
	
	/////////////////
	//Image Gallery//
	/////////////////

	$('.image-carousel').owlCarousel({
		items:3,
		navigation : false, // Show next and prev buttons
		pagination: false,
		slideSpeed : 300,
		paginationSpeed : 400,
	});
	
	$('.simple-carousel').owlCarousel({
		items:5,
		itemsDesktop:[2500,1],
		itemsDesktopSmall:[768, 1],
		itemsTablet:[568,1],
		itemsTabletSmall:[480, 1],
		itemsMobile:[320,1],
		navigation : false, // Show next and prev buttons
		pagination: false,
		slideSpeed : 300,
		paginationSpeed : 400,
		afterInit : progressBar,
		afterMove : moved,
		startDragging : pauseOnDragging
	});
	
	$('.blog-carousel').owlCarousel({
		items:5,
		itemsDesktop:[2500,1],
		itemsDesktopSmall:[768, 1],
		itemsTablet:[568,1],
		itemsTabletSmall:[480, 1],
		itemsMobile:[320,1],
		navigation : false, // Show next and prev buttons
		pagination: true,
		slideSpeed : 300,
		autoPlay:3000,
		paginationSpeed : 400,
	});
	
	// Custom Navigation Events
	$(".next-simple-carousel").click(function(){
		$(".simple-carousel").trigger('owl.next');
		return false;
	});
	$(".prev-simple-carousel").click(function(){
		$(".simple-carousel").trigger('owl.prev');
		return false;
	});
	
	$('.customers-slider').owlCarousel({
		items:5,
		itemsDesktop:[1280,5],
		itemsDesktopSmall:[768, 4],
		itemsTablet:[568,3],
		itemsTabletSmall:[480, 2],
		itemsMobile:[320,2],
		navigation : false, // Show next and prev buttons
		pagination: false,
		slideSpeed : 300,
		paginationSpeed : 400,
		stopOnHover:true,
		autoPlay:3000,
	});
	
	 $(".one-image-slider").owlCarousel({
		navigation : true, // Show next and prev buttons
		navigationText:	["<i class='fa fa-angle-left fa-2x'></i>","<i class='fa fa-angle-right fa-2x'></i>"],
		pagination: true,
		slideSpeed : 300,
		paginationSpeed : 400,
		singleItem:true,
		afterInit : progressBar,
		afterMove : moved,
		startDragging : pauseOnDragging
	});
	
	
	$(".thumbnail-slider").owlCarousel({
		items:5,
		itemsDesktop:[1024,5],
		itemsDesktopSmall:[768, 4],
		itemsTablet:[568,4],
		itemsTabletSmall:[480, 3],
		itemsMobile:[320,2],
		pagination:false,
		rewindNav:true,
		rewindSpeed:200,
		responsive:true
	});	
	
	// Custom Navigation Events
	$(".next-thumbnail-slider").click(function(){
		$(".thumbnail-slider").trigger('owl.next');
		return false;
	});
	$(".prev-thumbnail-slider").click(function(){
		$(".thumbnail-slider").trigger('owl.prev');
		return false;
	});
	  
	$('.team-slider').owlCarousel({
		items:3,
		itemsDesktop:[1024,3],
		itemsDesktopSmall:[768, 2],
		itemsTablet:[568,2],
		itemsTabletSmall:[480, 1],
		itemsMobile:[320,1],
		navigation : false, // Show next and prev buttons
		pagination: false,
		slideSpeed : 200,
		paginationSpeed : 200,
	});
	
	  // Custom Navigation Events
	  $(".next-team-slider").click(function(){
		$(".team-slider").trigger('owl.next');
		return false;
	  })
	  $(".prev-team-slider").click(function(){
		$(".team-slider").trigger('owl.prev');
		return false;
	  })

	$('.services-slider').owlCarousel({
		items:4,
		itemsDesktop:[1024,4],
		itemsDesktopSmall:[768, 3],
		itemsTablet:[568,2],
		itemsTabletSmall:[480, 1],
		itemsMobile:[320,1],
		navigation : false, // Show next and prev buttons
		pagination: false,
		slideSpeed : 200,
		paginationSpeed : 200,
	});
	
	$(".next-services-slider").click(function(){
	  $('.services-slider').trigger('owl.next');
	  return false;
	})
	$(".prev-services-slider").click(function(){
	  $('.services-slider').trigger('owl.prev');
	  return false;
	});
	
	$('.features-slider').owlCarousel({
		items:1,
		itemsDesktop:[1366,1],
		itemsDesktopSmall:[1280, 1],
		itemsTablet:[768,1],
		itemsTabletSmall:[480, 1],
		itemsMobile:[320,1],
		navigation : false, // Show next and prev buttons
		pagination: false,
		slideSpeed : 200,
		paginationSpeed : 200,
	});
	
	  // Custom Navigation Events
	  $(".next-features").click(function(){
		$(".features-slider").trigger('owl.next');
		return false;
	  })
	  $(".prev-features").click(function(){
		$(".features-slider").trigger('owl.prev');
		return false;
	  })
	
	$('.quotes-slider').owlCarousel({
		items:1,
		itemsDesktop:[1366,1],
		itemsDesktopSmall:[1280, 1],
		itemsTablet:[768,1],
		itemsTabletSmall:[480, 1],
		itemsMobile:[320,1],
		navigation : false, // Show next and prev buttons
		pagination: false,
		slideSpeed : 200,
		paginationSpeed : 400,
		stopOnHover:true,
		autoPlay:3000,
		autoHeight:false,
	});
	
	$(".next-features-slider").click(function(){
	  $('.features-slider').trigger('owl.next');
	  return false;
	})
	$(".prev-features-slider").click(function(){
	  $('.features-slider').trigger('owl.prev');
	  return false;
	});


	//Activating the slider//
	var $progressBar,
		$bar,
		$elem,
		isPause,
		tick,
		percentTime;

	 //Init progressBar where elem is $("#owl-demo")
	function progressBar(elem) {
		$elem = elem;
		//build progress bar elements
		buildProgressBar();
		//start counting
		start();
	}
	 //create div#progressBar and div#bar then prepend to $("#owl-demo")
	function buildProgressBar() {
		$progressBar = $("<div>", {
			id: "progressBar"
		});
		$bar = $("<div>", {
			id: "bar"
		});
		$progressBar.append($bar).prependTo($elem);
	}
	function start() {
		//reset timer
		percentTime = 0;
		isPause = false;
		//run interval every 0.01 second
		tick = setInterval(interval, 10);
	};
	function interval() {
		if (isPause === false) {
			percentTime += 1 / time;
			$bar.css({
				width: percentTime + "%"
			});
			//if percentTime is equal or greater than 100
			if (percentTime >= 100) {
				//slide to next item 
				$elem.trigger('owl.next')
			}
		}
	}
	 //pause while dragging 
	function pauseOnDragging() {
		isPause = true;
	}
	 //moved callback
	function moved() {
		//clear interval
		clearTimeout(tick);
		//start again
		start();
	}

     $('.homepage-slider').on('mouseover',function(){
       isPause = true;
     })
      $('.homepage-slider').on('mouseout',function(){
       isPause = false;
     })
	 
	
	////////////////////////////////////////////////////
	//Page Portfolios One / Two / Three and Filterable//
	////////////////////////////////////////////////////
	
	$('.portfolio-one-item-categories a').click(function() {
		$('.portfolio-one-item-categories a').removeClass('selected-portfolio-one-cat');
		$(this).addClass('selected-portfolio-one-cat');
		var thisItem 	= $(this).prop("id");		
		if ($.browser.msie  && parseInt($.browser.version, 10) > 8) {
				//If IE
				if(thisItem != "all") {
					$('.portfolio-one-wrapper .portfolio-one-item').addClass('remove-one-portfolio-ie');	
					$('.portfolio-one-wrapper .portfolio-one-item').removeClass('show-one-portfolio-ie');	
					$('.portfolio-one-wrapper div' + '.' +thisItem).addClass('show-one-portfolio-ie');
					$('.portfolio-one-wrapper div' + '.' +thisItem).removeClass('remove-one-portfolio-ie');		
				}else{
					$('.portfolio-one-wrapper .portfolio-one-item').addClass('show-one-portfolio-ie');
					$('.portfolio-one-wrapper .portfolio-one-item').removeClass('remove-one-portfolio-ie');	
				}
				return false;
		} else {
				//If not IE
				if(thisItem != "all") {
					$('.portfolio-one-wrapper .portfolio-one-item').addClass('remove-one-portfolio');	
					$('.portfolio-one-wrapper .portfolio-one-item').removeClass('show-one-portfolio');	
					$('.portfolio-one-wrapper div' + '.' +thisItem).addClass('show-one-portfolio');
					$('.portfolio-one-wrapper div' + '.' +thisItem).removeClass('remove-one-portfolio');		
				}else{
					$('.portfolio-one-wrapper .portfolio-one-item').addClass('show-one-portfolio');
					$('.portfolio-one-wrapper .portfolio-one-item').removeClass('remove-one-portfolio');	
				}
				return false;
		}
	});
	
	
	$('.portfolio-two-item-categories a').click(function() {
		$('.portfolio-two-item-categories a').removeClass('selected-portfolio-two-cat');
		$(this).addClass('selected-portfolio-two-cat');
		var thisItem 	= $(this).prop("id");	
		if ($.browser.msie  && parseInt($.browser.version, 10) > 8) {
				//If IE
				if(thisItem != "all") {
					$('.portfolio-two-wrapper .portfolio-two-item').addClass('remove-two-portfolio-ie');	
					$('.portfolio-two-wrapper .portfolio-two-item').removeClass('show-two-portfolio-ie');	
					$('.portfolio-two-wrapper div' + '.' +thisItem).addClass('show-two-portfolio-ie');
					$('.portfolio-two-wrapper div' + '.' +thisItem).removeClass('remove-two-portfolio-ie');		
				}else{
					$('.portfolio-two-wrapper .portfolio-two-item').addClass('show-two-portfolio-ie');
					$('.portfolio-two-wrapper .portfolio-two-item').removeClass('remove-two-portfolio-ie');	
				}
				return false;
		} else {
				//If not IE
				if(thisItem != "all") {
					$('.portfolio-two-wrapper .portfolio-two-item').addClass('remove-two-portfolio');	
					$('.portfolio-two-wrapper .portfolio-two-item').removeClass('show-two-portfolio');	
					$('.portfolio-two-wrapper div' + '.' +thisItem).addClass('show-two-portfolio');
					$('.portfolio-two-wrapper div' + '.' +thisItem).removeClass('remove-two-portfolio');		
				}else{
					$('.portfolio-two-wrapper .portfolio-two-item').addClass('show-two-portfolio');
					$('.portfolio-two-wrapper .portfolio-two-item').removeClass('remove-two-portfolio');	
				}
				return false;
		}
	});
	
	$('.portfolio-three-item-categories a').click(function() {
		$('.portfolio-three-item-categories a').removeClass('selected-portfolio-three-cat');
		$(this).addClass('selected-portfolio-three-cat');
		var thisItem 	= $(this).prop("id");
		if ($.browser.msie  && parseInt($.browser.version, 10) > 8) {
				//If IE
				if(thisItem != "all") {
					$('.portfolio-three-wrapper .portfolio-three-item').addClass('remove-three-portfolio-ie');	
					$('.portfolio-three-wrapper .portfolio-three-item').removeClass('show-three-portfolio-ie');	
					$('.portfolio-three-wrapper div' + '.' +thisItem).addClass('show-three-portfolio-ie');
					$('.portfolio-three-wrapper div' + '.' +thisItem).removeClass('remove-three-portfolio-ie');		
				}else{
					$('.portfolio-three-wrapper .portfolio-three-item').addClass('show-three-portfolio-ie');
					$('.portfolio-three-wrapper .portfolio-three-item').removeClass('remove-three-portfolio-ie');	
				}
				return false;
		} else {
				//If not IE
				if(thisItem != "all") {
					$('.portfolio-three-wrapper .portfolio-three-item').addClass('remove-three-portfolio');	
					$('.portfolio-three-wrapper .portfolio-three-item').removeClass('show-three-portfolio');	
					$('.portfolio-three-wrapper div' + '.' +thisItem).addClass('show-three-portfolio');
					$('.portfolio-three-wrapper div' + '.' +thisItem).removeClass('remove-three-portfolio');		
				}else{
					$('.portfolio-three-wrapper .portfolio-three-item').addClass('show-three-portfolio');
					$('.portfolio-three-wrapper .portfolio-three-item').removeClass('remove-three-portfolio');	
				}
				return false;
		}
	});
	
	$('.portfolio-one-wrapper .left-one-portfolio').hover(function(){
		$(this).find('.overlay').toggleClass('overlay-one');
		$(this).find('.detect-gallery').toggleClass('detect-gallery-one');
		$(this).find('.clicked-gallery').toggleClass('clicked-gallery-one');
	});

	$('.portfolio-two-wrapper .portfolio-two-item div').hover(function(){
		$(this).find('.overlay').toggleClass('overlay-two');
		$(this).find('.detect-gallery').toggleClass('detect-gallery-two');
		$(this).find('.clicked-gallery').toggleClass('clicked-gallery-two');
	});	
	
	$('.portfolio-three-wrapper .portfolio-three-item div').hover(function(){
		$(this).find('.overlay').toggleClass('overlay-three');
		$(this).find('.detect-gallery').toggleClass('detect-gallery-three');
		$(this).find('.clicked-gallery').toggleClass('clicked-gallery-three');
	});	
	

	
/*
Custom Add To Homescreen Script  
Responsive with automatic iOS device detection

This code CANNOT be shared or used for commercial projects outside the item it resides in! 
This code CAN be shared and used by it's respective developer (Enabled) for ThemeForest items
If you wish to use this code for a commercial project outside the item it resides in,
please purchase a license from http://codecanyon.net/item/add-to-home-homescreen-bookmark-script-for-ios/6925738

*/

	/////////////////////////////////////////////////////
	// Creating a cookie for the custom addToHome script/
	/////////////////////////////////////////////////////
	
	function createCookie(name,value,days) {
		if (days) {
			var date = new Date();
			date.setTime(date.getTime()+(days*24*60*60*1000));
			var expires = "; expires="+date.toGMTString();
		}
		else var expires = "";
		document.cookie = name+"="+value+expires+"; path=/";
	}
	
	function readCookie(name) {
		var nameEQ = name + "=";
		var ca = document.cookie.split(';');
		for(var i=0;i < ca.length;i++) {
			var c = ca[i];
			while (c.charAt(0)==' ') c = c.substring(1,c.length);
			if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
		}
		return null;
	}
	
	function eraseCookie(name) {	createCookie(name,"",-1);	}
	
	var webappStatus = readCookie('webappIsClosed');
	
	/////////////////////////////////////////////////////////////////////////////////////////////
	//Detect user agent for known mobile devices and show hide elements for each specific element
	/////////////////////////////////////////////////////////////////////////////////////////////
	
	var isiPhone = 		navigator.userAgent.toLowerCase().indexOf("iphone");
	var isiPad = 		navigator.userAgent.toLowerCase().indexOf("ipad");
	var isiPod = 		navigator.userAgent.toLowerCase().indexOf("ipod");
	var isiAndroid = 	navigator.userAgent.toLowerCase().indexOf("android");
	
	if(isiPhone > -1) 	 {		 $('.ipod-detected').hide();		 $('.ipad-detected').hide();		 $('.iphone-detected').show();		 $('.android-detected').hide();	 }
	if(isiPad > -1)	 {		 	 $('.ipod-detected').hide();		 $('.ipad-detected').show();		 $('.iphone-detected').hide();		 $('.android-detected').hide();	 }
	if(isiPod > -1)	 {		 	 $('.ipod-detected').show();		 $('.ipad-detected').hide();		 $('.iphone-detected').hide();		 $('.android-detected').hide();	 }   
	if(isiAndroid > -1) {		 $('.ipod-detected').hide();		 $('.ipad-detected').hide();		 $('.iphone-detected').hide();		 $('.android-detected').show();	 }  

	
	/*Show and Close WebApp*/	
	$('.delete-cookie').click(function(){
		$('.webapp-wrapper').fadeIn();
		eraseCookie('webappIsClosed');
		return false;
	});
	
	if(window.navigator.standalone==true){	$('.webapp-warpper').fadeOut();	}
	
		
	$('.close-webapp').click(function(){
		createCookie('webappIsClosed', 'true' , 7);
		$('.webapp-wrapper').fadeOut();
		return false;
		$('.webapp-wrapper').fadeOut();
	});	
	
	if(isiPhone > -1){
		$('.webapp-wrapper').delay(200).fadeIn(200);
	};
	
	if(isiPad > -1){
		$('.webapp-wrapper').delay(200).fadeIn(200);
	};
	
	if(isiPod > -1){
		$('.webapp-wrapper').delay(200).fadeIn(200);
	};

	if(webappStatus == 'true'){
		$('.webapp-wrapper').hide();	
	};	

	//Back To Top
	$(window).scroll(function() {
		if ($(this).scrollTop() > 200) {
			$('.going-up').fadeIn(200);
		} else {
			$('.going-up').fadeOut(200);
		}
	});
	$('.going-up').click(function(event) {
		event.preventDefault();
		
		$('html, body').animate({scrollTop: 0}, 300);
	})
	

});

