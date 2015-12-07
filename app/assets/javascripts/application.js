// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .

$(function(){ $(document).foundation(); });

//INDEX COURSES 
$(function(){
  $('#Container').mixItUp();
});

$('input').on('click',function() {
    if ($(this).hasClass('grid')) {
        $('#Container ul').removeClass('small-block-grid-1').addClass('small-block-grid-3 medium-block-grid-4 large-block-grid-5');
    }
    else if($(this).hasClass('list')) {
        $('#Container ul').removeClass('small-block-grid-3 medium-block-grid-4 large-block-grid-5').addClass('small-block-grid-1');
    }
});
