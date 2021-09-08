// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'materialize-css/dist/js/materialize'
import "jquery"
// import ''

Rails.start()
Turbolinks.start()
ActiveStorage.start()
// = require materialize

$(document).on('turbolinks:load', function() {
    $('.dropdown-trigger').dropdown();
});

// $('input[type=radio][name=team_button]').change(function () {
//     // first: hide all the divs
//     $('#team_button').css("display","none");
//     // $('#calendar_details_b2b').css("display","none");
//
//     // then get the div ID to show (i stored it in the "value" of the radio button
//     const fieldToShow = $(this).val();
//     // now use jQuery selector and change the display setting of that field
//     $("#" + fieldToShow).css("display","block");
// });
