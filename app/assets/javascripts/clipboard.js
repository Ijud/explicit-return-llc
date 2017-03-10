$(document).ready(function() {
  $('.copy').click(function() {
    $(this).closest('.grouping').find('.code').select()
    document.execCommand('copy')
  })
})
