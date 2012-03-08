// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(function() {
//  $("#emp_search").submit(function() {
//    $.get(this.action, $(this).serialize(), null, "script");
//    return false;
//  });

//  $("#products th a, #products .pagination a").live("click", function() {
//    $.getScript(this.href);
//    return false;
//  });

  $("#search_field").keyup(function() {
    $.get($("#emp_search").attr("action"), $("#emp_search").serialize(), null, "script");
    return false;
  });

});
