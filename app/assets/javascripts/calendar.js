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
function colourShow(){
  $('.nested-fields #mini').minicolors({
    control: 'wheel',
    animationSpeed: 100,
    showSpeed: 100,
    position: 'top right',
    swatches: ['#FF69B4','#FA8072','#DDA0DD','#98FB98','#66CDAA','#43A047', '#87CEFA','#4169E1','#F4A460','#F4D03F','#BCAAA4'],
    theme: 'bootstrap'
  });
}
colourShow();
// set the newly created colour field, use setTimeout to deal with timing issue
  $('.add_fields').click(function(){
  	setTimeout(function(){
  		colourShow();
      }, 10);
  });

$.minicolors = {
  defaults: {
    animationSpeed: 50,
    animationEasing: 'swing',
    change: null,
    changeDelay: 0,
    control: 'wheel',
    defaultValue: '',
    format: 'hex',
    hide: null,
    hideSpeed: 100,
    inline: false,
    keywords: '',
    letterCase: 'lowercase',
    opacity: false,
    position: 'bottom left',
    show: null,
    showSpeed: 100,
    theme: 'default',
    swatches: []
  }
};
function setColorBoxBackground(){
  $('.colour-box').on('keyup',function(){
    const bg = $(this).val();
    console.log(bg);
    $(this).css('background-color',bg);
  })
}
setColorBoxBackground();

// $('#options').click(function(e){
//   if(e.target.classList.contains('add_fields')){
//     setColorBoxBackground();
//   }
// })

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
  });

// When user enters an exercise that has been entered before,
// the colour to the exercise will automatically set
// the Js code is in records/new/html.erb----------------------note



// Limit how many fields can be added in new form ------------
// The first remove button will never shown
  const r = $('.remove_fields');
  r.eq(0).hide();

//
  $(function() {
    $('#options').on('cocoon:after-insert', function() {
      check_to_hide_or_show_add_link();
    });

    $('#options').on('cocoon:after-remove', function() {
      check_to_hide_or_show_add_link();
    });

    check_to_hide_or_show_add_link();

    function check_to_hide_or_show_add_link() {
      if ($('#options .nested-fields').length == 3) {
        $('a.add_fields').hide();
      } else {
        $('a.add_fields').show();
      }
    }
  })

// -----------------------------------------------------------------
// when first enter user show page, no date is shown
// when the mouse enters, the date will shown
  setTimeout(function(){
  	$('.day-cell').slideDown('fast');
  },10);
//---------------------------------------------------------- jQuery UI
// $(function() {
//   $('#datepicker').datepicker();
// });
$( function() {
  $( document ).tooltip({
    position: { my: "left-120% top-90% center", at: "right center" }
  });
});

function colorTitle(){
  $('.colour-label').attr('title','🌈 pick a colour for your exercise');
}

colorTitle();

$('#options').click(function(){
  setTimeout(function(){
    colorTitle();
  },10)

})

//
//


});
