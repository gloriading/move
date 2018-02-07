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
// set the newly created colour field,
//use setTimeout to deal with timing issue
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

// Show Pie CHart --------------------------------------------------
  $('.user-stats').click(function(event){
    event.stopPropagation();
    $('.myChart').show();
  });

// _form.html.erb--------------------------------------------------
// click to toggle advanced options
  $('.show-adv-opt').click(function(){
    $('.advanced-options').toggle('slow');
  })


// clicking on area without exercise names brings a new form ----- note
// the JS is in `_month_calendar.html.erb`

// Logic: window.location will be triggered only when the `target`
//        is on `day-cell` or `cell`

// $('td.day').on('click', function(e) {
//   if (e.target.classList.contains('day-cell') ||
//     e.target.classList.contains('cell')) {
//     window.location = "<%= new_record_path %>?date=" + $(this).data('date');
//   }
// });


// click on the record of a day will bring up a modal -----------------

  $('.inner-cell').click(function(e){
      e.stopPropagation();
      e.preventDefault();
      const id = $(this).attr('id');
      $(`[data-target="#modal-${id}"]`)[0].click();
      // let target = '[data-target="#modal-' + x + '"]';
      // console.log(target);
      // console.dir($(target).click())
      // $(target).click();

  });

// When user enters an exercise that has been entered before,
// the colour to the exercise will automatically set
// the Js code is in records/new/html.erb----------------------note



// Limit how many fields can be added in new form ------------
// event delegation

// The first remove button will never shown
  const r = $('.remove_fields');
  const a = $('.add_fields');
  let c = 1;
  r.hide();

// click on the parent ( #options ) and check if the actual thing we clicked on
// i.e. the 'target' has the class 'remove_fields' or 'add_fields'
  $('#options').click(function (e) {
    if (e.target.classList.contains('remove_fields')) {
      c--;
    }
    if (e.target.classList.contains('add_fields')) {
      c++;
    }
    console.log(c);
    c >= 3 ? a.hide() : a.show();
  })

// -----------------------------------------------------------------
// when first enter user show page, no date is shown
// when the mouse enters, the date will shown
$('.container .row').mouseenter(function(){
	$('.day-cell').slideDown('slow');
})






});
