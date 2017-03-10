$(document).on('turbolinks:load', function() {
  $slider = $('.group-size')

  $('.group-size__label').text($slider.val())

  $slider.on('input', sliderHandler)
})

var sliderHandler = function() {
  $('.group-size__label').text($(this).val())
}
