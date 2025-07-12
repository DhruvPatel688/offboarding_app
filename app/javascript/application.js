// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "jquery"

function toggleMenu() {
    var navbar = document.getElementById("navbarSupportedContent");
    navbar.classList.toggle("show");
  }
  
  document.addEventListener("DOMContentLoaded", function() {
    var toggler = document.querySelector(".navbar-toggler");
    toggler.addEventListener("click", toggleMenu);
  });
