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
//= require_tree .




$(document).ready(function(){
$('#playsound').on('click', function (e) {
  e.preventDefault();
  $('#sound_effect').currentTime = 0;
  $('#sound_effect').get(0).play();
  return false;
});
});

$(document).ready(function(){
$(".img-swap:not(.active)").hover(
    function(){this.src = this.src.replace("_btn","_active");},
    function(){
        if(!$(this).hasClass('active')){
            this.src = this.src.replace("_active","_btn");
        }
    });
    $(".img-swap").click(function(){
        $(".img-swap.active").each(function(){
            this.src = this.src.replace("_active","_btn");
            $(this).removeClass('active');
        });
    $(this).toggleClass('active');
    });
});


$(function(){
    $('.event-btn').click(function(e){
        $('button').attr('disabled',true);
        var button_id = $(this).data('id');
        var data = {
            button_id: button_id
        }
        $('#error').html('');
        var jqxhr = $.get( "/trigger", data, function(data) {
            console.log(data);
            if (data['error']){
                console.log("error");
                $('#error').html(data['error']);
            }
        }).fail(function() {
            $('#error').html("Could not connect to server");
        }).always(function(){
            $('button').attr('disabled',false);
        });
    });
    console.log("Loaded");
});

