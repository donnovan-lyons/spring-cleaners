// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
// Load jquery
//= require jquery
//= require jquery_ujs
// Loads all Semantic javascripts
//= require semantic-ui

$(document).on('turbolinks:load', function(){
    let data = $('body').data();
    // pagescript: is just the namespace for the events to avoid potential name collisions 
    $(document).trigger('pagescript:' + data.controller + '#' + data.action, data)
               .trigger('pagescript:' + data.controller + '#*', data)
               .trigger('pagescript:' + '*#' + data.action , data);
  });

  // A specific controller_name and action
$(document).on('pagescript:appointments#edit', (e) => {
    $('#standard_calendar').calendar();
    $('#time_calendar').calendar({type: 'time'});
});

$(document).on('pagescript:appointments#new', (e) => {
    $('#standard_calendar').calendar();
    $('#time_calendar').calendar({type: 'time'});
});