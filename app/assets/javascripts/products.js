$(document).ready(function() {
      
      $('#minus-button').click(function() {
        if ($('#minus-button img').attr('src') == 'assets/minus.jpg') {
        $('#minus-button img').attr('src','assets/plus.jpg');
          var test = $('.bigIMG').css('height') ;
          $('img:not(.bigIMG)').toggle();
          
    } else {
        $('#minus-button img').attr('src','assets/minus.jpg');
    }
      
        $('#wrapper').toggleClass("grid-img");
        $('#container').toggleClass("shelf-img");
        
        
    
        
      });
      
      $('.draggable').mouseup(function() {
        
        var offset = $(this).offset().left;
        
        
      if(offset <= 700) {
      //  alert('Regular offset: ' + offset);
        $(this).addClass('bigIMG');
        $(this).css('position','absolute');
        $(this).css('height','initial');
        $(this).css('width','initial');
        var test2 = $(this).css('height');
        //alert('test2: ' + test2);
      }
      else {
        $(this).css('position','relative');
        $(this).css('height','60px');
        $(this).css('width','60px');
        //alert('Else offset: ' + offset);
      }
    });
      
    });