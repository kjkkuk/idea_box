// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'materialize-css/dist/js/materialize'
require("jquery")
require("easy-autocomplete")
import "packs/search"

Rails.start()
Turbolinks.start()
ActiveStorage.start()
// = require materialize

window.$ = window.jQuery = require('jquery');
require('packs/raty')

$(document).on('turbolinks:load', function() {
    $('.dropdown-trigger').dropdown();
    $('.slider').slider();
    $('.tabs').tabs();
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

$(document).on('turbolinks:load', () => {
    if ($('.upload-hider-labels').length > 0) {
        $('.upload-hider-labels').each(function () {
            return $(this).closest('.form-group').find('.upload-hider-fields').hide();
        });
    }
    $('form').on('click', '.replace-upload', function (e) {
        var uploadFields, uploadLabels;
        e.preventDefault();
        uploadLabels = $(this).closest('.upload-hider-labels');
        uploadFields = $(this).closest('.form-group').find('.upload-hider-fields');
        uploadLabels.hide();
        return uploadFields.show();
    });
})
