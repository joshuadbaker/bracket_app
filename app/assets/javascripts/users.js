$(document).ready(function(){

  $(function() { 
    function ValidateZipCode(zipcode){
      if (zipcode.length === 5 && !isNaN(zipcode)){
         $('#user_address').removeClass('error');
          return true;
        }
      else {
          $('#user_address').addClass('error');
          $('#search_box').append( "<h3 class='error'>Please Enter A Valid Zip Code</h3>" );
          return false;
        }
      }

    $('form').submit(function(event){
          var zipcode = $('#user_address').val()
          if(ValidateZipCode(zipcode)) {
            $("#spin").show();
            // $(".index").addClass("darken");
            return true; //submit form.
          }
          else {
            event.preventDefault();  //prevent form from submitting!
          }
      });

  });

$('.bad_results').click(function(){
  $(this).children('.violation_description').toggle(500);
  $(this).children('.icon').toggle(500);
})

$('.good_results').click(function(){
  $(this).children('.snippet').toggle(500);
  $(this).children('.type').toggle(500);
  $(this).children('.yelp_link').toggle(500);
})

var opts = {
  lines: 17, // The number of lines to draw
  length: 0, // The length of each line
  width: 10, // The line thickness
  radius: 30, // The radius of the inner circle
  corners: 1, // Corner roundness (0..1)
  rotate: 29, // The rotation offset
  direction: 1, // 1: clockwise, -1: counterclockwise
  color: '#fff', // #rgb or #rrggbb or array of colors
  speed: 1.4, // Rounds per second
  trail: 10, // Afterglow percentage
  shadow: false, // Whether to render a shadow
  hwaccel: false, // Whether to use hardware acceleration
  className: 'spinner', // The CSS class to assign to the spinner
  zIndex: 2e9, // The z-index (defaults to 2000000000)
  top: '80%', // Top position relative to parent
  left: '49.5%' // Left position relative to parent
};
var target = document.getElementById('spin');
var spinner = new Spinner(opts).spin(target);
$('#spin').hide();





})
