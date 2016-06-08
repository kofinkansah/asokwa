//Add hints to form fields and make them disappear 
//when requirement for field is satisfied

$( document ).ready(function() {
$("#try").click(function (){
       $("#try").hide(); 
    });



//$('input[id=user_name]').focus().val("<span>Enter a name, foo!</span>");
$('#alright').hide();

//On form load, add hints
$(".form-control #user_name").append( "<span>Enter a name, foo!</span>" );
//$("#user_email").
//$("#user_password").
//$("#user_password_confirmation").


//

});
