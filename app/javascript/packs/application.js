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

$( document ).ready('turbolinks:load', function() {
    $("#checkBox_id").click(function() {
        const checkbox = document.querySelector('checkbox');
        const inputs = document.querySelectorAll('checkbook > input[type="text"]');
        for (let input of inputs) {
            input.disabled = checkbox.checked;
        }
    });
});
