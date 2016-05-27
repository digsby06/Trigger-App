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



//////////////////////////////////// Toggle Icon Images 

// $(document).ready(function(){
//   $(".img-swap").click(function() {
//     $(".img-swap.btn").each(function(){
//         this.src = this.src.replace("_btn", "_active");
//         $(this).removeClass("active");
//     });
//     if ($(this).attr("class") == "img-swap") {
//       this.src = this.src.replace("_active","_btn");
//     } else {
//       this.src = this.src.replace("_btn","_active");
//     }
//     $(this).toggleClass("btn");
//   });
// });


//////////////////////////////////// Click to Play Audio

$(document).ready(function(){
  
    var $players = $('.player');
    var $playButtons = $('.play');
    
    function onPlayClick(playButton, player) {
        if (player.paused) {
            player.play();
        } else {
            player.pause();
        }
    }

    for(var i = 0; i < $playButtons.length; i++) {
        var playButton = $playButtons[i];
        var player = $players[i];
        $(playButton).click(onPlayClick.bind(null, playButton, player));  
    }    
});

//////////////////////////////////// Play One Audio File at at Time

document.addEventListener('play', function(e){
    var audios = document.getElementsByTagName('audio');
    for(var i = 0, len = audios.length; i < len;i++){
        if(audios[i] != e.target){
            audios[i].pause();
            audios[i].currentTime = 0;
        }
    }
}, true);

//////////////////////////////////// Mute All Audio

$(document).ready(function(e) {
    
   $('audio').on('loadeddata', function(e) {
       console.log('onloadeddata', e.target);
       $(this).prop("muted", false);
    });
   
   var isMuted = false; 
    $('#mutebutton').click(function(e) {
        isMuted = !isMuted; 
        $('audio').prop("muted", isMuted);
    if (isMuted = true){
        setTimeout(unMute, 5000);
        };
  
    });

///////////////////// Function swaps Mute Button Images through CSS and Controls Audio

    var unMute = function(){        
            isMuted = false;
            $('input:checkbox').prop('checked', false);
            $('audio').prop("muted", isMuted);
    };

});


//////////////////////////////////// Phidgets 

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

