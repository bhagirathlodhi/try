// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import jquery from 'jquery'
window.jQuery = jquery
window.$ = jquery



// $( ".change" ).on("click", function() {
//     if( $( "body" ).hasClass( "dark" )) {
//         $( "body" ).removeClass( "dark" );
//         $( ".change" ).text( "OFF" );
//     } else {
//         $( "body" ).addClass( "dark" );
//         $( ".change" ).text( "ON" );
//     }
// });

$(document).ready(function() {
    $('.action-button').click(function() {
        event.preventDefault();
        if($(this).text() == "Dark Mode"){
            $("body").addClass("dark");
        }
        else
        {
            $("body").removeClass("dark");
        }
    })
});
