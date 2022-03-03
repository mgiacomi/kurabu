$(document).ready(function () {
    "use strict"

    $('.close-panel').click(function () {
        $('.page-settings').addClass('hide-page-settings');
        return false;
    });

    $('.toggle-page-settings').click(function () {
        $('.page-settings').removeClass('hide-page-settings');
        return false;
    });

    $('.disabled-boxed-layout').click(function () {
        $('#page-settings').removeClass();
        $('#page-settings').addClass('boxed-disabled');
        $('.header').removeClass('boxed-header');
        return false;
    });

    $('.enabled-boxed-color').click(function () {
        $('#page-settings').removeClass();
        $('#page-settings').addClass('boxed-color');
        $('.header').addClass('boxed-header');
        return false;
    });

    $('.enabled-boxed-image').click(function () {
        $('#page-settings').removeClass();
        $('#page-settings').addClass('boxed-image');
        return false;
    });

    $('.enabled-boxed-image-v2').click(function () {
        $('#page-settings').removeClass();
        $('#page-settings').addClass('boxed-image-v2');
        return false;
    });

    $('.enabled-boxed-image-v3').click(function () {
        $('#page-settings').removeClass();
        $('#page-settings').addClass('boxed-image-v3');
        return false;
    });

    $('.enabled-boxed-color-v2').click(function () {
        $('#page-settings').removeClass();
        $('#page-settings').addClass('boxed-color-v2');
        return false;
    });

    $('.enabled-boxed-color-v3').click(function () {
        $('#page-settings').removeClass();
        $('#page-settings').addClass('boxed-color-v3');
        return false;
    });

    ///////////////////////
    //Staff Hover Effects//
    ///////////////////////

    $('.staff-member-image').hover(function () {
        $(this).find('.overlay').toggleClass('staff-overlay-animated');
        $(this).find('.staff-facebook').toggleClass('staff-facebook-animated');
        $(this).find('.staff-twitter').toggleClass('staff-twitter-animated');
        $(this).find('.staff-google').toggleClass('staff-google-animated');
    });

    //Maps//

    $('.service-box-image').hover(function () {
        $(this).find('i').toggleClass('active-service-box-icon');
        $(this).find('h4').toggleClass('service-box-heading4-active');
        $(this).find('h3').toggleClass('service-box-heading3-active');
    });

    $('.map-activation').click(function () {
        $(this).fadeOut(300);
        return false;
    });

    function initialize() {
        /*
         var mapOptions = {
         zoom: 15,
         center: new google.maps.LatLng(-37.817066, 144.955443),
         mapTypeId: google.maps.MapTypeId.ROADMAP
         };

         var map = new google.maps.Map(document.getElementById('location-canvas'), mapOptions);


         var marker = new google.maps.Marker({
         map: map,
         draggable: false,
         position: new google.maps.LatLng(-37.817066, 144.955443)
         });
         */
    }

    //google.maps.event.addDomListener(window, 'resize', initialize);
    //google.maps.event.addDomListener(window, 'load', initialize);


    $('.goup-footer').click(function () {
        $("html, body").animate({scrollTop: 0}, 1500);
        return false;
    });


});