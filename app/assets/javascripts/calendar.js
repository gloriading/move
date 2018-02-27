$( document ).ready(function() {
    console.log( "ready!" );

// welcoms/index.html.erb ----------------------------------------------
// A mouse movement within the div with class home will trigger the animation
 // 
 // $(".home").one("mouseover", function(){
 //   $(".display-2").css('position','relative');
 //    $(".display-2").animate({left: '30px'}, "500");
 //    $(".display-2").animate({left: '0px'}, "500");
 //    $(".display-2").animate({left: '30px'}, "500");
 //    $(".display-2").animate({left: '0px'}, "500", function(){
 //        $('.display-4').eq(0).fadeIn(1500, function(){
 //          $(this).fadeOut(1500, function(){
 //            $('.display-4').eq(1).fadeIn(1000);
 //          });
 //        });
 //    });
 //  });

// set the first colour field---------------------------------[ minicolors ]
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
// -------------------------------------------------[colour field background]
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

// ------------------------------------------- [ Show/Hide date on a day ]

  $('.show-day').click(function(event){
    event.stopPropagation();
    $('.day-cell').toggle('3000');
    // $('tr th').html("").toggle();
  });

// ----------------------------------- [ Show/Hide exercise name on a day ]
  $('.show-exe').click(function(event){
    event.stopPropagation();
    $('.inner-cell span').toggle('3000');
  });

  $('.btn-link').click(function(){
    $('.day-cell').show('slow');
    $('.inner-cell span').show('slow');
  })
// _form.html.erb-------------------------------[ toggle advanced options ]

  $('.show-adv-opt').click(function(){
    $('.advanced-options').toggle('slow');
  })

//  ----------------- [ click on a record of a day will bring up a modal ]

  $('.inner-cell').click(function(e){
      e.stopPropagation();
      e.preventDefault();
      const id = $(this).attr('id');
      $(`[data-target="#modal-${id}"]`)[0].click();
  });

//  --------------------[ Limit the # of fields can be added in new form ]
// The first remove button will never show in new form but will show in edit

  const r = $('.remove-f');
  r.eq(0).hide();

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

// -------------------------------[ delay the date shown in the calendar ]
  setTimeout(function(){
  	$('.day-cell').slideDown('fast');
  },10);

//---------------------------------------------------------- jQuery UI
$( function() {
  $('#accordion, .record_exercises_colour').tooltip({
    position: { my: "left-120% top-150% center", at: "right center" }
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








});
