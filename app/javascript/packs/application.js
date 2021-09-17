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

$(document).on('turbolinks:load', function() {
    const checkbox = document.querySelector('.checkbox-sponsor');
    const selectors = document.querySelectorAll('.checkbox-sponsor ~ .form-group-for-disable select');
    if (checkbox) {
        checkbox.addEventListener('change', event => {
            for (let selector of selectors) {
                selector.disabled = !event.target.checked;
            }
        });
    }
});
