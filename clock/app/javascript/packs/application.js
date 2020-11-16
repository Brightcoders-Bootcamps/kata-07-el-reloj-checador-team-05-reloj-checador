// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import $ from 'jquery';

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

//= require jquery3
//= require popper
//= require bootstrapn

$(document).ready(function() {
  //$("#store-errors").hide();
  $(".close").click(function() {
    $("#Errors").toggle("slow");
  });
});

let getDOM = (id) => {
  return document.getElementById(id)
 }

 window.onload = function() {
  const tabs = document.querySelectorAll("#navTabs>li>a"),
    panes = document.querySelectorAll("#navPanes>div")

  for (let i = 0; i < tabs.length; i++)
    tabs[i].addEventListener("click", function () {
      for (let i1 = 0; i1 < tabs.length; i1++) tabs[i1].classList.remove("active");

      for (let i2 = 0; i2 < panes.length; i2++) panes[i2].classList.remove("show", "active");

      const tab = this.classList, pane = getDOM(this.getAttribute("aria-controls")).classList

      tab.add("active")
      pane.add("show", "active")
    })
 }
 