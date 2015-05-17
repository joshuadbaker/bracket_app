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

})
