$( document ).ready(function() {
    console.log( "ready!" );

// welcoms/index.html.erb ----------------------------------------------
// A mouse movement within the div with class home will trigger the animation

   $(".home").one("mouseover", function(){
     $(".display-2").css('position','relative');
      $(".display-2").animate({left: '30px'}, "slow");
      $(".display-2").animate({left: '0px'}, "slow");
      $(".display-2").animate({left: '30px'}, "slow");
      $(".display-2").animate({left: '0px'}, "slow", function(){
          $('.display-4').eq(0).fadeIn(3000, function(){
            $(this).fadeOut(3000, function(){
              $('.display-4').eq(1).fadeIn(3000);
            });
          });
      });
    });

// --------------------------------------------------------------------
// set the first colour field
  $('.nested-fields #mini').minicolors();
// set the newly created colour field, use setTimeout to deal with timing issue
  $('.add_fields').click(function(){
  	setTimeout(function(){
  		$('.nested-fields #mini').minicolors();
      }, 10);
  });

// click on the record of a day will bring up the show page (not yet...)

  // $('.has-events').children().click(function(event){
  //     event.stopPropagation();
  //     // add this to prevent from triggering the next js
  //     const x = $(this).attr('id');
  //     let target = '#show-' + x;
  //     $(target).children()[0].click();
  // })
  // $('.inner-cell').children().click(function(event){
  //     event.stopPropagation();
  //
  // })

  // _month_calendar.html.erb
  // not working ----------------but pass an id in path it works
  // $('.inner-cell').on('click', function(event){
  //   event.stopPropagation();
  //     const recordId = parseInt($(this).attr('id'));
  //     alert(typeof(recordId));
  //     alert(recordId);
  //     window.location = "<%= record_path(`${recordId}`) %>"
  //   })

// Show/Hide day on a day---------------------------------------------
// $('a').map((index, value) => $(value).html())

  $('.show-day').click(function(event){
    event.stopPropagation();
    $('.day-cell').toggle('3000');
  });

//Click on a record to show modal---------------------------------

// $('.abc').modal({ show: false})

// $('.inner-cell').click(function(e){
//     e.stopPropagation();
//     const x = $(this).attr('id');
//     console.log(x);
//     // let target = '#show-' + x;
//     // $(target).children()[0].click();
//     const y = '#'+x;
//     console.log(y);
//     $(y).modal('show');
//
// });

// $('.inner-cell').click(function(e){
//     e.stopPropagation();
//     console.log($(this).parent());
//     console.log($(this).parent().find('#exampleModal'));
//     $(this).parent().find('#exampleModal').modal('show');
//
// });










});
