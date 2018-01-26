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


// records/new.html.erb
  // $('.exe').on('change', function(){
  // 	console.log($(this).val());
  // })
  //
  // const x = @user_pair_string
  // for (let p in x){
  // 	console.log( `${p} : ${a[p]} `);
  // }

// set the first colour field
  $('.nested-fields #mini').minicolors();
// set the newly created colour field, use setTimeout to deal with timing issue
  $('.add_fields').click(function(){
  	setTimeout(function(){
  		$('.nested-fields #mini').minicolors();
      }, 10);
  });

// click on the record of a day will bring up the show page (not yet...)

  $('.has-events').children().click(function(event){
      event.stopPropagation();
      // add this to prevent from triggering the next js
      const x = $(this).attr('id');
      let target = '#show-' + x;
      $(target).children()[0].click();
  })





});
