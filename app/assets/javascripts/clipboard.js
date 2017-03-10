$(document).on('turbolinks:load', function() {

  $('.copy').click(function() {
    $(this).closest('.grouping').find('.code').select()
    document.execCommand('copy')
  })

})
