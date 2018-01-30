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

// set the first colour field--------------------------------------
  $('.nested-fields #mini').minicolors();
// set the newly created colour field, use setTimeout to deal with timing issue
  $('.add_fields').click(function(){
  	setTimeout(function(){
  		$('.nested-fields #mini').minicolors();
      }, 10);
  });

// Show/Hide date on a day-------------------------------------------

  $('.show-day').click(function(event){
    event.stopPropagation();
    $('.day-cell').toggle('3000');
    // $('tr th').html("").toggle();
  });

// Show/Hide exercise name on a day---------------------------------
  $('.show-exe').click(function(event){
    event.stopPropagation();
    $('.inner-cell span').toggle('3000');
  });

// _form.html.erb--------------------------------------------------
// click to toggle advanced options
  $('.show-adv-opt').click(function(){
    $('.advanced-options').toggle('slow');
  })


// clicking on area without exercise names brings a new form -----
// the JS is in _month_calendar.html.erb

// click on the record of a day will bring up the show page ------

  $('.inner-cell').click(function(e){
      e.stopPropagation();
      const x = $(this).attr('id');
      let target = '#show-' + x;
      $(target).children()[0].click();
  });

//
// Limit how many fields can be added in new form ----------------?????
  const r = $('.remove_fields');
  const a = $('.add_fields');
  let c = 1;

  a.click(function(){
    c++;
    console.log(c);
    c >= 3 ? a.hide() : a.show()
  })

  r.click(function(){// only works for the first button
    c--;
    console.log(c);
  })











});
