// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

$(document).ready(function() {
  $('.popup-image').magnificPopup({
    type: 'image',
    gallery: {
      enabled: true
    }
  });
});